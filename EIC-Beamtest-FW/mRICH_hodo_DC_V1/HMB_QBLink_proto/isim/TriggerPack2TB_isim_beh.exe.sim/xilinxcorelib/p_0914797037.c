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
extern char *XILINXCORELIB_P_1837083571;
extern char *STD_STANDARD;
extern char *XILINXCORELIB_P_2147798235;

int xilinxcorelib_p_1837083571_sub_2363168970_775299228(char *, char *, char *);
int xilinxcorelib_p_1837083571_sub_2363173326_775299228(char *, char *, char *);
int xilinxcorelib_p_1837083571_sub_2925270857_775299228(char *, char *, char *);
char *xilinxcorelib_p_1837083571_sub_3867535652_775299228(char *, char *, char *, char *);
unsigned char xilinxcorelib_p_1837083571_sub_719035815_775299228(char *, char *, char *);
char *xilinxcorelib_p_2147798235_sub_1332776844_2200477577(char *, char *, char *, int , int , int , int , int , int , char *, char *, char *, char *, int , char *, char *, int , int , int , int );
char *xilinxcorelib_p_2147798235_sub_2305365441_2200477577(char *, char *, char *, int , int , int , int , int , int , char *, char *, char *, char *, int , char *, char *, int , int , int , int );
char *xilinxcorelib_p_2147798235_sub_241607350_2200477577(char *, char *, char *, int , int , int , int , int , int , char *, char *, char *, char *, int , char *, char *, int , int , int , int );


char *xilinxcorelib_p_0914797037_sub_4008928201_466632300(char *t1, char *t2, char *t3, int t4)
{
    char t5[128];
    char t6[24];
    char t10[8];
    char *t0;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    unsigned char t14;
    char *t15;
    char *t16;
    unsigned char t17;
    char *t18;
    char *t19;
    unsigned int t20;

LAB0:    t7 = (t5 + 4U);
    t8 = (t1 + 3056);
    t9 = (t7 + 88U);
    *((char **)t9) = t8;
    t11 = (t7 + 56U);
    *((char **)t11) = t10;
    xsi_type_set_default_value(t8, t10, 0);
    t12 = (t7 + 80U);
    *((unsigned int *)t12) = 8U;
    t13 = (t6 + 4U);
    t14 = (t2 != 0);
    if (t14 == 1)
        goto LAB3;

LAB2:    t15 = (t6 + 12U);
    *((char **)t15) = t3;
    t16 = (t6 + 20U);
    *((int *)t16) = t4;
    t17 = (t4 == 0);
    if (t17 != 0)
        goto LAB4;

LAB6:    t14 = xilinxcorelib_p_1837083571_sub_719035815_775299228(XILINXCORELIB_P_1837083571, t2, t3);
    if (t14 != 0)
        goto LAB7;

LAB9:    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t20 = (0 + 4U);
    t8 = (t9 + t20);
    *((int *)t8) = 48;
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t20 = (0 + 0U);
    t8 = (t9 + t20);
    *((int *)t8) = 1;

LAB8:
LAB5:    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t0 = xsi_get_transient_memory(8U);
    memcpy(t0, t9, 8U);

LAB1:    return t0;
LAB3:    *((char **)t13) = t2;
    goto LAB2;

LAB4:    t18 = (t7 + 56U);
    t19 = *((char **)t18);
    t20 = (0 + 4U);
    t18 = (t19 + t20);
    *((int *)t18) = 256;
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t20 = (0 + 0U);
    t8 = (t9 + t20);
    *((int *)t8) = 1;
    goto LAB5;

LAB7:    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t20 = (0 + 4U);
    t8 = (t9 + t20);
    *((int *)t8) = 35;
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t20 = (0 + 0U);
    t8 = (t9 + t20);
    *((int *)t8) = 1;
    goto LAB8;

LAB10:;
}

char *xilinxcorelib_p_0914797037_sub_3567015153_466632300(char *t1, char *t2, char *t3, int t4, int t5, int t6, int t7)
{
    char t8[128];
    char t9[40];
    char t13[8];
    char *t0;
    char *t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    t10 = (t8 + 4U);
    t11 = (t1 + 3056);
    t12 = (t10 + 88U);
    *((char **)t12) = t11;
    t14 = (t10 + 56U);
    *((char **)t14) = t13;
    xsi_type_set_default_value(t11, t13, 0);
    t15 = (t10 + 80U);
    *((unsigned int *)t15) = 8U;
    t16 = (t9 + 4U);
    t17 = (t2 != 0);
    if (t17 == 1)
        goto LAB3;

LAB2:    t18 = (t9 + 12U);
    *((char **)t18) = t3;
    t19 = (t9 + 20U);
    *((int *)t19) = t4;
    t20 = (t9 + 24U);
    *((int *)t20) = t5;
    t21 = (t9 + 28U);
    *((int *)t21) = t6;
    t22 = (t9 + 32U);
    *((int *)t22) = t7;
    t23 = (t10 + 56U);
    t24 = *((char **)t23);
    t0 = xsi_get_transient_memory(8U);
    memcpy(t0, t24, 8U);

LAB1:    return t0;
LAB3:    *((char **)t16) = t2;
    goto LAB2;

LAB4:;
}

