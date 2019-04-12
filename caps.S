		;		ARM Programming Assignment #1: Capitalizer
		;
		;		Write a program that goes through the characters in chars,
		;		and Capitalizes every lower-case letter that it finds..
		;		Write the number of capitalizations the program performed
		;		In the caps "fill" memory provided.
		
		;		Your code here
		
chars	DCD		'a', 'B', '5', 'q', '0', 'O', '1', 's', 'b', 'i', 'G'
caps	FILL		4


main
		mov		r1, #0		; counter for end of array
		adr		r2, chars		; get address for chars
loop		ldr		r3, [r2]		; load r3 with value for char
		mov		r4, #123		; load upper bound for ascii values in lower case chars
		cmp		r3, r4		; compare to see if the char is up to "z"
		blt		capt			; branch if char in r3 is less then "z"
back		mov		r4, #4
		add		r1, r1, r4	; add 4 to incrementer
		add		r2, r2, r4	; add 4 to address for next char
		adr		r4, size		; get address for size of array
		ldr		r4, [r4]		; load the size into r4
		cmp		r1, r4		; compare the incrementer to size of array
		blt		loop			; loop back if there is another char in the array
		end
capt
		mov		r4, #97		; load the lower limit for chars "a"
		cmp		r3, r4		; compare to see if the char less then "a"
		blt		back			; if char is not a lower case letter branch back to main
		mov		r4, #32
		sub		r3, r3, r4    	; change the char to uppercase
		str		r3, [r2]		; store the new char to memory
		adr		r0, caps		; load address to caps counter
		ldr		r5, [r0]		; get value stored for caps counter
		mov		r4, #1
		add		r5, r5, r4	; increment counter
		str		r5, [r0]		; put updated counter back in memory
		b		back	
