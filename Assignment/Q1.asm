# ORG 0200H
	   MVI C,05	    ;for taking 5 numbers
	   MVI B,05     ;Counter
	   MVI D,00	    ;storing quotient
	   LXI H,0060	  ;taking value from 0060H
	   MOV E,M      ;reading from memory

LOOP1:	MOV A,E   ;move data to accumulator for further addition
        INX H     ;increment the pointer to load data
        ADD M     ;add memory to accumulator
        MOV E,A   ;move the sum to E to store it
        DCR B     ;decrement the counter
        MOV A,B   ;move the counter to accumulator to determine if the loop should keep running
        JNZ LOOP1 ;if the counter is not zero, keep the loop running
        MOV A,E   ;move the total sum to accumulator for further operations
        JZ LOOP2  ;jump to Loop 2 if counter goes to zero

LOOP2:	CMP C     ;compare with C to find the average
        JC LOOP3  ;store the answer if the value goes to zero
        SUB C     ;subtract to get the average
        INR D     ;increase the count
        JMP LOOP2 ;loop back

LOOP3:	INX H
        MOV A,D
        STA 2500
        HLT
# ORG 0060H
# DB 10H,15H,20H,25H,06H
