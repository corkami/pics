; a simple Hello-World Mach-O
; 64 bits and Mountain Lion (LC_MAIN) format

; Ange Albertini, BSD Licence 2013

BITS 64

%include 'macho.inc'

;###############################################################################

istruc mach_header64
    at mach_header64.magic,      dd MH_MAGIC_64
    at mach_header64.cputype,    dd CPU_TYPE_X86_64
    at mach_header64.cpusubtype, dd CPU_SUBTYPE_I386_ALL | CPU_SUBTYPE_LIB64
    at mach_header64.filetype,   dd MH_EXECUTE
    at mach_header64.ncmds,      dd 4 ; segment, entry_point, dylinker, dylib
    at mach_header64.sizeofcmds, dd CMD_SIZE
    at mach_header64.flags,      dd MH_NOUNDEFS
iend


load_commands:
istruc segment_command64
    at segment_command64.cmd,      dd LC_SEGMENT_64
    at segment_command64.cmdsize,  dd segment_command64_size
    at segment_command64.vmsize,   dq 0x1000 ; rounded up
    at segment_command64.filesize, dq FILE_SIZE
    at segment_command64.maxprot,  dd VM_PROT_READ | VM_PROT_WRITE | VM_PROT_EXECUTE
    at segment_command64.initprot, dd VM_PROT_READ | VM_PROT_WRITE | VM_PROT_EXECUTE
iend


istruc entry_point_command
    at entry_point_command.cmd,      dd LC_MAIN
    at entry_point_command.cmdsize,  dd entry_point_command_size
    at entry_point_command.entryoff, dd start
iend


dylinker
istruc dylinker_command
    at dylinker_command.cmd,     dd LC_LOAD_DYLINKER
    at dylinker_command.cmdsize, dd DYLINKER_SIZE
    at dylinker_command.name,    dd dylinker_name - dylinker
iend
dylinker_name db '/usr/lib/dyld'
        align 4, db 0
    DYLINKER_SIZE equ $ - dylinker


dylib:
istruc dylib_command
    at dylib_command.cmd,     dd LC_LOAD_DYLIB
    at dylib_command.cmdsize, dd DYLIB_SIZE
    at dylib_command.name,    dd dylib_name - dylib
iend
dylib_name db '/usr/lib/libSystem.B.dylib'
        align 4, db 0
    DYLIB_SIZE equ $ - dylib


    CMD_SIZE equ $ - load_commands

align 16, db 0

;###############################################################################

start:
    mov rdx, MSG_LEN
    mov rsi, msg
    mov rdi, STDOUT_FILENO
    mov rax, ((SYSCALL_CLASS_UNIX << SYSCALL_CLASS_SHIFT) | (SYSCALL_NUMBER_MASK & (SC_WRITE)))
    syscall

    mov rdi, 0
    mov rax, ((SYSCALL_CLASS_UNIX << SYSCALL_CLASS_SHIFT) | (SYSCALL_NUMBER_MASK & (SC_EXIT)))
    syscall

align 16, db 0

;###############################################################################

msg db 'Hello World!', 0ah
    MSG_LEN EQU $ - msg

;###############################################################################

	FILE_SIZE	EQU	$ - $$
