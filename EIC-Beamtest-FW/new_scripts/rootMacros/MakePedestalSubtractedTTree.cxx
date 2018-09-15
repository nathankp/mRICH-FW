#include "Riostream.h"

void MakepedsubTTree(const char* ascii_input, const char* root_pedfile, const char* root_output) {


  // Get pedestals from file
  Float_t AvgPedSample[16][512][32];

  TFile* pedFile = new TFile(root_pedfile,"READ");

  TTree* pedTree;
  if (pedFile->Get("pedTree")){
      pedTree = (TTree*)pedFile->Get("pedTree");
  }
  else {
    printf("Can't find pedestal TTree in %s.\nExiting . . .\n", root_pedfile);
    exit(-1);
  }
  pedTree->SetBranchAddress("PedSample", AvgPedSample);
  pedTree->GetEntry(0);


  // Read ascii file and subtract pedestals
  Int_t EvtNum, AddNum,  WrAddNum;
  Int_t TrigCH, ASIC,    Channel;
  Int_t PeakTime[16], PeakVal[16];
  Float_t Sample[16][128];

  std::ifstream infile;
  infile.open(ascii_input);

  TFile* file = new TFile(root_output,"UPDATE");//UPDATE like "append"
  TTree* tree = new TTree("tree","Raw TargetX output");

  tree->Branch("EvtNum", &EvtNum, "EvtNum/I");
  tree->Branch("AddNum", &AddNum, "AddNum/I");
  tree->Branch("WrAddNum", &WrAddNum, "WrAddNum/I");
  tree->Branch("TrigCH", &TrigCH, "Wctime/I");
  tree->Branch("ASIC", &ASIC, "ASIC/I");
  tree->Branch("PeakTime", PeakTime, "PeakTime[16]/I");
  tree->Branch("PeakVal", PeakVal, "PeakVal[16]/I");
  tree->Branch("ADC_counts", Sample, "ADC_counts[16][128]/F");

  Float_t tempSample;
  Int_t   nlines = 0;
    
  while (1) { // loops intil break is reached
    infile >>      EvtNum      ;
    infile >>      AddNum      ;
    infile >>      WrAddNum    ;
    infile >>      TrigCH      ;
    infile >>      ASIC        ;
    for (int i=0; i<16; i++) {
      infile >>  PeakTime[i] ;
      infile >>  PeakVal[i]  ;
      for (int j=0; j<128; j++){
        infile >> tempSample;
        Sample[i][j] = tempSample - AvgPedSample[i][AddNum+j/32][j%32];
      }
    } 
      // exit loop when eof, fail, or bad bit from std::ios is set.
      if (!infile.good()) break;
      tree->Fill();//end of event -- fill tree with event & loop back
      nlines++;

  }
  printf("Read %d lines.\n",nlines);
  infile.close();
  tree->Write();
  file->Close();
  delete file;
}
