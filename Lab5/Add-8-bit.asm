ORG 0000H
LJMP MAIN ;Jump to main subroutine

ORG 30H
INIT:
    ;Write initialization commands that include storing the two numbers in respective locations and defining Port 1 as output port.
    MOV R0, #40H                ; Setting source address to 40H
    MOV R1, #50H                ; Setting destinatin address to 50H
    CLR C                       ; Clearing carry flag
    MOV P1, #00H                ; Setting up port
    MOV R2, #42H                ; Move 42H address to R2
    MOV R4, #44H                ; Move 44H address to R4
RET

ADDER_8BIT:
    ; Write the addition subroutine
    MOV A, @R0                  ; Take value from source to registor A
    ADD A, @R1                  ; Add the numbers
    JNC SAVE
    ;MOV R4, C                   ; Storing Carry in the memory
    INC R2
SAVE:
    MOV R2, A                  ; Store the sum in R2
RET

NIBBLE_8BIT:
    ;Write the code to extract upper and lower nibbles and to call LED program
    MOV A, R2                  ; Moving R2 to A
    ANL A, #0F0H                 ; Computing Upper nibble
    MOV R5, A                  ; Storing the upper nibble in R5
    MOV A, R2                  ; Moving R2 to A
    ANL A, #0FH                 ; Computing Lower nibble
    MOV R6, A                  ; Storing the lower nibble in R5
RET

LED:
    ;Showing the values on LED
    MOV P1, R5
    ACALL DELAY
    MOV P1, #000H
    ACALL DELAY
    SJMP LED
DELAY:
    MOV R3, #225
DELAY1:
    MOV R7, #255
HERE:
    DJNZ R3, HERE
    DJNZ R2, DELAY1
RET

;------------------------------------ Main subroutine------------------------------------
ORG 0100H
MAIN:
    ACALL INIT
    ACALL ADDER_8BIT ;Adding the two values
    ACALL NIBBLE_8BIT ;Separate the nibbles and Display result on led(sum)
    ACALL LED         ; Show LED
LOOP:
    SJMP LOOP
END
