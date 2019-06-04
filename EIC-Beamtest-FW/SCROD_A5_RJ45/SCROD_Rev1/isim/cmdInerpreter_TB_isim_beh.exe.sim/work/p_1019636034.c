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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
extern char *STD_STANDARD;



int work_p_1019636034_sub_290711087_4071687244(char *t1, char *t2, unsigned int t3, unsigned int t4, int t5, int t6)
{
    char t7[128];
    char t8[16];
    char t9[16];
    char t16[8];
    int t0;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    char *t23;
    char *t24;
    int t25;
    char *t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    char *t32;
    char *t33;

LAB0:    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 9;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (9 - 0);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    t11 = (t7 + 4U);
    t14 = ((STD_STANDARD) + 384);
    t15 = (t11 + 88U);
    *((char **)t15) = t14;
    t17 = (t11 + 56U);
    *((char **)t17) = t16;
    *((int *)t16) = 0;
    t18 = (t11 + 80U);
    *((unsigned int *)t18) = 4U;
    t19 = (t8 + 4U);
    *((int *)t19) = t5;
    t20 = (t8 + 8U);
    *((int *)t20) = t6;
    t21 = t5;
    t22 = t6;

LAB2:    if (t21 <= t22)
        goto LAB3;

LAB5:    t10 = (t11 + 56U);
    t14 = *((char **)t10);
    t12 = *((int *)t14);
    t0 = t12;

LAB1:    return t0;
LAB3:    t23 = (t11 + 56U);
    t24 = *((char **)t23);
    t25 = *((int *)t24);
    t23 = (t2 + 40U);
    t26 = *((char **)t23);
    t23 = (t26 + t4);
    t27 = (t21 - 0);
    t13 = (t27 * 1);
    xsi_vhdl_check_range_of_index(0, 9, 1, t21);
    t28 = (4U * t13);
    t29 = (0 + t28);
    t26 = (t23 + t29);
    t30 = *((int *)t26);
    t31 = (t25 + t30);
    t32 = (t11 + 56U);
    t33 = *((char **)t32);
    t32 = (t33 + 0);
    *((int *)t32) = t31;

LAB4:    if (t21 == t22)
        goto LAB5;

LAB6:    t12 = (t21 + 1);
    t21 = t12;
    goto LAB2;

LAB7:;
}


void ieee_p_2592010699_sub_3130575329_503743352();

void ieee_p_2592010699_sub_3130575329_503743352();

void ieee_p_2592010699_sub_3130575329_503743352();

void ieee_p_2592010699_sub_3130575329_503743352();

void ieee_p_2592010699_sub_3130575329_503743352();

extern void work_p_1019636034_init()
{
	static char *se[] = {(void *)work_p_1019636034_sub_290711087_4071687244};
	xsi_register_didat("work_p_1019636034", "isim/cmdInerpreter_TB_isim_beh.exe.sim/work/p_1019636034.didat");
	xsi_register_subprogram_executes(se);
	xsi_register_resolution_function(1, 2, (void *)ieee_p_2592010699_sub_3130575329_503743352, 3);
	xsi_register_resolution_function(3, 2, (void *)ieee_p_2592010699_sub_3130575329_503743352, 3);
	xsi_register_resolution_function(4, 2, (void *)ieee_p_2592010699_sub_3130575329_503743352, 3);
	xsi_register_resolution_function(9, 2, (void *)ieee_p_2592010699_sub_3130575329_503743352, 3);
	xsi_register_resolution_function(11, 2, (void *)ieee_p_2592010699_sub_3130575329_503743352, 3);
}
