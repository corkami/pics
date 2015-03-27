; a simple Java "Hello World" CLASS in assembly

; build with:
; yasm -o simple.class simple_class.asm

; Ange Albertini, BSD Licence 2012-2013

;*******************************************************************************
; macros

%macro GETSTATIC 1
    db 0b2h
        _dw %1
%endmacro

%macro LDC 1
    db 012h
        db %1
%endmacro

%macro INVOKEVIRTUAL 1
    db 0b6h
        _dw %1
%endmacro

%macro RETURN 0
        db 0b1h
%endmacro

%macro _dd 1
    db (%1 >> 8 * 3) & 0ffh
    db (%1 >> 8 * 2) & 0ffh
    db (%1 >> 8 * 1) & 0ffh
    db (%1 >> 8 * 0) & 0ffh
%endmacro

%macro _dw 1
    db (%1 >> 8 * 1) & 0ffh
    db (%1 >> 8 * 0) & 0ffh
%endmacro

%macro lbuffer 1
_dw %%end - 1 -$
    db %1
%%end:
%endmacro

%macro utf8 1
    db 1
        lbuffer %1
%endmacro

%macro nat 2
    db 0ch
        _dw %1
        _dw %2
%endmacro

%macro string 1
    db 8
        _dw %1
%endmacro

%macro classref 1
    db 7
        _dw %1
%endmacro

%macro fieldref 2
    db 9
        _dw %1
        _dw %2
%endmacro

%macro metref 2
    db 0ah
        _dw %1
        _dw %2
%endmacro

ACC_PUBLIC equ 1
ACC_STATIC equ 8

;*******************************************************************************
; header

_dd 0CAFEBABEh ; signature
_dw 3          ; major version
_dw 2dh        ; minor version

;*******************************************************************************
; constant pool
_dw 22        ;constant pool count

 ;<always empty>                       ; 00
  classref 2                           ; 01
      utf8 'simple'                    ; 02

  classref 4                           ; 03
      utf8 'java/lang/Object'          ; 04

  utf8 'main'                          ; 05

  utf8 'Code'                          ; 06

  fieldref 8, 10                       ; 07
      classref 9                       ; 08
          utf8 'java/lang/System'      ; 09
      nat 11, 12                       ; 10
          utf8 'out'                   ; 11
          utf8 'Ljava/io/PrintStream;' ; 12

  string 14                            ; 13
   utf8 'Hello World!'                 ; 14

  metref 16, 18                        ; 15
      classref 17                      ; 16
          utf8 'java/io/PrintStream'   ; 17
      nat 19, 20                       ; 18
          utf8 'println'               ; 19
          utf8 '(Ljava/lang/String;)V' ; 20

  utf8 '([Ljava/lang/String;)V'        ; 21

_dw ACC_PUBLIC  ;access_flag

_dw 1 ;this class
_dw 3 ;super class

_dw 0 ; interfaces_count
; no interfaces

_dw 0 ; fields_count
; no fields

_dw 1 ; methods_count
    _dw ACC_PUBLIC + ACC_STATIC
    _dw 5  ; methodname: 'main'
    _dw 21 ; return type: ([Ljava/lang/String;)V
    _dw 1  ; attribute_count
        _dw 6   ; attributename: Code
        _dd 15h ; length
            _dw 2 ; maxlocals
            _dw 1 ; maxstack
            _dd 9 ; length of bytecode
                GETSTATIC 7
                LDC 13
                INVOKEVIRTUAL 15
                RETURN
            _dw 0 ; exceptions_count
            _dw 0 ; attributes_count

_dw 0 ;attributes_count
; no attributes
