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
char *STD_STANDARD;
char *UNISIM_P_0947159679;
char *IEEE_P_1242562249;
char *IEEE_P_2592010699;
char *WORK_P_4250642694;
char *IEEE_P_3620187407;
char *UNIMACRO_P_0947159679;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    unisim_p_0947159679_init();
    unimacro_p_0947159679_init();
    work_p_4250642694_init();
    xilinxcorelib_a_0903201034_3212880686_init();
    xilinxcorelib_a_2606897407_3212880686_init();
    xilinxcorelib_a_2035134324_3212880686_init();
    work_a_3819779223_1289078305_init();
    xilinxcorelib_a_3829867477_3212880686_init();
    xilinxcorelib_a_2683654378_3212880686_init();
    xilinxcorelib_a_2207982310_3212880686_init();
    work_a_1665749512_3590731790_init();
    xilinxcorelib_a_3928059347_3212880686_init();
    xilinxcorelib_a_3931412523_3212880686_init();
    xilinxcorelib_a_1706808773_3212880686_init();
    work_a_0802900139_3159074371_init();
    work_a_0123172718_3212880686_init();
    work_a_3192252765_2372691052_init();


    xsi_register_tops("work_a_3192252765_2372691052");

    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    WORK_P_4250642694 = xsi_get_engine_memory("work_p_4250642694");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    UNIMACRO_P_0947159679 = xsi_get_engine_memory("unimacro_p_0947159679");

    return xsi_run_simulation(argc, argv);

}
