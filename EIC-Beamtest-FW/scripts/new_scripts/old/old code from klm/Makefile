#COMPILE_FLAGS = -Isrc/lib -I/usr/include/libusb-1.0 -DUSE_USB -DDEBUG -g `root-config --cflags ` 
#LINK_OPTIONS = -L/usr/lib/i386-linux-gnu -lusb-1.0 -DDEBUG -g `root-config --glibs`
COMPILE_FLAGS = -Isrc/lib -DDEBUG -g `root-config --cflags ` 
LINK_OPTIONS = -L/usr/lib/i386-linux-gnu -DDEBUG -g `root-config --glibs`

# things we always need built:
#FINAL_OBJECT_FILES = bin/target6Control_readReg bin/scrod_readReg bin/scrod_writeReg bin/scrod_writeTXReg bin/target6Control_writeReg bin/target6Control_writeDacReg bin/target6Control_writeDefaultDacRegs bin/target6Control_test bin/target6Control_testTrigger bin/target6Control_takeData bin/target6Control_takeAndPlotData bin/parseTarget6Data bin/parseTarget6Data3 bin/target6Data_viewWaveformTree bin/target6Data_measurePedestals bin/target6Data_makeHitTree bin/target6Control_RAMtest01 bin/SCRODA4_RAMtest02 bin/SCRODA4_RAMpattern01 bin/tx_onboard_pedcalc01 bin/tx_onboard_pedcalc02 bin/parseTXPedSubData01 bin/tx_takedataplot1 bin/tx_takedatarecord1 bin/tx_plotdata1 bin/tx_trigscan1 bin/tx_sweepgen_takedatarecord1 bin/tx_parse1 bin/tx_ethparse1 bin/tx_take_multiAsic_datarecord2 bin/tx_MB_take_multiAsic_datarecord2 bin/tx_ethtakedataplot1
FINAL_OBJECT_FILES = bin/tx_ethparse1 bin/tx_ethtakedataplot1

# needed to link all:
#INTERMEDIATE_OBJECT_FILES = work/generic.o work/io_interface.o work/idl_usb.o work/packet_interface.o work/target6ControlClass.o work/target6ControlClass.o work/target6DataClass.o

default :
	if [ ! -e src     ]; then mkdir     src; fi
	if [ ! -e work    ]; then mkdir    work; fi
	if [ ! -e bin     ]; then mkdir     bin; fi
	$(MAKE) intermediate all

intermediate : $(INTERMEDIATE_OBJECT_FILES)

all : $(FINAL_OBJECT_FILES)

work/%.o : src/%.cpp $(INTERMEDIATE_OBJECT_FILES) ;
	g++ $(COMPILE_FLAGS) -c $< -o $@

work/%.o : src/%.cxx $(INTERMEDIATE_OBJECT_FILES) ;
	g++ $(COMPILE_FLAGS) -c $< -o $@

work/%.o : src/lib/%.cpp src/lib/%.h ;
	g++ $(COMPILE_FLAGS) -c $< -o $@





bin/tx_ethtakedataplot1 : work/tx_ethtakedataplot1.o $(INTERMEDIATE_OBJECT_FILES) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/tx_ethparse1			: work/tx_ethparse1.o $(INTERMEDIATE_OBJECT_FILES) ; g++ $^ $(LINK_OPTIONS) -o $@



clean: 
	-rm -rf work/* bin/*



