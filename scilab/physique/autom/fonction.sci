//fonction : rapidité du système

//Temps de montée

function D = depassement(y)
		ypermanent=y(length(y)-1);
		D=(max(y)-ypermanent)/ypermanent;


function Tm = tempsdemontee(t,y)
		ypermanent=y(length(y)-1);
		ym=0.95*ypermanent;
		Tm=t(min(find(y>=ym)));

function Tr = tempsdereponse(t,y)
		ypermanent=y(length(y)-1);

		ym1=0.95*ypermanent;
		ym2=1.05*ypermanent;

		ind=find((y<ym1) | (y>ym2));
		Tr=t(max(ind));

function epsilon= erreurdeprecision(t,y)
		ypermanent=y(length(y)-1);
		epsilon=ypermanent-1;