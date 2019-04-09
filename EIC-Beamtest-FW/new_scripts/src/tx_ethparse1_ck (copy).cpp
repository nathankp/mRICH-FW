//compile independently with: g++ -o ./bin/tx_ethparse1_ck ./src/tx_ethparse1_ck.cpp `root-config --cflags --glibs` -Wall
//authur: Chris ketter
//modified by: khanh le 1/4/2018-changed header file format to work with BMD data(~line 143), and add trigger channel to outfile(~line 216)



#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <cstring>

const int NSAMP         = 32*4;
const int MEMORY_DEPTH  = 512;
const int NASICS        = 10;
const int NCHS          = 16;
bool DecodeTPGflag;

using namespace std;

class MBevent {
    public:
    int    EvtNum;
    int    AddNum;
    int    WrAddNum;
    int    TrigCH;
    int    ASIC;
    int    Sample[16][128];
    int    PeakVal[16];
    int    PeakTime[16];
    // note: Window information is only allocated 3 bits, so
    //       window number is fully specified by sample number

    MBevent() {}  // Constructor
    ~MBevent() {} // Destructor
};

//-----------------------------------------------------//
//                   PROCESS BUFFER
//-----------------------------------------------------//
void processBuffer( unsigned char* buff, long size, char* waveformOutfile, char* trigBitOutfile, int OutMode) {

    ofstream outfile; // data in form of ascii (8-bit) characters
//    char waveformOutfile[80];
//    sprintf(waveformOutfile, "%s/waveformSamples.txt", (char)working_dir);
    outfile.open(waveformOutfile, ofstream::out | ofstream::app); // app opt. writes to end.

    ofstream CAoutfile;
//    char trigBitOutfile[80];
//    sprintf(trigBitOutfile, "%s/triggerBits.txt", (char)working_dir);
    CAoutfile.open(trigBitOutfile, ofstream::out | ofstream::app);

    //---- INITIALIZE EVENT PARAMETERS ----//
    MBevent* evt = new MBevent;
    evt->EvtNum                                     = -1;
    evt->AddNum                                     = -1;
    evt->WrAddNum                                   = -1;
    evt->TrigCH                                     = -1;
    evt->ASIC                                       = -1;
    for (int i=0; i<16; i++) evt->PeakVal [i]       = 9999;
    for (int i=0; i<16; i++) evt->PeakTime [i]      = -1;
    for (int i=0; i<16; i++) {
        for (int j=0; j<128; j++) evt->Sample[i][j] = 9999;
    }

     //---- EXTRACT PACKAGES FROM BUFFER ----//
    unsigned int buffer_uint[65536];
    int pos1 = 0;
    int pos2 = 0;
    int eventCounter = 1; // for printing progress to terminal

    if (size<100) {
        cout << "\n\nWARNING: Packet size only: " << size << " bytes. ---> Skipping packet.\n\n";
        return;
    }

    while (pos1 < (size-16)) {

        //----FIND BUFFER POSITION FOR START OF PACKAGE----//
        while (
            (pos1 < (size-16))
            && (!((buff[pos1]=='w' && buff[pos1+1]=='a' && buff[pos1+2]=='v' && buff[pos1+3]=='e')) // for OutMode==0 //ex. wave-->-------\    |pos1    --------         pos2\       (all utf 8-bit)
            &&  !((buff[pos1]=='c' && buff[pos1+1]=='h' && buff[pos1+2]=='r' && buff[pos1+3]=='g'))) // for OutMode==1//sdf0k\Uffffffffdf\Uffffffffet\Uffffffffk\Uffffffffwq\Uffffffff\Uffffffffjwave\Uffffffff\Uffffffff\Uffffffff\Uffffffffu\Uffffffff57\Uffffffff\Ufffffffffm\Uffffffff/\Uffffffff08\Uffffffff\Uffffffff\Uffffffff\Uffffffffhrg=\Uffffffff3\Uffffffff\Uffffffff\Uffffffff1\Uffffffff\Uffffffffhn\Uffffffffhk\Uffffffff
              ) {
            pos1++;
        }
        pos1 += 4; // Increment both place holders past package markers identifed above.
        pos2 = pos1;

        //----FIND BUFFER POSITION FOR START OF NEXT PACKAGE----//
        while (
            (pos2 < (size-16))
            && (!((buff[pos2]=='w' && buff[pos2+1]=='a' && buff[pos2+2]=='v' && buff[pos2+3]=='e'))
            &&  !((buff[pos2]=='c' && buff[pos2+1]=='h' && buff[pos2+2]=='r' && buff[pos2+3]=='g')))
              ) {
            pos2++;
        }


        //----CONVERT DATA FROM 8-BIT BUFFER TO 32-BIT BUFFER----//
        if ((buff[pos1]==0xFE && buff[pos1+4]==0xCF && (buff[pos1+8]&0xF0)==0xD0)) { // We do have a package.
            int wordNum=0;
            int posRead=0;
            while (
                (pos1<pos2)  & !((buff[pos1] == 0xFA) && (buff[pos1+1] == 0xCE)
                && (buff[pos1+2] == 0xFA) && (buff[pos1+3] == 0xCE)) // End of package marked by hex words "FACEFACE = \Uffffffff?
                  ) {
                if (posRead%4==0) { // Fill waveform buffer.
                    buffer_uint[wordNum]=((unsigned int)buff[pos1+0])<<24 | ((unsigned int)buff[pos1+1])<<16 | ((unsigned int)buff[pos1+2])<<8 | ((unsigned int)buff[pos1+3]);
                    wordNum++;
                }
                posRead++;
                pos1++; // When at end of while-loop, pos1 should be either at the word FACEFACE or at start of next package?
            }
            int wbuflen=wordNum; // Waveform buffer length as number of 32-bit words.

            //----PRINT PSEUDO STATUS BAR TO TERMINAL----//
            //if (eventCounter == 1) cout << "Passing package of " << wbuflen <<" 32-bit words to waveform buffer\n";
            if (eventCounter%100 == 0) cout << ".";
            if (eventCounter%8000 == 0) cout << "<---" << eventCounter << "\n";


            //----PARSE UINT32 BUFFER & STORE DATA AS INSTANCE OF MBevent CLASS----//

            int count       = 0;
            int offset     = 3;
            int sampNum     = -1;
            int chanNum     = -1;
            int window      = -1;

            //----FOR EACH 32-bit WORD, EXTRACT DATA USING BIT-WISE & OPERATORS----//
            evt->WrAddNum   =   (buffer_uint[0])      & 0x000001FF ;   // word #0: read 9 bits
            evt->ASIC       =  ((buffer_uint[0]>>20)  & 0x0000000F);   // word #0: read 4 bits
            evt->EvtNum     =   (buffer_uint[1])      & 0x00FFFFFF ;   // word #1: read 24 bits
            evt->TrigCH     =   (buffer_uint[2])      & 0x000000FF ;   // word #2: read 5 bits
			evt->AddNum     =   (buffer_uint[2]>>8)   & 0x000001FF ;   // word #2: read 9 bits


            //----LOOP OVER CURRENT PACKAGE AND EXTRACT DATA----//
            while (count < wbuflen) {
                chanNum    = (buffer_uint[offset+count]>>19) & 0x0000000F; // word #3 & up: read 4 bits
                window     = (buffer_uint[offset+count]>>17) & 0x00000003; // word #3 & up: read 2 bits


                //----CHECK FOR SAMPLE -- INDICATED BY "BD" VALUE----//
                // current usage is 31 bits
                if ((buffer_uint[offset+count] & 0xFF000000) == 0xBD000000) {
                    sampNum     = ((buffer_uint[offset+count]>>12) & 0x0000001F)+window*32; // word #3 & up: read 5 bits
                    int BDval   =  (buffer_uint[offset+count]>>24) & 0x000000FF; // word #3 & up: read 8 bits (top 8 bits)
                    // make sure info is still valid before extracting samples---must pass these four conditions
                    if (evt->AddNum >= MEMORY_DEPTH  || evt->ASIC > NASICS || sampNum >= NSAMP || BDval != 0xBD) {
                        cout << "INVALID SAMPLE INFO, SKIPPING "    << "\n"
                             << "Loop counter: "    << count        << "\n"
                             << "Address number: "  << evt->AddNum  << "\n"
                             << "ASIC number: "     << evt->ASIC    << "\n"
                             << "Sample number: "   << sampNum      << "\n"
                             << "BD value: "        << BDval        << "\n";
                        count++;
                        continue;
                    }
                    else {
                        evt->Sample[chanNum][sampNum] = ((buffer_uint[offset+count]) & 0x00000FFF); // word #3 & up: read 12 bits (bottom 12 bits)
                    }
                }


                //----CHECK FOR FEATURE EXTRACTION --  INDICATED BY "CB" VALUE----//
                if ((buffer_uint[offset+count]& 0xFF000000)==0xCB000000) { // note: current usage is 31 bits
                    chanNum                 = (0x00F00000 & buffer_uint[offset+count])>>20;
                    evt->PeakTime[chanNum]  = buffer_uint[offset+count]>>12 & 0x7F; // 7 bits for sample number
                    evt->PeakVal[chanNum]   = (buffer_uint[offset+count] & 0x0FFF); // 12 bit ADC count for peak
                }


                //----CHECK FOR TRIGGER BITS -- INDICATED BY "CA" WORD FOLLOWED BY "C7" WORD----//
                const int n_ca_max=32; // total of 64 hex words, 32 each of "CAXXXXXX" and "C7XXXXXX"
                int n_ca                         = 0;
                unsigned int CA_val[n_ca_max]    = {0};
                unsigned int CA_raw1[n_ca_max]   = {0};
                unsigned int CA_raw2[n_ca_max]   = {0};
                unsigned int CA_win[n_ca_max]    = {0};
                unsigned int CA_tbs[n_ca_max][4] = {{0}};
                // note: (CA)(23 downto 17)(7 downto 0) and (C7)(23 downto 20) are only stored in raw's
                if ((buffer_uint[offset+count] & 0xFF000000) == 0xCA000000) {
                    if ((buffer_uint[offset+count+1] & 0xFF000000) == 0xC7000000) {
                        if (n_ca < n_ca_max) {
                            CA_raw1[n_ca]   =  buffer_uint[offset+count  ]; // store "CA" word just in case
                            CA_raw2[n_ca]   =  buffer_uint[offset+count+1]; // store "C7" word just in case
                            CA_val[n_ca]    =  buffer_uint[offset+count+1] & 0x000FFFFF; // (C7) 19 downto 0 // redundant
                            CA_tbs[n_ca][0] = (buffer_uint[offset+count+1]>>0 ) & 0x0000001F; // (C7) 4 downto 0
                            CA_tbs[n_ca][1] = (buffer_uint[offset+count+1]>>5 ) & 0x0000001F; // (C7) 9 downto 5
                            CA_tbs[n_ca][2] = (buffer_uint[offset+count+1]>>10) & 0x0000001F; // (C7) 14 downto 10
                            CA_tbs[n_ca][3] = (buffer_uint[offset+count+1]>>15) & 0x0000001F; // (C7) 19 downto 15
                            CA_win[n_ca]    = (buffer_uint[offset+count  ] & 0x0001FF00) >> 8; // (CA) 16 downto 8
                            CAoutfile << CA_raw1[n_ca]   << "\t";
                            CAoutfile << CA_raw2[n_ca]   << "\t";
                            CAoutfile << CA_val[n_ca]    << "\t";
                            CAoutfile << CA_win[n_ca]    << "\t";
                            CAoutfile << CA_tbs[n_ca][0] << "\t";
                            CAoutfile << CA_tbs[n_ca][1] << "\t";
                            CAoutfile << CA_tbs[n_ca][2] << "\t";
                            CAoutfile << CA_tbs[n_ca][3] << "\n";
                        }
                        n_ca++;
                    }
                }


                count++;
            }//END OF EXTRACT DATA FROM CURRENT PACKAGE

            //----WRITE PARSED PACKAGE TO FILE (ONE LINE PER EVENT)----//
            outfile <<      evt->EvtNum      << " ";
            outfile <<      evt->AddNum      << " ";
            outfile <<      evt->WrAddNum    << " ";
            outfile <<      evt->TrigCH      << " ";
            outfile <<      evt->ASIC        << " ";
            for (int i=0; i<16; i++) {
                outfile <<  evt->PeakTime[i] << " ";
                outfile <<  evt->PeakVal[i]  << " ";
                for (int j=0; j<128; j++) outfile << evt->Sample[i][j] << " ";
            }
            outfile << "\n";
            eventCounter++;
        }//END OF PACKAGE
    }//END OF ALL PACKAGES
    cout << "<---" << eventCounter-1 << "\n";
    outfile.close();
    CAoutfile.close();
    delete evt; // Clear all memory declared as new.
}//END PROCESS BUFFER



