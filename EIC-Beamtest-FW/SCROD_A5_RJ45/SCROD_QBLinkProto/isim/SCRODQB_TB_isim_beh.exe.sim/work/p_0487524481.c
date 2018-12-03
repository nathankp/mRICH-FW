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
static const char *ng0 = "Function sel ended without a return statement";
extern char *STD_STANDARD;
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


char *work_p_0487524481_sub_2434039100_4043136551(char *t1, char *t2, int t3, char *t4, char *t5)
{
    char t6[128];
    char t7[24];
    char t10[16];
    char t17[8];
    char *t0;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned char t23;
    char *t24;
    unsigned char t25;
    int t26;
    char *t27;
    unsigned char t28;
    unsigned char t29;
    char *t30;
    int t32;
    int t33;
    int t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    int t38;
    int t39;
    int t40;
    int t41;
    unsigned int t42;
    unsigned int t43;

LAB0:    t8 = xsi_get_transient_memory(8U);
    memset(t8, 0, 8U);
    t9 = t8;
    memset(t9, (unsigned char)2, 8U);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 7;
    t12 = (t11 + 4U);
    *((int *)t12) = 0;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t13 = (0 - 7);
    t14 = (t13 * -1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t6 + 4U);
    t15 = (t1 + 2472);
    t16 = (t12 + 88U);
    *((char **)t16) = t15;
    t18 = (t12 + 56U);
    *((char **)t18) = t17;
    memcpy(t17, t8, 8U);
    t19 = (t12 + 64U);
    *((char **)t19) = t10;
    t20 = (t12 + 80U);
    *((unsigned int *)t20) = 8U;
    t21 = (t7 + 4U);
    *((int *)t21) = t3;
    t22 = (t7 + 8U);
    t23 = (t4 != 0);
    if (t23 == 1)
        goto LAB3;

LAB2:    t24 = (t7 + 16U);
    *((char **)t24) = t5;
    t26 = (t3 * 8);
    t27 = (t5 + 12U);
    t14 = *((unsigned int *)t27);
    t28 = (t26 <= t14);
    if (t28 == 1)
        goto LAB6;

LAB7:    t25 = (unsigned char)0;

LAB8:    if (t25 == 0)
        goto LAB4;

LAB5:    t8 = (t5 + 0U);
    t13 = *((int *)t8);
    t26 = (8 * t3);
    t32 = (t26 + 7);
    t14 = (t13 - t32);
    t33 = (8 * t3);
    t9 = (t5 + 4U);
    t34 = *((int *)t9);
    t11 = (t5 + 8U);
    t35 = *((int *)t11);
    xsi_vhdl_check_range_of_slice(t13, t34, t35, t32, t33, -1);
    t36 = (t14 * 1U);
    t37 = (0 + t36);
    t15 = (t4 + t37);
    t16 = (t12 + 56U);
    t18 = *((char **)t16);
    t16 = (t18 + 0);
    t38 = (8 * t3);
    t39 = (t38 + 7);
    t40 = (8 * t3);
    t41 = (t40 - t39);
    t42 = (t41 * -1);
    t42 = (t42 + 1);
    t43 = (1U * t42);
    memcpy(t16, t15, t43);
    t8 = (t12 + 56U);
    t9 = *((char **)t8);
    t8 = (t10 + 12U);
    t14 = *((unsigned int *)t8);
    t14 = (t14 * 1U);
    t0 = xsi_get_transient_memory(t14);
    memcpy(t0, t9, t14);
    t11 = (t10 + 0U);
    t13 = *((int *)t11);
    t15 = (t10 + 4U);
    t26 = *((int *)t15);
    t16 = (t10 + 8U);
    t32 = *((int *)t16);
    t18 = (t2 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = t13;
    t19 = (t18 + 4U);
    *((int *)t19) = t26;
    t19 = (t18 + 8U);
    *((int *)t19) = t32;
    t33 = (t26 - t13);
    t36 = (t33 * t32);
    t36 = (t36 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t36;

LAB1:    return t0;
LAB3:    *((char **)t22) = t4;
    goto LAB2;

LAB4:    t30 = (t1 + 5264);
    xsi_report(t30, 28U, (unsigned char)3);
    goto LAB5;

LAB6:    t29 = (t3 >= 0);
    t25 = t29;
    goto LAB8;

LAB9:;
}

int work_p_0487524481_sub_2035035004_4043136551(char *t1, unsigned char t2, int t3, int t4)
{
    char t6[16];
    int t0;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;

LAB0:    t7 = (t6 + 4U);
    *((unsigned char *)t7) = t2;
    t8 = (t6 + 5U);
    *((int *)t8) = t3;
    t9 = (t6 + 9U);
    *((int *)t9) = t4;
    t10 = (t2 == (unsigned char)1);
    if (t10 != 0)
        goto LAB2;

LAB4:    t0 = t4;

LAB1:    return t0;
LAB2:    t0 = t3;
    goto LAB1;

LAB3:    xsi_error(ng0);
    t0 = 0;
    goto LAB1;

LAB5:    goto LAB3;

LAB6:    goto LAB3;

}

int work_p_0487524481_sub_2931345285_4043136551(char *t1, char *t2, char *t3)
{
    char t4[128];
    char t5[24];
    char t9[8];
    int t0;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    int t23;
    int t24;
    char *t25;
    int t26;
    char *t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned char t34;
    unsigned char t35;
    char *t36;
    char *t37;
    int t38;
    int t39;
    char *t40;

LAB0:    t6 = (t4 + 4U);
    t7 = ((STD_STANDARD) + 384);
    t8 = (t6 + 88U);
    *((char **)t8) = t7;
    t10 = (t6 + 56U);
    *((char **)t10) = t9;
    *((int *)t9) = 0;
    t11 = (t6 + 80U);
    *((unsigned int *)t11) = 4U;
    t12 = (t5 + 4U);
    t13 = (t2 != 0);
    if (t13 == 1)
        goto LAB3;

LAB2:    t14 = (t5 + 12U);
    *((char **)t14) = t3;
    t15 = (t3 + 8U);
    t16 = *((int *)t15);
    t17 = (t3 + 4U);
    t18 = *((int *)t17);
    t19 = (t3 + 0U);
    t20 = *((int *)t19);
    t21 = t20;
    t22 = t18;

LAB4:    t23 = (t22 * t16);
    t24 = (t21 * t16);
    if (t24 <= t23)
        goto LAB5;

LAB7:    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t16 = *((int *)t8);
    t0 = t16;

LAB1:    return t0;
LAB3:    *((char **)t12) = t2;
    goto LAB2;

LAB5:    t25 = (t3 + 0U);
    t26 = *((int *)t25);
    t27 = (t3 + 8U);
    t28 = *((int *)t27);
    t29 = (t21 - t26);
    t30 = (t29 * t28);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t33 = (t2 + t32);
    t34 = *((unsigned char *)t33);
    t35 = (t34 == (unsigned char)3);
    if (t35 != 0)
        goto LAB8;

LAB10:
LAB9:
LAB6:    if (t21 == t22)
        goto LAB7;

LAB11:    t18 = (t21 + t16);
    t21 = t18;
    goto LAB4;

LAB8:    t36 = (t6 + 56U);
    t37 = *((char **)t36);
    t38 = *((int *)t37);
    t39 = (t38 + 1);
    t36 = (t6 + 56U);
    t40 = *((char **)t36);
    t36 = (t40 + 0);
    *((int *)t36) = t39;
    goto LAB9;

LAB12:;
}

int work_p_0487524481_sub_545091389_4043136551(char *t1, char *t2, char *t3)
{
    char t4[128];
    char t5[24];
    char t9[8];
    char t36[16];
    int t0;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    int t23;
    int t24;
    char *t25;
    char *t26;
    int t27;
    int t28;
    char *t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t37;
    char *t38;
    int t39;
    unsigned int t40;
    int t41;
    int t42;
    char *t43;

LAB0:    t6 = (t4 + 4U);
    t7 = ((STD_STANDARD) + 384);
    t8 = (t6 + 88U);
    *((char **)t8) = t7;
    t10 = (t6 + 56U);
    *((char **)t10) = t9;
    *((int *)t9) = 0;
    t11 = (t6 + 80U);
    *((unsigned int *)t11) = 4U;
    t12 = (t5 + 4U);
    t13 = (t2 != 0);
    if (t13 == 1)
        goto LAB3;

LAB2:    t14 = (t5 + 12U);
    *((char **)t14) = t3;
    t15 = (t3 + 8U);
    t16 = *((int *)t15);
    t17 = (t3 + 4U);
    t18 = *((int *)t17);
    t19 = (t3 + 0U);
    t20 = *((int *)t19);
    t21 = t20;
    t22 = t18;

LAB4:    t23 = (t22 * t16);
    t24 = (t21 * t16);
    if (t24 <= t23)
        goto LAB5;

LAB7:    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t16 = *((int *)t8);
    t0 = t16;

LAB1:    return t0;
LAB3:    *((char **)t12) = t2;
    goto LAB2;

LAB5:    t25 = (t6 + 56U);
    t26 = *((char **)t25);
    t27 = *((int *)t26);
    t25 = (t3 + 0U);
    t28 = *((int *)t25);
    t29 = (t3 + 8U);
    t30 = *((int *)t29);
    t31 = (t21 - t28);
    t32 = (t31 * t30);
    t33 = (8U * t32);
    t34 = (0 + t33);
    t35 = (t2 + t34);
    t37 = (t36 + 0U);
    t38 = (t37 + 0U);
    *((int *)t38) = 7;
    t38 = (t37 + 4U);
    *((int *)t38) = 0;
    t38 = (t37 + 8U);
    *((int *)t38) = -1;
    t39 = (0 - 7);
    t40 = (t39 * -1);
    t40 = (t40 + 1);
    t38 = (t37 + 12U);
    *((unsigned int *)t38) = t40;
    t41 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t35, t36);
    t42 = (t27 + t41);
    t38 = (t6 + 56U);
    t43 = *((char **)t38);
    t38 = (t43 + 0);
    *((int *)t38) = t42;

LAB6:    if (t21 == t22)
        goto LAB7;

LAB8:    t18 = (t21 + t16);
    t21 = t18;
    goto LAB4;

LAB9:;
}

int work_p_0487524481_sub_3397313174_4043136551(char *t1, char *t2, char *t3)
{
    char t4[128];
    char t5[24];
    char t9[8];
    char t36[16];
    int t0;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    int t23;
    int t24;
    char *t25;
    char *t26;
    int t27;
    int t28;
    char *t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t37;
    char *t38;
    int t39;
    unsigned int t40;
    int t41;
    int t42;
    char *t43;

LAB0:    t6 = (t4 + 4U);
    t7 = ((STD_STANDARD) + 384);
    t8 = (t6 + 88U);
    *((char **)t8) = t7;
    t10 = (t6 + 56U);
    *((char **)t10) = t9;
    *((int *)t9) = 0;
    t11 = (t6 + 80U);
    *((unsigned int *)t11) = 4U;
    t12 = (t5 + 4U);
    t13 = (t2 != 0);
    if (t13 == 1)
        goto LAB3;

LAB2:    t14 = (t5 + 12U);
    *((char **)t14) = t3;
    t15 = (t3 + 8U);
    t16 = *((int *)t15);
    t17 = (t3 + 4U);
    t18 = *((int *)t17);
    t19 = (t3 + 0U);
    t20 = *((int *)t19);
    t21 = t20;
    t22 = t18;

LAB4:    t23 = (t22 * t16);
    t24 = (t21 * t16);
    if (t24 <= t23)
        goto LAB5;

LAB7:    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t16 = *((int *)t8);
    t0 = t16;

LAB1:    return t0;
LAB3:    *((char **)t12) = t2;
    goto LAB2;

LAB5:    t25 = (t6 + 56U);
    t26 = *((char **)t25);
    t27 = *((int *)t26);
    t25 = (t3 + 0U);
    t28 = *((int *)t25);
    t29 = (t3 + 8U);
    t30 = *((int *)t29);
    t31 = (t21 - t28);
    t32 = (t31 * t30);
    t33 = (16U * t32);
    t34 = (0 + t33);
    t35 = (t2 + t34);
    t37 = (t36 + 0U);
    t38 = (t37 + 0U);
    *((int *)t38) = 15;
    t38 = (t37 + 4U);
    *((int *)t38) = 0;
    t38 = (t37 + 8U);
    *((int *)t38) = -1;
    t39 = (0 - 15);
    t40 = (t39 * -1);
    t40 = (t40 + 1);
    t38 = (t37 + 12U);
    *((unsigned int *)t38) = t40;
    t41 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t35, t36);
    t42 = (t27 + t41);
    t38 = (t6 + 56U);
    t43 = *((char **)t38);
    t38 = (t43 + 0);
    *((int *)t38) = t42;

LAB6:    if (t21 == t22)
        goto LAB7;

LAB8:    t18 = (t21 + t16);
    t21 = t18;
    goto LAB4;

LAB9:;
}


void ieee_p_2592010699_sub_3130575329_503743352();

void ieee_p_2592010699_sub_3130575329_503743352();

extern void work_p_0487524481_init()
{
	static char *se[] = {(void *)work_p_0487524481_sub_2434039100_4043136551,(void *)work_p_0487524481_sub_2035035004_4043136551,(void *)work_p_0487524481_sub_2931345285_4043136551,(void *)work_p_0487524481_sub_545091389_4043136551,(void *)work_p_0487524481_sub_3397313174_4043136551};
	xsi_register_didat("work_p_0487524481", "isim/SCRODQB_TB_isim_beh.exe.sim/work/p_0487524481.didat");
	xsi_register_subprogram_executes(se);
	xsi_register_resolution_function(1, 0, (void *)ieee_p_2592010699_sub_3130575329_503743352, 3);
	xsi_register_resolution_function(1, 2, (void *)ieee_p_2592010699_sub_3130575329_503743352, 3);
}
