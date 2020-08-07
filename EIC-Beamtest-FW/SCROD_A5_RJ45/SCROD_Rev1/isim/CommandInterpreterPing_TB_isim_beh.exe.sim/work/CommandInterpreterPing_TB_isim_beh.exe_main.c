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

char *WORK_P_4250642694;
char *IEEE_P_3499444699;
char *IEEE_P_1242562249;
char *IEEE_P_2592010699;
char *IEEE_P_3620187407;
char *WORK_P_2951266164;
char *WORK_P_0487524481;
char *STD_STANDARD;
char *WORK_P_3361524051;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    work_p_4250642694_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_p_0487524481_init();
    work_p_2951266164_init();
    work_p_3361524051_init();
    work_a_2722242993_1516540902_init();
    work_a_1954778583_2372691052_init();


    xsi_register_tops("work_a_1954778583_2372691052");

    WORK_P_4250642694 = xsi_get_engine_memory("work_p_4250642694");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    WORK_P_2951266164 = xsi_get_engine_memory("work_p_2951266164");
    WORK_P_0487524481 = xsi_get_engine_memory("work_p_0487524481");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_3361524051 = xsi_get_engine_memory("work_p_3361524051");

    return xsi_run_simulation(argc, argv);

}
