
paEchelle := 2;
paSeparation := 5;

color paCouleurFond, paCouleurOmbre;
paCouleurFond := (0.86,0.65,0.13);				     % Goldenrod
paCouleurOmbre := .6white;

pair paDecalage;
paDecalage := (1,-1);

%
% Légende: Cadre avec bords carrés et ombre (CCO)
% ------------------------------------------------------------------------------
vardef paLegendeCCO(expr pos,txt) =
    picture $;
    path $$;
    pair BLLC,BULC,BURC,BLRC;
    save _s; _s = paSeparation;
    save _p; pair _p; _p = pos gENPLACE;    
    % Acquisition du texte à encadrer sous forme d'image
    $ = thelabel(TEX(txt),(0,0)) scaled paEchelle; 
    
    % Calcul des coins
    BLLC = llcorner $ shifted (-_s,-_s); 
    BULC = ulcorner $ shifted (-_s,_s);
    BURC = urcorner $ shifted (_s,_s);
    BLRC = lrcorner $ shifted (_s,-_s);
    
    % Construction du bord de la boîte
    $$ = BLLC -- BULC -- BURC -- BLRC -- cycle;
    fill $$ shifted (_p+paDecalage)
	withcolor paCouleurOmbre;
    fill $$ shifted _p
	withcolor paCouleurFond;
    draw $ shifted _p;
enddef;

endinput