COMP_STORED equ 0

struc filerecord
    .frSignature        resb 4 ; db "PK", 3, 4
    .frVersion          resw 1
    .frFlags            resw 1
    .frCompression      resw 1
    .frFileTime         resw 1
    .frFileDate         resw 1
    .frCrc              resd 1
    .frCompressedSize   resd 1
    .frUncompressedSize resd 1
    .frFileNameLength   resw 1
    .frExtraFieldLength resw 1
    ;.frFileName        resb frFileNameLength
    ;.frExtraField      resb frExtraFieldLength
    ;.frData            resb frCompressedSize
endstruc

struc direntry
    .deSignature          resb 4 ; db "PK", 1, 2
    .deVersionMadeBy      resw 1
    .deVersionToExtract   resw 1
    .deFlags              resw 1
    .deCompression        resw 1
    .deFileTime           resw 1
    .deFileDate           resw 1
    .deCrc                resd 1
    .deCompressedSize     resd 1
    .deUncompressedSize   resd 1
    .deFileNameLength     resw 1
    .deExtraFieldLength   resw 1
    .deFileCommentLength  resw 1
    .deDiskNumberStart    resw 1
    .deInternalAttributes resw 1
    .deExternalAttributes resd 1
    .deHeaderOffset       resd 1
    ;.deFileName          resb deFileNameLength
    ;.deExtraField        resb deExtraFieldLength
    ;.deData              resb deCompressedSize
endstruc

struc endlocator
    .elSignature          resb 4 ;db "PK", 5, 6
    .elDiskNumber         resw 1
    .elStartDiskNumber    resw 1
    .elEntriesOnDisk      resw 1
    .elEntriesInDirectory resw 1
    .elDirectorySize      resd 1
    .elDirectoryOffset    resd 1
    .elCommentLength      resw 1
    ;.elComment           resb elCommentLength
endstruc
