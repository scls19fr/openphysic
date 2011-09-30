; -------------------------------------------
; Programme réalisant l'algo indiqué
; -------------------------------------------

extern printf	; fonction C externe, utilisée par ce programme

;; Segment des données
section .data
	msg_a:		db "a=%i",10,0	; chaine à passer à la fonction printf (doit se terminer par zero)
	a:		dd 1		; chaine 32 bits (double mot)
	msg_b:		db "b=%i",10,0 	; 10=retour chariot 0=caractère de fin de chaine
	b:		dd 6
	somme:		dd 0
	msg_somme:	db "somme=%i",10,0


;; Segment de code
section .text

	
global main			; export du point d'entrée du programme
main:				; point d'entrée standard du C (ligne "int main(void)")
	; la fonction C print récupère ses paramètres à partir
	; de la position mémoire pointée par ebp, dans la pile
	
	push	ebp		; sauvegarde de ebp
	mov	ebp, esp	; ebp pointe maintenant sur le haut de la pile

	push	dword [a]	; le contenu de la variable "x" est empilé
	push 	dword msg_a	; l'adresse de la chaine de caractere à afficher est empilée
	call 	printf		; appel de la fonction C printf

	push	dword [b]
	push	dword msg_b
	call	printf		; appel de la fonction C printf



;a_sup_25_and_b_sup_1:
	;a_sup_25
	mov	eax,dword[a]
	mov	ebx,dword[b]
	cmp	eax,25
	jbe	sinon 		; a_inf_or_eq_25
	;b_sup_1   on fait le and avec des sauts
	cmp	ebx,1
	jbe	sinon
	
	;somme=a+b
	add eax,ebx
	mov dword[somme],eax

	
jmp	fin
sinon:
	;a_eq_1_and_b_sup_3
		; a_eq_1
		cmp eax,1
		jne sinon2
		; b_sup_3
		cmp ebx,3
		jbe sinon2
		
		; somme = a+b+5
		add eax,ebx
		add eax,5
		mov dword[somme],eax
		jmp	fin

	sinon2:
		; somme = a*b+1
		mul ebx
		add eax,1
		mov dword[somme],eax


fin:

	push	dword[somme]
	push	msg_somme
	call	printf


	mov	esp, ebp	; remet esp dans ebp

	pop	ebp		; restauration de ebp
	mov	eax, 0		; code de retour de la fonction main (ligne "return 0")
	ret			; sort de la fonction "main"
