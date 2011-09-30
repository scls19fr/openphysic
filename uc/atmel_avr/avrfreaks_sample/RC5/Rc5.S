#include <avr/io.h>
#include <avr/signal.h>

#define RC5IN			0				// PA0

#define	__tmp_reg__		r0				// Temp register
#define __zero_reg__	r1  			// Zero register 

#define	lreg			r26				// Used by timer overflow interrupt
#define	hreg			r27

#define	temp			r18
#define	bitcnt			r19
#define	system			r20
#define	command			r21
#define	ref1			r22
#define	ref2			r23

	.data
timer:	.ds 2							// Timer 0 overflow count

	.text
	.global SIG_OVERFLOW0
SIG_OVERFLOW0:
	push	lreg
    push	hreg
    in		hreg, _SFR_IO_ADDR(SREG)
    push	hreg
    
	lds		lreg, timer + 0				// Updated every 32us
	lds		hreg, timer + 1				// Updated every 8192us
	adiw	lreg, 1

	sts		timer + 0, lreg
	sts		timer + 1, hreg

SIG_OVERFLOW0_exit:	
	pop		hreg
	out		_SFR_IO_ADDR(SREG), hreg
	pop		hreg
	pop		lreg
	
	reti

/****************************************************************/
/* "GetRC5" - RC5 decode routine								*/
/*																*/
/* This subroutine decodes the RC5 bit stream applied on PORTA	*/
/* pin "RC5IN". 												*/
/*																*/
/* If success: The command and system address are				*/
/*		returned in "command" and "system".						*/
/*		Bit 6 of "command" holds the toggle bit.				*/
/*																*/
/* Crystal frequency is 8MHz									*/
/****************************************************************/

	.global GetRC5
GetRC5:	
	ldi		temp, 1						// Timer/Counter 0 clocked at CK
	out		_SFR_IO_ADDR(TCCR0), temp

	in		temp, _SFR_IO_ADDR(TIMSK)	// Enable Timer0 overflow interrupt
	ori		temp, (1<<TOIE0)					
	out		_SFR_IO_ADDR(TIMSK), temp
	
	ldi		r30, lo8(timer)
	ldi		r31, hi8(timer)

	std		Z + 1, __zero_reg__			// Clear timerH

L1:	
	st		Z, __zero_reg__				// Clear timerL

L2:	
	ldd		temp, Z + 1
	cpi		temp, 16					// If line not idle within 131ms
	brlo	dl1
	rjmp	fault						// then exit

dl1:
	ld		temp, Z
	cpi		temp, 110					// If line low for 3.5ms
	brge	start1						// then wait for start bit

	sbis	_SFR_IO_ADDR(PINA), RC5IN	// If line is
	rjmp	L1							// low  - jump to L1
	rjmp	L2							// high - jump to L2


start1:		
	ldd		temp, Z + 1
	cpi		temp,16						// If no start bit detected
	brge	fault						// within 130ms then exit

	sbic	_SFR_IO_ADDR(PINA), RC5IN	// Wait for start bit
	rjmp	start1

	st		Z, __zero_reg__				// Measure length of start bit

start2:
	ld		temp, Z
	cpi		temp, 34					// If startbit longer than 1.1ms,
	brge	fault						// exit

	sbis	_SFR_IO_ADDR(PINA), RC5IN
	rjmp	start2

/* Positive edge of 1st start bit */

	ld		temp, Z						// timer is 1/2 bit time
	st		Z, __zero_reg__

	mov		ref1, temp
	lsr		ref1
	mov		ref2, ref1
	add		ref1, temp					// ref1 = 3/4 bit time
	lsl		temp
	add		ref2, temp					// ref2 = 5/4 bit time


start3:
	ld		temp, Z		
	cp		temp, ref1					// If high periode St2 > 3/4 bit time
	brge	fault						// exit */

	sbic	_SFR_IO_ADDR(PINA), RC5IN	// Wait for falling edge start bit 2
	rjmp	start3

	st		Z, __zero_reg__ 
	ldi		bitcnt,12					// Receive 12 bits
	clr		command
	clr		system


sample:
	ld		temp, Z
	cp		temp, ref1					// Sample INPUT at 1/4 bit time
	brlo	sample
	sbic	_SFR_IO_ADDR(PINA), RC5IN
	rjmp	bit_is_a_1					// Jump if line high


bit_is_a_0:	
	clc									// Store a '0'
	rol	command
	rol	system

/* Synchronize timing */

bit_is_a_0a:	
	ld		temp, Z
	cp		temp, ref2					// If no edge within 3/4 bit time
	brge	fault						// exit
	sbis	_SFR_IO_ADDR(PINA),RC5IN	// Wait for rising edge
	rjmp	bit_is_a_0a					// in the middle of the bit

	st		Z, __zero_reg__
	rjmp	nextbit

bit_is_a_1:	
	sec									// Store a '1'
	rol		command
	rol		system

/* Synchronize timing */

bit_is_a_1a:	
	ld		temp, Z
	cp		temp, ref2					// If no edge within 3/4 bit time 
	brge	fault						// exit 							
	sbic	_SFR_IO_ADDR(PINA), RC5IN	// Wait for falling edge 			
	rjmp	bit_is_a_1a					// in the middle of the bit 		

	st		Z, __zero_reg__

nextbit:	
	dec		bitcnt						// If bitcnt > 0
	brne	sample						// get next bit
	rjmp	done

fault:		
	clr		r24
	clr     r25
	rjmp	exit

/* All bits sucessfully received */

done:
	mov		temp,command				// Place system bits in "system"
	rol		temp
	rol		system
	rol		temp
	rol		system
	
	bst		system,5					// Move toggle bit
	bld		command,6					// to "command"

/* Clear remaining bits */

	andi	command, 0x7F
	andi	system, 0x1F
	
	mov		r30, r24					// Z register points to struct RC5
	mov		r31, r25

	std		Z + 0, system
	std		Z + 1, command
	clr		r24
	ldi		r25, 0x80

exit:
	ldi		temp, 0						// Stop Timer/Counter 0
	out		_SFR_IO_ADDR(TCCR0), temp

	in		temp, _SFR_IO_ADDR(TIMSK)	// Disable Timer0 overflow interrupt
	andi	temp, ~(1<<TOIE0)					
	out		_SFR_IO_ADDR(TIMSK), temp
	
	ret
