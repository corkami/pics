;let's encode 'Hello World' in Morse

;morse durations:
; one dot is the smallest duration, d
; one dash = 3 d
; after one dash or one dot, one d of silence
; between 2 words, 7d of silence.

; text              H         E   L           L           O                 W           O             R         L           D
; letter codes      ....      .   .-..        .-..        ---           /   .--         ---           .-.       .-..        -..
; actual encoding:  =_=_=_=___=___=_===_=_=___=_===_=_=___===_===_===_______=_===_===___===_===_===___=_===_=___=_===_=_=___===_=_=___


DURATION equ 80

%macro _beep 0
  ; a complete SINUS waveform, over 8 samples (range = [1;255])
  ; [1 + int(127 * (1 + math.sin (i * math.pi / 4))) for i in range(8)]
  times DURATION db 128, 217, 255, 217, 128, 38, 1, 38 
%endmacro

%macro _silence 0
  times DURATION * 8 db 128 ; 8 samples of silence
%endmacro

%macro _dot 0
  _beep
_silence
%endmacro

%macro _dash 0
  _beep
  _beep
  _beep
_silence
%endmacro

;************************

%macro _e 0 ; .
  _dot
_letterbreak
%endmacro

%macro _w 0 ; .--
  _dot
  _dash
  _dash
_letterbreak
%endmacro

%macro _r 0 ; .-.
  _dot
  _dash
  _dot
_letterbreak
%endmacro

%macro _d 0 ; -..
  _dash
  _dot
  _dot
_letterbreak
%endmacro

%macro _o 0 ; ---
  _dash
  _dash
  _dash
_letterbreak
%endmacro

%macro _h 0 ; ....
  _dot
  _dot
  _dot
  _dot
_letterbreak
%endmacro

%macro _l 0 ; .-..
  _dot
  _dash
  _dot
  _dot
_letterbreak
%endmacro

;************************

%macro _letterbreak 0
; one silence already present after the previous dot/dash
; _silence
  _silence
  _silence
%endmacro

%macro _wordbreak 0 ; /
; 3 silences already present as a letter break
; _silence
; _silence
; _silence
  _silence
  _silence
  _silence
  _silence
%endmacro
