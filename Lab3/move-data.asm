#ORG 7000H
    MVI C,0A        // Initialise counter to 10
    LXI H,7500      // Initialise HL pair
    LXI D,7600      // Initialise DE pair
LOOP:   MOV A,M     // Move Memory to accumulator
        STAX D      // Store to D indirectly
        INX H       // Increment H
        INX D       // Increment D
        DCR C       // Decrement Counter
        JNZ LOOP    // Loop until counter becomes 0
    RST 1           // STOP
# ORG 7500H
# DB 00H,01H,02H,03H,04H,05H,06H,07H,08H,09H,0AH
