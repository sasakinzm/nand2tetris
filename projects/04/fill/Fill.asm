// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(START)
    // read keyboard
    @24576
    D=M

    // if keyboard pushed then goto ON
    // else goto OFF
    @ON
    D;JGT
    @OFF
    D;JEQ

(ON)
    // set Mem[COLOR] to black
    @COLOR
    M=-1
    // goto DRAW
    @DRAW
    0;JMP

(OFF)
    // set Mem[COLOR] to white
    @COLOR
    M=0
    // goto DRAW
    @DRAW
    0;JMP

(DRAW)
    // set Mem[COUNT] == 8192
    @8192
    D=A
    @COUNT
    M=D

    // set Mem[NOW] == 16384
    // NOW indicates the pixel that is currently being painted.
    @SCREEN
    D=A
    @NOW
    M=D

    // start drawing loop
(LOOP)
    // set color
    @COLOR
    D=M
    // paint pixel
    @NOW
    A=M
    M=D
    // slide NOW to next pixel
    @NOW
    M=M+1
    // reduce counter
    @COUNT
    M=M-1
    // if D > 0 then goto loop
    // elif D == 0 then goto START
    D=M
    @LOOP
    D;JGT
    @START
    D;JEQ








