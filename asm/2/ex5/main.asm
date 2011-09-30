; -------------------------------
; Calcul du factoriel d'un nombre
; -------------------------------

extern printf	; fonction C externe, utilisée par ce programme

;; Segment des données
section .data
	msg_a:		db "a=%i",10,0	; chaine à passer à la fonction printf (doit se terminer par zero)
	a:		dd 6		; chaine 32 bits (double mot)
	msg_result:	db "a!=%i",10,0


;; Segment de code
section .text

	
global main			; export du point d'entrée du programme
main:				; point d'entrée standard du C (ligne "int main(void)")
	; la fonction C print récupère ses paramètres à partir
	; de la position mémoire pointée par ebp, dans la pile
	
	push	ebp		; sauvegarde de ebp
	mov	ebp, esp	; ebp pointe maintenant sur le haut de la pile

	mov	eax,dword [a]	; met le contenu de a dans le registre eax

	push	dword [a]
	push 	dword msg_a	; l'adresse de la chaine de caractere à afficher est empilée
	call 	printf		; appel de la fonction C printf

	add	esp,8		; 2 push -> 2*4

	mov	eax,dword [a]
	mov	ebx,dword [a]		; eax->ebx

boucle:
	dec	ebx

	cmp	ebx,1
	je	affichage
	mul	ebx
	jmp	boucle

affichage:
	push	eax
	push	msg_result
	call	printf

	add	esp,8

	mov	esp, ebp	; remet esp dans ebp

	pop	ebp		; restauration de ebp
	mov	eax, 0		; code de retour de la fonction main (ligne "return 0")
	ret			; sort de la fonction "main"