int xilinxcorelib_p_0914797037_sub_625362161_466632300(char *t1, int t2, int t3, char *t4, char *t5, int t6, int t7, int t8, int t9, char *t10, char *t11, char *t12, char *t13, int t14, char *t15, char *t16, int t17, int t18, int t19, int t20, int t21, int t22, char *t23, char *t24, char *t25, char *t26, int t27, int t28, int t29)
{
    char t30[632];
    char t31[168];
    char t35[8];
    char t41[8];
    char t47[8];
    char t53[8];
    char t56[16];
    char t60[16];
    char t119[16];
    char t120[16];
    int t0;
    char *t32;
    char *t33;
    char *t34;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t54;
    char *t55;
    char *t57;
    char *t58;
    unsigned int t59;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    char *t71;
    unsigned int t72;
    int t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    char *t81;
    unsigned char t82;
    char *t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    char *t88;
    unsigned char t89;
    char *t90;
    char *t91;
    unsigned char t92;
    char *t93;
    char *t94;
    char *t95;
    unsigned char t96;
    char *t97;
    char *t98;
    char *t99;
    char *t100;
    char *t101;
    char *t102;
    char *t103;
    char *t104;
    unsigned char t105;
    char *t106;
    char *t107;
    unsigned char t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    unsigned char t113;
    unsigned char t114;
    unsigned char t115;
    char *t116;
    int t118;
    int t121;

LAB0:    t32 = (t30 + 4U);
    t33 = ((STD_STANDARD) + 384);
    t34 = (t32 + 88U);
    *((char **)t34) = t33;
    t36 = (t32 + 56U);
    *((char **)t36) = t35;
    *((int *)t35) = 0;
    t37 = (t32 + 80U);
    *((unsigned int *)t37) = 4U;
    t38 = (t30 + 124U);
    t39 = ((STD_STANDARD) + 384);
    t40 = (t38 + 88U);
    *((char **)t40) = t39;
    t42 = (t38 + 56U);
    *((char **)t42) = t41;
    *((int *)t41) = 0;
    t43 = (t38 + 80U);
    *((unsigned int *)t43) = 4U;
    t44 = (t30 + 244U);
    t45 = (t1 + 3056);
    t46 = (t44 + 88U);
    *((char **)t46) = t45;
    t48 = (t44 + 56U);
    *((char **)t48) = t47;
    xsi_type_set_default_value(t45, t47, 0);
    t49 = (t44 + 80U);
    *((unsigned int *)t49) = 8U;
    t50 = (t30 + 364U);
    t51 = (t1 + 3056);
    t52 = (t50 + 88U);
    *((char **)t52) = t51;
    t54 = (t50 + 56U);
    *((char **)t54) = t53;
    xsi_type_set_default_value(t51, t53, 0);
    t55 = (t50 + 80U);
    *((unsigned int *)t55) = 8U;
    t57 = xilinxcorelib_p_1837083571_sub_3867535652_775299228(XILINXCORELIB_P_1837083571, t56, t4, t5);
    t58 = (t56 + 12U);
    t59 = *((unsigned int *)t58);
    t59 = (t59 * 1U);
    memcpy(t60, t56, 16U);
    t61 = (t30 + 484U);
    t62 = ((STD_STANDARD) + 1008);
    t63 = (t61 + 88U);
    *((char **)t63) = t62;
    t64 = xsi_get_memory(t59);
    t65 = (t61 + 56U);
    *((char **)t65) = t64;
    memcpy(t64, t57, t59);
    t66 = (t61 + 64U);
    *((char **)t66) = t60;
    t67 = (t61 + 80U);
    *((unsigned int *)t67) = t59;
    t68 = (t61 + 136U);
    *((char **)t68) = t64;
    t69 = (t61 + 124U);
    *((int *)t69) = 0;
    t70 = (t61 + 128U);
    t71 = (t60 + 12U);
    t72 = *((unsigned int *)t71);
    t73 = (t72 - 1);
    *((int *)t70) = t73;
    t74 = (t61 + 120U);
    t76 = (t59 > 2147483644);
    if (t76 == 1)
        goto LAB2;

LAB3:    t77 = (t59 + 3);
    t78 = (t77 / 16);
    t75 = t78;

LAB4:    *((unsigned int *)t74) = t75;
    t79 = (t31 + 4U);
    *((int *)t79) = t2;
    t80 = (t31 + 8U);
    *((int *)t80) = t3;
    t81 = (t31 + 12U);
    t82 = (t4 != 0);
    if (t82 == 1)
        goto LAB6;

LAB5:    t83 = (t31 + 20U);
    *((char **)t83) = t5;
    t84 = (t31 + 28U);
    *((int *)t84) = t6;
    t85 = (t31 + 32U);
    *((int *)t85) = t7;
    t86 = (t31 + 36U);
    *((int *)t86) = t8;
    t87 = (t31 + 40U);
    *((int *)t87) = t9;
    t88 = (t31 + 44U);
    t89 = (t10 != 0);
    if (t89 == 1)
        goto LAB8;

LAB7:    t90 = (t31 + 52U);
    *((char **)t90) = t11;
    t91 = (t31 + 60U);
    t92 = (t12 != 0);
    if (t92 == 1)
        goto LAB10;

LAB9:    t93 = (t31 + 68U);
    *((char **)t93) = t13;
    t94 = (t31 + 76U);
    *((int *)t94) = t14;
    t95 = (t31 + 80U);
    t96 = (t15 != 0);
    if (t96 == 1)
        goto LAB12;

LAB11:    t97 = (t31 + 88U);
    *((char **)t97) = t16;
    t98 = (t31 + 96U);
    *((int *)t98) = t17;
    t99 = (t31 + 100U);
    *((int *)t99) = t18;
    t100 = (t31 + 104U);
    *((int *)t100) = t19;
    t101 = (t31 + 108U);
    *((int *)t101) = t20;
    t102 = (t31 + 112U);
    *((int *)t102) = t21;
    t103 = (t31 + 116U);
    *((int *)t103) = t22;
    t104 = (t31 + 120U);
    t105 = (t23 != 0);
    if (t105 == 1)
        goto LAB14;

LAB13:    t106 = (t31 + 128U);
    *((char **)t106) = t24;
    t107 = (t31 + 136U);
    t108 = (t25 != 0);
    if (t108 == 1)
        goto LAB16;

LAB15:    t109 = (t31 + 144U);
    *((char **)t109) = t26;
    t110 = (t31 + 152U);
    *((int *)t110) = t27;
    t111 = (t31 + 156U);
    *((int *)t111) = t28;
    t112 = (t31 + 160U);
    *((int *)t112) = t29;
    t114 = (t7 < 0);
    if (t114 == 1)
        goto LAB20;

LAB21:    t115 = (t7 > 1);
    t113 = t115;

LAB22:    if (t113 != 0)
        goto LAB17;

LAB19:
LAB18:    t89 = (t17 < 0);
    if (t89 == 1)
        goto LAB29;

LAB30:    t92 = (t17 > 1);
    t82 = t92;

LAB31:    if (t82 != 0)
        goto LAB26;

LAB28:
LAB27:    t89 = (t8 < 0);
    if (t89 == 1)
        goto LAB38;

LAB39:    t92 = (t8 > 1);
    t82 = t92;

LAB40:    if (t82 != 0)
        goto LAB35;

LAB37:
LAB36:    t33 = xilinxcorelib_p_0914797037_sub_4008928201_466632300(t1, t4, t5, t2);
    t34 = (t50 + 56U);
    t36 = *((char **)t34);
    t34 = (t36 + 0);
    memcpy(t34, t33, 8U);
    t33 = (t50 + 56U);
    t34 = *((char **)t33);
    t59 = (0 + 0U);
    t33 = (t34 + t59);
    t73 = *((int *)t33);
    t89 = (t6 < t73);
    if (t89 == 1)
        goto LAB47;

LAB48:    t36 = (t50 + 56U);
    t37 = *((char **)t36);
    t72 = (0 + 4U);
    t36 = (t37 + t72);
    t118 = *((int *)t36);
    t92 = (t6 > t118);
    t82 = t92;

LAB49:    if (t82 != 0)
        goto LAB44;

LAB46:
LAB45:    t82 = (t2 == 1);
    if (t82 != 0)
        goto LAB53;

LAB55:
LAB54:    t92 = (t2 == 1);
    if (t92 == 1)
        goto LAB74;

LAB75:    t96 = (t21 != 1);
    t89 = t96;

LAB76:    if (t89 == 1)
        goto LAB71;

LAB72:    t105 = (t22 != 0);
    t82 = t105;

LAB73:    if (t82 != 0)
        goto LAB68;

LAB70:
LAB69:    t0 = 0;

LAB1:    t33 = (t61 + 80);
    t73 = *((int *)t33);
    t34 = (t61 + 136U);
    t36 = *((char **)t34);
    xsi_put_memory(t73, t36);
    return t0;
LAB2:    t75 = 2147483647;
    goto LAB4;

LAB6:    *((char **)t81) = t4;
    goto LAB5;

LAB8:    *((char **)t88) = t10;
    goto LAB7;

LAB10:    *((char **)t91) = t12;
    goto LAB9;

LAB12:    *((char **)t95) = t15;
    goto LAB11;

LAB14:    *((char **)t104) = t23;
    goto LAB13;

LAB16:    *((char **)t107) = t25;
    goto LAB15;

LAB17:    if ((unsigned char)0 == 0)
        goto LAB23;

LAB24:    t0 = 1;
    goto LAB1;

LAB20:    t113 = (unsigned char)1;
    goto LAB22;

LAB23:    t116 = (t1 + 4680);
    xsi_report(t116, 54U, (unsigned char)2);
    goto LAB24;

LAB25:    goto LAB18;

LAB26:    if ((unsigned char)0 == 0)
        goto LAB32;

LAB33:    t0 = 1;
    goto LAB1;

LAB29:    t82 = (unsigned char)1;
    goto LAB31;

LAB32:    t33 = (t1 + 4734);
    xsi_report(t33, 65U, (unsigned char)2);
    goto LAB33;

LAB34:    goto LAB27;

LAB35:    if ((unsigned char)0 == 0)
        goto LAB41;

LAB42:    t0 = 1;
    goto LAB1;

LAB38:    t82 = (unsigned char)1;
    goto LAB40;

LAB41:    t33 = (t1 + 4799);
    xsi_report(t33, 56U, (unsigned char)2);
    goto LAB42;

LAB43:    goto LAB36;

LAB44:    if ((unsigned char)0 == 0)
        goto LAB50;

LAB51:    t0 = 1;
    goto LAB1;

LAB47:    t82 = (unsigned char)1;
    goto LAB49;

LAB50:    t39 = (t1 + 4855);
    t42 = ((STD_STANDARD) + 384);
    t43 = xsi_int_to_mem(t6);
    t45 = xsi_string_variable_get_image(t56, t42, t43);
    t48 = ((STD_STANDARD) + 1008);
    t49 = (t120 + 0U);
    t51 = (t49 + 0U);
    *((int *)t51) = 1;
    t51 = (t49 + 4U);
    *((int *)t51) = 60;
    t51 = (t49 + 8U);
    *((int *)t51) = 1;
    t121 = (60 - 1);
    t75 = (t121 * 1);
    t75 = (t75 + 1);
    t51 = (t49 + 12U);
    *((unsigned int *)t51) = t75;
    t46 = xsi_base_array_concat(t46, t119, t48, (char)97, t39, t120, (char)97, t45, t56, (char)101);
    t51 = (t56 + 12U);
    t75 = *((unsigned int *)t51);
    t76 = (60U + t75);
    xsi_report(t46, t76, (unsigned char)2);
    goto LAB51;

LAB52:    goto LAB45;

LAB53:    t73 = xilinxcorelib_p_1837083571_sub_2925270857_775299228(XILINXCORELIB_P_1837083571, t4, t5);
    t96 = (t73 > 0);
    if (t96 == 1)
        goto LAB62;

LAB63:    t118 = xilinxcorelib_p_1837083571_sub_2363173326_775299228(XILINXCORELIB_P_1837083571, t4, t5);
    t105 = (t118 > 0);
    t92 = t105;

LAB64:    if (t92 == 1)
        goto LAB59;

LAB60:    t121 = xilinxcorelib_p_1837083571_sub_2363168970_775299228(XILINXCORELIB_P_1837083571, t4, t5);
    t108 = (t121 > 0);
    t89 = t108;

LAB61:    t113 = (!(t89));
    if (t113 != 0)
        goto LAB56;

LAB58:
LAB57:    goto LAB54;

LAB56:    if ((unsigned char)0 == 0)
        goto LAB65;

LAB66:    t0 = 1;
    goto LAB1;

LAB59:    t89 = (unsigned char)1;
    goto LAB61;

LAB62:    t92 = (unsigned char)1;
    goto LAB64;

LAB65:    t33 = (t1 + 4915);
    xsi_report(t33, 86U, (unsigned char)2);
    goto LAB66;

LAB67:    goto LAB57;

LAB68:    t108 = (t28 != 0);
    if (t108 != 0)
        goto LAB77;

LAB79:
LAB78:    t82 = (t29 != 0);
    if (t82 != 0)
        goto LAB83;

LAB85:
LAB84:    goto LAB69;

LAB71:    t82 = (unsigned char)1;
    goto LAB73;

LAB74:    t89 = (unsigned char)1;
    goto LAB76;

LAB77:    if ((unsigned char)0 == 0)
        goto LAB80;

LAB81:    t0 = 1;
    goto LAB1;

LAB80:    t33 = (t1 + 5001);
    xsi_report(t33, 125U, (unsigned char)2);
    goto LAB81;

LAB82:    goto LAB78;

LAB83:    if ((unsigned char)0 == 0)
        goto LAB86;

LAB87:    t0 = 1;
    goto LAB1;

LAB86:    t33 = (t1 + 5126);
    xsi_report(t33, 126U, (unsigned char)2);
    goto LAB87;

LAB88:    goto LAB84;

LAB89:;
}

