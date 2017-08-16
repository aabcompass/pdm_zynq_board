#!/opt/Xilinx/SDK/2016.2/bin/xsct
cd project_1.sdk
setws
pwd
openhw design_1_wrapper_hw_platform_0 
#getperipherals design_1_wrapper_hw_platform_0
createbsp -name bsp_0 -hwproject design_1_wrapper_hw_platform_0 -proc  ps7_cortexa9_0 -os standalone
openbsp bsp_0 
projects -build -type bsp -name bsp_0 
createapp -name hello1 -app {Hello World} -bsp bsp_0 -hwproject design_1_wrapper_hw_platform_0 -proc ps7_cortexa9_0
projects -build -type app -name hello1 
createapp -name app_0 -app {Empty Application} -bsp bsp_0 -hwproject design_1_wrapper_hw_platform_0 -proc ps7_cortexa9_0 -lang c
setlib -hw design_1_wrapper_hw_platform_0 -bsp bsp_0 -lib xilffs
setlib -hw design_1_wrapper_hw_platform_0 -bsp bsp_0 -lib xilrsa
setlib -hw design_1_wrapper_hw_platform_0 -bsp bsp_0 -lib lwip140 -ver 2.3
#configbsp -lib lwip140 -hw design_1_wrapper_hw_platform_0 -bsp bsp_0
updatemss -hw design_1_wrapper_hw_platform_0 -mss bsp_0/system.mss 
regenbsp -hw design_1_wrapper_hw_platform_0 -bsp bsp_0
projects -build -type bsp -name bsp_0
importsources -name app_0 -path ../project_1.sdk.tmp/app_0/src
projects -build -type app -name app_0


