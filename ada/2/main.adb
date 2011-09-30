-- Entrees-sorties sur l'ecran en Ada
-- *********************************
-- put/putline : sortie ecran
-- get/getline : entree clavier

with ADA.TEXT_IO; use ADA.TEXT_IO;

procedure MAIN is
   CHAINE : STRING := "Hello World";
   --package IO_NOMBRE is new ADA.TEXT_IO.INTEGER_IO(INTEGER);

   I_MIN : constant := 1;
   I_MAX : constant := 5;
begin
   for I in I_MIN .. I_MAX loop
      --IO_NOMBRE.Put(I);
      --Put(" : ");
      --Put_Line(CHAINE);
      Put_Line(INTEGER'Image(I)&" : "&CHAINE);
   end loop;
end MAIN;
