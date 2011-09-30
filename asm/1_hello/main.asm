;;; Mon premier programme en Assembleur 80x86

	;; Segment des données
	section .data
		msg db "Hello World",0xa	; chaîne de caractère
		len equ $-msg			; longueur de la chaîne 

	;; Segment de code
	section .text

	global _start		; export du point d'entrée du programme (loader)

	_start			; point d'entrée du programme
		mov edx,len	; charge dans le registre étendu la longueur de la chaîne à afficher
		mov ecx,msg	; ecx pointeur de la chaîne
		mov ebx,1	; ebx<=1 (stdout flux d'écriture)
		mov eax,4	; eax<=4 n° appel système (sys write)
		int 0x80	; appel système
		mov ebx,0	; code de retour
		mov eax,1	; numero de la fonction à appeler (1=sys-exit)
		int 0x80	; appel système
	