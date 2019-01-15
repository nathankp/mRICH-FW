/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *UNISIM_P_0947159679;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *WORK_P_0487524481;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *IEEE_P_1242562249;
char *IEEE_P_1367372525;
char *STD_TEXTIO;
char *UNISIM_P_3222816464;
char *IEEE_P_2717149903;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    unisim_p_0947159679_init();
    work_p_0487524481_init();
    std_textio_init();
    ieee_p_2717149903_init();
    ieee_p_1367372525_init();
    unisim_p_3222816464_init();
    unisim_a_4160231357_3824467259_init();
    unisim_a_4027674294_3824467259_init();
    unisim_a_0850834979_2152628908_init();
    unisim_a_0714155612_2768510774_init();
    unisim_a_0018426790_2768510774_init();
    unisim_a_1297477671_0429821216_init();
    unisim_a_3232950048_2584565154_init();
    unisim_a_1490675510_1976025627_init();
    work_a_2472698881_0912031422_init();
    unisim_a_3458723563_3979135294_init();
    unisim_a_3321449454_0621957688_init();
    unisim_a_2627850724_0725860537_init();
    unisim_a_3382823076_2584565154_init();
    work_a_2570266795_0912031422_init();
    unisim_a_2340387572_1864968857_init();
    work_a_1181910133_1181938964_init();
    xilinxcorelib_a_2929639361_3212880686_init();
    xilinxcorelib_a_3606286955_3212880686_init();
    xilinxcorelib_a_2523763003_3212880686_init();
    work_a_1244718436_2052900076_init();
    unisim_a_0347976373_0621957688_init();
    work_a_1645520677_3212880686_init();
    unisim_a_3014403764_1187145474_init();
    work_a_3035903171_3212880686_init();
    work_a_2741925868_1516540902_init();
    work_a_4189508887_1516540902_init();
    work_a_1884529077_1516540902_init();
    xilinxcorelib_a_2719822303_3212880686_init();
    xilinxcorelib_a_2570771257_3212880686_init();
    xilinxcorelib_a_3898511197_3212880686_init();
    xilinxcorelib_a_1059662729_3212880686_init();
    work_a_2551899526_2492096576_init();
    xilinxcorelib_a_0903201034_3212880686_init();
    xilinxcorelib_a_2606897407_3212880686_init();
    xilinxcorelib_a_2035134324_3212880686_init();
    work_a_3819779223_1289078305_init();
    work_a_0934933731_3212880686_init();
    work_a_2449498190_3212880686_init();
    work_a_0788415914_3212880686_init();
    work_a_3050231650_2372691052_init();


    xsi_register_tops("work_a_3050231650_2372691052");

    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_0487524481 = xsi_get_engine_memory("work_p_0487524481");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    UNISIM_P_3222816464 = xsi_get_engine_memory("unisim_p_3222816464");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");

    return xsi_run_simulation(argc, argv);

}
