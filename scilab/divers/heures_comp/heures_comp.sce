disp "Script Scilab de calcul des heures complémentaires"
disp "=================================================="

clear

disp "Statut"
disp "======"
h_stat=384;
h_sup_max=192;
coef_service=[1.5 1 1] // [coeff_cours coeff_td coeff_tp]
coef_hc=[1.5 1 2/3] // [coeff_cours coeff_td coeff_tp]
//h = [1 1 1]; // [h_cours h_td h_tp]
//coeff = [1.5 1 2/3]; 



disp "Heures effectuees"
disp "================="
//h_effectuees = [0 288 288]
h_effectuees = [0 190 386]

function h_eq_td = h_eq_td(h, coef)
  h_eq_td = h * coef';
  // Rem: produit matriciel d'un vct ligne par un vct col = produit scalaire
endfunction

function service_regle_2009=service_regle_2009(h_effectuees)
  // remplissage du service avec cours
  // puis avec td puis avec tp (afin d'avoir
  // le moins de tp en heure comp
  
  service=[0 0 0];
  
  // Remplissage service avec TP
  if h_effectuees(1,3)>h_stat then
    service(1,3) = service(1,3) + h_stat/coef_service(1,3);
    h_effectuees(1,3) = h_effectuees(1,3) - h_stat/coef_service(1,3);
  else
    service(1,3) = h_effectuees(1,3)
    h_effectuees(1,3) = 0
  end

  // Remplissage service avec TD
  if h_eq_td([0 h_effectuees(1,2) service(1,3)], coef_service)>h_stat then
    service(1,2) = service(1,2) + (h_stat-h_eq_td([0 0 service(1,3)], coef_service))/coef_service(1,2)
    h_effectuees(1,2) = h_effectuees(1,2) - (h_stat-h_eq_td([0 0 service(1,3)], coef_service))/coef_service(1,2)
  else
    service(1,2) = service(1,2) + h_effectuees(1,2)
    h_effectuees(1,2) = 0
  end
  
  // Remplissage service avec Cours
  if h_eq_td([h_effectuees(1,1) service(1,2) service(1,3)], coef_service)>h_stat then
    service(1,1) = service(1,1) + (h_stat-h_eq_td([0 service(1,2) service(1,3)], coef_service))/coef_service(1,1)
    h_effectuees(1,1) = h_effectuees(1,1) - (h_stat-h_eq_td([0 service(1,2) service(1,3)], coef_service))/coef_service(1,1)
  else
    service(1,1) = service(1,1) + h_effectuees(1,1)
    h_effectuees(1,1) = 0
  end  
  
  service_regle_2009 = service;
endfunction


function service_regle_2010=service_regle_2010(h_effectuees)
  // remplissage du service 
  // au prorata cours, TD, TP
  
  //pc=h_effectuees/sum(h_effectuees)
  heqtd=h_eq_td(h_effectuees, coef_service);
  if heqtd<>0
    pc=h_effectuees/heqtd;
  else
    pc=[1/3 1/3 1/3];
  end
  
  if heqtd>h_stat
    service_regle_2010=pc*h_stat
  else
    service_regle_2010=h_effectuees
  end
endfunction

function heures_comp=heures_comp(h_effectuees, h_service)
  heures_comp=h_effectuees-h_service
endfunction

function tests()
  // Tests d'intégrité (débordement de service)
  if h_service+h_comp<>h_effectuees then
    disp "**** Erreur de calcul du débordement de service : h_service+h_comp <> h_effectuees ****"
  end

  if h_eq_td(h_service, coef_service)>h_stat then
    disp "**** Erreur service > service_stat ****"
  end

  // Respect de la règle de limitation des heures comp
  if h_eq_td(h_comp, coef_hc)>192 then
    disp "**** Service dépassant la règle de limitation ****"
  end
endfunction

//h_eq_td(h, coeff)

disp "Regles avant 2009"
disp "================="

h_service=service_regle_2009(h_effectuees)
h_comp=heures_comp(h_effectuees, h_service)
h_comp_total_2009=h_eq_td(h_comp, coef_hc)

tests()

disp "Regles après 2009"
disp "================="
h_service=service_regle_2010(h_effectuees)
h_comp=heures_comp(h_effectuees, h_service)
h_comp_total_2010=h_eq_td(h_comp, coef_hc)

tests()

ecart_hc_abs = h_comp_total_2010 - h_comp_total_2009
ecart_hc_rel = ecart_hc_abs/h_comp_total_2009*100


// Répartition // A tester
// ===========

pc_td_tp = [0:1:100]/100; // ligne
hc = [0:1:h_sup_max]'; // col

td = (hc+h_stat)*pc_td_tp;
tp = (hc+h_stat)*(1-pc_td_tp);

nb_lig = size(hc,'r');
nb_col = size(pc_td_tp,'c');
M_h_comp_total_2009 = zeros(nb_lig, nb_col);
M_h_comp_total_2010 = M_h_comp_total_2009;

for i=1:nb_lig
  for j=1:nb_col
    h_effectuees = [0 td(i,j) tp(i,j)];
    
    // 2009
    h_service=service_regle_2009(h_effectuees);
    h_comp=heures_comp(h_effectuees, h_service);
    h_comp_total_2009=h_eq_td(h_comp, coef_hc);
    M_h_comp_total_2009(i,j)=h_comp_total_2009;
    
    // 2010
    h_service=service_regle_2010(h_effectuees);
    h_comp=heures_comp(h_effectuees, h_service);
    h_comp_total_2010=h_eq_td(h_comp, coef_hc);
    M_h_comp_total_2010(i,j)=h_comp_total_2010;
        
  end
end


M_ecart_hc_abs = M_h_comp_total_2010 - M_h_comp_total_2009;
M_ecart_hc_rel = M_ecart_hc_abs ./ h_comp_total_2009 * 100;

M=abs(M_ecart_hc_rel);
M=M($:-1:1,:); // inverser ordre lignes

Mmax=max(M);

clf();

// couleur
cmap = jetcolormap(Mmax);
xset("colormap",cmap);
Matplot(M)

// couleur noir vers blanc
//cmap = graycolormap(Mmax);
//xset("colormap",cmap);
//Matplot(M)

// couleur blanc vers noir
//offset=1
//cmap = graycolormap(Mmax+offset);
//cmap = cmap($:-1:1,:)
//xset("colormap",cmap);
//Matplot(M+offset)


//Matplot((1:xget("lastpattern"))) // tester la colormap

//plot3d(hc,pc_td_tp,M)


// Recherche du cas le plus défavorable
disp "Perte relative maximale heures comp"
ecart_hc_rel_max=min(M_ecart_hc_rel)
[i,j]=find(M_ecart_hc_rel==ecart_hc_rel_max)
M_ecart_hc_rel(i,j)
cond_h_sup_max=td(i,j)+tp(i,j)<h_stat+h_sup_max
td(i,j)
tp(i,j)
//h_effectuees = [0 td(i,j) tp(i,j)];