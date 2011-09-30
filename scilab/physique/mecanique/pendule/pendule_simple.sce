function proceed()
[L_new,ierr,errtext]=check_scalar("L","Longueur du pendule (m)","-%inf","+%inf","1");
TCL_SetVar("L_errortext",errtext);
if (ierr)
TCL_EvalStr("mess $L_errortext");
return
end
L_changed=first_run;
if (or(L_new~=L))
L_changed=%t;
end
L=L_new;
[theta_0_deg_new,ierr,errtext]=check_scalar("theta_0_deg","Angle initial","1","179","1");
TCL_SetVar("theta_0_deg_errortext",errtext);
if (ierr)
TCL_EvalStr("mess $theta_0_deg_errortext");
return
end
theta_0_deg_changed=first_run;
if (or(theta_0_deg_new~=theta_0_deg))
theta_0_deg_changed=%t;
end
theta_0_deg=theta_0_deg_new;
[g0_new,ierr,errtext]=check_scalar("g0","Acceleration de la pesanteur (N/kg)","-%inf","+%inf","1");
TCL_SetVar("g0_errortext",errtext);
if (ierr)
TCL_EvalStr("mess $g0_errortext");
return
end
g0_changed=first_run;
if (or(g0_new~=g0))
g0_changed=%t;
end
g0=g0_new;
[iv_new,ierr,errtext]=check_scalar("iv","Instant de visualisation","1","500","1");
TCL_SetVar("iv_errortext",errtext);
if (ierr)
TCL_EvalStr("mess $iv_errortext");
return
end
iv_changed=first_run;
if (or(iv_new~=iv))
iv_changed=%t;
end
iv=iv_new;
[tf_new,ierr,errtext]=check_scalar("tf","Temps final","-%inf","+%inf","1");
TCL_SetVar("tf_errortext",errtext);
if (ierr)
TCL_EvalStr("mess $tf_errortext");
return
end
tf_changed=first_run;
if (or(tf_new~=tf))
tf_changed=%t;
end
tf=tf_new;
// 
tc=linspace(0,2*3.1415926535,31)';
// Temps
t=linspace(0,tf,500)';
if (or([theta_0_deg_changed,tf_changed,L_changed,g0_changed]))
// Script code for the pendule ode
_X0(1:1,1)=theta_0_deg;
_X0(2:2,1)=0;
_X=ode(_X0,0,t,f_pendule);
theta=_X(1:1,:)';
theta_point=_X(2:2,:)';
end
id66089=L*sin(theta(iv)*%pi/180)+cos(tc)*L/20;
id66096=-L*cos(theta(iv)*%pi/180)+sin(tc)*L/20;
pendule_nonlinX=[0,L*sin(theta(iv)*%pi/180)];
pendule_nonlinY=[0,-L*cos(theta(iv)*%pi/180)];
id66127=theta;
id66133=theta_point/(sqrt(g0/L));
xmllab_display
endfunction

function [lhs]=f_pendule(_t,_X)
t=_t;
theta=_X(1:1,1);
theta_point=_X(2:2,1);
lhs=[(theta_point);(-180/%pi*g0/L*sin(theta*%pi/180))];
endfunction

function xmllab_display()
if (or([theta_0_deg_changed,tf_changed,L_changed,g0_changed]))
fig(0);
_wdim=xget("wdim");
clf
if (TCL_GetVar("display_pph1")=="on")
plot(id66127,id66133,"r-2","axis",[-theta_0_deg,theta_0_deg,-theta_0_deg,theta_0_deg],"axis","equal","axis","left");
hold("on");
hold("off");
end
xlabel("");
ylabel("");
legend_list=[];
if (TCL_GetVar("display_pph1")=="on")
legend_list=[legend_list;""];
end
legend(legend_list,1);
xset("wshow");
set_posfig_dim(_wdim(1),_wdim(2));
end
if (or([theta_0_deg_changed,tf_changed,L_changed,g0_changed]))
fig(1);
_wdim=xget("wdim");
clf
if (TCL_GetVar("display_theta")=="on")
plot(t,theta,"r-2","axis",[0,tf,-theta_0_deg,theta_0_deg],"axis","left");
hold("on");
hold("off");
end
xlabel("Temps"+"(s)");
ylabel("deg");
legend_list=[];
if (TCL_GetVar("display_theta")=="on")
legend_list=[legend_list;"Angle du pendule"];
end
legend(legend_list,1);
xset("wshow");
set_posfig_dim(_wdim(1),_wdim(2));
end
fig(2);
_wdim=xget("wdim");
clf
if (TCL_GetVar("display_pendule_nonlin")=="on")
plot(pendule_nonlinX,pendule_nonlinY,"r-1","axis",[-1.2,1.2,-1.2,1.2],"axis","equal","axis","left");
hold("on");
end
if (TCL_GetVar("display_circ1")=="on")
plot(id66089,id66096,"r-1","axis",[-1.2,1.2,-1.2,1.2],"axis","equal","axis","left");
hold("on");
hold("off");
end
title(sprintf("t = %f s",t(iv)));
legend_list=[];
if (TCL_GetVar("display_pendule_nonlin")=="on")
legend_list=[legend_list;""];
end
if (TCL_GetVar("display_circ1")=="on")
legend_list=[legend_list;""];
end
legend(legend_list,1);
xset("wshow");
set_posfig_dim(_wdim(1),_wdim(2));
endfunction

