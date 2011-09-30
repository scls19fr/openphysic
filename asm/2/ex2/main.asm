; -------------------------------------------
; Programme affichant le maximum de 2 nombres
; -------------------------------------------

extern printf	; fonction C externe, utilisée par ce programme

;; Segment des données
section .data
	msg_x:	db "x=%i",10,0	; chaine à passer à la fonction printf (doit se terminer par zero)
	x:	dd 155		; chaine 32 bits (double mot)
	msg_y:	db "y=%i",10,0 	; 10=retour chariot 0=caractère de fin de chaine
	y:	dd 61
	msg_z: db "max(x,y)=%i",10,0


;; Segment de code
section .text

	
global main			; export du point d'entrée du programme
main:				; point d'entrée standard du C (ligne "int main(void)")
	; la fonction C print récupère ses paramètres à partir
	; de la position mémoire pointée par ebp, dans la pile
	
	push	ebp		; sauvegarde de ebp
	mov	ebp, esp	; ebp pointe maintenant sur le haut de la pile

	push	dword [x]	; le contenu de la variable "x" est empilé
	push 	dword msg_x	; l'adresse de la chaine de caractere à afficher est empilée
	call 	printf		; appel de la fonction C printf

	push	dword [y]
	push	dword msg_y
	call	printf		; appel de la fonction C printf

	mov     eax,dword[x]
	mov	ebx,dword[y]
	cmp	eax,ebx
	JA	x_sup_y
	JB	y_sup_x

	x_sup_y:
		push 	dword[x]	
		push	dword msg_z
		call	printf
		jmp	fin

	y_sup_x:
		push	dword[y]
		push	dword msg_z	; affichage
		call	printf

	fin:

	mov	esp, ebp	; remet esp dans ebp

	pop	ebp		; restauration de ebp
	mov	eax, 0		; code de retour de la fonction main (ligne "return 0")
	ret			; sort de la fonction "main"
