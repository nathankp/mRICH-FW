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
static const char *ng0 = "C:/Users/Kevin/Desktop/HMB/QBLink/source/S6SerialInterfaceIn.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_3620187407_sub_2546382208_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_2546418145_3965413181(char *, char *, char *, int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_3035903171_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    int t15;
    int t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    int t21;
    int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1632U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 7592);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(90, ng0);
    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 7752);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t2;
    xsi_driver_first_trans_delta(t1, 4U, 1, 0LL);
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 2632U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 7816);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t2;
    xsi_driver_first_trans_delta(t1, 4U, 1, 0LL);
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 13700);
    *((int *)t1) = 1;
    t3 = (t0 + 13704);
    *((int *)t3) = 4;
    t13 = 1;
    t14 = 4;

LAB8:    if (t13 <= t14)
        goto LAB9;

LAB11:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(91, ng0);
    t3 = xsi_get_transient_memory(5U);
    memset(t3, 0, 5U);
    t7 = t3;
    memset(t7, (unsigned char)2, 5U);
    t8 = (t0 + 7752);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 5U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(92, ng0);
    t1 = xsi_get_transient_memory(5U);
    memset(t1, 0, 5U);
    t3 = t1;
    memset(t3, (unsigned char)2, 5U);
    t4 = (t0 + 7816);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast(t4);
    goto LAB6;

