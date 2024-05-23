function I_dJe = I_dJe_fun(in1,in2)
%I_dJe_fun
%    I_dJe = I_dJe_fun(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    23-May-2024 07:34:16

dphi1 = in2(1,:);
dphi2 = in2(2,:);
dphi3 = in2(3,:);
dphi4 = in2(4,:);
dphi5 = in2(5,:);
phi1 = in1(1,:);
phi2 = in1(2,:);
phi3 = in1(3,:);
phi4 = in1(4,:);
phi5 = in1(5,:);
t2 = cos(phi1);
t3 = cos(phi2);
t4 = cos(phi4);
t5 = cos(phi5);
t6 = sin(phi1);
t7 = sin(phi2);
t8 = sin(phi4);
t9 = sin(phi5);
t10 = phi2+phi3;
t11 = dphi1.*t2;
t12 = cos(t10);
t13 = dphi1.*t6;
t14 = sin(t10);
t15 = t2.*t4;
t16 = t2.*t8;
t17 = t4.*t6;
t18 = t6.*t8;
t19 = t3.*1.35e+2;
t20 = t7.*1.35e+2;
t21 = -t11;
t22 = -t13;
t23 = t12.*3.5e+1;
t24 = t14.*3.5e+1;
t25 = -t19;
t26 = t5.*t12;
t28 = t12.*1.51e+2;
t29 = t14.*1.51e+2;
t30 = t14.*t15;
t31 = t2.*t5.*t14;
t32 = t14.*t16;
t33 = t14.*t17;
t34 = t5.*t6.*t14;
t35 = t4.*t9.*t14;
t37 = t14.*t18;
t38 = t5.*t14.*3.6e+1;
t39 = t9.*t14.*3.6e+1;
t40 = t12.*(7.0./1.0e+2);
t42 = t9.*t12.*t15;
t43 = t9.*t12.*t17;
t45 = t4.*t9.*t12.*3.6e+1;
t50 = t14.*(1.51e+2./5.0e+2);
t53 = t9.*t12.*(9.0./1.25e+2);
t54 = t5.*t14.*(9.0./1.25e+2);
t63 = t2.*t9.*t14.*(9.0./1.25e+2);
t64 = t6.*t9.*t14.*(9.0./1.25e+2);
t65 = dphi4.*t8.*t9.*t14.*(9.0./1.25e+2);
t27 = -t23;
t36 = t26.*3.6e+1;
t41 = -t40;
t46 = -t32;
t47 = -t33;
t48 = -t35;
t49 = t35.*3.6e+1;
t51 = t4.*t26.*-3.6e+1;
t55 = t15+t37;
t56 = t18+t30;
t57 = t2.*t26.*(9.0./1.25e+2);
t58 = t2.*t53;
t59 = t6.*t26.*(9.0./1.25e+2);
t60 = t4.*t53;
t61 = t4.*t54;
t62 = t6.*t53;
t66 = -t65;
t69 = t15.*t26.*(9.0./1.25e+2);
t70 = t17.*t26.*(9.0./1.25e+2);
t71 = dphi4.*t16.*t53;
t72 = dphi4.*t18.*t53;
t76 = t31+t42;
t77 = t34+t43;
t79 = t20+t24+t28;
t52 = -t49;
t67 = t16+t47;
t68 = t17+t46;
t73 = -t69;
t74 = -t70;
t75 = t26+t48;
t78 = t39+t51;
t80 = t9.*t56.*(9.0./1.25e+2);
t82 = t53+t61;
t88 = t27+t29+t38+t45;
t96 = t41+t50+t54+t60;
t81 = t9.*t67.*(9.0./1.25e+2);
t83 = (dphi5.*t2.*t78)./5.0e+2;
t84 = (dphi5.*t6.*t78)./5.0e+2;
t85 = dphi5.*t82;
t86 = t63+t73;
t87 = t64+t74;
t89 = t24+t28+t36+t52;
t90 = t36+t52+t79;
t91 = t25+t88;
t97 = dphi3.*t96;
t92 = (dphi3.*t2.*t89)./5.0e+2;
t93 = (dphi3.*t6.*t89)./5.0e+2;
t94 = -t92;
t95 = -t93;
mt1 = [dphi5.*(t62-t5.*t16.*(9.0./1.25e+2)+t5.*t33.*(9.0./1.25e+2))-dphi1.*(t57-t80+(t2.*t79)./5.0e+2)-dphi4.*t9.*t55.*(9.0./1.25e+2)+(dphi3.*t6.*t88)./5.0e+2+(dphi2.*t6.*t91)./5.0e+2,-dphi5.*(t58+t5.*t18.*(9.0./1.25e+2)+t5.*t30.*(9.0./1.25e+2))-dphi1.*(t59+t81+(t6.*t79)./5.0e+2)-dphi4.*t9.*t68.*(9.0./1.25e+2)-(dphi3.*t2.*t88)./5.0e+2-(dphi2.*t2.*t91)./5.0e+2,0.0,0.0,0.0,0.0,t71+t83+t94+(t13.*t91)./5.0e+2-(dphi2.*t2.*t90)./5.0e+2,t72+t84+t95-(t11.*t91)./5.0e+2-(dphi2.*t6.*t90)./5.0e+2];
mt2 = [t66+t85+t97-dphi2.*(t3.*(2.7e+1./1.0e+2)-t96),t21,t22,0.0,t71+t83+t94+(t13.*t88)./5.0e+2-(dphi2.*t2.*t89)./5.0e+2,t72+t84+t95-(t11.*t88)./5.0e+2-(dphi2.*t6.*t89)./5.0e+2,t66+t85+t97+dphi2.*t96,t21,t22,0.0,dphi4.*t80-dphi1.*t9.*t55.*(9.0./1.25e+2)+dphi2.*t16.*t53+dphi3.*t16.*t53-dphi5.*t5.*t68.*(9.0./1.25e+2),dphi5.*t5.*t55.*(9.0./1.25e+2)+dphi2.*t18.*t53+dphi3.*t18.*t53-dphi1.*t9.*t68.*(9.0./1.25e+2)-dphi4.*t9.*t67.*(9.0./1.25e+2),dphi4.*t60+dphi5.*t8.*t26.*(9.0./1.25e+2)-dphi2.*t8.*t9.*t14.*(9.0./1.25e+2)-dphi3.*t8.*t9.*t14.*(9.0./1.25e+2)];
mt3 = [t12.*t22-dphi2.*t2.*t14-dphi3.*t2.*t14,t11.*t12-dphi2.*t6.*t14-dphi3.*t6.*t14,-t12.*(dphi2+dphi3),-dphi1.*(t5.*t67.*(9.0./1.25e+2)-t6.*t9.*t12.*(9.0./1.25e+2))+dphi2.*t86+dphi3.*t86-dphi5.*(t57-t80)-dphi4.*t5.*t68.*(9.0./1.25e+2),-dphi5.*(t59+t81)+dphi2.*t87+dphi3.*t87-dphi1.*(t58+t5.*t56.*(9.0./1.25e+2))+dphi4.*t5.*t55.*(9.0./1.25e+2),dphi5.*(t54+t60)+dphi2.*t82+dphi3.*t82+dphi4.*t8.*t26.*(9.0./1.25e+2),-dphi1.*t55+dphi4.*t56+dphi2.*t12.*t16+dphi3.*t12.*t16,-dphi1.*t68-dphi4.*t67+dphi2.*t12.*t18+dphi3.*t12.*t18];
mt4 = [dphi4.*t4.*t12-dphi2.*t8.*t14-dphi3.*t8.*t14,0.0,0.0,0.0,-dphi5.*(t5.*t56+t2.*t9.*t12)-dphi2.*t76-dphi3.*t76-dphi1.*(t6.*t26+t9.*t67)-dphi4.*t9.*t68,dphi5.*(t5.*t67-t6.*t9.*t12)-dphi2.*t77-dphi3.*t77+dphi1.*(t2.*t26-t9.*t56)+dphi4.*t9.*t55,-dphi2.*t75-dphi3.*t75+dphi5.*(t9.*t14-t4.*t26)+dphi4.*t8.*t9.*t12];
I_dJe = reshape([mt1,mt2,mt3,mt4],6,6);
end
