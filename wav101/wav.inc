struc CK ; chunk
    .ckID   resd 1 ; chunk type identifier
    .ckSize resd 1 ; chunk size field
    ; .ckData resb ckSize ; chunk data
endstruc

struc fmtck ; WAVE format chunk
    .wFormatTag       resw 1
    .wChannels        resw 1
    .dwSamplesPerSec  resd 1
    .dwAvgBytesPerSec resd 1 ; to estimate the buffer size
    .wBlockAlign      resw 1
endstruc

struc PCM_format_specific
    .wBitsPerSample resw 1
endstruc

WAVE_FORMAT_PCM equ 1