char *xilinxcorelib_p_0914797037_sub_3767719667_466632300(char *t1, char *t2, char *t3, int t4, int t5, int t6, int t7, int t8, int t9, char *t10, char *t11, char *t12, char *t13, int t14, char *t15, char *t16, int t17, int t18, int t19, int t20)
{
    char t21[248];
    char t22[112];
    char t26[136];
    char t32[136];
    char *t0;
    char *t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    char *t34;
    char *t35;
    unsigned char t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    unsigned char t45;
    char *t46;
    char *t47;
    unsigned char t48;
    char *t49;
    char *t50;
    char *t51;
    unsigned char t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    int t58;
    unsigned char t59;
    char *t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;

LAB0:    t23 = (t21 + 4U);
    t24 = (t1 + 2832);
    t25 = (t23 + 88U);
    *((char **)t25) = t24;
    t27 = (t23 + 56U);
    *((char **)t27) = t26;
    xsi_type_set_default_value(t24, t26, 0);
    t28 = (t23 + 80U);
    *((unsigned int *)t28) = 136U;
    t29 = (t21 + 124U);
    t30 = ((XILINXCORELIB_P_2147798235) + 3536);
    t31 = (t29 + 88U);
    *((char **)t31) = t30;
    t33 = (t29 + 56U);
    *((char **)t33) = t32;
    xsi_type_set_default_value(t30, t32, 0);
    t34 = (t29 + 80U);
    *((unsigned int *)t34) = 136U;
    t35 = (t22 + 4U);
    t36 = (t2 != 0);
    if (t36 == 1)
        goto LAB3;

LAB2:    t37 = (t22 + 12U);
    *((char **)t37) = t3;
    t38 = (t22 + 20U);
    *((int *)t38) = t4;
    t39 = (t22 + 24U);
    *((int *)t39) = t5;
    t40 = (t22 + 28U);
    *((int *)t40) = t6;
    t41 = (t22 + 32U);
    *((int *)t41) = t7;
    t42 = (t22 + 36U);
    *((int *)t42) = t8;
    t43 = (t22 + 40U);
    *((int *)t43) = t9;
    t44 = (t22 + 44U);
    t45 = (t10 != 0);
    if (t45 == 1)
        goto LAB5;

LAB4:    t46 = (t22 + 52U);
    *((char **)t46) = t11;
    t47 = (t22 + 60U);
    t48 = (t12 != 0);
    if (t48 == 1)
        goto LAB7;

LAB6:    t49 = (t22 + 68U);
    *((char **)t49) = t13;
    t50 = (t22 + 76U);
    *((int *)t50) = t14;
    t51 = (t22 + 80U);
    t52 = (t15 != 0);
    if (t52 == 1)
        goto LAB9;

LAB8:    t53 = (t22 + 88U);
    *((char **)t53) = t16;
    t54 = (t22 + 96U);
    *((int *)t54) = t17;
    t55 = (t22 + 100U);
    *((int *)t55) = t18;
    t56 = (t22 + 104U);
    *((int *)t56) = t19;
    t57 = (t22 + 108U);
    *((int *)t57) = t20;
    t58 = (-(1));
    t59 = (t6 == t58);
    if (t59 != 0)
        goto LAB10;

LAB12:    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t63 = (0 + 0U);
    t24 = (t25 + t63);
    *((int *)t24) = t6;

LAB11:    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t0 = xsi_get_transient_memory(136U);
    memcpy(t0, t25, 136U);

LAB1:    return t0;
LAB3:    *((char **)t35) = t2;
    goto LAB2;

LAB5:    *((char **)t44) = t10;
    goto LAB4;

LAB7:    *((char **)t47) = t12;
    goto LAB6;

LAB9:    *((char **)t51) = t15;
    goto LAB8;

LAB10:    t60 = xilinxcorelib_p_2147798235_sub_2305365441_2200477577(XILINXCORELIB_P_2147798235, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20);
    t61 = (t29 + 56U);
    t62 = *((char **)t61);
    t61 = (t62 + 0);
    memcpy(t61, t60, 136U);
    t24 = (t29 + 56U);
    t25 = *((char **)t24);
    t63 = (0 + 0U);
    t24 = (t25 + t63);
    t58 = *((int *)t24);
    t27 = (t23 + 56U);
    t28 = *((char **)t27);
    t64 = (0 + 0U);
    t27 = (t28 + t64);
    *((int *)t27) = t58;
    goto LAB11;

LAB13:;
}

