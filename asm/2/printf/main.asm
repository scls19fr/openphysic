; -------------------------------------------------
; Programme C affichant le contenu d'une variable x
; -------------------------------------------------
;
;#include <stdio.h>
;int main( void )
;{
; unsigned int x =50;
; printf( "x=%i\n",x);
; return 0
;}

; -------------------------------------------------
; Programme assembleur équivalent
; -------------------------------------------------
; 
; pour compiler cet exemple :
; $ nasm -f elf printf.asm
; $ gcc printf.o -o printf
; 
; Exécution :
; $ ./printf


extern printf	; fonction C externe, utilisée par ce programme

;; Segment des données
section .data
	msg:	db "x=%i",10,0	; chaine à passer à la fonction printf (doit se terminer par zero)
	x:	dd 50		; chaine 32 bits (double mot)

;; Segment de code
section .text

	
global main			; export du point d'entrée du programme
main:				; point d'entrée standard du C (ligne "int main(void)")
	; la fonction C print récupère ses paramètres à partir
	; de la position mémoire pointée par ebp, dans la pile
	
	push	ebp		; sauvegarde de ebp
	mov	ebp, esp	; ebp pointe maintenant sur le haut de la pile
	push	dword [x]	; le contenu de la variable "x" est empilé
	push 	dword msg	; l'adresse de la chaine de caractere à afficher est empilée
	call	printf		; appel de la fonction C printf
	add	esp, 8		; maintenant que printf est terminée, nous devons restaurer
				; la pile à son état antérieur (on déplace le pointeur de la pile)

	pop	ebp		; restauration de ebp
	mov	eax, 0		; code de retour de la fonction main (ligne "return 0")
	ret			; sort de la fonction "main"
