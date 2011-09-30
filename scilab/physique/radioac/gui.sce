// Loi de décroissance radioactive
// ===============================

// S. Celles

clear;

getf('func.sci');

//set("figure_style","new") //create a figure in entity mode
//f=get("current_figure") //get the handle on the Figure entity
//f.figure_size = [1000, 700];


// Valeurs par défaut des paramètres
TCL_EvalStr([	'destroy .top1'           // supprime eventuellement la fenetre top1
						'set w1 [toplevel .top1]'  // creation de la fenetre top1
						'set sqrtN 25' 
						'set p0 0.2'
						])

function update
   sqrtN=TCL_GetVar('sqrtN');
      //mprintf('sqrtN=%s\n',sqrtN);
      sqrtN=evstr(sqrtN);
   p0=TCL_GetVar('p0');
     p0=evstr(p0);

  main(sqrtN, p0) // fonction principale
endfunction

TCL_EvalStr('scale $w1.echelleVar1 -from 0 -to 1 -length 300 -label p0 -orient horizontal -tickinterval 0.2 ...
					-command {ScilabEval ""update""} -variable p0 -relief groove -showvalue true ...
					-borderwidth 4 -resolution 0.05')
TCL_EvalStr('scale $w1.echelleVar2 -from 10 -to 100 -length 300 -label sqrtN -orient horizontal -tickinterval 10 ...
					-command {ScilabEval ""update""} -variable sqrtN -relief groove -showvalue true ...
					-borderwidth 4 -resolution 5')

TCL_EvalStr('pack $w1.echelleVar1 $w1.echelleVar2') // les contrôles sont placés les uns sous les autres