char *xilinxcorelib_p_0914797037_sub_1441545807_466632300(char *t1, char *t2, char *t3, int t4, int t5, int t6, int t7, int t8, int t9, char *t10, char *t11, char *t12, char *t13, int t14, char *t15, char *t16, int t17, int t18, int t19, int t20)
{
    char t21[248];
    char t22[112];
    char t26[136];
    char t32[16];
    char *t0;
    char *t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    char *t34;
    char *t35;
    unsigned char t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    unsigned char t45;
    char *t46;
    char *t47;
    unsigned char t48;
    char *t49;
    char *t50;
    char *t51;
    unsigned char t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    int t58;
    unsigned char t59;
    char *t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;

LAB0:    t23 = (t21 + 4U);
    t24 = (t1 + 2832);
    t25 = (t23 + 88U);
    *((char **)t25) = t24;
    t27 = (t23 + 56U);
    *((char **)t27) = t26;
    xsi_type_set_default_value(t24, t26, 0);
    t28 = (t23 + 80U);
    *((unsigned int *)t28) = 136U;
    t29 = (t21 + 124U);
    t30 = ((XILINXCORELIB_P_2147798235) + 3312);
    t31 = (t29 + 88U);
    *((char **)t31) = t30;
    t33 = (t29 + 56U);
    *((char **)t33) = t32;
    xsi_type_set_default_value(t30, t32, 0);
    t34 = (t29 + 80U);
    *((unsigned int *)t34) = 16U;
    t35 = (t22 + 4U);
    t36 = (t2 != 0);
    if (t36 == 1)
        goto LAB3;

LAB2:    t37 = (t22 + 12U);
    *((char **)t37) = t3;
    t38 = (t22 + 20U);
    *((int *)t38) = t4;
    t39 = (t22 + 24U);
    *((int *)t39) = t5;
    t40 = (t22 + 28U);
    *((int *)t40) = t6;
    t41 = (t22 + 32U);
    *((int *)t41) = t7;
    t42 = (t22 + 36U);
    *((int *)t42) = t8;
    t43 = (t22 + 40U);
    *((int *)t43) = t9;
    t44 = (t22 + 44U);
    t45 = (t10 != 0);
    if (t45 == 1)
        goto LAB5;

LAB4:    t46 = (t22 + 52U);
    *((char **)t46) = t11;
    t47 = (t22 + 60U);
    t48 = (t12 != 0);
    if (t48 == 1)
        goto LAB7;

LAB6:    t49 = (t22 + 68U);
    *((char **)t49) = t13;
    t50 = (t22 + 76U);
    *((int *)t50) = t14;
    t51 = (t22 + 80U);
    t52 = (t15 != 0);
    if (t52 == 1)
        goto LAB9;

LAB8:    t53 = (t22 + 88U);
    *((char **)t53) = t16;
    t54 = (t22 + 96U);
    *((int *)t54) = t17;
    t55 = (t22 + 100U);
    *((int *)t55) = t18;
    t56 = (t22 + 104U);
    *((int *)t56) = t19;
    t57 = (t22 + 108U);
    *((int *)t57) = t20;
    t58 = (-(1));
    t59 = (t7 == t58);
    if (t59 != 0)
        goto LAB10;

LAB12:    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t63 = (0 + 0U);
    t24 = (t25 + t63);
    *((int *)t24) = t7;

LAB11:    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t0 = xsi_get_transient_memory(136U);
    memcpy(t0, t25, 136U);

LAB1:    return t0;
LAB3:    *((char **)t35) = t2;
    goto LAB2;

LAB5:    *((char **)t44) = t10;
    goto LAB4;

LAB7:    *((char **)t47) = t12;
    goto LAB6;

LAB9:    *((char **)t51) = t15;
    goto LAB8;

LAB10:    t60 = xilinxcorelib_p_2147798235_sub_241607350_2200477577(XILINXCORELIB_P_2147798235, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20);
    t61 = (t29 + 56U);
    t62 = *((char **)t61);
    t61 = (t62 + 0);
    memcpy(t61, t60, 16U);
    t24 = (t29 + 56U);
    t25 = *((char **)t24);
    t63 = (0 + 0U);
    t24 = (t25 + t63);
    t58 = *((int *)t24);
    t27 = (t23 + 56U);
    t28 = *((char **)t27);
    t64 = (0 + 0U);
    t27 = (t28 + t64);
    *((int *)t27) = t58;
    goto LAB11;

LAB13:;
}

