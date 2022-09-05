org 0H
ljmp main
org 100H

main:
    mov P1, #0F0H
    acall delay
    mov P1, #000H
    acall edlay
    sjmp main

delay:
    mov R2, #255

delay1:
    mov R1, #255

here:
    djnz R1, here
    djnz R2, delay1

ret
end
