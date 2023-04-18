; Calculating the factorial
; Author: Jocelyn Martinez
; Date: April, 2023
.586
.MODEL FLAT

INCLUDE io.h ; header file for input/output

.STACK  4096             ; reserve 4096-byte stack

.DATA                              ; reserve storage for data
    number      DWORD    ?
    factorial   QWORD    1         ; initialize the factorial to 1
    xxx         QWORD    0         ; end of factorial string
    input_msg   BYTE                "Please enter a number: ", 0
    output_msg  BYTE                "The factorial is: ", 0
    output_str BYTE 40 DUP (?)     ; reserve storage for output string

.CODE                              ; start of main program code
_MainProc    PROC
    input input_msg, number, 40    ; prompt user for input
    atod  number                   ; convert input to integer
    mov   number, eax
    mov   eax, 1

factorial_loop:                    ; Compute factorial the number the user input
        imul eax, number           ; Multiplying eax by the number the user input down to 1.
        dec  number                ; Decrementing number
        cmp  number, 0             ; Comparing number to 0
        jg   factorial_loop        ; While number is greater than 0, continue looping.

    dtoa factorial, eax            ; Converting decimal to ascii

    output output_msg, factorial   ; Output factorial.
    mov     eax, 0                 ; exit with return code 0
    ret
_MainProc    ENDP

END                                ; end of source code
