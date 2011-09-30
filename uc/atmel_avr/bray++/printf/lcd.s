/* START ASM
   MCU: AT90S8515
*/
#arch AT90S8515
#define __SREG__ 0x3f
#define __SP_H__ 0x3e
#define __SP_L__ 0x3d
#define low(x) ((x)&0xff)
#define high(x) (((x)>>8)&0xff)
#define hlow(x) (((x)>>16)&0xff)
#define hhigh(x) (((x)>>24)&0xff)
#define __tmp_reg__ r0
#define __zero_reg__ r1
#define __pc_rel__(x) ((x)*2)

extern __prologue_saves__
extern __epilogue_restores__
extern _send_byte
	seg flash.code.f_lcd_delay
public _lcd_delay:
;prologue: frame size=0
;prologue end (size=0)
	clr r22
	clr r23
	cp r22,r24
	cpc r23,r25
	brsh L18
L20:
	clr r21
L23:
	subi r21,low(-(1))
	cpi r21,low(10)
	brlo L23
	subi r22,low(-(1))
	sbci r23,high(-(1))
	cp r22,r24
	cpc r23,r25
	brlo L20
L18:
;epilogue: frame size=0
	ret
;epilogue end (size=1)
; function lcd_delay size 15 (14)
 ; aligning segment
	seg flash.code.f_toggle_E
public _toggle_E:
;prologue: frame size=0
;prologue end (size=0)
;#APP
	in r25,27
;#NOAPP
	ori r25,low(32)
;#APP
	out 27,r25
	in r25,27
;#NOAPP
	andi r25,low(-33)
;#APP
	out 27,r25
;#NOAPP
;epilogue: frame size=0
	ret
;epilogue end (size=1)
; function toggle_E size 11 (10)
 ; aligning segment
	seg flash.code.f_lcd_cls
public _lcd_cls:
;prologue: frame size=0
;prologue end (size=0)
	clr r25
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r25,low(1)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(1000)
	ldi r25,high(1000)
	rcall _lcd_delay
;epilogue: frame size=0
	ret
;epilogue end (size=1)
; function lcd_cls size 12 (11)
 ; aligning segment
	seg flash.code.f_lcd_home
public _lcd_home:
;prologue: frame size=0
;prologue end (size=0)
	clr r25
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r25,low(2)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(1000)
	ldi r25,high(1000)
	rcall _lcd_delay
;epilogue: frame size=0
	ret
;epilogue end (size=1)
; function lcd_home size 12 (11)
 ; aligning segment
	seg flash.code.f_lcd_control
public _lcd_control:
;prologue: frame size=0
	push r17
	push r28
	push r29
;prologue end (size=3)
	mov r29,r25
	mov r28,r24
	mov r17,r23
	clr r25
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r25,low(8)
	cpi r29,low(1)
	brne L31
	ldi r25,low(12)
L31:
	cpi r28,low(1)
	brne L32
	ori r25,low(2)
L32:
	cpi r17,low(1)
	brne L33
	ori r25,low(1)
L33:
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(100)
	ldi r25,high(100)
	rcall _lcd_delay
;epilogue: frame size=0
	pop r29
	pop r28
	pop r17
	ret
;epilogue end (size=4)
; function lcd_control size 30 (23)
 ; aligning segment
	seg flash.code.f_lcd_goto
public _lcd_goto:
;prologue: frame size=0
	push r29
;prologue end (size=1)
	mov r29,r25
	swap r25
	andi r25,0x0f
	ori r25,low(8)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	andi r29,low(15)
;#APP
	out 27,r29
;#NOAPP
	rcall _toggle_E
	ldi r24,low(100)
	ldi r25,high(100)
	rcall _lcd_delay
;epilogue: frame size=0
	pop r29
	ret
;epilogue end (size=2)
; function lcd_goto size 17 (14)
 ; aligning segment
	seg flash.code.f_lcd_putch