char *xilinxcorelib_p_0914797037_sub_3878460044_466632300(char *t1, char *t2, char *t3, int t4, int t5, int t6, int t7, int t8, int t9, char *t10, char *t11, char *t12, char *t13, int t14, char *t15, char *t16, int t17, int t18, int t19, int t20)
{
    char t21[248];
    char t22[112];
    char t26[16];
    char t32[16];
    char *t0;
    char *t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    char *t34;
    char *t35;
    unsigned char t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    unsigned char t45;
    char *t46;
    char *t47;
    unsigned char t48;
    char *t49;
    char *t50;
    char *t51;
    unsigned char t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    unsigned char t58;
    unsigned char t59;
    unsigned char t60;
    unsigned char t61;
    unsigned char t62;
    char *t63;
    char *t64;
    unsigned int t65;
    int t66;
    int t67;
    int t68;
    int t69;
    unsigned int t70;

LAB0:    t23 = (t21 + 4U);
    t24 = (t1 + 2944);
    t25 = (t23 + 88U);
    *((char **)t25) = t24;
    t27 = (t23 + 56U);
    *((char **)t27) = t26;
    xsi_type_set_default_value(t24, t26, 0);
    t28 = (t23 + 80U);
    *((unsigned int *)t28) = 16U;
    t29 = (t21 + 124U);
    t30 = ((XILINXCORELIB_P_2147798235) + 3648);
    t31 = (t29 + 88U);
    *((char **)t31) = t30;
    t33 = (t29 + 56U);
    *((char **)t33) = t32;
    xsi_type_set_default_value(t30, t32, 0);
    t34 = (t29 + 80U);
    *((unsigned int *)t34) = 16U;
    t35 = (t22 + 4U);
    t36 = (t2 != 0);
    if (t36 == 1)
        goto LAB3;

LAB2:    t37 = (t22 + 12U);
    *((char **)t37) = t3;
    t38 = (t22 + 20U);
    *((int *)t38) = t4;
    t39 = (t22 + 24U);
    *((int *)t39) = t5;
    t40 = (t22 + 28U);
    *((int *)t40) = t6;
    t41 = (t22 + 32U);
    *((int *)t41) = t7;
    t42 = (t22 + 36U);
    *((int *)t42) = t8;
    t43 = (t22 + 40U);
    *((int *)t43) = t9;
    t44 = (t22 + 44U);
    t45 = (t10 != 0);
    if (t45 == 1)
        goto LAB5;

LAB4:    t46 = (t22 + 52U);
    *((char **)t46) = t11;
    t47 = (t22 + 60U);
    t48 = (t12 != 0);
    if (t48 == 1)
        goto LAB7;

LAB6:    t49 = (t22 + 68U);
    *((char **)t49) = t13;
    t50 = (t22 + 76U);
    *((int *)t50) = t14;
    t51 = (t22 + 80U);
    t52 = (t15 != 0);
    if (t52 == 1)
        goto LAB9;

LAB8:    t53 = (t22 + 88U);
    *((char **)t53) = t16;
    t54 = (t22 + 96U);
    *((int *)t54) = t17;
    t55 = (t22 + 100U);
    *((int *)t55) = t18;
    t56 = (t22 + 104U);
    *((int *)t56) = t19;
    t57 = (t22 + 108U);
    *((int *)t57) = t20;
    t60 = (t5 == 0);
    if (t60 == 1)
        goto LAB16;

LAB17:    t59 = (unsigned char)0;

LAB18:    if (t59 == 1)
        goto LAB13;

LAB14:    t58 = (unsigned char)0;

LAB15:    if (t58 != 0)
        goto LAB10;

LAB12:    t24 = xilinxcorelib_p_2147798235_sub_1332776844_2200477577(XILINXCORELIB_P_2147798235, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20);
    t25 = (t29 + 56U);
    t27 = *((char **)t25);
    t25 = (t27 + 0);
    memcpy(t25, t24, 16U);
    t24 = (t29 + 56U);
    t25 = *((char **)t24);
    t65 = (0 + 0U);
    t24 = (t25 + t65);
    t66 = *((int *)t24);
    t27 = (t23 + 56U);
    t28 = *((char **)t27);
    t70 = (0 + 0U);
    t27 = (t28 + t70);
    *((int *)t27) = t66;
    t24 = (t29 + 56U);
    t25 = *((char **)t24);
    t65 = (0 + 4U);
    t24 = (t25 + t65);
    t66 = *((int *)t24);
    t27 = (t23 + 56U);
    t28 = *((char **)t27);
    t70 = (0 + 4U);
    t27 = (t28 + t70);
    *((int *)t27) = t66;
    t24 = (t29 + 56U);
    t25 = *((char **)t24);
    t65 = (0 + 8U);
    t24 = (t25 + t65);
    t66 = *((int *)t24);
    t27 = (t23 + 56U);
    t28 = *((char **)t27);
    t70 = (0 + 8U);
    t27 = (t28 + t70);
    *((int *)t27) = t66;
    t24 = (t29 + 56U);
    t25 = *((char **)t24);
    t65 = (0 + 12U);
    t24 = (t25 + t65);
    t66 = *((int *)t24);
    t27 = (t23 + 56U);
    t28 = *((char **)t27);
    t70 = (0 + 12U);
    t27 = (t28 + t70);
    *((int *)t27) = t66;

LAB11:    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t0 = xsi_get_transient_memory(16U);
    memcpy(t0, t25, 16U);

LAB1:    return t0;
LAB3:    *((char **)t35) = t2;
    goto LAB2;

LAB5:    *((char **)t44) = t10;
    goto LAB4;

LAB7:    *((char **)t47) = t12;
    goto LAB6;

LAB9:    *((char **)t51) = t15;
    goto LAB8;

LAB10:    t63 = (t23 + 56U);
    t64 = *((char **)t63);
    t65 = (0 + 0U);
    t63 = (t64 + t65);
    *((int *)t63) = 0;
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t65 = (0 + 4U);
    t24 = (t25 + t65);
    *((int *)t24) = 0;
    t66 = (t9 + t18);
    t67 = (t8 * t66);
    t68 = (t67 / 4);
    t69 = (t8 + t68);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t65 = (0 + 8U);
    t24 = (t25 + t65);
    *((int *)t24) = t69;
    t66 = (t8 + t18);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t65 = (0 + 12U);
    t24 = (t25 + t65);
    *((int *)t24) = t66;
    goto LAB11;

LAB13:    t62 = (t7 == 0);
    t58 = t62;
    goto LAB15;

LAB16:    t61 = (t6 == 1);
    t59 = t61;
    goto LAB18;

LAB19:;
}