//--------------------------------------------------------//
//                  MAIN
//--------------------------------------------------------//
int main(int argc, char* argv[]) {

    //------------ USAGE ------------//
    if (argc != 5 && argc != 6 ) {
        cout << "wrong number of arguments:\n";
        cout << "Usage ./tx_ethparse1 <input filename> <waveformOutfile> <trigBitoutfile> <OutMode> [options: -TPG]\n";
        return 0; //          0            1                   2                 3            4
    }

    DecodeTPGflag = false;
    if (argc == 6) {
        if (0 == strcmp(argv[5], "-TPG")) DecodeTPGflag = true;
        else {
            cout << "Usage: ./tx_ethparse1 <input filename> <waveformOutfile> <trigBitoutfile> <OutMode> [options: -TPG]\n";
            return 0;
        }
    }

    char* inputFileName   = argv[1]; // outdir/data.dat
    char* waveformOutfile = argv[2]; // outdir/KLMS . . . /
    char* trigBitOutfile  = argv[3];
    int   OutMode         = atoi(argv[4]);

    //---- DEFINE INPUT FILE AND PARSING ----//
    ifstream infile; // data in form of ascii (8-bit) characters
    infile.open(inputFileName, ifstream::in | ifstream::binary); // Open file for reading in binary.
    if (infile.fail()) {
        cout << "\n\nError opening input file, exiting\n\n";
        return 0;
    }

    //---- GET LENGTH OF FILE ----//
    infile.seekg (0, infile.end);       // Seek to a position offset 0 from end of infile stream.
    long size_in_bytes = infile.tellg(); // Return position of get-pointer.
    infile.seekg (0, infile.beg);       // Move get-pointer back to beginning of file stream buffer.

     //---- READ DATA TO BUFFER ----//
    char* buffer = new char [size_in_bytes]; // Declare memory
    unsigned char* Ubuff = (unsigned char*)buffer; // point to ascii buffer and cast it as unsigned buffer
    cout << "Reading " << size_in_bytes << " bytes... ";
    infile.read (buffer, size_in_bytes);
    if (infile) cout << "all characters read successfully.\n";
    else cout << "\n\nerror: only " << infile.gcount() << " could be read\n\n";
    infile.close();

    processBuffer(Ubuff, size_in_bytes, waveformOutfile, trigBitOutfile, OutMode);

    delete [] buffer; // Clear all memory declared as new.
    return 0;
}
