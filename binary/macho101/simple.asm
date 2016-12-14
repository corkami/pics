; a simple Hello-World Mach-O

; Ange Albertini, BSD Licence 2013

BITS 32

%include 'macho.inc'

istruc mach_header
    at mach_header.magic,       dd MH_MAGIC
    at mach_header.cputype,     dd CPU_TYPE_I386
    at mach_header.cpusubtype,  dd CPU_SUBTYPE_I386_ALL
    at mach_header.filetype,    dd MH_EXECUTE
    at mach_header.ncmds,       dd 2 ; segment, thread
    at mach_header.sizeofcmds,  dd CMD_SIZE
    at mach_header.flags,       dd MH_NOUNDEFS
iend

commands:

textsc:
istruc segment_command
    at segment_command.cmd,      dd LC_SEGMENT
    at segment_command.cmdsize,  dd TEXTSC_SIZE
    at segment_command.segname,  db "__TEXT"
    at segment_command.vmaddr,   dd 0
    at segment_command.vmsize,   dd FILESIZE
    at segment_command.fileoff,  dd 0
    at segment_command.filesize, dd FILESIZE
    at segment_command.maxprot,  dd VM_PROT_READ + VM_PROT_WRITE + VM_PROT_EXECUTE
    at segment_command.initprot, dd VM_PROT_READ + VM_PROT_EXECUTE
    at segment_command.nsects,   dd 2 ; text, cstring
iend

istruc section_
    at section_.sectname, db "__text"
    at section_.segname,  db "__TEXT"
    at section_.addr,     dd text
    at section_.size,     dd TEXT_SIZE
    at section_.offset,   dd text
    at section_.align,    dd 4
iend
istruc section_
    at section_.sectname, db "__cstring"
    at section_.segname,  db "__TEXT"
    at section_.addr,     dd data
    at section_.size,     dd DATA_SIZE
    at section_.offset,   dd data
    at section_.align,    dd 4
iend
TEXTSC_SIZE equ $ - textsc

tc:
istruc thread_command
    at thread_command.cmd,     dd LC_UNIXTHREAD
    at thread_command.cmdsize, dd TC_SIZE
    at thread_command.flavor,  dd x86_THREAD_STATE_32
    at thread_command.count,   dd i386_thread_state_size >> 2
iend

istruc i386_thread_state
    at i386_thread_state.eip, dd text
iend

TC_SIZE equ $ - tc

CMD_SIZE equ $ - commands

align 16, db 0

;******************************************************************************

text:
    push MSG_LEN
    push msg
    push STDOUT_FILENO
    mov  eax, SC_WRITE
    sub  esp, 4
    int  80h

    add  esp, 4 * 4 ; clearing arguments

    push 0 ; exit value
    mov  eax, SC_EXIT
    sub  esp, 4
    int  80h

TEXT_SIZE equ $ - text

align 16, db 0

;******************************************************************************

data:

msg db 'Hello World!', 0ah
    MSG_LEN equ $ - msg

DATA_SIZE equ $ - data

FILESIZE equ $