public _lcd_putch:
;prologue: frame size=0
	push r29
;prologue end (size=1)
	mov r29,r25
	swap r25
	andi r25,0x0f
	ori r25,low(16)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	mov r25,r29
	andi r25,low(15)
	ori r25,low(16)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(100)
	ldi r25,high(100)
	rcall _lcd_delay
;epilogue: frame size=0
	pop r29
	ret
;epilogue end (size=2)
; function lcd_putch size 19 (16)
 ; aligning segment
	seg flash.code.f_lcd_putstr
public _lcd_putstr:
;prologue: frame size=0
	push r28
	push r29
;prologue end (size=2)
	mov r29,r25
	mov r28,r24
	rjmp L41
L39:
	ld r25,Y+
	rcall _lcd_putch
L41:
	ld r25,Y
	tst r25
	brne L39
;epilogue: frame size=0
	pop r29
	pop r28
	ret
;epilogue end (size=3)
; function lcd_putstr size 13 (8)
 ; aligning segment
	seg flash.code.f_printbin
public _printbin:
;prologue: frame size=0
	push r28
	push r29
;prologue end (size=2)
	mov r28,r25
	ldi r29,low(-128)
L46:
	mov r25,r28
	and r25,r29
	brne L47
	ldi r25,low(48)
	rcall _lcd_putch
	rjmp L45
L47:
	ldi r25,low(49)
	rcall _lcd_putch
L45:
	lsr r29
	brne L46
;epilogue: frame size=0
	pop r29
	pop r28
	ret
;epilogue end (size=3)
; function printbin size 19 (14)
 ; aligning segment
	seg flash.code.f_printhex
public _printhex:
;prologue: frame size=0
	push r29
;prologue end (size=1)
	mov r24,r25
	swap r25
	andi r25,0x0f
	subi r25,low(-(48))
	cpi r25,low(58)
	brlo L51
	subi r25,low(-(7))
L51:
	andi r24,low(15)
	mov r29,r24
	subi r29,low(-(48))
	cpi r29,low(58)
	brlo L52
	subi r29,low(-(7))
L52:
	rcall _lcd_putch
	mov r25,r29
	rcall _lcd_putch
;epilogue: frame size=0
	pop r29
	ret
;epilogue end (size=2)
; function printhex size 19 (16)
extern __udivhi3
 ; aligning segment
	seg eram.gcc_data_section
LC0:
	dc.b 0x45
	dc.b 0x72
	dc.b 0x72
	dc.b 0x0
	seg flash.code.f_print2
public _print2:
;prologue: frame size=0
	push r16
	push r17
	push r28
	push r29
;prologue end (size=4)
	mov r29,r25
	mov r28,r24
	cpi r28,100
	cpc r29,__zero_reg__
	brsh L54
	ldi r22,low(10)
	ldi r23,high(10)
	rcall __udivhi3
	mov r16,r24
	mov r17,r25
	mov r25,r16
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r25,r17
	mov r24,r16
	ldi r23,low(3)
	lsl r24
	rol r25
	dec r23
	brne __pc_rel__(-4)
	add r24,r16
	adc r25,r17
	add r24,r16
	adc r25,r17
	sub r28,r24
	sbc r29,r25
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	rjmp L55
L54:
	ldi r24,low(LC0)
	ldi r25,high(LC0)
	rcall _lcd_putstr
L55:
;epilogue: frame size=0
	pop r29
	pop r28
	pop r17
	pop r16
	ret
;epilogue end (size=5)
; function print2 size 42 (33)
extern __mulhi3
 ; aligning segment
	seg eram.gcc_data_section
LC1:
	dc.w (100) & 0xffff
	seg flash.code.f_print3
