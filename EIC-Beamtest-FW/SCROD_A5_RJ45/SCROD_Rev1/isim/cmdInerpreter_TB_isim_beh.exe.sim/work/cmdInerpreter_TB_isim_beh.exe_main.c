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

char *IEEE_P_3499444699;
char *UNISIM_P_0947159679;
char *STD_STANDARD;
char *IEEE_P_2592010699;
char *IEEE_P_3620187407;
char *IEEE_P_1242562249;
char *XILINXCORELIB_P_0914797037;
char *XILINXCORELIB_P_2147798235;
char *WORK_P_4250642694;
char *WORK_P_1019636034;
char *XILINXCORELIB_P_1837083571;
char *WORK_P_0062508312;
char *STD_TEXTIO;
char *WORK_P_2951266164;
char *WORK_P_0487524481;
char *XILINXCORELIB_P_0558180590;
char *WORK_P_3361524051;
char *IEEE_P_2717149903;
char *IEEE_P_1367372525;
char *UNISIM_P_3222816464;
char *XILINXCORELIB_P_3381355550;
char *XILINXCORELIB_P_1433929353;
char *XILINXCORELIB_P_0661866964;
char *IEEE_P_0774719531;
char *XILINXCORELIB_P_3106367597;
char *XILINXCORELIB_P_0624651749;


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
    work_p_2951266164_init();
    work_p_3361524051_init();
    work_p_4250642694_init();
    work_p_1019636034_init();
    work_p_0062508312_init();
    work_a_0611294277_1516540902_init();
    std_textio_init();
    ieee_p_2717149903_init();
    ieee_p_1367372525_init();
    unisim_p_3222816464_init();
    unisim_a_0850834979_2152628908_init();
    unisim_a_0714155612_2768510774_init();
    unisim_a_0018426790_2768510774_init();
    unisim_a_1297477671_0429821216_init();
    unisim_a_3382823076_2584565154_init();
    unisim_a_1490675510_1976025627_init();
    work_a_2570266795_0912031422_init();
    work_a_1923327646_1516540902_init();
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
    work_a_2775425109_3797831714_init();
    unisim_a_2627850724_0725860537_init();
    unisim_a_3458723563_3979135294_init();
    unisim_a_3321449454_0621957688_init();
    work_a_1200010050_3212880686_init();
    ieee_p_0774719531_init();
    unisim_a_4160231357_3824467259_init();
    unisim_a_1027153212_2930107152_init();
    unisim_a_3468871596_1532504268_init();
    work_a_4041658745_0912031422_init();
    work_a_2136280892_3212880686_init();
    xilinxcorelib_p_1837083571_init();
    xilinxcorelib_p_2147798235_init();
    xilinxcorelib_p_0914797037_init();
    xilinxcorelib_p_0558180590_init();
    xilinxcorelib_p_3381355550_init();
    xilinxcorelib_p_1433929353_init();
    xilinxcorelib_p_0661866964_init();
    xilinxcorelib_p_3106367597_init();
    xilinxcorelib_p_0624651749_init();
    xilinxcorelib_a_2170362861_3212880686_init();
    xilinxcorelib_a_0475200155_3212880686_init();
    xilinxcorelib_a_0008792968_3212880686_init();
    xilinxcorelib_a_1703983943_3212880686_init();
    xilinxcorelib_a_2637840722_3212880686_init();
    work_a_2026819502_4181869764_init();
    work_a_3389051026_3212880686_init();
    work_a_0788415914_3212880686_init();
    work_a_0248843461_2372691052_init();


    xsi_register_tops("work_a_0248843461_2372691052");

    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    XILINXCORELIB_P_0914797037 = xsi_get_engine_memory("xilinxcorelib_p_0914797037");
    XILINXCORELIB_P_2147798235 = xsi_get_engine_memory("xilinxcorelib_p_2147798235");
    WORK_P_4250642694 = xsi_get_engine_memory("work_p_4250642694");
    WORK_P_1019636034 = xsi_get_engine_memory("work_p_1019636034");
    XILINXCORELIB_P_1837083571 = xsi_get_engine_memory("xilinxcorelib_p_1837083571");
    WORK_P_0062508312 = xsi_get_engine_memory("work_p_0062508312");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    WORK_P_2951266164 = xsi_get_engine_memory("work_p_2951266164");
    WORK_P_0487524481 = xsi_get_engine_memory("work_p_0487524481");
    XILINXCORELIB_P_0558180590 = xsi_get_engine_memory("xilinxcorelib_p_0558180590");
    WORK_P_3361524051 = xsi_get_engine_memory("work_p_3361524051");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    UNISIM_P_3222816464 = xsi_get_engine_memory("unisim_p_3222816464");
    XILINXCORELIB_P_3381355550 = xsi_get_engine_memory("xilinxcorelib_p_3381355550");
    XILINXCORELIB_P_1433929353 = xsi_get_engine_memory("xilinxcorelib_p_1433929353");
    XILINXCORELIB_P_0661866964 = xsi_get_engine_memory("xilinxcorelib_p_0661866964");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    XILINXCORELIB_P_3106367597 = xsi_get_engine_memory("xilinxcorelib_p_3106367597");
    XILINXCORELIB_P_0624651749 = xsi_get_engine_memory("xilinxcorelib_p_0624651749");

    return xsi_run_simulation(argc, argv);

}
