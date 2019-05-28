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
static const char *ng0 = "C:/Users/Kevin/Desktop/HMB/QBLink/source/S6SerialInterfaceOut.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_3620187407_sub_2546418145_3965413181(char *, char *, char *, int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_1645520677_3212880686_p_0(char *t0)
{
    char t23[16];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned char t11;
    int t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    int t22;
    static char *nl0[] = {&&LAB3, &&LAB4};

LAB0:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 4128U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 24U);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    t5 = *((unsigned char *)t1);
    t3 = (char *)((nl0) + t5);
    goto **((char **)t3);

LAB2:    xsi_set_current_line(102, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t11 = (t5 == (unsigned char)3);
    if (t11 != 0)
        goto LAB12;

LAB14:
LAB13:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 4128U);
    t2 = *((char **)t1);
    t1 = (t0 + 6304);
    t3 = (t1 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 24U);
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 6176);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(83, ng0);
    t6 = xsi_get_transient_memory(4U);
    memset(t6, 0, 4U);
    t7 = t6;
    memset(t7, (unsigned char)2, 4U);
    t8 = (t0 + 4128U);
    t9 = *((char **)t8);
    t10 = (0 + 11U);
    t8 = (t9 + t10);
    memcpy(t8, t6, 4U);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t11 = (t5 == (unsigned char)3);
    if (t11 != 0)
        goto LAB6;

LAB8:
LAB7:    goto LAB2;

LAB4:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t4 = (0 + 11U);
    t1 = (t3 + t4);
    t6 = (t0 + 7200);
    t7 = xsi_record_get_element_type(t6, 2);
    t8 = (t7 + 80U);
    t9 = *((char **)t8);
    t12 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t1, t9);
    t13 = (9 - t12);
    t14 = (t13 - 9);
    t10 = (t14 * -1);
    xsi_vhdl_check_range_of_index(9, 0, -1, t13);
    t15 = (1U * t10);
    t16 = (0 + 1U);
    t17 = (t16 + t15);
    t18 = (t2 + t17);
    t5 = *((unsigned char *)t18);
    t19 = (t0 + 4128U);
    t20 = *((char **)t19);
    t21 = (0 + 15U);
    t19 = (t20 + t21);
    *((unsigned char *)t19) = t5;
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t4 = (0 + 11U);
    t1 = (t3 + t4);
    t6 = (t0 + 7200);
    t7 = xsi_record_get_element_type(t6, 2);
    t8 = (t7 + 80U);
    t9 = *((char **)t8);
    t12 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t1, t9);
    t13 = (9 - t12);
    t14 = (t13 - 1);
    t22 = (t14 - 9);
    t10 = (t22 * -1);
    xsi_vhdl_check_range_of_index(9, 0, -1, t14);
    t15 = (1U * t10);
    t16 = (0 + 1U);
    t17 = (t16 + t15);
    t18 = (t2 + t17);
    t5 = *((unsigned char *)t18);
    t19 = (t0 + 4128U);
    t20 = *((char **)t19);
    t21 = (0 + 16U);
    t19 = (t20 + t21);
    *((unsigned char *)t19) = t5;
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t4 = (0 + 11U);
    t1 = (t2 + t4);
    t3 = (t0 + 7200);
    t6 = xsi_record_get_element_type(t3, 2);
    t7 = (t6 + 80U);
    t8 = *((char **)t7);
    t5 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t1, t8, 8);
    if (t5 != 0)
        goto LAB9;

LAB11:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t4 = (0 + 11U);
    t1 = (t2 + t4);
    t3 = (t0 + 7200);
    t6 = xsi_record_get_element_type(t3, 2);
    t7 = (t6 + 80U);
    t8 = *((char **)t7);
    t9 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t23, t1, t8, 2);
    t18 = (t0 + 4128U);
    t19 = *((char **)t18);
    t10 = (0 + 11U);
    t18 = (t19 + t10);
    t20 = (t23 + 12U);
    t15 = *((unsigned int *)t20);
    t16 = (1U * t15);
    memcpy(t18, t9, t16);

LAB10:    goto LAB2;

LAB5:    xsi_set_current_line(98, ng0);
    t1 = (t0 + 4128U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)0;
    goto LAB2;

LAB6:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t1 = (t0 + 4128U);
    t6 = *((char **)t1);
    t4 = (0 + 1U);
    t1 = (t6 + t4);
    memcpy(t1, t3, 10U);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 4128U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB7;

LAB9:    xsi_set_current_line(92, ng0);
    t9 = xsi_get_transient_memory(4U);
    memset(t9, 0, 4U);
    t18 = t9;
    memset(t18, (unsigned char)2, 4U);
    t19 = (t0 + 4128U);
    t20 = *((char **)t19);
    t10 = (0 + 11U);
    t19 = (t20 + t10);
    memcpy(t19, t9, 4U);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 4128U);
    t3 = *((char **)t1);
    t4 = (0 + 1U);
    t1 = (t3 + t4);
    memcpy(t1, t2, 10U);
    goto LAB10;

LAB12:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 4008U);
    t3 = *((char **)t1);
    t1 = (t0 + 4128U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    memcpy(t1, t3, 24U);
    goto LAB13;

}

static void work_a_1645520677_3212880686_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(114, ng0);
    t1 = (t0 + 1472U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 6192);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(115, ng0);
    t3 = (t0 + 2152U);
    t4 = *((char **)t3);
    t3 = (t0 + 6368);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 24U);
    xsi_driver_first_trans_delta(t3, 0U, 17U, 1000LL);
    t9 = (t0 + 6368);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    goto LAB3;

}

static void work_a_1645520677_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(64, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 6432);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);

LAB2:    t9 = (t0 + 6208);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1645520677_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(129, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 6496);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);

LAB2:    t9 = (t0 + 6224);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1645520677_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1645520677_3212880686_p_0,(void *)work_a_1645520677_3212880686_p_1,(void *)work_a_1645520677_3212880686_p_2,(void *)work_a_1645520677_3212880686_p_3};
	xsi_register_didat("work_a_1645520677_3212880686", "isim/HMB_DC_QBTOP_isim_beh.exe.sim/work/a_1645520677_3212880686.didat");
	xsi_register_executes(pe);
}
