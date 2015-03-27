BITS 32
%include "zip.inc"

%macro _filename 0
    db 'hello.txt'
%endmacro

DATA_CRC32 equ 07d14ddddh

file:
istruc filerecord
    at filerecord.frSignature,        db "PK", 3, 4
    at filerecord.frVersion,          dw 0ah
    at filerecord.frCompression,      dw COMP_STORED
    at filerecord.frCrc,              dd DATA_CRC32
    at filerecord.frCompressedSize,   dd DATA_SIZE
    at filerecord.frUncompressedSize, dd DATA_SIZE
;   at filerecord.frFileNameLength,   dw FILENAME_LEN
iend
;_filename
data db 'Hello World!', 0ah
    DATA_SIZE equ $ - data


central_directory:
istruc direntry
    at direntry.deSignature,        db "PK", 1, 2
    at direntry.deVersionToExtract, dw 0ah
    at direntry.deCrc,              dd DATA_CRC32
    at direntry.deCompressedSize,   dd DATA_SIZE
    at direntry.deUncompressedSize, dd DATA_SIZE
    at direntry.deFileNameLength,   dw FILENAME_LEN
    at direntry.deHeaderOffset,     dd file
iend
filename _filename
    FILENAME_LEN equ $ - filename

CENTRAL_DIRECTORY_SIZE equ $ - central_directory

istruc endlocator
    at endlocator.elSignature,          db "PK", 5, 6
    at endlocator.elEntriesInDirectory, db 1
    at endlocator.elDirectorySize,      dd CENTRAL_DIRECTORY_SIZE
    at endlocator.elDirectoryOffset,    dd central_directory
iend