public _print3:
;prologue: frame size=0
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
;prologue end (size=6)
	mov r29,r25
	mov r28,r24
	ldi r23,high(1000)
	cpi r28,low(1000)
	cpc r29,r23
	brsh L57
	lds r14,LC1
	lds r15,(LC1)+1
	mov r23,r15
	mov r22,r14
	rcall __udivhi3
	mov r16,r24
	mov r17,r25
	mov r25,r16
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r23,r15
	mov r22,r14
	mov r25,r17
	mov r24,r16
	rcall __mulhi3
	sub r28,r24
	sbc r29,r25
	ldi r22,low(10)
	ldi r23,high(10)
	mov r24,r28
	mov r25,r29
	rcall __udivhi3
	mov r16,r24
	mov r17,r25
	mov r25,r16
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r25,r17
	mov r24,r16
	ldi r23,low(3)
	lsl r24
	rol r25
	dec r23
	brne __pc_rel__(-4)
	add r24,r16
	adc r25,r17
	add r24,r16
	adc r25,r17
	sub r28,r24
	sbc r29,r25
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	rjmp L58
L57:
	ldi r24,low(LC0)
	ldi r25,high(LC0)
	rcall _lcd_putstr
L58:
;epilogue: frame size=0
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
;epilogue end (size=7)
; function print3 size 68 (55)
 ; aligning segment
	seg flash.code.f_print5
public _print5:
;prologue: frame size=0
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
;prologue end (size=6)
	mov r14,r24
	mov r15,r25
	ldi r28,low(10000)
	ldi r29,high(10000)
	mov r22,r28
	mov r23,r29
	rcall __udivhi3
	mov r16,r24
	mov r17,r25
	mov r25,r16
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r22,r28
	mov r23,r29
	mov r25,r17
	mov r24,r16
	rcall __mulhi3
	sub r14,r24
	sbc r15,r25
	ldi r28,low(1000)
	ldi r29,high(1000)
	mov r22,r28
	mov r23,r29
	mov r25,r15
	mov r24,r14
	rcall __udivhi3
	mov r16,r24
	mov r17,r25
	mov r25,r16
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r22,r28
	mov r23,r29
	mov r25,r17
	mov r24,r16
	rcall __mulhi3
	sub r14,r24
	sbc r15,r25
	ldi r28,low(100)
	ldi r29,high(100)
	mov r22,r28
	mov r23,r29
	mov r25,r15
	mov r24,r14
	rcall __udivhi3
	mov r16,r24
	mov r17,r25
	mov r25,r16
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r22,r28
	mov r23,r29
	mov r25,r17
	mov r24,r16
	rcall __mulhi3
	sub r14,r24
	sbc r15,r25
	ldi r22,low(10)
	ldi r23,high(10)
	mov r25,r15
	mov r24,r14
	rcall __udivhi3
	mov r16,r24
	mov r17,r25
	mov r25,r16
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r25,r17
	mov r24,r16
	ldi r23,low(3)
	lsl r24
	rol r25
	dec r23
	brne __pc_rel__(-4)
	add r24,r16
	adc r25,r17
	add r24,r16
	adc r25,r17
	sub r14,r24
	sbc r15,r25
	mov r25,r14
	subi r25,low(-(48))
	rcall _lcd_putch
;epilogue: frame size=0
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
;epilogue end (size=7)
; function print5 size 96 (83)
extern __udivsi3
extern __mulsi3
 ; aligning segment
	seg eram.gcc_data_section
LC2:
	dc.l 1000000000 ; long
LC3:
	dc.l 100000000 ; long
LC4:
	dc.l 10000000 ; long
LC5:
	dc.l 1000000 ; long
LC6:
	dc.l 100000 ; long
	seg flash.code.f_print10
