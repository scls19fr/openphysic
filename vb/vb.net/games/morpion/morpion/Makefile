MONOLIB=/usr/lib/mono/2.0
OUTPUT=morpion.exe

all:
	vbnc -r:$(MONOLIB)/System.Drawing.dll -r:$(MONOLIB)/System.Windows.Forms.dll *.vb 
	#-o $(OUTPUT)

run:
	mono $(OUTPUT)