if (~exists("%xmllab_version") | %xmllab_version ~= "1.53-1")
if (isdir("XMLlab1.53-1"))
// Load the runtime XMLlab library
exec("XMLlab1.53-1/runtime_loader.sce");

else
x_message(["You need the XMLlab toolbox version >=1.53-1";"to run this simulation.";"";"Please visit http://xmllab.org"]);
quit
end
end
first_run=%t;
// 
// Cette simulation a été générée par XMLlab 1.53-1
// 
// Copyright Stéphane Mottelet, André Pauss, Université de Technologie de Compiègne
// stephane.mottelet@utc.fr, andre.pauss@utc.fr
// 
oldpwd=pwd();
chdir(get_absolute_file_path("pendule_simple.sce"));
TCL_EvalFile("pendule_simple.tk");
[L,ierr,errtext]=check_scalar("L","Longueur du pendule (m)","-%inf","+%inf","1");
TCL_SetVar("L_errortext",errtext);
if (ierr)
TCL_EvalStr("mess $L_errortext");
return
end
[theta_0_deg,ierr,errtext]=check_scalar("theta_0_deg","Angle initial","1","179","1");
TCL_SetVar("theta_0_deg_errortext",errtext);
if (ierr)
TCL_EvalStr("mess $theta_0_deg_errortext");
return
end
[g0,ierr,errtext]=check_scalar("g0","Acceleration de la pesanteur (N/kg)","-%inf","+%inf","1");
TCL_SetVar("g0_errortext",errtext);
if (ierr)
TCL_EvalStr("mess $g0_errortext");
return
end
[iv,ierr,errtext]=check_scalar("iv","Instant de visualisation","1","500","1");
TCL_SetVar("iv_errortext",errtext);
if (ierr)
TCL_EvalStr("mess $iv_errortext");
return
end
[tf,ierr,errtext]=check_scalar("tf","Temps final","-%inf","+%inf","1");
TCL_SetVar("tf_errortext",errtext);
if (ierr)
TCL_EvalStr("mess $tf_errortext");
return
end
// Function for the rhs of the pendule ode
graphinit();
fig(0,"margin",0.1);
xset("wpdim",450+256*(1-1),360+224*(1-1));
xset("wresize",1);
xname("Portrait de phase");
xset("pixmap",1);
fig(1,"margin",0.1);
xset("wpdim",450+256*(1-1),360+224*(1-1));
xset("wresize",1);
xname("Angle du pendule en fonction du temps");
xset("pixmap",1);
fig(2,"margin",0.1);
xset("wpdim",450+256*(1-1),360+224*(1-1));
xset("wresize",1);
xname("Animation du pendule");
xset("pixmap",1);

exec(xmllab_run,-1);
TCL_EvalStr('set ok 1');first_run=%f;
TCL_EvalStr("raise $toplevelWindow");

TCL_SetVar('keep','yes')
while TCL_GetVar('keep')=='yes';realtimeinit(1/1000);realtime(0);realtime(1);end;
TCL_EvalStr('catch {bind $toplevelWindow <Destroy> {}}; catch {destroy $toplevelWindow}');
if(or(sciargs()=="-f")) quit; end;chdir(oldpwd);