LAB9:    xsi_set_current_line(97, ng0);
    t4 = (t0 + 2792U);
    t7 = *((char **)t4);
    t4 = (t0 + 13700);
    t15 = *((int *)t4);
    t16 = (t15 - 1);
    t17 = (t16 - 4);
    t18 = (t17 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, t16);
    t19 = (1U * t18);
    t20 = (0 + t19);
    t8 = (t7 + t20);
    t2 = *((unsigned char *)t8);
    t9 = (t0 + 13700);
    t21 = *((int *)t9);
    t22 = (t21 - 4);
    t23 = (t22 * -1);
    t24 = (1 * t23);
    t25 = (0U + t24);
    t10 = (t0 + 7752);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t26 = (t12 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = t2;
    xsi_driver_first_trans_delta(t10, t25, 1, 0LL);
    xsi_set_current_line(98, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = (t0 + 13700);
    t15 = *((int *)t1);
    t16 = (t15 - 1);
    t17 = (t16 - 4);
    t18 = (t17 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, t16);
    t19 = (1U * t18);
    t20 = (0 + t19);
    t4 = (t3 + t20);
    t2 = *((unsigned char *)t4);
    t7 = (t0 + 13700);
    t21 = *((int *)t7);
    t22 = (t21 - 4);
    t23 = (t22 * -1);
    t24 = (1 * t23);
    t25 = (0U + t24);
    t8 = (t0 + 7816);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t2;
    xsi_driver_first_trans_delta(t8, t25, 1, 0LL);

LAB10:    t1 = (t0 + 13700);
    t13 = *((int *)t1);
    t3 = (t0 + 13704);
    t14 = *((int *)t3);
    if (t13 == t14)
        goto LAB11;

LAB12:    t15 = (t13 + 1);
    t13 = t15;
    t4 = (t0 + 13700);
    *((int *)t4) = t13;
    goto LAB8;

}

static void work_a_3035903171_3212880686_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned char t15;
    char *t16;
    int t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    int t28;

LAB0:    xsi_set_current_line(105, ng0);
    t1 = (t0 + 1632U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 7608);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(106, ng0);
    t3 = (t0 + 13708);
    *((int *)t3) = 0;
    t4 = (t0 + 13712);
    *((int *)t4) = 4;
    t5 = 0;
    t6 = 4;

LAB5:    if (t5 <= t6)
        goto LAB6;

LAB8:    goto LAB3;

LAB6:    xsi_set_current_line(107, ng0);
    t7 = (t0 + 2792U);
    t8 = *((char **)t7);
    t7 = (t0 + 13708);
    t9 = *((int *)t7);
    t10 = (t9 - 4);
    t11 = (t10 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, *((int *)t7));
    t12 = (1U * t11);
    t13 = (0 + t12);
    t14 = (t8 + t13);
    t15 = *((unsigned char *)t14);
    t16 = (t0 + 13708);
    t17 = *((int *)t16);
    t18 = (t17 * 2);
    t19 = (t18 - 9);
    t20 = (t19 * -1);
    t21 = (1 * t20);
    t22 = (0U + t21);
    t23 = (t0 + 7880);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = t15;
    xsi_driver_first_trans_delta(t23, t22, 1, 0LL);
    xsi_set_current_line(108, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = (t0 + 13708);
    t9 = *((int *)t1);
    t10 = (t9 - 4);
    t11 = (t10 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, *((int *)t1));
    t12 = (1U * t11);
    t13 = (0 + t12);
    t4 = (t3 + t13);
    t2 = *((unsigned char *)t4);
    t7 = (t0 + 13708);
    t17 = *((int *)t7);
    t18 = (t17 * 2);
    t19 = (t18 + 1);
    t28 = (t19 - 9);
    t20 = (t28 * -1);
    t21 = (1 * t20);
    t22 = (0U + t21);
    t8 = (t0 + 7880);
    t14 = (t8 + 56U);
    t16 = *((char **)t14);
    t23 = (t16 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = t2;
    xsi_driver_first_trans_delta(t8, t22, 1, 0LL);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = (t0 + 13708);
    t9 = *((int *)t1);
    t10 = (t9 - 4);
    t11 = (t10 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, *((int *)t1));
    t12 = (1U * t11);
    t13 = (0 + t12);
    t4 = (t3 + t13);
    t2 = *((unsigned char *)t4);
    t7 = (t0 + 13708);
    t17 = *((int *)t7);
    t18 = (t17 * 2);
    t19 = (t18 - 9);
    t20 = (t19 * -1);
    t21 = (1 * t20);
    t22 = (0U + t21);
    t8 = (t0 + 7944);
    t14 = (t8 + 56U);
    t16 = *((char **)t14);
    t23 = (t16 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = t2;
    xsi_driver_first_trans_delta(t8, t22, 1, 0LL);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t1 = (t0 + 13708);
    t9 = *((int *)t1);
    t10 = (t9 - 4);
    t11 = (t10 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, *((int *)t1));
    t12 = (1U * t11);
    t13 = (0 + t12);
    t4 = (t3 + t13);
    t2 = *((unsigned char *)t4);
    t7 = (t0 + 13708);
    t17 = *((int *)t7);
    t18 = (t17 * 2);
    t19 = (t18 + 1);
    t28 = (t19 - 9);
    t20 = (t28 * -1);
    t21 = (1 * t20);
    t22 = (0U + t21);
    t8 = (t0 + 7944);
    t14 = (t8 + 56U);
    t16 = *((char **)t14);
    t23 = (t16 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = t2;
    xsi_driver_first_trans_delta(t8, t22, 1, 0LL);

LAB7:    t1 = (t0 + 13708);
    t5 = *((int *)t1);
    t3 = (t0 + 13712);
    t6 = *((int *)t3);
    if (t5 == t6)
        goto LAB8;

LAB9:    t9 = (t5 + 1);
    t5 = t9;
    t4 = (t0 + 13708);
    *((int *)t4) = t5;
    goto LAB5;

}

static void work_a_3035903171_3212880686_p_2(char *t0)
{
    char t11[16];
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
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5};

LAB0:    xsi_set_current_line(121, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 5048U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 40U);
    xsi_set_current_line(124, ng0);
    t1 = (t0 + 5048U);
    t2 = *((char **)t1);
    t4 = (0 + 11U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(127, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    t5 = *((unsigned char *)t1);
    t3 = (char *)((nl0) + t5);
    goto **((char **)t3);

LAB2:    xsi_set_current_line(171, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t17 = (t5 == (unsigned char)3);
    if (t17 != 0)
        goto LAB22;

LAB24:
LAB23:    xsi_set_current_line(176, ng0);
    t1 = (t0 + 5048U);
    t2 = *((char **)t1);
    t1 = (t0 + 8008);
    t3 = (t1 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 40U);
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 7624);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(129, ng0);
    t6 = xsi_get_transient_memory(4U);
    memset(t6, 0, 4U);
    t7 = t6;
    memset(t7, (unsigned char)2, 4U);
    t8 = (t0 + 5048U);
    t9 = *((char **)t8);
    t10 = (0 + 12U);
    t8 = (t9 + t10);
    memcpy(t8, t6, 4U);
    xsi_set_current_line(130, ng0);
    t1 = (t0 + 5048U);
    t2 = *((char **)t1);
    t4 = (0 + 32U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(131, ng0);
    t1 = (t0 + 5048U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB2;

LAB4:    xsi_set_current_line(133, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t4 = (0 + 12U);
    t1 = (t2 + t4);
    t3 = (t0 + 9016);
    t6 = xsi_record_get_element_type(t3, 3);
    t7 = (t6 + 80U);
    t8 = *((char **)t7);
    t9 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t11, t1, t8, 2);
    t12 = (t0 + 5048U);
    t13 = *((char **)t12);
    t10 = (0 + 12U);
    t12 = (t13 + t10);
    t14 = (t11 + 12U);
    t15 = *((unsigned int *)t14);
    t16 = (1U * t15);
    memcpy(t12, t9, t16);
    xsi_set_current_line(141, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t4 = (0 + 12U);
    t1 = (t2 + t4);
    t3 = (t0 + 9016);
    t6 = xsi_record_get_element_type(t3, 3);
    t7 = (t6 + 80U);
    t8 = *((char **)t7);
    t5 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t1, t8, 8);
    if (t5 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB2;

LAB5:    xsi_set_current_line(164, ng0);
    t1 = xsi_get_transient_memory(4U);
    memset(t1, 0, 4U);
    t2 = t1;
    memset(t2, (unsigned char)2, 4U);
    t3 = (t0 + 5048U);
    t6 = *((char **)t3);
    t4 = (0 + 12U);
    t3 = (t6 + t4);
    memcpy(t3, t1, 4U);
    xsi_set_current_line(165, ng0);
    t1 = (t0 + 5048U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB2;

LAB6:    xsi_set_current_line(167, ng0);
    t1 = (t0 + 5048U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)0;
    goto LAB2;

LAB7:    xsi_set_current_line(142, ng0);
    t9 = xsi_get_transient_memory(4U);
    memset(t9, 0, 4U);
    t12 = t9;
    memset(t12, (unsigned char)2, 4U);
    t13 = (t0 + 5048U);
    t14 = *((char **)t13);
    t10 = (0 + 12U);
    t13 = (t14 + t10);
    memcpy(t13, t9, 4U);
    xsi_set_current_line(143, ng0);
    t1 = (t0 + 5048U);
    t2 = *((char **)t1);
    t4 = (0 + 11U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)3;
    xsi_set_current_line(144, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t4 = (0 + 32U);
    t1 = (t2 + t4);
    t5 = *((unsigned char *)t1);
    t17 = (t5 == (unsigned char)2);
    if (t17 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(147, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t1 = (t0 + 5048U);
    t3 = *((char **)t1);
    t4 = (0 + 1U);
    t1 = (t3 + t4);
    memcpy(t1, t2, 10U);

LAB11:    xsi_set_current_line(149, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t17 = (t5 == (unsigned char)2);
    if (t17 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB8;

LAB10:    xsi_set_current_line(145, ng0);
    t3 = (t0 + 3112U);
    t6 = *((char **)t3);
    t3 = (t0 + 5048U);
    t7 = *((char **)t3);
    t10 = (0 + 1U);
    t3 = (t7 + t10);
    memcpy(t3, t6, 10U);
    goto LAB11;

LAB13:    xsi_set_current_line(150, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t4 = (0 + 16U);
    t1 = (t3 + t4);
    t6 = (t0 + 9016);
    t7 = xsi_record_get_element_type(t6, 4);
    t8 = (t7 + 80U);
    t9 = *((char **)t8);
    t18 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t1, t9, 200);
    if (t18 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(153, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)2, 16U);
    t3 = (t0 + 5048U);
    t6 = *((char **)t3);
    t4 = (0 + 16U);
    t3 = (t6 + t4);
    memcpy(t3, t1, 16U);
    xsi_set_current_line(154, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t4 = (0 + 32U);
    t1 = (t2 + t4);
    t5 = *((unsigned char *)t1);
    t17 = (t5 == (unsigned char)2);
    if (t17 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(157, ng0);
    t1 = (t0 + 5048U);
    t2 = *((char **)t1);
    t4 = (0 + 32U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(158, ng0);
    t1 = (t0 + 5048U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)2;

LAB20:
LAB17:    goto LAB14;

LAB16:    xsi_set_current_line(151, ng0);
    t12 = (t0 + 2152U);
    t13 = *((char **)t12);
    t10 = (0 + 16U);
    t12 = (t13 + t10);
    t14 = (t0 + 9016);
    t19 = xsi_record_get_element_type(t14, 4);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t11, t12, t21, 1);
    t23 = (t0 + 5048U);
    t24 = *((char **)t23);
    t15 = (0 + 16U);
    t23 = (t24 + t15);
    t25 = (t11 + 12U);
    t16 = *((unsigned int *)t25);
    t26 = (1U * t16);
    memcpy(t23, t22, t26);
    goto LAB17;

LAB19:    xsi_set_current_line(155, ng0);
    t3 = (t0 + 5048U);
    t6 = *((char **)t3);
    t10 = (0 + 32U);
    t3 = (t6 + t10);
    *((unsigned char *)t3) = (unsigned char)3;
    goto LAB20;

LAB22:    xsi_set_current_line(172, ng0);
    t1 = (t0 + 4928U);
    t3 = *((char **)t1);
    t1 = (t0 + 5048U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    memcpy(t1, t3, 40U);
    goto LAB23;

}

static void work_a_3035903171_3212880686_p_3(char *t0)
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

LAB0:    xsi_set_current_line(183, ng0);
    t1 = (t0 + 1632U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 7640);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(184, ng0);
    t3 = (t0 + 2312U);
    t4 = *((char **)t3);
    t3 = (t0 + 8072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 40U);
    xsi_driver_first_trans_delta(t3, 0U, 33U, 1000LL);
    t9 = (t0 + 8072);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    goto LAB3;

}

static void work_a_3035903171_3212880686_p_4(char *t0)
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

LAB0:    xsi_set_current_line(80, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 8136);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);

LAB2:    t9 = (t0 + 7656);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3035903171_3212880686_p_5(char *t0)
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

LAB0:    xsi_set_current_line(197, ng0);

LAB3:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 8200);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);

LAB2:    t9 = (t0 + 7672);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3035903171_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3035903171_3212880686_p_0,(void *)work_a_3035903171_3212880686_p_1,(void *)work_a_3035903171_3212880686_p_2,(void *)work_a_3035903171_3212880686_p_3,(void *)work_a_3035903171_3212880686_p_4,(void *)work_a_3035903171_3212880686_p_5};
	xsi_register_didat("work_a_3035903171_3212880686", "isim/cmdInerpreter_TB_isim_beh.exe.sim/work/a_3035903171_3212880686.didat");
	xsi_register_executes(pe);
}
