# mRICH-FW
Firmware and software for mRICH SCROD and HODOSCOPE Daughtercards. 

This Branch focuses on the firmware for the HODOSCOPE trigger master system. 

Components:
1 SCROD (aka Trigger Master): determines if there is a global event, sends pmt readout triggers to PMT SCRODs, passes trigger data 
  to PC for event reconstruction. 
2. 4 HODOSCOPE event detection Daughter cards: that watch scintillating planes, when a oarticle passes through a plane, the Daughtercard 
   will send trigger data to the  SCROD.
