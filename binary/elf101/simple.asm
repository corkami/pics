; a simple "Hello World!" ELF

; compile with yasm -o simple.elf simple.asm
; SHA-1 67259687b87b749b13fd59b0344a5890ebcadc3b

; Ange Albertini, BSD Licence 2013

BITS 32

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Constants and structures
ELFCLASS32 equ 1

ELFDATA2LSB equ 1

EV_CURRENT equ 1

EI_NIDENT equ 16

ET_EXEC equ 2

EM_386 equ 3

struc Elf32_Ehdr
    .e_ident     resb EI_NIDENT
    .e_type      resw 1
    .e_machine   resw 1
    .e_version   resd 1
    .e_entry     resd 1
    .e_phoff     resd 1
    .e_shoff     resd 1
    .e_flags     resd 1
    .e_ehsize    resw 1
    .e_phentsize resw 1
    .e_phnum     resw 1
    .e_shentsize resw 1
    .e_shnum     resw 1
    .e_shstrndx  resw 1
endstruc

PT_LOAD equ 1

PF_X equ 1
PF_W equ 2
PF_R equ 4

struc Elf32_Phdr
    .p_type   resd 1
    .p_offset resd 1
    .p_vaddr  resd 1
    .p_paddr  resd 1
    .p_filesz resd 1
    .p_memsz  resd 1
    .p_flags  resd 1
    .p_align  resd 1
endstruc

SHT_NULL equ 0
SHT_PROGBITS equ 1
SHT_STRTAB equ 3

SHF_ALLOC equ 2
SHF_EXECINSTR equ 4

struc Elf32_Shdr
    .sh_name      resd 1
    .sh_type      resd 1
    .sh_flags     resd 1
    .sh_addr      resd 1
    .sh_offset    resd 1
    .sh_size      resd 1
    .sh_link      resd 1
    .sh_info      resd 1
    .sh_addralign resd 1
    .sh_entsize   resd 1
endstruc

SC_EXIT equ 1
SC_WRITE equ 4

STDOUT equ 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ELFBASE equ 08000000h

org ELFBASE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ELF Header

segment_start:

ehdr:
istruc Elf32_Ehdr
    at Elf32_Ehdr.e_ident
        EI_MAG     db 07Fh, "ELF"
        EI_CLASS   db ELFCLASS32
        EI_DATA    db ELFDATA2LSB
        EI_VERSION db EV_CURRENT
    at Elf32_Ehdr.e_type,      dw ET_EXEC
    at Elf32_Ehdr.e_machine,   dw EM_386
    at Elf32_Ehdr.e_version,   dd EV_CURRENT
    at Elf32_Ehdr.e_entry,     dd entry
    at Elf32_Ehdr.e_phoff,     dd phdr - ehdr
    at Elf32_Ehdr.e_shoff,     dd shdr - ehdr
    at Elf32_Ehdr.e_ehsize,    dw Elf32_Ehdr_size
    at Elf32_Ehdr.e_phentsize, dw Elf32_Phdr_size
    at Elf32_Ehdr.e_phnum,     dw PHNUM
    at Elf32_Ehdr.e_shentsize, dw Elf32_Shdr_size
    at Elf32_Ehdr.e_shnum,     dw SHNUM
    at Elf32_Ehdr.e_shstrndx,  dw SHSTRNDX
iend
align 16, db 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Program header table

phdr:
istruc Elf32_Phdr
    at Elf32_Phdr.p_type,   dd PT_LOAD
    at Elf32_Phdr.p_offset, dd segment_start - ehdr
    at Elf32_Phdr.p_vaddr,  dd ELFBASE
    at Elf32_Phdr.p_paddr,  dd ELFBASE
    at Elf32_Phdr.p_filesz, dd SEGMENT_SIZE
    at Elf32_Phdr.p_memsz,  dd SEGMENT_SIZE
    at Elf32_Phdr.p_flags,  dd PF_R + PF_X
iend
PHNUM equ ($ - phdr) / Elf32_Phdr_size

align 16, db 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; .text section (code)

text:
entry:
    mov ecx, msg
    mov edx, MSG_LEN
    mov ebx, STDOUT

    mov eax, SC_WRITE
    int 80h


    mov ebx, 1 ; return code

    mov eax, SC_EXIT
    int 80h

TEXT_SIZE equ $ - text

align 16, db 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; .rodata section (read-only data)

rodata:

msg:
    db "Hello World!", 0ah
    MSG_LEN equ $ - msg

RODATA_SIZE equ $ - rodata

align 16, db 0

SEGMENT_SIZE equ $ - segment_start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; .shtstrtab section (section names)

names:
anullstr  db 0
ashstrtab db ".shstrtab", 0
atext     db ".text", 0
arodata   db ".rodata", 0
NAMES_SIZE equ $ - names

align 16, db 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Section header table (optional)

shdr:

; section 0, always null
istruc Elf32_Shdr
    at Elf32_Shdr.sh_name,      dd anullstr - names
    at Elf32_Shdr.sh_type,      dd SHT_NULL
iend

istruc Elf32_Shdr
    at Elf32_Shdr.sh_name,      dd atext - names
    at Elf32_Shdr.sh_type,      dd SHT_PROGBITS
    at Elf32_Shdr.sh_flags,     dd SHF_ALLOC + SHF_EXECINSTR
    at Elf32_Shdr.sh_addr,      dd text
    at Elf32_Shdr.sh_offset,    dd text - ehdr
    at Elf32_Shdr.sh_size,      dd TEXT_SIZE
iend

istruc Elf32_Shdr
    at Elf32_Shdr.sh_name,      dd arodata - names
    at Elf32_Shdr.sh_type,      dd SHT_PROGBITS
    at Elf32_Shdr.sh_flags,     dd SHF_ALLOC
    at Elf32_Shdr.sh_addr,      dd rodata
    at Elf32_Shdr.sh_offset,    dd rodata - ehdr
    at Elf32_Shdr.sh_size,      dd RODATA_SIZE
iend

SHSTRNDX equ ($ - shdr) / Elf32_Shdr_size
istruc Elf32_Shdr
    at Elf32_Shdr.sh_name,      dd ashstrtab - names
    at Elf32_Shdr.sh_type,      dd SHT_STRTAB
    at Elf32_Shdr.sh_offset,    dd names - ehdr
    at Elf32_Shdr.sh_size,      dd NAMES_SIZE
iend

SHNUM equ ($ - shdr) / Elf32_Shdr_size

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