public _print10:
;prologue: frame size=0
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
;prologue end (size=10)
	mov r14,r22
	mov r15,r23
	mov r16,r24
	mov r17,r25
	lds r10,LC2
	lds r11,(LC2)+1
	lds r12,(LC2)+2
	lds r13,(LC2)+3
	mov r21,r13
	mov r20,r12
	mov r19,r11
	mov r18,r10
	rcall __udivsi3
	mov r29,r23
	mov r28,r22
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r21,r13
	mov r20,r12
	mov r19,r11
	mov r18,r10
	mov r22,r28
	mov r23,r29
	clr r24
	clr r25
	rcall __mulsi3
	sub r14,r22
	sbc r15,r23
	sbc r16,r24
	sbc r17,r25
	lds r10,LC3
	lds r11,(LC3)+1
	lds r12,(LC3)+2
	lds r13,(LC3)+3
	mov r21,r13
	mov r20,r12
	mov r19,r11
	mov r18,r10
	mov r25,r17
	mov r24,r16
	mov r23,r15
	mov r22,r14
	rcall __udivsi3
	mov r29,r23
	mov r28,r22
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r21,r13
	mov r20,r12
	mov r19,r11
	mov r18,r10
	mov r22,r28
	mov r23,r29
	clr r24
	clr r25
	rcall __mulsi3
	sub r14,r22
	sbc r15,r23
	sbc r16,r24
	sbc r17,r25
	lds r10,LC4
	lds r11,(LC4)+1
	lds r12,(LC4)+2
	lds r13,(LC4)+3
	mov r21,r13
	mov r20,r12
	mov r19,r11
	mov r18,r10
	mov r25,r17
	mov r24,r16
	mov r23,r15
	mov r22,r14
	rcall __udivsi3
	mov r29,r23
	mov r28,r22
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r21,r13
	mov r20,r12
	mov r19,r11
	mov r18,r10
	mov r22,r28
	mov r23,r29
	clr r24
	clr r25
	rcall __mulsi3
	sub r14,r22
	sbc r15,r23
	sbc r16,r24
	sbc r17,r25
	lds r10,LC5
	lds r11,(LC5)+1
	lds r12,(LC5)+2
	lds r13,(LC5)+3
	mov r21,r13
	mov r20,r12
	mov r19,r11
	mov r18,r10
	mov r25,r17
	mov r24,r16
	mov r23,r15
	mov r22,r14
	rcall __udivsi3
	mov r29,r23
	mov r28,r22
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r21,r13
	mov r20,r12
	mov r19,r11
	mov r18,r10
	mov r22,r28
	mov r23,r29
	clr r24
	clr r25
	rcall __mulsi3
	sub r14,r22
	sbc r15,r23
	sbc r16,r24
	sbc r17,r25
	lds r10,LC6
	lds r11,(LC6)+1
	lds r12,(LC6)+2
	lds r13,(LC6)+3
	mov r21,r13
	mov r20,r12
	mov r19,r11
	mov r18,r10
	mov r25,r17
	mov r24,r16
	mov r23,r15
	mov r22,r14
	rcall __udivsi3
	mov r29,r23
	mov r28,r22
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r21,r13
	mov r20,r12
	mov r19,r11
	mov r18,r10
	mov r22,r28
	mov r23,r29
	clr r24
	clr r25
	rcall __mulsi3
	sub r14,r22
	sbc r15,r23
	sbc r16,r24
	sbc r17,r25
	ldi r18,low(10000)
	ldi r19,high(10000)
	ldi r20,hlow(10000)
	ldi r21,hhigh(10000)
	mov r25,r17
	mov r24,r16
	mov r23,r15
	mov r22,r14
	rcall __udivsi3
	mov r10,r22
	mov r11,r23
	mov r12,r24
	mov r13,r25
	mov r29,r11
	mov r28,r10
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	ldi r22,low(10000)
	ldi r23,high(10000)
	mov r25,r11
	mov r24,r10
	rcall __mulhi3
	clr r26
	clr r27
	sub r14,r24
	sbc r15,r25
	sbc r16,r26
	sbc r17,r27
	ldi r18,low(1000)
	ldi r19,high(1000)
	ldi r20,hlow(1000)
	ldi r21,hhigh(1000)
	mov r25,r17
	mov r24,r16
	mov r23,r15
	mov r22,r14
	rcall __udivsi3
	mov r10,r22
	mov r11,r23
	mov r12,r24
	mov r13,r25
	mov r29,r11
	mov r28,r10
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	ldi r22,low(1000)
	ldi r23,high(1000)
	mov r25,r11
	mov r24,r10
	rcall __mulhi3
	clr r26
	clr r27
	sub r14,r24
	sbc r15,r25
	sbc r16,r26
	sbc r17,r27
	ldi r18,low(100)
	ldi r19,high(100)
	ldi r20,hlow(100)
	ldi r21,hhigh(100)
	mov r25,r17
	mov r24,r16
	mov r23,r15
	mov r22,r14
	rcall __udivsi3
	mov r10,r22
	mov r11,r23
	mov r12,r24
	mov r13,r25
	mov r29,r11
	mov r28,r10
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	ldi r22,low(100)
	ldi r23,high(100)
	mov r25,r11
	mov r24,r10
	rcall __mulhi3
	clr r26
	clr r27
	sub r14,r24
	sbc r15,r25
	sbc r16,r26
	sbc r17,r27
	ldi r18,low(10)
	ldi r19,high(10)
	ldi r20,hlow(10)
	ldi r21,hhigh(10)
	mov r25,r17
	mov r24,r16
	mov r23,r15
	mov r22,r14
	rcall __udivsi3
	mov r29,r23
	mov r28,r22
	mov r25,r28
	subi r25,low(-(48))
	rcall _lcd_putch
	mov r24,r28
	mov r25,r29
	ldi r23,low(3)
	lsl r24
	rol r25
	dec r23
	brne __pc_rel__(-4)
	add r24,r28
	adc r25,r29
	add r24,r28
	adc r25,r29
	clr r26
	clr r27
	sub r14,r24
	sbc r15,r25
	sbc r16,r26
	sbc r17,r27
	mov r25,r14
	subi r25,low(-(48))
	rcall _lcd_putch
