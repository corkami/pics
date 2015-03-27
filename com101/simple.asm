; a simple hello world .COM

; compile with: yasm -o simple.com simple.asm

; Ange Albertini, BSD Licence, 2013

org 100h ; standard loaded address
bits 16 ; ouch :p

DISPLAY_STRING equ 9h
TERMINATE_WITH_RETURN_CODE equ 4ch

MAIN_DOS_API equ 21h

    ; in a .COM file, DATA is with mixed with CODE
    ; not strictly required, as by default, ds=cs on initialization, but safer
    push cs  ; = mov ds, cs
    pop  ds

    ; print("Hello World!\r\n\r")
    mov  dx, msg
    mov  ah, DISPLAY_STRING
    int  MAIN_DOS_API

    ; return 1;
    ERRORCODE equ 1
    mov  ax, (TERMINATE_WITH_RETURN_CODE << 8) | ERRORCODE
    int  MAIN_DOS_API

msg db 'Hello World!', 0dh, 0dh, 0ah, '$' ; DOS string are $-terminated
