disp "Script Scilab de calcul des heures complémentaires"
disp "=================================================="

// cas d'un service mélant cours, td, tp
clear

disp "Statut"
disp "======"
h_stat=384;
h_sup_max=192;
coef_service=[1.5 1 1] // [coeff_cours coeff_td coeff_tp]
coef_hc=[1.5 1 2/3] // [coeff_cours coeff_td coeff_tp]

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

// augmenter la taille de la pile
// (pour pouvoir manipuler des grandes matrices)
stacksize(5000000*10); // default=5000000

pas=4;
cours=[0:pas:(h_stat+h_sup_max)/coef_service(1,1)]';
td=[0:pas:(h_stat+h_sup_max)/coef_service(1,2)]';
tp=[0:pas:h_stat/coef_service(1,3)+h_sup_max/coef_hc(1,3)]';

M_h_comp_total_2009 = zeros(size(cours,'r'), size(td,'r'), size(tp,'r'));
M_h_comp_total_2010 = M_h_comp_total_2009;

for i=1:size(cours,'r')
  for j=1:size(td,'r')
    for k=1:size(tp,'r')
      h_effectuees = [cours(i,1) td(j,1) tp(k,1)];
    
      // 2009
      h_service=service_regle_2009(h_effectuees);
      h_comp=heures_comp(h_effectuees, h_service);
      h_comp_total_2009=h_eq_td(h_comp, coef_hc);
      M_h_comp_total_2009(i,j,k)=h_comp_total_2009;
    
      // 2010
      h_service=service_regle_2010(h_effectuees);
      h_comp=heures_comp(h_effectuees, h_service);
      h_comp_total_2010=h_eq_td(h_comp, coef_hc);
      M_h_comp_total_2010(i,j,k)=h_comp_total_2010; 
    end
  end
end

//save('data.sci', M_h_comp_total_2009, M_h_comp_total_2010)
//load

M_ecart_hc_abs = M_h_comp_total_2010 - M_h_comp_total_2009;
M_ecart_hc_rel = M_ecart_hc_abs ./ h_comp_total_2009 * 100;


// Recherche du cas le plus défavorable
disp "Perte relative maximale heures comp"
ecart_hc_rel_max=min(M_ecart_hc_rel)
//[i,j,k]=find(M_ecart_hc_rel==ecart_hc_rel_max)
//M_ecart_hc_rel(i,j,k)
//cond_h_sup_max=cours()+td(i,j)+tp(i,j)<h_stat+h_sup_max
td(i,j)
tp(i,j)