;epilogue: frame size=0
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	ret
;epilogue end (size=11)
; function print10 size 317 (296)
 ; aligning segment
	seg flash.code.f_lcd_init
public _lcd_init:
;prologue: frame size=0
;prologue end (size=0)
	ldi r25,low(-1)
;#APP
	out 26,r25
;#NOAPP
	ldi r24,low(10000)
	ldi r25,high(10000)
	rcall _lcd_delay
	ldi r25,low(3)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(500)
	ldi r25,high(500)
	rcall _lcd_delay
	ldi r25,low(3)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(100)
	ldi r25,high(100)
	rcall _lcd_delay
	ldi r25,low(3)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(100)
	ldi r25,high(100)
	rcall _lcd_delay
	ldi r25,low(2)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(100)
	ldi r25,high(100)
	rcall _lcd_delay
	ldi r25,low(2)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r25,low(8)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(100)
	ldi r25,high(100)
	rcall _lcd_delay
	clr r25
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r25,low(15)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(100)
	ldi r25,high(100)
	rcall _lcd_delay
	clr r25
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r25,low(6)
;#APP
	out 27,r25
;#NOAPP
	rcall _toggle_E
	ldi r24,low(100)
	ldi r25,high(100)
	rcall _lcd_delay
	rcall _lcd_cls
;epilogue: frame size=0
	ret
;epilogue end (size=1)
; function lcd_init size 69 (68)
 ; aligning segment
	seg eram.gcc_data_section
_hex_I_60:
	dc.b 0x30
	dc.b 0x31
	dc.b 0x32
	dc.b 0x33
	dc.b 0x34
	dc.b 0x35
	dc.b 0x36
	dc.b 0x37
	dc.b 0x38
	dc.b 0x39
	dc.b 0x41
	dc.b 0x42
	dc.b 0x43
	dc.b 0x44
	dc.b 0x45
	dc.b 0x46
	dc.b 0x0
extern ___builtin_next_arg
extern __umodhi3
LC7:
	dc.w (10) & 0xffff
