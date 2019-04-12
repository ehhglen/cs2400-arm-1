		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
numbers	DCD		0b1100101010010001, 0b1111010101000011
result	FILL		4
carry	FILL		4

ADR		R0, numbers
		ADR		R7, result
		ADR		R8, carry
		LDR		R1,[R0]
		LDR		R2,[R0,#4]
		MOV		R5, #16
		MOV		R3, #1
		MOV		R6, #0
		
loop
		AND		R4,R3,R2
		SUBS		R4,R4,R3
		ADDPL		R6,R6,R1
		LSR		R2,R2,#1
		LSL 		R1,R1,#1
		SUBS 		R5,R5,#1
		BNE		loop
		STR 		R6, [R7]
		end
		
numbers	DCD		0b1100101010010001, 0b1111010101000011
result	FILL		4
carry	FILL		4
