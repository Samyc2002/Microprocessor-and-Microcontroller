#ORG 7000H
START:  LXI H,7500H
        MVI D,00H
        MOV C,M
        DCR C
        INX H

CHECK:  MOV A,M
        INX H
        CMP M
        JC NEXTBYTE
        JZ NEXTBYTE
        MOV B,M
        MOV M,A
        DCX H
        MOV M,B
        INX H
        MVI D,01H

NEXTBYTE:   DCR C
            JNZ CHECK
            MOV A,D
            CPI 01H
            JZ START

    RST 1
# ORG 7500H
# DB 08H,04H,1AH,AAH,12H,45H,A9H,01H,FFH
