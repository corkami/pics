; <mach-o/loader.h> unless mentioned

; <mach/machine.h>
CPU_ARCH_ABI64  equ 001000000h
;CPU_ARCH_MASK   equ 0ff000000h

CPU_TYPE_X86    equ        7
CPU_TYPE_I386   equ CPU_TYPE_X86
CPU_TYPE_X86_64 equ CPU_TYPE_X86 | CPU_ARCH_ABI64

CPU_SUBTYPE_I386_ALL equ         3
CPU_SUBTYPE_LIB64    equ 080000000h

MH_MAGIC equ    0FEEDFACEh
MH_MAGIC_64 equ 0FEEDFACFh

MH_NOUNDEFS equ 1
MH_EXECUTE  equ 2

struc mach_header
    .magic      resd 1
    .cputype    resd 1
    .cpusubtype resd 1
    .filetype   resd 1
    .ncmds      resd 1
    .sizeofcmds resd 1
    .flags      resd 1
endstruc

struc mach_header64
    .magic      resd 1
    .cputype    resd 1
    .cpusubtype resd 1
    .filetype   resd 1
    .ncmds      resd 1
    .sizeofcmds resd 1
    .flags      resd 1
    .reserved   resd 1
endstruc

LC_SEGMENT        equ         1
LC_SYMTAB         equ         2
LC_UNIXTHREAD     equ         5
LC_LOAD_DYLIB     equ        0ch
LC_LOAD_DYLINKER  equ        0eh
LC_SEGMENT_64     equ        19h
LC_REQ_DYLD       equ 080000000h
;imageloader.h
LC_MAIN           equ 028h | LC_REQ_DYLD


x86_THREAD_STATE_32 equ 1
x86_THREAD_STATE_64 equ 4

VM_PROT_READ    equ 1
VM_PROT_WRITE   equ 2
VM_PROT_EXECUTE equ 4

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

struc segment_command64
    .cmd      resd 1
    .cmdsize  resd 1
    .segname  resb 16
    .vmaddr   resq 1
    .vmsize   resq 1
    .fileoff  resq 1
    .filesize resq 1
    .maxprot  resd 1
    .initprot resd 1
    .nsects   resd 1
    .flags    resd 1
endstruc

struc section_
    .sectname  resb 16
    .segname   resb 16
    .addr      resd 1
    .size      resd 1
    .offset    resd 1
    .align     resd 1
    .reloff    resd 1
    .nreloc    resd 1
    .flags     resd 1
    .reserved1 resd 1
    .reserved2 resd 1
endstruc

struc section_64
    .sectname  resb 16
    .segname   resb 16
    .addr      resq 1
    .size      resq 1
    .offset    resd 1
    .align     resd 1
    .reloff    resd 1
    .nreloc    resd 1
    .flags     resd 1
    .reserved1 resd 1
    .reserved2 resd 1
    .reserved3 resd 1
endstruc

struc thread_command
    .cmd     resd 1
    .cmdsize resd 1
    .flavor  resd 1
    .count   resd 1
;   .state ; starts here
endstruc

struc symtab_command
    .cmd     resd 1
    .cmdsize resd 1
    .symoff  resd 1
    .nsyms   resd 1
    .stroff  resd 1
    .strsize resd 1
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

STDOUT_FILENO equ 1

SC_EXIT equ 1
SC_WRITE equ 4h

struc entry_point_command
    .cmd       resd 1
    .cmdsize   resd 1
    .entryoff  resq 1
    .stacksize resq 1
endstruc

struc dylinker_command
    .cmd     resd 1
    .cmdsize resd 1
    .name    resd 1
endstruc

struc dylib_command
    .cmd                   resd 1
    .cmdsize               resd 1
    .name                  resd 1
    .timestamp             resd 1
    .current_version       resd 1
    .compatibility_version resd 1
endstruc

;<syscall_sw.h>
SYSCALL_CLASS_UNIX  equ 2
SYSCALL_CLASS_SHIFT equ 24
SYSCALL_CLASS_MASK  equ (0FFh << SYSCALL_CLASS_SHIFT)
SYSCALL_NUMBER_MASK equ (~SYSCALL_CLASS_MASK)
