-- Mon premier programme en ADA
-- ****************************

procedure Main is
   --
   -- type Entier is Integer; -- type synonyme ????? erreur ?????
   subtype Entier is Integer range 0..Integer'Last; -- sous-type (entier naturel)
   -- type Entier is new Integer; -- type derive

   N:Entier;
   -- N:Integer;

begin
   N:=1;
end;

