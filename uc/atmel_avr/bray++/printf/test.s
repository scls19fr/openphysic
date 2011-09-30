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
	seg flash.code.f_delay
public _delay:
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
	cpi r21,low(100)
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
; function delay size 15 (14)
extern _lcd_init
extern _lcd_control
extern _printf
 ; aligning segment
	seg eram.gcc_data_section
LC0:
	dc.b 0x20
	dc.b 0x48
	dc.b 0x65
	dc.b 0x6c
	dc.b 0x6c
	dc.b 0x6f
	dc.b 0x20
	dc.b 0x66
	dc.b 0x72
	dc.b 0x6f
	dc.b 0x6d
	dc.b 0x20
	dc.b 0x41
	dc.b 0x56
	dc.b 0x52
	dc.b 0x20
	dc.b 0x0
extern _lcd_goto
LC1:
	dc.b 0x54
	dc.b 0x65
	dc.b 0x6d
	dc.b 0x70
	dc.b 0x3d
	dc.b 0x25
	dc.b 0x64
	dc.b 0x25
	dc.b 0x63
	dc.b 0x43
	dc.b 0x20
	dc.b 0x25
	dc.b 0x78
	dc.b 0x0
	seg flash.code.f_main
public _main:
;prologue: frame size=0
	ldi r28,low (0x25f - 0)
	ldi r29,high (0x25f - 0)
	out __SP_L__,r28
	out __SP_H__,r29
;prologue end (size=4)
	ldi r28,low(-32)
	ldi r29,high(-32)
	rcall _lcd_init
	clr r23
	mov r24,r23
	ldi r25,low(1)
	rcall _lcd_control
	ldi r24,low(LC0)
	ldi r25,high(LC0)
	push r25
	push r24
	rcall _printf
	ldi r25,low(64)
	rcall _lcd_goto
	ldi r24,low(170)
	ldi r25,high(170)
	push r25
	push r24
	ldi r24,low(223)
	ldi r25,high(223)
	push r25
	push r24
	push r29
	push r28
	ldi r24,low(LC1)
	ldi r25,high(LC1)
	push r25
	push r24
	rcall _printf
L30:
	rjmp L30
;epilogue: frame size=0
__stop_progIi__:
	rjmp __stop_progIi__
;epilogue end (size=1)
; function main size 35 (30)
; File 'test.c' sizes: code   50 (  44), prologues   4, epilogues   2
