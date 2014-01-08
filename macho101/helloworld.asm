; a minimalist hello-world Mach-O binary
; Ange Albertini, BSD 2013

; from Nicolas Seriot's http://seriot.ch/hello_macho.php

; constants & structs **********************************************************

CPU_TYPE_I386 equ 7

CPU_SUBTYPE_I386_ALL equ 3

MH_MAGIC equ 0FEEDFACEh
MH_EXECUTE equ 2
MH_NOUNDEFS equ 1

struc mach_header
    .magic      resd 1
    .cputype    resd 1
    .cpusubtype resd 1
    .filetype   resd 1
    .ncmds      resd 1
    .sizeofcmds resd 1
    .flags      resd 1
endstruc

LC_SEGMENT equ 1
LC_UNIXTHREAD equ 5

x86_THREAD_STATE_32 equ 1

_x equ 1
_w equ 2
_r equ 4

struc segment_command
    .cmd      resd 1
    .cmdsize  resd 1
    .segname  resb 16
    .vmaddr   resd 1
    .vmsize   resd 1
    .fileoff  resd 1
    .filesize resd 1
    .maxprot  resd 1
    .initprot resd 1
    .nsects   resd 1
    .flags    resd 1
endstruc

struc thread_command
    .cmd resd 1
    .cmdsize resd 1
    .flavor resd 1
    .count resd 1
;    .state ; starts here
endstruc

struc i386_thread_state
    .eax    resd 1
    .ebx    resd 1
    .ecx    resd 1
    .edx    resd 1
    .edi    resd 1
    .esi    resd 1
    .ebp    resd 1
    .esp    resd 1
    .ss     resd 1
    .eflags resd 1
    .eip    resd 1
    .cs     resd 1
    .ds     resd 1
    .es     resd 1
    .fs     resd 1
    .gs     resd 1
endstruc

; header ***********************************************************************
bits 32

istruc mach_header
    at mach_header.magic,       dd MH_MAGIC
    at mach_header.cputype,     dd CPU_TYPE_I386
    at mach_header.cpusubtype,  dd CPU_SUBTYPE_I386_ALL
    at mach_header.filetype,    dd MH_EXECUTE
    at mach_header.ncmds,       dd 2 ; 1 segment command + 1 thread command
    at mach_header.sizeofcmds,  dd SC_SIZE + TC_SIZE
    at mach_header.flags,       dd MH_NOUNDEFS
iend

sc:
istruc segment_command
    at segment_command.cmd,      dd LC_SEGMENT
    at segment_command.cmdsize,  dd SC_SIZE
    at segment_command.segname,  db "__TEXT"
    at segment_command.vmsize,   dd 1000h
    at segment_command.filesize, dd 64
    at segment_command.maxprot,  db _r + _w + _x
    at segment_command.initprot, dd _r + _x
iend
    SC_SIZE equ $ - sc

tc:
istruc thread_command
    at thread_command.cmd,      dd LC_UNIXTHREAD
    at thread_command.cmdsize,  dd TC_SIZE
    at thread_command.flavor,   dd x86_THREAD_STATE_32
    at thread_command.count,    dd STATE_SIZE >> 2
iend

state:
istruc i386_thread_state
    at i386_thread_state.eip, dd entrypoint
iend
    STATE_SIZE equ $ - state

    TC_SIZE equ $ - tc

; EntryPoint code **************************************************************

STDOUT equ 1

SC_EXIT equ 1
SC_WRITE equ 4h

entrypoint:
    push MSG_SIZE
    push msg
    push STDOUT
    mov al, SC_WRITE
    sub esp, 1 * 4
    int 80h

    add esp, 4 * 4
    push 0
    mov al, SC_EXIT
    sub esp, 4
    int 80h

; data *************************************************************************

msg db 'Hello world', 0ah
    MSG_SIZE equ $ - msg