LC8:
	dc.w (10000) & 0xffff
LC9:
	dc.w (16) & 0xffff
	seg flash.code.f_printf
public _printf:
;prologue: frame size=0
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
;prologue end (size=14)
	ldd r10,Y+15
	ldd r11,Y+16
	ldi r23,low(17)
	ldi r24,high(17)
	add r23,r28
	adc r24,r29
	mov r12,r23
	mov r13,r24
	rjmp L96
L72:
	tst r25
	brne __pc_rel__(+1)
	rjmp L95
L97:
	rcall _lcd_putch
L96:
	mov r31,r11
	mov r30,r10
	sec
	adc r10,__zero_reg__
	adc r11,__zero_reg__
	ld r25,Z+
	cpi r25,low(37)
	brne L72
	mov r31,r11
	mov r30,r10
	sec
	adc r10,__zero_reg__
	adc r11,__zero_reg__
	ld r25,Z+
	cpi r25,low(100)
	breq L78
	cpi r25,low(101)
	brge L93
	cpi r25,low(99)
	breq L76
	rjmp L97
L93:
	cpi r25,low(120)
	breq L80
	rjmp L97
L76:
	ldi r23,low(2)
	ldi r24,high(2)
	add r12,r23
	adc r13,r24
	ldi r24,low(-2)
	ldi r25,high(-2)
	add r12,r24
	adc r13,r25
	mov r31,r13
	mov r30,r12
	ld r25,Z
	ldi r23,low(2)
	ldi r24,high(2)
	add r12,r23
	adc r13,r24
	rjmp L97
L78:
	lds r8,LC7
	lds r9,(LC7)+1
	lds r14,LC8
	lds r15,(LC8)+1
	rjmp L79
L80:
	lds r14,LC9
	lds r15,(LC9)+1
	mov r8,r14
	mov r9,r15
L79:
	ldi r30,low(2)
	ldi r31,high(2)
	add r12,r30
	adc r13,r31
	mov r31,r13
	mov r30,r12
	sbiw r30,2
	mov r12,r30
	mov r13,r31
	ld r16,Z
	ldd r17,Z+1
	ldi r23,low(2)
	ldi r24,high(2)
	add r12,r23
	adc r13,r24
	cpi r25,low(100)
	brne L91
	tst r17
	brge L82
	com r16
	com r17
	subi r16,low(-1)
	sbci r17,low(-1)
	ldi r25,low(45)
	rcall _lcd_putch
L82:
	ldi r24,low(2)
	cp r14,r24
	cpc r15,__zero_reg__
	brlo L91
	cp r16,r14
	cpc r17,r15
	brsh L91
L85:
	ldi r22,low(10)
	ldi r23,high(10)
	mov r25,r15
	mov r24,r14
	rcall __udivhi3
	mov r14,r24
	mov r15,r25
	ldi r25,low(2)
	cp r14,r25
	cpc r15,__zero_reg__
	brlo L91
	cp r16,r14
	cpc r17,r15
	brlo L85
L91:
	mov r23,r15
	mov r22,r14
	mov r25,r17
	mov r24,r16
	rcall __udivhi3
	mov r31,r25
	mov r30,r24
	subi r30,low(-(_hex_I_60))
	sbci r31,high(-(_hex_I_60))
	ld r25,Z
	rcall _lcd_putch
	mov r23,r15
	mov r22,r14
	mov r25,r17
	mov r24,r16
	rcall __umodhi3
	mov r16,r24
	mov r17,r25
	mov r23,r9
	mov r22,r8
	mov r25,r15
	mov r24,r14
	rcall __udivhi3
	mov r14,r24
	mov r15,r25
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	brne L91
	rjmp L96
L95:
	clr r24
	clr r25
;epilogue: frame size=0
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	ret
;epilogue end (size=13)
; function printf size 172 (145)
; File 'lcd.c' sizes: code  931 ( 817), prologues  50, epilogues  64
