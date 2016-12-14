; a 'Hello World' .WAV file in ASM

; Ange Albertini, BSD Licence 2014

;TODO: check the sizes' adjustments

%include 'wav.inc'

%include 'morse.inc'

;*******************************************************************************

istruc CK ; generic RIFF chunk
  at CK.ckID,   db 'RIFF'
  at CK.ckSize, dd _END - 9 ; TODO: why ?
iend

db 'WAVE' ; this is an audio file (Waveform Audio File Format), as RIFF (Resource Interchange File Format) is a generic container format

istruc CK ; WAVE-specific format chunk
  at CK.ckID,   db 'fmt '
  at CK.ckSize, dd FMT_SIZE
iend
fmt_start
istruc fmtck ; WAVE format chunk
    at fmtck.wFormatTag,       dw WAVE_FORMAT_PCM ; Pulse Code Modulation
    at fmtck.wChannels,        dw 1
    at fmtck.dwSamplesPerSec,  dd 8000
    at fmtck.dwAvgBytesPerSec, dd 8000
    at fmtck.wBlockAlign,      dw 1
iend
istruc PCM_format_specific
    at PCM_format_specific.wBitsPerSample, dw 8
iend
 ; cbSize dw 0 ; no extension
FMT_SIZE equ $ - fmt_start

istruc CK ; data chunk
  at CK.ckID,   db 'data'
  at CK.ckSize, dd _END - 1 - data ; TODO: why ?
iend

data:
  _h
  _e
  _l
  _l
  _o
_wordbreak
  _w
  _o
  _r
  _l
  _d
_END