unsigned char xilinxcorelib_p_0914797037_sub_3540726430_466632300(char *t1, int t2, int t3, int t4, int t5)
{
    char t7[24];
    unsigned char t0;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;

LAB0:    t8 = (t7 + 4U);
    *((int *)t8) = t2;
    t9 = (t7 + 8U);
    *((int *)t9) = t3;
    t10 = (t7 + 12U);
    *((int *)t10) = t4;
    t11 = (t7 + 16U);
    *((int *)t11) = t5;
    t15 = (t2 == 0);
    if (t15 == 1)
        goto LAB11;

LAB12:    t14 = (unsigned char)0;

LAB13:    if (t14 == 1)
        goto LAB8;

LAB9:    t13 = (unsigned char)0;

LAB10:    if (t13 == 1)
        goto LAB5;

LAB6:    t12 = (unsigned char)0;

LAB7:    if (t12 != 0)
        goto LAB2;

LAB4:
LAB3:    t0 = (unsigned char)0;

LAB1:    return t0;
LAB2:    t0 = (unsigned char)1;
    goto LAB1;

LAB5:    t18 = (t5 > 1);
    t12 = t18;
    goto LAB7;

LAB8:    t17 = (t4 == 0);
    t13 = t17;
    goto LAB10;

LAB11:    t16 = (t3 == 1);
    t14 = t16;
    goto LAB13;

LAB14:    goto LAB3;

LAB15:;
}


extern void xilinxcorelib_p_0914797037_init()
{
	static char *se[] = {(void *)xilinxcorelib_p_0914797037_sub_4008928201_466632300,(void *)xilinxcorelib_p_0914797037_sub_3567015153_466632300,(void *)xilinxcorelib_p_0914797037_sub_625362161_466632300,(void *)xilinxcorelib_p_0914797037_sub_3767719667_466632300,(void *)xilinxcorelib_p_0914797037_sub_1441545807_466632300,(void *)xilinxcorelib_p_0914797037_sub_3878460044_466632300,(void *)xilinxcorelib_p_0914797037_sub_3540726430_466632300};
	xsi_register_didat("xilinxcorelib_p_0914797037", "isim/TriggerPack2TB_isim_beh.exe.sim/xilinxcorelib/p_0914797037.didat");
	xsi_register_subprogram_executes(se);
}
