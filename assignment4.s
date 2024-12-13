.section .data
array: .byte 1, 2, 3, 4, 5, 0

.section .text
.global _start

_start:

        LDR R0, =array
        LDR R1, =array
        LDR R2, =reversed
        LDR R3, sp

push_loop:
        LDRB R4, [R0], #1
        CMP R4, #0
        BEQ pop_elements @ if equal to 0, pop
        PUSH {R0} @ push the byte
        BAL loop @ loop for next byte
		
pop_elements:
        CMP sp, R3
        BLE done @ if it's the end of the stack, end
        POP {R3} @ pop top byte
        LDRB R2, [R3], #1 @ store byte in array and increment
        BAL loop @ loop

done:
        SWI 0 @ output
        MOV r3, #11 @end
	