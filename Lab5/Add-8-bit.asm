ORG 0000H
LJMP MAIN ;Jump to main subroutine

ORG 50H
INIT:
    ;Write initialization commands that include storing the two numbers in respective
locations and defining Port 1 as output port.
RET

ADDER_8BIT:
    ; Write the addition subroutine
RET

NIBBLE_8BIT:
    ;Write the code to extract upper and lower nibbles and to call LED program
RET

LED:
    ;Showing the values on LED
RET

;------------------------------------ Main subroutine------------------------------------
ORG 0100H
MAIN:
    ACALL INIT
    ACALL ADDER_8BIT ;Adding the two values
    ACALL NIBBLE_8BIT ;Separate the nibbles and Display result on led(sum)
LOOP:
    SJMP LOOP
END
