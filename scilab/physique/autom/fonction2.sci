//fonction : parametres du systeme

//depassement

function D = depassement(y)
		ypermanent=y(length(y)-1);
		D=100*(max(y)-ypermanent)/ypermanent;

//temps de montee

function Tm = tempsdemontee(t,y)
		ypermanent=y(length(y)-1);
		ym=0.95*ypermanent;
		Tm=t(min(find(y>=ym)));

//temps de reponse

function Tr = tempsdereponse(t,y)
		ypermanent=y(length(y)-1);
		ym1=0.95*ypermanent;
		ym2=1.05*ypermanent;
		ind=find((y<ym1) | (y>ym2));
		Tr=t(max(ind));
