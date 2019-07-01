; This relies on the ability of the assembler to read labels and put data bytes
; and all that other good stuff. No actual assembly is used here, just data.

;;;;;;;;;;;;;;;;;
;;  envelopes  ;;
;;;;;;;;;;;;;;;;;
;; 10 - Jump to position XX
;; FF - Stop envelope

; Each byte is just simply written to register 0 of whatever channel is using the
; envelope, after one of the useless bits being masked out so commands (yep, all
; two of them) could exist. Triangle channel completely ignores envelopes.
; It's *highly* recommended that the first envelope is a silent one.

envelopes:
	.addr env_blank
	.addr env_lead1, env_nse_hat, env_nse_hat2, env_nse_snare, env_lead2
	.addr sq4sound, sq8sound, rumble_env, spooky_env, build_1
	.addr build_2, build_3, testes, testes2, duty0_change_4
	.addr march_snare_r, march_snare_l, march_snare_accent, end_rhythm, end_punch
	.addr bass_drum1, sq_quiet, zero_rise, quiet_8, windyt_env
env_blank:
 .byte	$00,$FF
env_lead1:
 .byte	$0F,$0D,$0B,$09,$07,$05,$04,$04,$04,$04,$05,$05,$06,$06,$06,$06,$05,$05,$10,$06,$ff
env_nse_hat:
 .byte	$0F,$0C,$00,$FF
env_nse_hat2:
 .byte	$0F,$0B,$07,$03,$FF
env_nse_snare:
 .byte	$0F,$08,$0C,$06,$04,$03,$02,$02,$01,$01,$00,$FF
env_lead2:
 .byte	$8C,$8E,$8F,$8E,$8C,$8A,$89,$88,$87,$86,$85,$84,$FF
sq4sound:
	.byte $4a,$4a,$4d,$4d,$4d,$4a,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43,$ff
sq8sound:
	.byte $8a,$8a,$8d,$8d,$8d,$8a,$8a,$8a,$8d,$8a,$89,$88,$83,$83,$83,$83,$83,$ff
rumble_env:
	.byte $85,$85,$85,$8f,$8d,$8f,$8d,$85,$85,$8f,$10,$00
spooky_env:
	.byte $43,$44,$45,$46,$48,$4a,$4c,$4a,$48,$46,$44,$43,$44,$45,$46,$48,$4a,$10,$0c
build_1:
	.byte $41,$42,$42,$41,$ff
build_2:
	.byte $43,$44,$44,$42,$ff
build_3:
	.byte $46,$47,$47,$44,$ff
testes:
	.byte $45,$47,$48,$4a,$8a,$8a,$8a,$0a,$ff;,$09,$08,$06,$05,$ff
testes2:
	.byte $85,$8a,$89,$8a,$89,$8a,$89,$8a,$09,$0a,$09,$0a,$09,$0a,$49,$48,$ff
duty0_change_4:
	.byte $05,$8a,$09,$8a,$ff
march_snare_r:
	.byte $06,$02,$00,$ff
march_snare_l:
	.byte $04,$01,$00,$ff
march_snare_accent:
	.byte $09,$05,$00,$ff
end_rhythm:
	.byte $8d,$8f,$8f,$8e,$4d,$4b,$0b,$08,$ff
end_punch:
	.byte $0f,$0f,$0f,$0f,$0d,$0b,$0b,$08,$ff
bass_drum1:
	.byte $0f,$0c,$0b,$00,$ff
sq_quiet:
 .byte	$06,$05,$06,$06,$07,$05,$04,$04,$04,$04,$04,$04,$03,$03,$02,$04,$05,$05,$04,$03,$ff
zero_rise:
	.byte $01,$01,$01,$01,$02,$02,$02,$02,$03,$03,$03,$03,$04,$04,$04,$04
	.byte $05,$05,$05,$05,$06,$06,$06,$06,$07,$07,$07,$07,$08,$08,$08,$08
	.byte $09,$09,$09,$09,$0a,$0a,$0a,$0a,$0b,$0b,$0b,$0b,$0c,$0c,$0c,$0c
	.byte $0d,$0d,$0d,$0d,$0d,$0d,$0e,$0e,$0e,$0e,$0e,$0e,$0f,$0f,$0f,$0f,$ff
quiet_8:
 .byte	$86,$88,$86,$88,$86,$88,$86,$88,$86,$88,$86,$88,$86,$88,$86,$88,$86,$88,$86,$88,$ff
windyt_env:
	.byte $8e,$8d,$8b,$8e,$8d,$8c,$8b,$8a,$89,$88,$87,$88,$89,$8c
	.byte $8d,$8d,$8b,$8e,$8d,$8c,$8b,$8a,$89,$88,$88,$88,$88,$89
	.byte $8a,$8b,$8b,$8a,$89,$89,$89,$89,$89,$88,$87,$86,$85,$84
	.byte $ff


;;;;;;;;;;;;;;;;;;
;;  song table  ;;
;;;;;;;;;;;;;;;;;;
; This determines what song is assigned to what value when loading songs
songs:
	.addr silence
	.addr pause_jingle, oworld_tune, sewer_tune, silo_tune, shopping_tune
	.addr cave_tune, battle_tune, btl_intro_tune, junk_tune, circus_tune
	.addr win_tune, slums_tune, run_tune, store_tune, karn_tune
	.addr detec_tune, ball_tune, final_tune, stadi_tune, home_tune
	.addr golf_tune, pirate_tune, resi_tune, inhouse_tune, uni_tune
	.addr plant_tune, play_tune, title_tune, boss_tune, contri_tune
	.addr mines_tune, introstory_tune, oworld2_tune, oworld3_tune, constr_tune
	.addr bully_tune, cred_tune, shad_tune, invin_tune, coinish_tune
	.addr train_tune, sail_tune, hekl_song, isle_tune

;	.addr title_tune
;	.addr introstory_tune, contri_tune, home_tune, play_tune, resi_tune
;	.addr inhouse_tune, train_tune, oworld_tune, oworld2_tune, oworld3_tune
;	.addr shopping_tune, store_tune, detec_tune, ball_tune, sewer_tune
;	.addr silo_tune, circus_tune, pirate_tune, uni_tune, junk_tune
;	.addr bully_tune, stadi_tune, slums_tune, cave_tune, golf_tune
;	.addr plant_tune, mines_tune, constr_tune, isle_tune, final_tune
;	.addr btl_intro_tune, battle_tune, win_tune, boss_tune, shad_tune
;	.addr cred_tune, invin_tune, karn_tune, hekl_song
;;;;;;;;;;;;;
;;  songs  ;;
;;;;;;;;;;;;;
;; C8 XX - silent rest for XX cycles
;; C0 XX - do nothing (just extend the note for another XX cycles)
;; C1 XX - precut (cut the note XX cycles before it ends)
;; C2 XX - set envelope to XX
;; C3 YY XX ZZ - jump to YYXX, ZZ times
;; C4 YY XX - jump to YYXX
;; C5 XX - set detune to XX (01-7F up, 80-FF down, 00 none)
;; C6 XX - decrease envelope volume by XX
;; C7 XX - set pitch bend to XX (01-7F down, 80-FE up, 00 none)
;; C9 XX - set tempo-independent pitch bend (functions the same as C7)
;; FF - Track end (the track stops playing here)

; The first 4 words in the list are the pointer for square 1, square 2, tri, noise
; in that order, followed by a byte that defines the tempo. Lower values are
; slower, higher are faster, 00 is infinitely slow, making the song stop.
; If you don't use a particular channel for a song, just put $0000 as the pointer.
; All four channels can be used at once. It's *highly* recommended that you reserve
; one song in your playlist to be a silent song.

silence:
	.word $0000, $0000, $0000, $0000
	.byte $00
pause_jingle:
	.addr pause_sq1, $0000, $0000, $0000
	.byte $ff
oworld_tune:
	.addr oworld_sq1, oworld_sq2, oworld_tri, oworld_nse
	.byte $90
sewer_tune:
	.addr sewer_sq1, sewer_sq2, sewer_tri, sewer_nse
	.byte $d0
silo_tune:
	.addr silo_sq1, silo_sq2, silo_tri, silo_nse
	.byte $d0
shopping_tune:
	.addr shopping_sq1, shopping_sq2, shopping_tri, shopping_nse
	.byte $90
cave_tune:
	.addr cave_sq1, cave_sq2, cave_tri, cave_nse
	.byte $90
battle_tune:
	.addr battle_sq1, battle_sq2, battle_tri, battle_nse
	.byte $d0
btl_intro_tune:
	.addr btl_intro_sq1, btl_intro_sq2, btl_intro_tri, btl_intro_nse
	.byte $d0
junk_tune:
	.addr junk_sq1, junk_sq2, junk_tri, junk_nse
	.byte $90
circus_tune:
	.addr circus_sq1, circus_sq2, circus_tri, $0000
	.byte $f0
win_tune:
	.addr $0000, win_sq2, win_tri, $0000
	.byte $f0
slums_tune:
	.addr slums_sq1, slums_sq2, slums_tri, slums_nse
	.byte $90
run_tune:
	.addr $0000, $0000, $0000, run_nse
	.byte $f0
store_tune:
	.addr store_sq1, store_sq2, store_tri, store_nse
	.byte $90
karn_tune:
	.addr karn_sq1, karn_sq2, karn_tri, karn_nse
	.byte $c0
detec_tune:
	.addr $0000, $0000, detec_tri, detec_nse
	.byte $ff
ball_tune:
	.addr $0000, ball_sq1, ball_tri, $0000
	.byte $c0
final_tune:
	.addr final_sq1, final_sq2, final_tri, final_nse
	.byte $90
stadi_tune:
	.addr stadi_sq1, stadi_sq2, stadi_tri, stadi_nse
	.byte $90
home_tune:
	.addr home_sq1, home_sq2, home_tri, home_nse
	.byte $90
golf_tune:
	.addr golf_sq1, golf_sq2, golf_tri, golf_nse
	.byte $b0
pirate_tune:
	.addr pirate_sq1, pirate_sq2, pirate_tri, pirate_nse
	.byte $d0
resi_tune:
	.addr resi_sq1, resi_sq2, resi_tri, resi_nse
	.byte $90
inhouse_tune:
	.addr inhouse_sq1, inhouse_sq2, inhouse_tri, inhouse_nse
	.byte $90
uni_tune:
	.addr uni_sq1, uni_sq2, uni_tri, uni_nse
	.byte $60
plant_tune:
	.addr plant_sq1, plant_sq2, plant_tri, plant_nse
	.byte $90
play_tune:
	.addr play_sq10, play_sq20, play_tri0, play_nse0
	.byte $90
title_tune:
	.addr title_sq1, title_sq2, title_tri, title_nse
	.byte $90
boss_tune:
	.addr boss_sq1, boss_sq2, boss_tri, boss_nse
	.byte $80
contri_tune:
	.addr contri_sq1, contri_sq2, contri_tri, contri_nse
	.byte $d0
mines_tune:
	.addr mines_sq1, mines_sq2, mines_tri, mines_nse
	.byte $90
introstory_tune:
	.addr introstory_sq1, introstory_sq2, introstory_tri, introstory_nse
	.byte $b0
oworld2_tune:
	.addr oworld2_sq1, oworld2_sq2, oworld2_tri, oworld_nse
	.byte $90
oworld3_tune:
	.addr oworld3_sq1, oworld3_sq2, oworld3_tri, oworld_nse
	.byte $90
constr_tune:
	.addr constr_sq1, constr_sq2, constr_tri, constr_nse
	.byte $90
bully_tune:
	.addr bully_sq1, bully_sq2, bully_tri, bully_nse
	.byte $90
shad_tune:
	.addr shad_sq1, shad_sq2, shad_tri, shad_nse
	.byte $90
cred_tune:
	.addr cred_sq1, cred_sq2, cred_tri, cred_nse
	.byte $90
invin_tune:
	.addr invin_sq1, invin_sq2, invin_tri, invin_nse
	.byte $ff
coinish_tune:
	.addr coinish_sq1, $0000, $0000, $0000
	.byte $ff
train_tune:
	.addr train_sq1, train_sq2, train_tri, train_nse
	.byte $90
sail_tune:
	.addr $0000,$0000,$0000,sailt_nse
	.byte $ff
hekl_song:
	.addr overworld_sq1, overworld_sq2, overworld_tri, overworld_nse
	.byte $90
isle_tune:
	.addr isle_sq1, isle_sq2, isle_tri, isle_nse
	.byte $90

; Song data is just <note> <duration> for each note, or <command> <data>... for
; commands (see table above). For <note>, the higher nybble is the actual note
; (the scale begins with A, so 0x is A, 1x is A#, 2x is B, etc), and the lower
; nybble is the octave. The tracks are state machines, so whatever commands you
; apply (like envelope, detune, pitch bend, etc) will stick until you change them,
; or until a new song is loaded.

; cheat sheet:
; A=0 #=1 B=2 C=3 #=4 D=5 #=6 E=7 F=8 #=9 G=a #=b
isle_sq1:
	.byte $c2,$16
	.byte $00,$08
	.byte $c4,<isle_sq1,>isle_sq1
	.byte $ff
isle_sq2:
	.byte $c2,$18
	.byte $30,$10, $70,$10, $30,$10, $00,$10
	.byte $c3,<isle_sq2,>isle_sq2,$03
	.byte $01,$40, $71,$40, $31,$80
	.byte $c4,<isle_sq2,>isle_sq2
	.byte $ff
isle_tri:
	.byte $01,$80
	.byte $c4,<isle_tri,>isle_tri
	.byte $ff
isle_nse:
	.byte $c2,$10,$00,$04,$c2,$11,$00,$04,$c2,$10,$01,$02,$c2,$11,$01,$02,$c2,$10,$00,$08,$00,$04
	.byte $c2,$12,$00,$04,$c2,$11,$00,$04,$c2,$10,$01,$02,$c2,$11,$01,$02,$c2,$10,$00,$08,$00,$04
	.byte $c4,<isle_nse,>isle_nse
	.byte $ff





overworld_sq1:
	.byte $c2,$06
	.byte $c8,$80
overworld_sq11:
	.byte $c1,$04
	.byte $00,$08, $01,$08
	.byte $c3,<overworld_sq11,>overworld_sq11,$0f
overworld_sq12:
	.byte $70,$08, $71,$08
	.byte $c3,<overworld_sq12,>overworld_sq12,$0f
overworld_sq13:
	.byte $70,$08, $92,$08, $52,$08, $32,$08
	.byte $c3,<overworld_sq13,>overworld_sq13,$07
	.byte $c1,$00, $03,$40, $72,$40
	.byte $c4,<overworld_sq11,>overworld_sq11

overworld_sq2:
	.byte $c2,$05
	.byte $02,$10, $72,$10, $c1,$04,$52,$08, $42,$08, $c1,$00,$22,$10 
	.byte $a1,$08, $52,$04, $32,$04, $22,$08, $a1,$08, $02,$08, $02,$08, $52,$10
	.byte $c3,<overworld_sq2,>overworld_sq2,$04
overworld_sq21:
	.byte $72,$40, $92,$40, $52,$40, $02,$20, $32,$20
	.byte $c4,<overworld_sq2,>overworld_sq2

overworld_tri:
	.byte $c1,$02
	.byte $02,$10
	.byte $c3,<overworld_tri,>overworld_tri,$07
overworld_tri1:
	.byte $52,$10, $72,$10, $02,$10, $52,$10
	.byte $c3,<overworld_tri1,>overworld_tri1,$07
overworld_tri2:
	.byte $72,$08
	.byte $c3,<overworld_tri2,>overworld_tri2,$07
overworld_tri3:
	.byte $92,$08
	.byte $c3,<overworld_tri3,>overworld_tri3,$07
overworld_tri4:
	.byte $52,$08
	.byte $c3,<overworld_tri4,>overworld_tri4,$07
overworld_tri5:
	.byte $32,$08
	.byte $c3,<overworld_tri5,>overworld_tri5,$07
	.byte $c4,<overworld_tri,>overworld_tri

overworld_nse:
	.byte $c8,$80
overworld_nse1:
	.byte $c2,$15, $0f,$08, $c2,$02,$00,$08, $c2,$15,$0a,$08, $c2,$02,$00,$08	; <--- straight beat
	.byte $c4,<overworld_nse1,>overworld_nse1


sailt_nse:
	.byte $c2,$19
	.byte $05,$80
	.byte $c4,<sailt_nse,>sailt_nse






train_sq1: ; e2  b2  e2
	.byte $c2,$18
	.byte $71,$40, $71,$40, $71,$80
		   ;  c d e d   c d e d   f d c d   f d c d
		   ;  eedd      eedd    aaffeeeeaa   f g e d
;	.byte $72,$80, $23,$80, $c8,$01, $72,$ff
train_sq1_1:
	.byte $c2,$0e
	.byte $30,$08, $50,$08, $70,$08, $50,$08, $30,$08, $50,$08, $70,$08, $50,$08
	.byte $80,$08, $50,$08, $30,$08, $50,$08, $80,$08, $50,$08, $30,$08, $50,$08
	.byte $30,$08,$50,$08,$70,$08,$50,$08, $30,$08,$50,$08,$80,$08,$70,$08
	.byte $80,$08,$a0,$08,$70,$08,$50,$08, $80,$08,$a0,$08,$70,$08,$50,$08
	.byte $c3,<train_sq1_1,>train_sq1_1,$01
train_sq1_2:
	.byte $c2,$0e
	.byte $30,$10, $80,$08, $a0,$08
	.byte $30,$20
	.byte $81,$08, $a1,$08, $31,$10
	.byte $91,$08, $b1,$08, $41,$10
	.byte $30,$10, $80,$08, $a0,$08
	.byte $30,$10, $80,$08, $a0,$08
	.byte $30,$10, $c2,$0d,$91,$08, $b1,$08
	.byte $41,$20
	.byte $c3,<train_sq1_2,>train_sq1_2,$01
	.byte $c4,<train_sq1_1,>train_sq1_1
train_sq2: ; b2  e2  b2  e2
		   ; eeddbb     ccddee    ccaa      ccaa
		   ; c d e d    c d f e   f g e d   f g e d
	.byte $c2,$18
	.byte $21,$40, $21,$40, $21,$40, $71,$40
train_sq2_1:
	.byte $c2,$0d
	.byte $70,$04,$70,$04,$51,$04,$51,$04,$22,$04,$22,$04, $c8,$08
	.byte $32,$04,$32,$04,$52,$04,$52,$04,$72,$04,$72,$04, $c8,$08
	.byte $31,$04,$31,$04,$02,$04,$02,$04,$c8,$10
	.byte $31,$04,$31,$04,$02,$04,$02,$04,$c8,$10
	.byte $70,$04,$70,$04,$51,$04,$51,$04, $c8,$10, $70,$04,$70,$04,$51,$04,$51,$04, $c8,$08, $02,$04,$02,$04
	.byte $81,$04,$81,$04,$71,$04,$71,$04,$71,$04,$71,$04,$02,$04,$02,$04
	.byte $c8,$04, $81,$04, $c8,$04, $a1,$04, $c8,$04, $72,$04, $c8,$04, $52,$04
	.byte $c3,<train_sq2_1,>train_sq2_1,$01
train_sq2_2:
	.byte $70,$04,$70,$04,$70,$04,$70,$04, $c8,$08, $a1,$04,$a1,$04
	.byte $a1,$04,$a1,$04,$c8,$08, $a1,$04,$a1,$04,$a1,$04,$a1,$04
	.byte $c8,$10, $31,$04,$31,$04,$31,$04,$31,$04
	.byte $c8,$10, $42,$04,$42,$04,$42,$04,$42,$04
	.byte $70,$04,$70,$04,$70,$04,$70,$04, $c8,$08, $32,$04,$32,$04
	.byte $32,$04,$32,$04,$c8,$08, $52,$04,$52,$04,$52,$04,$52,$04
	.byte $c8,$10, $11,$08, $b1,$08
	.byte $41,$20
	.byte $c3,<train_sq2_2,>train_sq2_2,$01
	.byte $c4,<train_sq2_1,>train_sq2_1
train_tri:
	.byte $c1,$02, $c9,$10
	.byte $82,$04,$c8,$0c, $82,$04, $c8,$2c
	.byte $82,$04,$c8,$0c, $82,$04, $c8,$2c
	.byte $82,$04,$c8,$04, $82,$04,$c8,$04, $82,$04,$c8,$2c
	.byte $82,$04,$82,$04, $c8,$08,$82,$04, $c8,$2c
train_tri1:
	.byte $c9,$10
	.byte $82,$04,$82,$04, $c8,$04,$82,$04, $c8,$08, $82,$04,$c8,$04
	.byte $82,$04,$82,$04, $c8,$04,$82,$04, $c8,$08, $82,$04,$c8,$04
	.byte $82,$04,$82,$04, $c8,$14, $82,$04
	.byte $82,$04,$c8,$04, $82,$04, $c8,$14
	.byte $82,$04,$82,$04, $c8,$04,$82,$04, $c8,$08, $82,$04,$c8,$04
	.byte $82,$04,$82,$04, $c8,$08, $82,$04, $c8,$0c
	.byte $82,$04,$82,$04, $c8,$04,$82,$04, $c8,$10
	.byte $82,$04,$82,$04, $c8,$18, $c9,$00
	.byte $c4,<train_tri1,>train_tri1
train_nse:
	.byte $c2,$15
	.byte $c8,$30, $00,$08, $c8,$08
	.byte $c3,<train_nse,>train_nse,$03
train_nse1:
	.byte $c2,$15
	.byte $00,$08, $00,$08, $c2,$05,$00,$08, $c2,$15,$00,$08
	.byte $00,$08, $00,$08, $c2,$05,$00,$08, $00,$08, $c2,$15
	.byte $00,$08, $00,$08, $c2,$05,$00,$08, $c2,$15,$00,$08
	.byte $00,$08, $c2,$05,$00,$08, $00,$08, $c2,$15,$00,$08
	.byte $00,$08, $00,$08, $c2,$05,$00,$08, $c2,$15,$00,$08
	.byte $00,$08, $00,$08, $c2,$05,$00,$08, $00,$08, $c2,$15
	.byte $00,$08, $00,$08, $c2,$05,$00,$08, $c2,$15,$00,$08
	.byte $00,$08, $c2,$05,$00,$08, $00,$08, $00,$08
	.byte $c4,<train_nse1,>train_nse1














coinish_sq1:
	.byte $c2,$07, $c8,$10
	.byte $64,$04, $c2,$06, $65,$0c
	.byte $ff

invin_sq1:
	.byte $c2,$05
	.byte $80,$08,$80,$08, $80,$08,$c8,$08, $80,$04,$80,$0c, $80,$02,$80,$06, $80,$08
	.byte $70,$08,$70,$08, $70,$08,$c8,$08, $70,$04,$70,$0c, $70,$02,$70,$06, $70,$08
	.byte $c4,<invin_sq1,>invin_sq1
invin_sq2:
	.byte $c2,$05
	.byte $30,$08,$30,$08, $30,$08,$c8,$08, $30,$04,$30,$0c, $30,$02,$30,$06, $30,$08
	.byte $20,$08,$20,$08, $20,$08,$c8,$08, $20,$04,$20,$0c, $20,$02,$20,$06, $20,$08
	.byte $c4,<invin_sq2,>invin_sq2
invin_tri:
	.byte $c1,$01
	.byte $82,$04
	.byte $c3,<invin_tri,>invin_tri,$0f
invin_tri1:
	.byte $72,$04
	.byte $c3,<invin_tri1,>invin_tri1,$0f
	.byte $c4,<invin_tri,>invin_tri
invin_nse:
	.byte $c2,$15
	.byte $0e,$08,$00,$08,$0c,$08,$00,$08
	.byte $c4,<invin_nse,>invin_nse





cred_sq1:
	.byte $c2,$05
	.byte $05,$40, $25,$38, $35,$38
	.byte $75,$40, $55,$38, $35,$38
	.byte $c3,<cred_sq1,>cred_sq1,$01
	.byte $c2,$09
	.byte $04,$50, $24,$50, $34,$50, $74,$50
	.byte $c8,$80,$c8,$80,$c8,$80
cred_sq1_1:
	.byte $c2,$0e
	.byte $a4,$40, $04,$40
	.byte $a3,$10, $a3,$18, $73,$08, $03,$10
	.byte $03,$20, $53,$20
	.byte $c3,<cred_sq1_1,>cred_sq1_1,$01
cred_sq1_2:
	.byte $73,$06,$b3,$05,$24,$05, $73,$06,$b3,$05,$24,$05, $73,$06,$b3,$05,$24,$05, $73,$06,$b3,$05,$24,$05
	.byte $03,$06,$33,$05,$73,$05, $03,$06,$33,$05,$73,$05, $03,$06,$33,$05,$73,$05, $03,$06,$33,$05,$73,$05
	.byte $13,$06,$23,$05,$33,$05, $13,$06,$23,$05,$33,$05, $13,$06,$23,$05,$33,$05, $13,$06,$23,$05,$33,$05
	.byte $53,$40, $83,$40, $73,$40
cred_sq1_3:
	.byte $70,$08,$70,$08, $c8,$08,$70,$08, $70,$08,$c8,$08, $70,$08,$70,$08
;	.byte $c4,<cred_sq1_3,>cred_sq1_3
;	.byte $73,$0b,$b3,$0b,$24,$0a, $73,$0b,$b3,$0b,$24,$0a, $73,$0b,$b3,$0b,$24,$0a, $73,$0b,$b3,$0b,$24,$0a
	.byte $c3,<cred_sq1_3,>cred_sq1_3,$0d
cred_sq1_4:
	.byte $42,$80, $32,$80, $62,$80, $02,$80
	.byte $c4,<cred_sq1,>cred_sq1
	.byte $ff

cred_sq2:
	.byte $c2,$0e
	.byte $03,$10, $75,$08,$55,$08, $03,$08,$23,$08, $53,$08,$73,$08, $03,$10, $55,$08
	.byte $25,$08,$03,$08, $33,$08,$53,$08, $a2,$10, $35,$08,$35,$08, $a2,$08,$52,$08, $72,$08
	.byte $c3,<cred_sq2,>cred_sq2,$03
	.byte $c1,$08
	.byte $03,$10,$03,$10,$03,$10,$03,$10,$03,$10
	.byte $23,$10,$23,$10,$23,$10,$23,$10,$23,$10
	.byte $33,$10,$33,$10,$33,$10,$33,$10,$33,$10
	.byte $73,$10,$73,$10,$73,$10,$73,$10,$73,$10
	.byte $c8,$80
cred_sq2_1:
	.byte $00,$08,$00,$08, $c8,$08,$00,$08, $00,$08,$c8,$08, $00,$08,$00,$08
	.byte $c3,<cred_sq2_1,>cred_sq2_1,$1f
cred_sq2_2:
	.byte $c2,$09
	.byte $44,$80, $34,$80, $64,$80, $04,$80
	.byte $c4,<cred_sq2,>cred_sq2
	.byte $ff
	
cred_tri:
	.byte $03,$10, $c8,$08,$a2,$08, $03,$08,$23,$08, $53,$08,$73,$08, $03,$10, $c8,$08
	.byte $a2,$08,$03,$08, $33,$08,$53,$08, $a2,$10, $c8,$08,$82,$08, $a2,$08,$52,$08, $72,$08
	.byte $c3,<cred_tri,>cred_tri,$03
cred_tri1:
	.byte $03,$10, $c8,$08,$a2,$08, $03,$08,$23,$08, $53,$08,$73,$08, $03,$10
	.byte $a2,$08,$03,$08, $33,$08,$53,$08, $a2,$10, $82,$08,$a2,$08, $52,$08,$72,$08
	.byte $c3,<cred_tri1,>cred_tri1,$01
cred_tri2:
	.byte $03,$10, $a2,$08, $23,$08,$53,$08, $73,$08,$03,$10
	.byte $a2,$08,$33,$08, $53,$08, $a2,$18, $52,$08,$72,$08
	.byte $c3,<cred_tri2,>cred_tri2,$09
cred_tri3:
	.byte $02,$08,$02,$08, $c8,$08,$02,$08, $02,$08,$c8,$08, $02,$08,$02,$08
	.byte $c3,<cred_tri3,>cred_tri3,$03
cred_tri4:
	.byte $c1,$01
	.byte $73,$08,$73,$08, $c8,$08,$73,$08, $73,$08,$c8,$08, $73,$10
	.byte $a3,$08,$a3,$08, $c8,$08,$a3,$08, $a3,$08,$c8,$08, $a3,$10
	.byte $93,$08,$93,$08, $c8,$08,$93,$08, $93,$08,$c8,$08, $93,$10
	.byte $53,$08,$53,$08, $c8,$08,$53,$08, $53,$08,$c8,$08, $53,$08,$54,$08
	.byte $c3,<cred_tri4,>cred_tri4,$01
cred_tri5:
	.byte $73,$06,$b3,$05,$24,$05, $73,$06,$b3,$05,$24,$05, $73,$06,$b3,$05,$24,$05, $73,$06,$b3,$05,$24,$05
	.byte $03,$06,$33,$05,$73,$05, $03,$06,$33,$05,$73,$05, $03,$06,$33,$05,$73,$05, $03,$06,$33,$05,$73,$05
	.byte $13,$06,$23,$05,$33,$05, $13,$06,$23,$05,$33,$05, $13,$06,$23,$05,$33,$05, $13,$06,$23,$05,$33,$05
	.byte $53,$40, $83,$40, $73,$40, $03,$40, $73,$40, $83,$40, $73,$40
;	.byte $c3,<cred_tri5,>cred_tri5,$01
	.byte $c4,<cred_tri,>cred_tri
	.byte $ff

cred_nse:
	.byte $c2,$02
	.byte $0e,$08,$00,$08, $00,$08,$00,$04,$00,$04, $00,$08,$00,$04,$00,$04, $00,$04,$00,$04,$00,$08, $0b,$08,$00,$08, $00,$08
	.byte $0e,$08,$00,$08, $00,$04,$00,$04,$00,$08, $0b,$08,$00,$08, $00,$08,$00,$08, $0b,$08,$00,$08, $00,$08
	.byte $c3,<cred_nse,>cred_nse,$03
cred_nse1:
	.byte $c2,$02
	.byte $0e,$08,$00,$08,$0b,$08,$00,$08
	.byte $c3,<cred_nse1,>cred_nse1,$1d
cred_nse2:
	.byte $c2,$05
	.byte $0e,$08,$00,$08,$0b,$08,$00,$08
	.byte $c3,<cred_nse2,>cred_nse2,$1b
cred_nse3:
	.byte $c2,$05
	.byte $0e,$08,$0e,$08, $00,$04,$00,$04,$00,$04,$00,$04, $0b,$08,$00,$04,$00,$04,$00,$08,$00,$04,$00,$04
	.byte $c3,<cred_nse3,>cred_nse3,$07
cred_nse4:
	.byte $0e,$40, $0b,$40
	.byte $c3,<cred_nse4,>cred_nse4,$04
	.byte $c4,<cred_nse,>cred_nse
	.byte $ff




















; cheat sheet:
; A=0 #=1 B=2 C=3 #=4 D=5 #=6 E=7 F=8 #=9 G=a #=b
shad_sq1:
	.byte $c8,$80,$c8,$80,$c8,$80
	.byte $c2,$0e
shad_sq1_1:
	.byte $20,$08, $30,$08, $60,$08, $90,$08
	.byte $c4,<shad_sq1_1,>shad_sq1_1
shad_sq2:
	.byte $c2,$0e
	.byte $20,$20, $20,$20, $40,$40, $50,$20, $50,$20, $51,$20, $41,$10, $21,$90
	.byte $c2,$05
shad_sq2_1:
	.byte $22,$04,$22,$04,$c8,$08, $61,$04,$61,$04,$c8,$08, $23,$04,$22,$04,$31,$08, $c8,$08,$92,$08
	.byte $c3,<shad_sq2_1,>shad_sq2_1,$03
shad_sq2_2:
	.byte $c2,$0e
	.byte $62,$40, $91,$40, $62,$40, $b1,$40
shad_sq2_3:
	.byte $63,$04,$63,$04,$c8,$10, $63,$04,$63,$04,$c8,$10
	.byte $93,$04,$93,$04,$c8,$10, $93,$04,$93,$04,$c8,$10
	.byte $c3,<shad_sq2_3,>shad_sq2_3,$01
	.byte $c2,$0d
	.byte $00,$80,$01,$80, $14,$20,$c9,$01,$a2,$20,$c9,$00
	.byte $c4,<shad_sq2_1,>shad_sq2_1
shad_tri:
	.byte $c8,$80,$c8,$80,$c8,$80
shad_tri0:
	.byte $b0,$04,$b1,$04
	.byte $c3,<shad_tri0,>shad_tri0,$1f
shad_tri1:
	.byte $62,$04,$63,$04
	.byte $c3,<shad_tri1,>shad_tri1,$07
shad_tri2:
	.byte $92,$04,$93,$04
	.byte $c3,<shad_tri2,>shad_tri2,$07
shad_tri3:
	.byte $62,$04,$63,$04
	.byte $c3,<shad_tri3,>shad_tri3,$07
shad_tri4:
	.byte $b2,$04,$b3,$04
	.byte $c3,<shad_tri4,>shad_tri4,$07
shad_tri5:
	.byte $c1,$01
	.byte $63,$04,$63,$04, $32,$04,$32,$04,$c8,$08, $63,$04,$63,$04,$c8,$10
	.byte $93,$04,$93,$04, $62,$04,$62,$04,$c8,$08, $93,$04,$93,$04,$c8,$10
	.byte $c3,<shad_tri5,>shad_tri5,$01
	.byte $01,$80,$02,$80, $01,$20,$81,$20
	.byte $c4,<shad_tri0,>shad_tri0
shad_nse:
	.byte $c8,$80,$c8,$80,$c8,$80
shad_nse1:
	.byte $c2,$06
	.byte $0e,$10,$0a,$10
	.byte $c4,<shad_nse1,>shad_nse1
























bully_sq1:
	.byte $c2,$03
	.byte $02,$08,$b2,$08,$02,$08,$b2,$08,$02,$08,$b2,$08,$02,$08,$b2,$08
	.byte $02,$08,$23,$08,$52,$08,$43,$08,$52,$08,$43,$08,$52,$08,$43,$08
	.byte $c4,<bully_sq1,>bully_sq1
	.byte $ff
bully_sq2:
	.byte $c2,$05
	.byte $02,$10,$b2,$10
	.byte $c4,<bully_sq2,>bully_sq2
	.byte $ff
bully_tri:
	.byte $c1,$01
	.byte $02,$40, $02,$08, $32,$08, $52,$08, $c8,$28
	.byte $c3,<bully_tri,>bully_tri,$02
	.byte $02,$40, $52,$08, $32,$08, $02,$08, $c8,$28
	.byte $c4,<bully_tri,>bully_tri
	.byte $ff
bully_nse:
	.byte $c2,$15,$0e,$10, $c8,$30, $c2,$09,$00,$30, $c8,$10
	.byte $c2,$15,$0a,$10, $c8,$30, $0e,$08,$0e,$08, $c8,$30
	.byte $c4,<bully_nse,>bully_nse
	.byte $ff









constr_sq1:
	.byte $c2,$05
	.byte $c6,$08,$31,$04,$31,$04, $c6,$06,$31,$04,$31,$04, $c6,$04,$31,$04,$31,$04, $c6,$02,$31,$04,$31,$04
	.byte $c8,$60
	.byte $c2,$06
	.byte $c6,$08,$61,$08, $c6,$06,$61,$08, $c6,$04,$61,$08, $c6,$02,$61,$08
	.byte $c8,$20
	.byte $c2,$17
	.byte $31,$40
	.byte $c2,$05
	.byte $c6,$08,$30,$04,$30,$04, $c6,$06,$30,$04,$30,$04, $c6,$04,$30,$04,$30,$04, $c6,$02,$30,$04,$30,$04
	.byte $c8,$60
	.byte $c2,$06
	.byte $c6,$08,$50,$08, $c6,$06,$60,$08, $c6,$03,$50,$08, $c6,$01,$60,$08
	.byte $c8,$60
	.byte $c3,<constr_sq1,>constr_sq1
	.byte $ff
constr_sq2:
	.byte $c2,$17
	.byte $c8,$40, $10,$40
	.byte $c8,$40, $00,$40
	.byte $c8,$40, $10,$20,$30,$20
	.byte $c8,$40, $00,$10,$60,$20,$20,$10
	.byte $c3,<constr_sq2,>constr_sq2
	.byte $ff
constr_tri:
	.byte $c1,$01
	.byte $31,$08,$31,$08, $c8,$08,$31,$08, $31,$08,$31,$08, $c8,$08,$31,$08
	.byte $31,$08,$31,$08, $c8,$08,$31,$08, $51,$08,$61,$08, $51,$08,$61,$08
	.byte $c3,<constr_tri,>constr_tri
	.byte $ff
constr_nse:
	.byte $c2,$02,$00,$20
	.byte $c3,<constr_nse,>constr_nse,$07
constr_nse1:
	.byte $c2,$15, $0f,$08, $c2,$02,$00,$08, $c2,$15,$0a,$08, $c2,$02,$00,$08
	.byte $c3,<constr_nse1,>constr_nse1,$27
	.byte $c4,<constr_nse,>constr_nse
	.byte $ff







oworld3_sq1:
	.byte $c2,$16, $c6,$02
	.byte $31,$10, $32,$10
	.byte $71,$10, $22,$10
	.byte $81,$10, $32,$10
	.byte $51,$10, $52,$10
	.byte $c4,<oworld3_sq1,>oworld3_sq1
oworld3_sq2:
	.byte $c2,$16
	.byte $71,$20
	.byte $22,$20
	.byte $02,$20
	.byte $91,$20
	.byte $31,$20
	.byte $72,$20
	.byte $32,$20
	.byte $12,$20
	.byte $c3,<oworld3_sq2,>oworld3_sq2,$02
	.byte $c2,$16
	.byte $71,$12, $72,$10
	.byte $b1,$10, $62,$10
	.byte $02,$10, $72,$10
	.byte $91,$10, $92,$0e
	.byte $71,$12, $72,$10
	.byte $b1,$10, $62,$10
	.byte $02,$10, $72,$10
	.byte $92,$08,$92,$08, $91,$0e
	.byte $c4,<oworld3_sq2,>oworld3_sq2
oworld3_tri:
	.byte $c1,$0c
	.byte $31,$10, $c1,$0a,$32,$0c,$31,$04
	.byte $c1,$0c
	.byte $71,$10, $c1,$0e,$22,$10
	.byte $c1,$0c
	.byte $81,$10, $c1,$0a,$32,$0c,$81,$04
	.byte $c1,$01
	.byte $51,$10, $52,$10
	.byte $c1,$0c
	.byte $31,$10, $c1,$0a,$32,$0c,$31,$04
	.byte $c1,$0c
	.byte $71,$10, $c1,$0e,$22,$10
	.byte $c1,$0c
	.byte $81,$10, $c1,$0a,$32,$0c,$81,$04
	.byte $c1,$04
	.byte $52,$08,$52,$08, $51,$10
	.byte $c4,<oworld3_tri,>oworld3_tri
; noise channel is oworld_nse






oworld2_sq1:
	.byte $c2,$16, $c6,$02
	.byte $51,$08,$c1,$06,$52,$08, $c1,$06,$01,$08,$01,$08
	.byte $31,$08,$c1,$06,$32,$08, $c1,$06,$01,$08,$01,$08
	.byte $81,$08,$c1,$00,$02,$08, $c1,$06,$01,$08, $c1,$01,$c6,$00,$71,$10
	.byte $c6,$04,$22,$08, $c6,$03,$71,$08,$c6,$01,$71,$08
	.byte $c4,<oworld2_sq1,>oworld2_sq1
oworld2_sq2:
	.byte $c2,$04
	.byte $53,$10, $01,$10
	.byte $33,$10, $01,$10
	.byte $83,$10, $01,$08, $73,$10
	.byte $23,$08, $72,$08,$73,$08
	.byte $c3,<oworld2_sq2,>oworld2_sq2,$02
	.byte $c2,$04
	.byte $93,$08,$01,$08, $03,$08,$01,$08
	.byte $33,$08,$01,$08, $03,$08,$01,$08
	.byte $04,$08,$01,$08, $43,$08,$01,$10
	.byte $23,$04,$01,$04, $72,$04,$01,$04,$73,$04,$01,$04
	.byte $93,$08,$01,$08, $03,$08,$01,$08
	.byte $33,$08,$01,$08, $03,$08,$01,$08
	.byte $04,$08,$01,$08, $73,$08,$01,$10
	.byte $23,$04,$01,$04, $72,$08,$73,$08
	.byte $c4,<oworld2_sq2,>oworld2_sq2
oworld2_tri:
	.byte $c1,$04
	.byte $51,$08,$c1,$06,$52,$08, $c1,$06,$01,$08,$01,$08
	.byte $31,$08,$c1,$06,$32,$08, $c1,$06,$01,$08,$01,$08
	.byte $81,$08,$c1,$00,$02,$08, $c1,$06,$01,$08, $c1,$01,$71,$10
	.byte $22,$08, $71,$08,$71,$08
	.byte $c4,<oworld2_tri,>oworld2_tri
; noise channel is oworld_nse











introstory_sq1:
	.byte $c8,$80, $c8,$80
introstory_sq1_1:
	.byte $c2,$06
	.byte $c9,$fe
	.byte $03,$20, $03,$20, $33,$20, $53,$20
	.byte $c3,<introstory_sq1_1,>introstory_sq1_1,$01
introstory_sq1_2:
	.byte $c2,$05
	.byte $81,$08,$c9,$f5,$01,$18,$c9,$00, $a1,$08,$c9,$f5,$01,$18,$c9,$00
	.byte $61,$08,$c9,$f5,$01,$18,$c9,$00, $21,$08,$c9,$f5,$01,$18,$c9,$00
	.byte $c3,<introstory_sq1_2,>introstory_sq1_2,$0f
	.byte $c8,$20
	.byte $00,$20
	.byte $ff
introstory_sq2:
	.byte $c8,$80, $c8,$80
introstory_sq2_1:
	.byte $c2,$06
	.byte $c9,$fe
	.byte $73,$20, $83,$20, $54,$20, $83,$20
	.byte $c3,<introstory_sq2_1,>introstory_sq2_1,$01
	.byte $c9,$00
introstory_sq2_2:
	.byte $c2,$09
;	.byte $52,$20, $72,$20
;	.byte $32,$20, $52,$20
	.byte $51,$20, $71,$20
	.byte $31,$20, $51,$20
	.byte $c3,<introstory_sq2_2,>introstory_sq2_2,$07
introstory_sq2_3:
	.byte $c2,$16
	.byte $52,$08,$53,$04,$53,$04,$52,$08,$52,$08, $72,$08,$72,$08,$72,$08,$72,$08
	.byte $32,$08,$32,$08,$32,$08,$32,$08, $52,$08,$52,$08,$52,$08,$52,$08
	.byte $c2,$05
	.byte $50,$08,$51,$04,$51,$04,$50,$08,$50,$08, $70,$08,$70,$08,$70,$08,$70,$08
	.byte $30,$08,$30,$08,$30,$08,$30,$08, $50,$08,$50,$08,$50,$08,$50,$08
	.byte $c3,<introstory_sq2_3,>introstory_sq2_3,$01
	.byte $c2,$16
	.byte $54,$20, $74,$20
	.byte $34,$20, $54,$20
introstory_sq2_4:
	.byte $c9,$02,$54,$20, $74,$20
	.byte $34,$20, $54,$20, $c9,$00
	.byte $c3,<introstory_sq2_4,>introstory_sq2_4,$02
	.byte $c8,$20
	.byte $05,$08,$c6,$01,$05,$10, $c6,$02,$04,$10, $c6,$03,$04,$10, $c6,$04,$03,$10, $c6,$06,$02,$10, $c6,$07,$01,$10
	.byte $ff
introstory_tri:
	.byte $c1,$01
	.byte $52,$08,$02,$04,$02,$04,$02,$08,$02,$08, $72,$08,$02,$08,$02,$08,$02,$08
	.byte $32,$08,$02,$08,$02,$08,$02,$08, $52,$08,$02,$08,$02,$08,$02,$08
	.byte $c3,<introstory_tri,>introstory_tri,$13
	.byte $c8,$20
	.byte $01,$20
	.byte $ff
introstory_nse:
	.byte $c8,$80, $c8,$80, $c8,$80
introstory_nse1:
	.byte $c2,$01,$c9,$01,$0c,$10,$c9,$00
	.byte $c3,<introstory_nse1,>introstory_nse1,$07
introstory_nse2:
	.byte $c2,$01,$0d,$08, $00,$08, $c9,$01,$0a,$08,$c9,$00, $00,$08
	.byte $c3,<introstory_nse2,>introstory_nse2,$3f
	.byte $c8,$20
	.byte $0d,$20
	.byte $ff




mines_sq1:
	.byte $c2,$06
	.byte $54,$30, $34,$30, $74,$18
	.byte $73,$01,$83,$01,$93,$01,$a3,$01,$b3,$01,$04,$01,$14,$01,$24,$01,$34,$18, $33,$08, $34,$08, $33,$10
	.byte $c2,$09
	.byte $72,$20, $02,$28
	.byte $c2,$06
	.byte $52,$30, $32,$30, $72,$18
	.byte $32,$20, $31,$08,$32,$08, $31,$10
	.byte $c2,$09
	.byte $71,$20, $01,$28
	.byte $c4,<mines_sq1,>mines_sq1
mines_sq2:
	.byte $c2,$01
	.byte $50,$08
	.byte $c3,<mines_sq2,>mines_sq2,$1f
mines_sq2_1:
	.byte $30,$08,$30,$08,$30,$08,$30,$08,$30,$08,$30,$08,$30,$08,$30,$08
	.byte $30,$08,$30,$08,$30,$08,$30,$08,$30,$08,$30,$08,$30,$08,$30,$08
	.byte $c3,<mines_sq2_1,>mines_sq2_1,$01
	.byte $c4,<mines_sq2,>mines_sq2
mines_tri:
	.byte $52,$18, $a1,$18, $81,$18, $a1,$18, $b1,$10, $a1,$10
	.byte $c3,<mines_tri,>mines_tri,$01
mines_tri1:
	.byte $c1,$01
	.byte $32,$08,$32,$08,$32,$08,$32,$08,$32,$08,$32,$08,$32,$08,$32,$08
	.byte $b1,$08,$b1,$08,$b1,$08,$a1,$08,$a1,$08,$a1,$08,$a1,$08,$a1,$08
	.byte $c3,<mines_tri1,>mines_tri1,$01
	.byte $c4,<mines_tri,>mines_tri
mines_nse:
	.byte $ff



contri_sq1:
	.byte $c8,$c0, $c8,$c0
	.byte $c8,$c0, $c8,$c0
	.byte $c8,$c0, $c8,$c0
contri_sq11:
	.byte $c2,$01
	.byte $33,$60, $04,$60, $a3,$60, $24,$18, $74,$18, $54,$12,$24,$0c,$a2,$06,$82,$0c
	.byte $c3,<contri_sq11,>contri_sq11,$01
	.byte $93,$30, $83,$30, $73,$30, $a3,$30, $73,$60
	.byte $c1,$06
	.byte $73,$0c,$73,$0c,$73,$0c, $c1,$00,$73,$0c
	.byte $c1,$06
	.byte $73,$0c,$73,$0c,$74,$0c, $c1,$00,$73,$0c
	.byte $c4,<contri_sq1,>contri_sq1
contri_sq2:
	.byte $c8,$c0, $c8,$c0
contri_sq21:
	.byte $c2,$02
	.byte $82,$06,$82,$06,$82,$0c, $82,$18, $82,$0c,$82,$0c,$82,$18
	.byte $82,$06,$82,$06,$82,$0c, $03,$18, $03,$06,$03,$0c,$03,$12,$03,$0c
	.byte $a2,$06,$a2,$06,$a2,$0c, $a2,$0c,$a2,$0c, $a2,$06,$a2,$06,$a2,$0c, $a2,$0c,$33,$0c
	.byte $23,$06,$23,$06,$23,$0c, $23,$0c,$23,$0c, $23,$12,$74,$0c,$54,$06, $23,$0c
	.byte $c3,<contri_sq21,>contri_sq21,$03
	.byte $23,$06,$23,$06,$23,$0c,$23,$0c,$82,$0c, $03,$06,$03,$06,$03,$0c,$03,$0c,$82,$0c
	.byte $23,$06,$23,$06,$23,$0c,$23,$0c,$72,$0c, $a2,$06,$a2,$06,$a2,$0c,$a2,$0c,$72,$0c
	.byte $22,$06,$22,$06,$22,$0c,$22,$0c,$81,$0c, $02,$06,$02,$06,$02,$0c,$02,$0c,$02,$0c
	.byte $02,$0c,$02,$0c,$02,$0c,$02,$0c, $22,$0c,$22,$0c,$23,$0c,$23,$0c
	.byte $c4,<contri_sq2,>contri_sq2
contri_tri:
	.byte $82,$0c,$83,$0c,$82,$0c,$83,$0c, $82,$0c,$83,$0c,$82,$0c,$83,$0c, $82,$0c,$83,$0c
	.byte $03,$0c,$04,$0c, $03,$0c,$04,$0c,$03,$0c,$04,$0c, $a2,$0c,$a3,$0c,$a2,$0c,$a3,$0c
	.byte $a2,$0c,$a3,$0c,$a2,$0c,$a3,$0c, $23,$0c,$24,$0c,$23,$0c,$24,$0c, $23,$0c,$24,$06,$74,$0c,$54,$06,$23,$0c
	.byte $c3,<contri_tri,>contri_tri,$04
	.byte $23,$18,$24,$0c,$83,$0c, $03,$18,$04,$18, $23,$18,$24,$0c,$73,$0c
	.byte $a2,$18,$a3,$18, $23,$18,$24,$0c,$83,$0c, $03,$18,$04,$18
	.byte $c1,$06
	.byte $03,$0c,$03,$0c,$03,$0c, $c1,$00,$03,$0c
	.byte $c1,$06
	.byte $23,$0c,$23,$0c,$23,$0c, $c1,$00,$23,$0c
	.byte $c4,<contri_tri,>contri_tri
contri_nse:
	.byte $c2,$15
	.byte $0e,$0c,$00,$0c,$0a,$0c,$00,$0c, $0e,$0c,$0e,$0c,$0d,$0c,$00,$0c
	.byte $0e,$0c,$0e,$0c,$0a,$0c,$00,$0c, $0e,$0c,$00,$06,$0d,$06,$00,$0c,$00,$0c
	.byte $0e,$0c,$00,$0c,$0d,$0c,$00,$0c, $0e,$0c,$00,$0c,$0a,$0c,$00,$0c
	.byte $0e,$0c,$0e,$0c,$0d,$0c,$0e,$0c, $0e,$0c,$0a,$06,$0a,$0c,$0d,$06,$0d,$0c
	.byte $c4,<contri_nse,>contri_nse







; noname_as_of_yet.nsf
;story0_sq1:
;	.byte $c8,$e0, $c8,$e0
;	.byte $c8,$e0, $c8,$e0
;	.byte $c2,$06
;story_sq1_1:
;	.byte $a1,$08, $81,$08, $51,$0c,   $a1,$08, $81,$08, $51,$0c
;	.byte $a1,$08, $81,$08, $51,$0c,   $a1,$08, $81,$08, $51,$0c
;	.byte $02,$08, $51,$08, $31,$0c,   $02,$08, $a1,$08, $02,$0c
;	.byte $22,$08, $02,$08, $32,$0c,   $22,$08, $32,$08, $a1,$0c
;	.byte $c3,<story_sq1_1,>story_sq1_1,$02
;	.byte $23,$08,$33,$08,$23,$28, $53,$08,$23,$08,$53,$20, $33,$08,$53,$0c, $23,$08,$53,$0c, $33,$08,$23,$14
	; b2c3b2   d3b2d3    c3 d3      b2 d3    c3 b2
	; g2a2f2   g2f2d2    b1 a1      b1 f1    b1 e1
	; b2c3b2 a2^ d3c3d3       
;	.byte $ff
;story0_sq2:
;	.byte $c8,$e0, $c8,$e0
;	.byte $c2,$07
;	.byte $c6,$0a,$a1,$08, $81,$08, $51,$0c,   $a1,$08, $81,$08, $51,$0c
;	.byte $c6,$09,$a1,$08, $81,$08, $51,$0c,   $a1,$08, $81,$08, $51,$0c
;	.byte $c6,$08,$02,$08, $a1,$08, $81,$0c,   $02,$08, $a1,$08, $81,$0c
;	.byte $c6,$07,$22,$08, $02,$08, $a1,$0c,   $22,$08, $02,$08, $a1,$0c
;	.byte $c6,$06,$a1,$08, $81,$08, $51,$0c,   $a1,$08, $81,$08, $51,$0c
;	.byte $c6,$05,$a1,$08, $81,$08, $51,$0c,   $a1,$08, $81,$08, $51,$0c
;	.byte $c6,$04,$02,$08, $a1,$08, $81,$0c,   $02,$08, $a1,$08, $81,$0c
;	.byte $c6,$03,$22,$08, $02,$08, $a1,$0c,   $22,$08, $02,$08, $a1,$0c
;story_sq2_1:
;	.byte $c6,$02,$a1,$08, $81,$08, $51,$0c,   $a1,$08, $81,$08, $51,$0c
;	.byte         $a1,$08, $81,$08, $51,$0c,   $a1,$08, $81,$08, $51,$0c
;	.byte         $02,$08, $a1,$08, $81,$0c,   $02,$08, $a1,$08, $81,$0c
;	.byte         $22,$08, $02,$08, $a1,$0c,   $22,$08, $02,$08, $a1,$0c
;	.byte $c3,<story_sq2_1,>story_sq2_1
;	.byte $ff
;story0_tri:
;	; e3 g2 f2 d2   e4 g2 f2 d2   e3 a2 g2 f2   e4 a2 g2 f2   e3 b2 a2 g2  e4
;	.byte $72,$02,$a1,$06, $81,$08, $51,$0c,   $72,$02,$a1,$06, $81,$08, $51,$0c
;	.byte $73,$02,$a1,$06, $81,$08, $51,$0c,   $73,$02,$a1,$06, $81,$08, $51,$0c
;	.byte $72,$02,$02,$06, $a1,$08, $81,$0c,   $72,$02,$02,$06, $a1,$08, $81,$0c
;	.byte $73,$02,$22,$06, $02,$08, $a1,$0c,   $73,$02,$22,$06, $02,$08, $a1,$0c
;	.byte $c3,<story0_tri,>story0_tri
;	.byte $ff
;story0_nse:
;	.byte $c2,$01
;	.byte $02,$04,$c8,$18
;	.byte $c3,<story0_nse,>story0_nse,$0f
;story_nse1:
;	.byte $02,$04, $c8,$08, $03,$08, $c8,$08
;	.byte $c3,<story_nse1,>story_nse1,$07
;story_nse2:
;	.byte $02,$04, $c8,$04, $03,$04,$03,$08,$03,$04, $c8,$04
;	.byte $c3,<story_nse2,>story_nse2
;	.byte $ff





boss_sq1:
	.byte $c2,$05
	.byte $00,$04,$00,$04, $c8,$0c,$00,$04, $00,$04,$c8,$08,$00,$04, $00,$04,$c8,$04,$00,$04,$00,$04, $c8,$08
	.byte $c3,<boss_sq1,>boss_sq1,$03
boss_sq1_1:
	.byte $00,$04,$00,$04, $c8,$0c,$90,$04, $30,$04,$c8,$08,$21,$04, $30,$04,$c8,$04,$70,$04,$10,$04, $c8,$08
	.byte $c3,<boss_sq1_1,>boss_sq1_1,$14
boss_sq1_2:
	.byte $00,$08, $c8,$0c,$00,$08,$c8,$08,$00,$08,$c8,$04,$00,$08, $c8,$08
	.byte $c3,<boss_sq1_2,>boss_sq1_2,$03
	.byte $c4,<boss_sq1,>boss_sq1
boss_sq2:
	.byte $c2,$05
	.byte $70,$04,$70,$04, $c8,$0c,$70,$04, $70,$04,$c8,$08,$70,$04, $70,$04,$c8,$04,$70,$04,$70,$04, $c8,$08
	.byte $c3,<boss_sq2,>boss_sq2,$03
boss_sq2_1:
	.byte $00,$04,$00,$04, $c8,$0c,$01,$04, $60,$04,$c8,$08,$51,$04, $60,$04,$c8,$04,$a0,$04,$40,$04, $c8,$08
	.byte $c3,<boss_sq2_1,>boss_sq2_1,$03
boss_sq2_2:
	.byte $c2,$16
	.byte $c9,$02,$75,$28, $65,$28, $55,$28, $33,$28, $c8,$20,$c9,$00
	.byte $03,$04,$03,$04,$03,$04,$03,$04, $03,$04,$93,$04,$33,$04,$33,$04
	.byte $34,$04,$25,$04,$34,$04,$34,$04, $74,$04,$14,$04,$14,$04,$14,$04
	.byte $c9,$02,$75,$28, $65,$28, $55,$28, $33,$28, $c8,$20
	.byte $03,$04,$03,$04,$03,$04,$03,$04, $03,$04,$93,$04,$33,$04,$33,$04
	.byte $33,$04,$24,$04,$33,$04,$33,$04, $73,$04,$13,$04,$13,$04,$13,$04
	.byte $c3,<boss_sq2_2,>boss_sq2_2,$01
	.byte $03,$04,$03,$04,$03,$04,$03,$04, $03,$04,$93,$04,$33,$04,$33,$04
	.byte $33,$04,$24,$04,$33,$04,$33,$04, $73,$04,$13,$04,$13,$04,$13,$04,$c9,$00
boss_sq2_3:
	.byte $c2,$05
	.byte $70,$08, $c8,$0c,$70,$08,$c8,$08,$70,$08,$c8,$04,$70,$08, $c8,$08
	.byte $c3,<boss_sq2_3,>boss_sq2_3,$03
	.byte $c4,<boss_sq2,>boss_sq2
boss_tri:
	.byte $c8,$80
boss_tri1:
	.byte $c1,$01
	.byte $03,$04,$03,$04, $c8,$0c,$03,$04, $03,$04,$c8,$08,$03,$04, $03,$04,$c8,$04,$03,$04,$03,$04, $c8,$08
	.byte $c3,<boss_tri1,>boss_tri1,$01
	.byte $c8,$80
boss_tri2:
	.byte $03,$04,$03,$04,$03,$04,$03,$04, $03,$04,$93,$04,$33,$04,$33,$04
	.byte $33,$04,$24,$04,$33,$04,$33,$04, $73,$04,$13,$04,$13,$04,$13,$04
	.byte $c3,<boss_tri2,>boss_tri2,$12
boss_tri3:
	.byte $03,$08, $c8,$0c,$03,$08,$c8,$08,$03,$08,$c8,$04,$03,$08, $c8,$08
	.byte $c3,<boss_tri3,>boss_tri3,$03
	.byte $c4,<boss_tri,>boss_tri
boss_nse:
	.byte $c2,$01
	.byte $00,$04,$00,$04, $c8,$0c,$00,$04, $00,$04,$c8,$08,$00,$04, $00,$04,$c8,$04,$00,$04,$00,$04, $c8,$08
	.byte $0f,$04,$0f,$04,$00,$04,$00,$04, $0d,$04,$00,$04,$00,$04,$c8,$04
	.byte $c8,$04,$0f,$04,$00,$04,$c8,$04, $0d,$04,$00,$04,$c8,$04,$c8,$04
	.byte $0f,$04,$0f,$04,$00,$04,$00,$04, $0d,$04,$00,$04,$00,$04,$00,$04
	.byte $00,$04,$0f,$04,$00,$04,$00,$04, $0d,$04,$00,$04,$00,$04,$00,$04
	.byte $0f,$04,$0f,$04,$00,$04,$00,$04, $0d,$04,$00,$04,$00,$04,$00,$04
	.byte $00,$04,$0f,$04,$00,$04,$00,$04, $0d,$04,$00,$04,$00,$04,$82,$04
boss_nse1:
	.byte $0e,$04,$0e,$04,$00,$04,$00,$04, $0a,$04,$00,$04,$00,$04,$00,$04
	.byte $00,$04,$0e,$04,$00,$04,$00,$04, $0a,$04,$00,$04,$00,$04,$00,$04
	.byte $c4,<boss_nse1,>boss_nse1






title_sq1:
	.byte $c2,$01
	.byte $a2,$04,$a2,$04,$33,$04,$03,$04,$a2,$04,$a2,$04,$03,$04,$a2,$04,$33,$08,$53,$04, $c8,$0c
	.byte $a0,$01,$b0,$01,$01,$01,$11,$01,$21,$01,$31,$01,$41,$01,$51,$01
	.byte $ff
title_sq2:
	.byte $c2,$09
	.byte $a2,$0c, $02,$04, $a2,$18, $82,$04, $c8,$0c
	.byte $a2,$01,$b2,$01,$03,$01,$13,$01,$23,$01,$33,$01,$43,$01,$53,$01
	.byte $ff
title_tri:
	.byte $c1,$01
	.byte $a2,$04,$a2,$04,$33,$04,$03,$04,$a2,$04,$a2,$04,$03,$04,$a2,$04,$33,$08,$53,$04, $c8,$0c
	.byte $a2,$01,$b2,$01,$03,$01,$13,$01,$23,$01,$33,$01,$43,$01,$53,$01
	.byte $ff
title_nse:
	.byte $c8,$40
	.byte $c2,$01,$c9,$01,$0c,$20,$c9,$00
	.byte $ff



play_sq10:
	.byte $c2,$09
	.byte $03,$08,$c8,$08,$03,$08,$c8,$08, $72,$01,$62,$01,$52,$01,$42,$01
	.byte $32,$01,$22,$01,$12,$01,$02,$01, $b1,$01,$a1,$01,$91,$01,$81,$01
play_sq1:
	.byte $c2,$09
	.byte $21,$40, $01,$40, $81,$40, $02,$40
	.byte $c3,<play_sq1,>play_sq1,$03
	.byte $71,$10,$c8,$30
	.byte $71,$10,$c8,$30
	.byte $71,$10,$c8,$30
	.byte $c8,$40
play_sq1_1:; d2 e2 d2 e2 f2 e2  a3 a3
	.byte $02,$20, $33,$20, $02,$20, $73,$20, $33,$20, $53,$20, $73,$20, $52,$10,$72,$10
	.byte $c3,<play_sq1_1,>play_sq1_1,$01
	.byte $52,$20, $72,$20, $52,$20, $72,$20, $82,$20, $72,$20, $03,$08,$c8,$08,$03,$08,$c8,$08
	.byte $c8,$20
	.byte $c4,<play_sq1,>play_sq1
play_sq20:
	.byte $c2,$16
	.byte $04,$08,$c8,$08,$04,$08,$c8,$08, $72,$01,$62,$01,$52,$01,$42,$01
	.byte $32,$01,$22,$01,$12,$01,$02,$01, $b1,$01,$a1,$01,$91,$01,$81,$01
play_sq2:;cefg age dc    cefg abc ba       cefg age dc        ec8ac8 ec8ac8 ec8ac8 caf8b
	.byte $c2,$16
	.byte $62,$02,$72,$1e, $62,$02,$72,$1e, $42,$02,$52,$0e, $52,$01,$62,$01,$72,$1e, $33,$08, $33,$08
	.byte $b2,$02,$03,$1e, $b2,$02,$03,$0e, $82,$08, $92,$08, $a2,$20, $03,$20
	.byte $c3,<play_sq2,>play_sq2,$03
	.byte $c8,$10
	.byte $32,$04,$72,$04,$82,$04,$a2,$08, $03,$04,$a2,$04,$72,$08, $52,$04,$32,$08
	.byte $c8,$10
	.byte $33,$04,$73,$04,$83,$04,$a3,$08, $04,$04,$24,$04,$34,$08, $24,$04,$04,$08
	.byte $c8,$10
	.byte $32,$04,$72,$04,$82,$04,$a2,$08, $03,$04,$a2,$04,$72,$08, $52,$04,$32,$08
	.byte $75,$04, $45,$04, $05,$04, $45,$04, $75,$04, $45,$04, $05,$04, $45,$04
	.byte $75,$04, $45,$04, $05,$04, $45,$04, $35,$04, $05,$04, $94,$04, $b4,$04
	;a4g4f4e4 g4e4c4b3a3g3 c4b3a3g3f3e3 g3f3a3   c5b4a4g4f4e4 g4e4d4c4a4b3 g4a4b4c5d5e5 c5d5e5
play_sq2_1:
	.byte                 $05,$04,$a4,$04,$84,$04,$74,$0c, $a4,$04,$74,$04,$34,$04,$24,$04,$04,$04,$a3,$0c
	.byte $33,$04,$23,$04,$03,$04,$a2,$04,$82,$04,$72,$0c, $a2,$04,$82,$04,$03,$18
	.byte $34,$04,$24,$04,$04,$04,$a3,$04,$83,$04,$73,$0c, $a4,$04,$74,$04,$54,$04,$34,$04,$04,$04,$24,$0c
	.byte $a4,$04,$05,$04,$25,$04,$35,$04,$55,$04,$75,$0c, $35,$04,$55,$04,$75,$20
	.byte $c3,<play_sq2_1,>play_sq2_1,$01
	.byte $c2,$09
	.byte $54,$08,$34,$08,$24,$08,$04,$28
	.byte $24,$08,$04,$08,$a3,$08,$83,$28
	.byte $83,$08,$73,$08,$53,$08,$33,$28
	.byte $04,$08,$c8,$08,$04,$08,$c8,$08
	.byte $c8,$20
	.byte $c4,<play_sq2,>play_sq2
play_tri0:
	.byte $02,$04,$02,$04,$c8,$04, $02,$04,$02,$04,$c8,$0c, $72,$01,$62,$01,$52,$01,$42,$01
	.byte $32,$01,$22,$01,$12,$01,$02,$01, $b1,$01,$a1,$01,$91,$01,$81,$01
play_tri:; b a f abd d c8c
	.byte $c1,$01
	.byte $22,$04,$c8,$04, $22,$04,$22,$04,$22,$04,$c8,$04, $22,$04,$22,$04,$22,$04,$c8,$04
	.byte $22,$04,$22,$04,$22,$04,$c8,$04, $22,$04,$22,$04
	.byte $02,$04,$c8,$04, $02,$04,$02,$04,$02,$04,$c8,$04, $02,$04,$02,$04,$02,$04,$c8,$04
	.byte $02,$04,$02,$04,$02,$04,$c8,$04, $02,$04,$02,$04
	.byte $81,$04,$c8,$04, $81,$04,$81,$04,$81,$04,$c8,$04, $81,$04,$81,$04,$81,$04,$c8,$04
	.byte $81,$04,$81,$04,$81,$04,$c8,$04, $02,$04,$22,$04
	.byte $52,$04,$c8,$04, $52,$04,$52,$04,$52,$04,$c8,$04, $52,$04,$52,$04,$52,$04,$c8,$04
	.byte $52,$04,$52,$04,$52,$04,$c8,$04, $42,$04,$32,$04
	.byte $c3,<play_tri,>play_tri,$03
	.byte $72,$08,$72,$08,$c8,$30
	.byte $72,$08,$72,$08,$c8,$30
	.byte $72,$08,$72,$08,$c8,$30
	.byte $c8,$40
play_tri1:; a3 c4 a3 e4 c4 d4 e4 d3e3
	.byte $03,$04,$c8,$04, $03,$04,$03,$04,$03,$04,$c8,$04, $03,$04,$03,$04,$33,$04,$c8,$04
	.byte $33,$04,$33,$04,$33,$04,$c8,$04, $33,$04,$33,$04
	.byte $03,$04,$c8,$04, $03,$04,$03,$04,$03,$04,$c8,$04, $03,$04,$03,$04,$72,$04,$c8,$04
	.byte $72,$04,$72,$04,$72,$04,$c8,$04, $72,$04,$72,$04
	.byte $03,$04,$c8,$04, $03,$04,$03,$04,$03,$04,$c8,$04, $03,$04,$03,$04,$53,$04,$c8,$04
	.byte $53,$04,$53,$04,$53,$04,$c8,$04, $53,$04,$53,$04
	.byte $73,$04,$c8,$04, $73,$04,$73,$04,$73,$04,$c8,$04, $73,$04,$73,$04,$53,$04,$c8,$04
	.byte $53,$04,$53,$04,$73,$04,$c8,$04, $73,$04,$73,$04
	.byte $c3,<play_tri1,>play_tri1,$01
	.byte $53,$04,$53,$04,$c8,$04, $53,$04,$53,$04,$c8,$08, $53,$04
	.byte $73,$04,$73,$04,$c8,$04, $73,$04,$73,$04,$c8,$08, $73,$04
	.byte $53,$04,$53,$04,$c8,$04, $53,$04,$53,$04,$c8,$08, $53,$04
	.byte $73,$04,$73,$04,$c8,$04, $73,$04,$73,$04,$c8,$08, $73,$04
	.byte $82,$04,$82,$04,$c8,$04, $82,$04,$82,$04,$c8,$08, $82,$04
	.byte $72,$04,$72,$04,$c8,$04, $72,$04,$72,$04,$c8,$08, $72,$04
	.byte $02,$04,$02,$04,$c8,$04, $02,$04,$02,$04
	.byte $c8,$2c
	.byte $c4,<play_tri,>play_tri
play_nse0:
	.byte $c2,$01
	.byte $0c,$04,$0c,$04,$c8,$04, $0c,$04,$0c,$04,$c8,$0c, $c2,$01,$0c,$0c
play_nse:
	.byte $c2,$01
	.byte $0f,$04,$c8,$04,   $0f,$04, $00,$04, $0c,$04,$c8,$04,   $00,$04, $00,$04
	.byte $0f,$04,$c8,$04,   $0f,$04, $0f,$04, $0c,$04,$c8,$04,   $00,$04, $0f,$04
	.byte $0f,$04,$c8,$04,   $00,$04, $00,$04, $0c,$04,$c8,$04,   $00,$04, $00,$04
	.byte $0f,$04,$c8,$04,   $00,$04, $00,$04, $0c,$04,$0c,$04,   $0f,$04, $00,$04
	.byte $0f,$04,$c8,$04,   $0f,$04, $00,$04, $0c,$04,$c8,$04,   $00,$04, $00,$04
	.byte $0f,$04,$c8,$04,   $0f,$04, $0f,$04, $0c,$04,$c8,$04,   $00,$04, $0f,$04
	.byte $0f,$04,$c8,$04,   $00,$04, $00,$04, $0c,$04,$c8,$04,   $00,$04, $00,$04
	.byte $0f,$04,$c8,$04,   $00,$04, $00,$04, $0c,$04,$0c,$04,   $0f,$04, $00,$04
	.byte $c3,<play_nse,>play_nse,$03
play_nse1:
	.byte $0f,$04,$c8,$04,$0f,$04,$c8,$04, $00,$04,$00,$04,$00,$04,$00,$08, $00,$04,$00,$04,$00,$08, $00,$04,$00,$08
	.byte $c3,<play_nse1,>play_nse1,$02
	.byte $c8,$20
	.byte $00,$04,$00,$04,$00,$04,$00,$04,$0a,$04,$0a,$04,$0a,$04,$0a,$04
play_nse2:
	.byte $0f,$04,$c8,$04,   $00,$04, $0f,$04, $0c,$04,$c8,$04,   $0c,$04, $00,$04
	.byte $0f,$04,$c8,$04,   $00,$04, $0f,$04, $0c,$04,$c8,$04,   $00,$04, $00,$04
	.byte $0f,$04,$c8,$04,   $00,$04, $0c,$04, $0c,$04,$c8,$04,   $00,$04, $0f,$04
	.byte $0f,$04,$c8,$04,   $00,$04, $0f,$04, $0c,$04,$c8,$04,   $0c,$04, $00,$04
	.byte $0f,$04,$c8,$04,   $00,$04, $0f,$04, $0c,$04,$c8,$04,   $00,$04, $00,$04
	.byte $0f,$04,$c8,$04,   $00,$04, $00,$04, $0c,$04,$0c,$04,   $00,$04, $0f,$04
	.byte $0f,$04,$c8,$04,   $00,$04, $0f,$04, $0c,$04,$0c,$04,   $00,$04, $00,$04
	.byte $0f,$04,$0f,$04,   $00,$04, $0c,$04, $00,$04,$0f,$04,   $0c,$04, $00,$04
	.byte $c3,<play_nse2,>play_nse2,$01
	.byte $0f,$04,$0f,$04,$c8,$04, $0f,$04,$0c,$04,$c8,$08, $00,$04
	.byte $0f,$04,$0f,$04,$c8,$04, $0f,$04,$0c,$04,$c8,$08, $00,$04
	.byte $0f,$04,$0f,$04,$c8,$04, $0f,$04,$0c,$04,$c8,$08, $0f,$04
	.byte $0f,$04,$0f,$04,$c8,$04, $0f,$04,$0c,$04,$c8,$08, $00,$04
	.byte $0f,$04,$0f,$04,$c8,$04, $0f,$04,$0c,$04,$c8,$08, $00,$04
	.byte $0f,$04,$0f,$04,$c8,$04, $00,$04,$0c,$04,$c8,$08, $0f,$04
	.byte $0c,$04,$0c,$04,$c8,$04, $0c,$04,$0c,$04
	.byte $c8,$2c
	.byte $c4,<play_nse,>play_nse




plant_sq1:
	.byte $c2,$06
	.byte $00,$04,$70,$04,$01,$04,$70,$04
	.byte $c3,<plant_sq1,>plant_sq1,$03
plant_sq11:
	.byte $10,$04,$80,$04,$11,$04,$80,$04
	.byte $c3,<plant_sq11,>plant_sq11,$03
	.byte $c4,<plant_sq1,>plant_sq1
plant_sq2:
	.byte $c8,$80, $c8,$80
	.byte $c2,$07
plant_sq21:
	.byte $02,$04,$02,$04,$c8,$08
	.byte $c3,<plant_sq21,>plant_sq21,$03
plant_sq22:
	.byte $12,$04,$12,$04,$c8,$08
	.byte $c3,<plant_sq22,>plant_sq22,$03
	.byte $c8,$80
plant_sq23:
	.byte $42,$04,$42,$04,$c8,$08
	.byte $c3,<plant_sq23,>plant_sq23,$03
	.byte $c8,$40
	.byte $a2,$05,$92,$01,$82,$01,$72,$01,$c8,$08
	.byte $c8,$10
	.byte $b2,$05,$a2,$01,$92,$01,$82,$01, $72,$01,$62,$01,$52,$01,$42,$01,$32,$01,$22,$01,$12,$01,$02,$01
	.byte $c8,$50
	.byte $c4,<plant_sq2,>plant_sq2
plant_tri:
	.byte $c8,$80
plant_tri1:
	.byte $72,$04,$62,$01,$52,$01,$42,$01,$32,$01
	.byte $c4,<plant_tri1,>plant_tri1
plant_nse:
	.byte $c8,$40
	.byte $c2,$15
plant_nse1:
	.byte $00,$04,$00,$04,$00,$04,$00,$04,$00,$04,$00,$04,$00,$04,$00,$04
	.byte $c3,<plant_nse1,>plant_nse1,$09
plant_nse2:
	.byte $0e,$08,$00,$04,$00,$04,$0a,$04,$00,$04,$00,$04,$00,$04
	.byte $c4,<plant_nse2,>plant_nse2













uni_sq1:
	.byte $c2,$16
	.byte $a0,$10,$a0,$10,$01,$10,$01,$10
	.byte $a0,$10,$a0,$10,$a0,$10,$a0,$10
	.byte $70,$10,$70,$10,$70,$10,$70,$10
	.byte $30,$10,$30,$10,$50,$10,$50,$10
	.byte $70,$10,$70,$10,$70,$10,$70,$10
	.byte $90,$10,$90,$10,$a0,$10,$a0,$10
	.byte $21,$10,$21,$10,$11,$10,$11,$10
	.byte $90,$10,$90,$10,$01,$10,$01,$10
	.byte $c4,<uni_sq1,>uni_sq1
uni_sq2:
	.byte $c2,$16
	.byte $a3,$10,$a3,$10, $93,$08,$a3,$08, $04,$10
	.byte $73,$20, $53,$20
	.byte $33,$20, $23,$08,$33,$08, $53,$10
	.byte $03,$40
	.byte $23,$20, $43,$08, $53,$10, $73,$08
	.byte $04,$20, $53,$20
	.byte $a3,$20, $a3,$08, $93,$10, $73,$08
	.byte $53,$40
	.byte $c4,<uni_sq2,>uni_sq2
uni_tri:
;	.byte $c1,$01
	.byte $52,$80
	.byte $32,$20,$22,$20
	.byte $02,$40
	.byte $52,$20,$42,$20
	.byte $52,$40
	.byte $72,$40
	.byte $52,$40
;	.byte $52,$10,$52,$10,$52,$10,$52,$10
;	.byte $52,$10,$52,$10,$52,$10,$52,$10
;	.byte $32,$10,$32,$10,$22,$10,$22,$10
;	.byte $02,$10,$02,$10,$02,$10,$02,$10
;	.byte $52,$10,$52,$10,$42,$10,$42,$10
;	.byte $52,$10,$52,$10,$52,$10,$52,$10
;	.byte $72,$10,$72,$10,$72,$10,$72,$10
;	.byte $52,$10,$52,$10,$52,$10,$52,$10
	.byte $c4,<uni_tri,>uni_tri
uni_nse:
	.byte $ff






inhouse_sq1:
	.byte $c2,$16
	.byte $52,$08,$c8,$68, $52,$0c,$02,$04
	.byte $c3,<inhouse_sq1,>inhouse_sq1,$02
	.byte $52,$08,$c8,$28, $52,$0c,$02,$04
	.byte $32,$40
	.byte $c4,<inhouse_sq1,>inhouse_sq1
inhouse_sq2:
	.byte $c2,$16
	.byte $92,$08,$c8,$68, $92,$0c,$c8,$04
	.byte $c3,<inhouse_sq2,>inhouse_sq2,$02
	.byte $92,$08,$c8,$28, $92,$0c,$c8,$04
	.byte $31,$40
	.byte $c4,<inhouse_sq2,>inhouse_sq2
inhouse_tri:
	.byte $52,$08, $c8,$06, $03,$01,$13,$01, $23,$08, $03,$08, $c8,$10, $52,$0c,$02,$04
	.byte $52,$08, $c8,$06, $03,$01,$13,$01, $23,$08, $03,$08, $c8,$20
	.byte $c3,<inhouse_tri,>inhouse_tri,$02
	.byte $52,$08, $c8,$06, $03,$01,$13,$01, $23,$08, $03,$08, $c8,$10, $52,$0c,$02,$04
	.byte $a2,$10, $82,$10, $72,$10, $32,$10
	.byte $c4,<inhouse_tri,>inhouse_tri
inhouse_nse:
	.byte $ff










resi_sq1:
	.byte $c2,$16
	.byte $02,$10, $c8,$08,$72,$08, $a2,$10, $c8,$08,$32,$08
	.byte $52,$10, $c8,$10, $32,$10, $c8,$10
	.byte $82,$10, $c8,$08,$02,$08, $a2,$10, $c8,$10
	.byte $72,$10, $c8,$10, $32,$10, $c8,$10
	.byte $c4,<resi_sq1,>resi_sq1
resi_sq2:
	.byte $c2,$16,$02,$0a,$02,$06, $c2,$05,$73,$10,         $c2,$16,$a2,$0a,$a2,$06, $c2,$05,$33,$10
	.byte $c2,$16,$52,$0a,$52,$06, $c2,$05,$33,$08,$53,$08,         $c2,$16,$32,$0a,$32,$06, $c2,$05,$73,$08,$93,$08
	.byte $c2,$16,$82,$0a,$82,$06, $c2,$05,$03,$10,         $c2,$16,$a2,$0a,$a2,$06, $c2,$05,$c8,$10
	.byte $c2,$16,$72,$0a,$72,$06, $c2,$05,$83,$08,$52,$08, $c2,$16,$32,$0a,$32,$06, $c2,$05,$53,$08,$23,$08
	.byte $c4,<resi_sq2,>resi_sq2
resi_tri:
	.byte $02,$10, $03,$10, $a2,$10, $72,$10
	.byte $52,$0c,$02,$04, $32,$08,$52,$08, $c8,$0c,$02,$04, $32,$08,$52,$08
	.byte $c8,$0c,$02,$04, $82,$10, $a2,$10, $03,$0c, $02,$04
	.byte $72,$10, $52,$10, $32,$10, $22,$10
	.byte $c4,<resi_tri,>resi_tri
resi_nse:
	.byte $c2,$15
	.byte $00,$0c, $00,$04, $00,$0c, $00,$04, $05,$0c, $00,$04, $00,$0c, $00,$04
	.byte $c4,<resi_nse,>resi_nse







pirate_sq1:
	.byte $c8,$80
	.byte $c2,$09
	.byte $52,$10, $52,$10, $52,$10, $32,$08, $02,$08, $a0,$08, $02,$08, $32,$10, $52,$20
	.byte $c3,<pirate_sq1,>pirate_sq1,$03
pirate_sq1_1:
	.byte $52,$10, $52,$10, $52,$10, $32,$08, $02,$08, $a0,$08, $02,$08, $32,$10, $52,$10
	.byte $52,$10, $a2,$20, $c8,$10, $52,$10, $a2,$20, $c8,$10, $32,$10
	.byte $52,$10, $52,$10, $52,$10, $32,$08, $02,$08, $a0,$08, $02,$08, $32,$10, $52,$10
	.byte $a2,$10, $33,$20, $c8,$10, $a2,$10, $33,$20, $c8,$10, $32,$10
	.byte $50,$10,$50,$10,$50,$10,$50,$10, $30,$10,$30,$10,$30,$10,$30,$10
	.byte $00,$10,$00,$10,$00,$10,$50,$10, $00,$40
	.byte $c4,<pirate_sq1,>pirate_sq1
pirate_sq2:
	.byte $c2,$0e
	.byte $01,$10, $01,$10, $31,$10, $01,$08, $51,$10, $01,$08, $51,$10, $31,$10, $01,$10
	.byte $c2,$05
	.byte $51,$10, $51,$10, $51,$10, $31,$08, $01,$08, $a0,$08, $01,$08, $31,$10, $51,$20
	.byte $c2,$0e
	.byte $51,$10, $51,$10, $81,$10, $51,$08, $a1,$10, $51,$08, $a1,$10, $81,$10, $51,$10
	.byte $c2,$05
	.byte $51,$10, $51,$10, $51,$10, $31,$08, $01,$08, $a0,$08, $01,$08, $31,$10, $51,$20
	.byte $c3,<pirate_sq2,>pirate_sq2,$01
pirate_sq2_1:
	.byte $51,$10, $51,$10, $51,$10, $31,$08, $01,$08, $a0,$08, $01,$08, $31,$10, $52,$10
	.byte $52,$10, $a2,$20, $c8,$10, $52,$10, $a2,$20, $c8,$10, $32,$10
	.byte $51,$10, $51,$10, $51,$10, $31,$08, $01,$08, $a0,$08, $01,$08, $31,$10, $52,$10
	.byte $a2,$10, $33,$20, $c8,$10, $a2,$10, $33,$20, $c8,$10, $32,$10
	.byte $50,$10,$50,$10,$50,$10,$50,$10, $30,$10,$30,$10,$30,$10,$30,$10
	.byte $00,$10,$00,$10,$00,$10,$50,$10, $00,$40
	.byte $c4,<pirate_sq2,>pirate_sq2
pirate_tri:
	.byte $c8,$80
	.byte $52,$10, $52,$10, $52,$10, $32,$08, $02,$08, $a1,$08, $02,$08, $32,$10, $52,$20
	.byte $c3,<pirate_tri,>pirate_tri,$03
pirate_tri1:
	.byte $52,$10, $52,$10, $52,$10, $32,$08, $02,$08, $a1,$08, $02,$08, $32,$10, $52,$10
	.byte $52,$10, $a2,$20, $c8,$10, $52,$10, $a2,$20, $c8,$10, $32,$10
	.byte $52,$10, $52,$10, $52,$10, $32,$08, $02,$08, $a1,$08, $02,$08, $32,$10, $52,$10
	.byte $a2,$10, $33,$20, $c8,$10, $a2,$10, $33,$20, $c8,$10, $32,$10
	.byte $52,$10,$52,$10,$52,$10,$52,$10, $32,$10,$32,$10,$32,$10,$32,$10
	.byte $02,$10,$02,$10,$02,$10,$51,$10, $01,$40
	.byte $c4,<pirate_tri,>pirate_tri
pirate_nse:
	.byte $c2,$15
	.byte $0e,$10, $00,$08,$00,$08, $0a,$10, $00,$08,$00,$08
	.byte $0e,$10, $00,$08,$00,$08, $0a,$10, $00,$08,$00,$08
	.byte $0e,$10, $0e,$10, $0e,$10, $00,$08, $00,$08, $0e,$10, $00,$08,$00,$08, $0a,$10, $00,$08,$00,$08
	.byte $c3,<pirate_nse,>pirate_nse,$03
pirate_nse1:
	.byte $0e,$08,$00,$08,$0a,$08,$00,$08
	.byte $c4,<pirate_nse1,>pirate_nse1






home_sq1:
	.byte $c2,$03
	.byte $51,$08, $02,$08, $92,$08, $02,$08
	.byte $51,$08, $52,$08, $92,$08, $02,$08
	.byte $51,$08, $02,$08, $52,$08, $02,$08
	.byte $72,$08, $52,$08, $22,$08, $02,$08
	.byte $c4,<home_sq1,>home_sq1
home_sq2:
	.byte $c2,$03
	.byte $52,$09, $03,$08, $93,$08, $03,$08
	.byte $52,$08, $53,$08, $93,$08, $03,$08
	.byte $52,$08, $03,$08, $53,$08, $03,$08
	.byte $73,$08, $53,$08, $23,$08, $03,$07
	.byte $c4,<home_sq2,>home_sq2
home_tri:
	.byte $c8,$80,$c8,$80
home_tri1:
	.byte $53,$18, $93,$08
	.byte $23,$18, $53,$08
	.byte $a2,$20
	.byte $23,$0b, $03,$0b, $23,$0a
	.byte $93,$18, $73,$08
	.byte $53,$18, $23,$08
	.byte $03,$20
	.byte $23,$0b, $03,$0b, $23,$0a
	.byte $c4,<home_tri1,>home_tri1
home_nse:
	.byte $c8,$80,$c8,$80
home_nse1:
	.byte $c2,$15
	.byte $0e,$10, $00,$10, $0a,$10, $00,$10
	.byte $00,$10, $0e,$10, $0a,$10, $00,$10
	.byte $0e,$10, $00,$10, $0a,$10, $00,$10
	.byte $0e,$10, $0e,$10, $0a,$10, $00,$10
	.byte $c4,<home_nse1,>home_nse1







stadi_sq1:
	.byte $c8,$80,$c8,$80
stadi_sq1_1:
	.byte $c2,$06
	.byte $00,$04,$30,$04,$00,$04,$c8,$04, $00,$04,$30,$04,$00,$04,$c8,$04
	.byte $00,$04,$30,$04,$00,$04,$c8,$04, $00,$04,$30,$04,$00,$04,$c8,$04
	.byte $50,$04,$70,$04,$50,$04,$c8,$04, $50,$04,$70,$04,$50,$04,$c8,$04
	.byte $50,$04,$70,$04,$50,$04,$c8,$04, $50,$04,$70,$04,$50,$04,$c8,$04
	.byte $70,$04,$a0,$04,$70,$04,$c8,$04, $70,$04,$a0,$04,$70,$04,$c8,$04
	.byte $70,$04,$a0,$04,$70,$04,$c8,$04, $70,$04,$a0,$04,$70,$04,$c8,$04
	.byte $00,$04,$30,$04,$00,$04,$c8,$04, $00,$04,$30,$04,$00,$04,$c8,$04
	.byte $00,$04,$30,$04,$00,$04,$c8,$04, $00,$04,$30,$04,$00,$04,$c8,$04
	.byte $c4,<stadi_sq1_1,>stadi_sq1_1
stadi_sq2:
	.byte $c8,$80,$c8,$80,$c8,$80,$c8,$80
stadi_sq2_1:
	.byte $c2,$05
	.byte $30,$04,$60,$04,$30,$04,$c8,$04, $70,$04,$a0,$04,$70,$04,$c8,$04
	.byte $30,$04,$60,$04,$30,$04,$c8,$04, $70,$04,$a0,$04,$70,$04,$c8,$04
	.byte $80,$04,$a0,$04,$80,$04,$c8,$04, $80,$04,$a0,$04,$80,$04,$c8,$04
	.byte $80,$04,$a0,$04,$80,$04,$c8,$04, $80,$04,$a0,$04,$80,$04,$c8,$04
	.byte $a0,$04,$70,$04,$a0,$04,$c8,$04, $a0,$04,$70,$04,$a0,$04,$c8,$04
	.byte $a0,$04,$70,$04,$a0,$04,$c8,$04, $a0,$04,$70,$04,$a0,$04,$c8,$04
	.byte $30,$04,$60,$04,$30,$04,$c8,$04, $70,$04,$a0,$04,$70,$04,$c8,$04
	.byte $30,$04,$60,$04,$30,$04,$c8,$04, $70,$04,$a0,$04,$70,$04,$c8,$04
	.byte $c3,<stadi_sq2_1,>stadi_sq2_1,$01
	.byte $c8,$80,$c8,$80
	.byte $70,$04,$a0,$04,$70,$04,$c8,$04, $70,$04,$a0,$04,$70,$04,$c8,$04
	.byte $70,$04,$a0,$04,$70,$04,$c8,$04, $70,$04,$a0,$04,$70,$04,$c8,$04
	.byte $01,$04,$21,$04,$01,$04,$c8,$04, $01,$04,$21,$04,$01,$04,$c8,$04
	.byte $01,$04,$21,$04,$01,$04,$c8,$04, $01,$04,$21,$04,$01,$04,$c8,$04
	.byte $21,$04,$51,$04,$91,$04,$c8,$04, $21,$04,$51,$04,$91,$04,$c8,$04
	.byte $21,$04,$51,$04,$91,$04,$c8,$04, $21,$04,$51,$04,$91,$04,$c8,$04
	.byte $70,$04,$a0,$04,$70,$04,$c8,$04, $70,$04,$a0,$04,$70,$04,$a0,$04
	.byte $70,$04,$a0,$04,$70,$04,$21,$04, $70,$04,$21,$04,$70,$04,$21,$04
stadi_sq2_2:
	.byte $02,$30, $32,$08, $72,$08
	.byte $52,$28, $72,$18
	.byte $32,$10, $32,$10, $32,$08, $a1,$08, $32,$10
	.byte $02,$40
	.byte $c3,<stadi_sq2_2,>stadi_sq2_2,$01
	.byte $c4,<stadi_sq2_1,>stadi_sq2_1
stadi_tri:
	.byte $c1,$01
	.byte $02,$08, $02,$04,$02,$04, $02,$08, $02,$04,$02,$04
	.byte $02,$08, $c8,$18
	.byte $52,$08, $52,$04,$52,$04, $52,$08, $52,$04,$52,$04
	.byte $52,$08, $c8,$18
	.byte $72,$08, $72,$04,$72,$04, $72,$08, $72,$04,$72,$04
	.byte $72,$08, $c8,$08, $72,$08, $52,$08
	.byte $02,$08, $02,$04,$02,$04, $02,$08, $02,$04,$02,$04
	.byte $02,$08, $c8,$18
	.byte $c4,<stadi_tri,>stadi_tri
stadi_nse:
	.byte $c2,$05
	.byte $0e,$04, $c8,$0c, $0d,$04, $c8,$0c
	.byte $0e,$08, $c8,$08, $0d,$04, $c8,$0c
	.byte $0e,$04, $c8,$0c, $0d,$04, $c8,$0c
	.byte $0e,$04,$c8,$04, $0e,$04,$c8,$04, $0d,$04, $c8,$0c
	.byte $c4,<stadi_nse,>stadi_nse



final_sq1:
	.byte $c2,$16
	.byte $a3,$20, $33,$20, $33,$08, $53,$08, $63,$18, $33,$08, $53,$08, $63,$18
	.byte $73,$30, $63,$08,$64,$08,$54,$08,$44,$08,$34,$08,$14,$08, $63,$10, $33,$10, $33,$08,$63,$08
	.byte $a3,$20, $33,$20, $33,$01,$33,$01,$33,$01,$33,$01,$33,$01,$33,$01,$33,$01,$33,$01, $53,$08, $63,$18, $33,$08, $53,$08, $63,$18
	.byte $73,$30, $63,$08,$64,$08,$54,$08,$44,$08,$34,$08,$14,$08, $63,$10, $33,$10, $33,$08,$63,$08
	.byte $c4,<final_sq1,>final_sq1
final_sq2:
	.byte $c2,$05
;	.byte $a0,$20, $30,$20
	.byte $30,$08,$50,$08,$30,$08,$80,$08,$30,$20
	.byte $10,$08,$30,$10,$60,$08,$30,$30
	.byte $30,$08,$50,$08,$30,$08,$80,$08,$30,$0d, $30,$01,$40,$01,$50,$01, $60,$08,$60,$08
	.byte $50,$08,$40,$08,$30,$08,$10,$08,$60,$08,$60,$08,$30,$08,$30,$08,$30,$08,$60,$08
	.byte $30,$08,$50,$08,$30,$08,$80,$18,$30,$08,$30,$08
	.byte $10,$08,$30,$08,$30,$08,$60,$08,$30,$08,$30,$08,$30,$08,$30,$08,$30,$08,$30,$08
	.byte $30,$08,$50,$08,$c9,$fe,$80,$10,$c9,$00,$30,$10, $60,$08,$60,$08
	.byte $50,$08,$40,$08,$30,$08,$10,$08,$60,$08,$60,$08,$30,$08,$30,$08,$30,$08, $90,$01,$80,$01,$70,$01,$60,$01,$50,$01,$40,$01,$30,$01,$20,$01
	.byte $c4,<final_sq2,>final_sq2
final_tri:
	.byte $c1,$04
	.byte $32,$08,$52,$08, $c1,$07,$31,$08, $c1,$06,$82,$08, $c1,$07,$31,$08,$31,$08,$31,$08,$31,$08
	.byte $c1,$04
	.byte $12,$08,$32,$08, $c1,$07,$31,$08, $c1,$06,$62,$08, $c1,$07,$31,$08,$c1,$00,$32,$10,$c1,$07,$31,$08,$31,$08,$31,$08;,$c1,$07,$31,$08,$c1,$00,$32,$10
	.byte $c4,<final_tri,>final_tri
final_nse:
	.byte $c2,$15
	.byte $0f,$08,$0f,$08, $00,$08, $0a,$08, $00,$04,$00,$04,$00,$08, $00,$08,$00,$08
	.byte $0f,$08,$0f,$08, $00,$08,$00,$08, $0a,$04,$00,$04,$00,$08, $00,$10, $0f,$08,$00,$08
	.byte $0f,$08,$0f,$08, $00,$08, $0a,$08, $00,$04,$00,$04,$00,$08, $00,$08,$00,$08
	.byte $0f,$08,$0f,$08, $00,$08,$00,$08, $0a,$04,$00,$04,$00,$08, $0a,$10, $0f,$08,$00,$08
	.byte $c4,<final_nse,>final_nse





ball_sq1:
	.byte $c2,$0e
	.byte $32,$20, $33,$10, $03,$10, $a2,$10, $72,$10, $a2,$30, $52,$30
	.byte $32,$20, $33,$10, $03,$10, $a2,$10, $72,$10, $a2,$60
	.byte $03,$10, $b2,$10, $03,$10, $72,$10, $82,$10, $a2,$10
	.byte $03,$20, $82,$10, $52,$30
	.byte $03,$20, $03,$10, $03,$10, $23,$10, $33,$10
	.byte $53,$10, $23,$10, $03,$10, $a2,$10, $72,$10, $52,$10
	.byte $c4,<ball_sq1,>ball_sq1
ball_sq2:
	.byte $ff
ball_tri:
	.byte $c1,$02
	.byte $32,$10,$72,$10,$72,$10, $a1,$10,$32,$10,$32,$10, $a1,$10,$22,$10,$22,$10, $51,$10,$71,$10,$71,$10
	.byte $32,$10,$72,$10,$72,$10, $a1,$10,$32,$10,$32,$10, $a1,$10,$22,$10,$22,$10, $a1,$10,$b1,$10,$02,$10
	.byte $02,$10,$42,$10,$42,$10, $71,$10,$42,$10,$42,$10, $52,$10,$82,$10,$82,$10, $02,$10,$82,$10,$82,$10
	.byte $52,$10,$92,$10,$92,$10, $02,$10,$92,$10,$92,$10, $a1,$10,$a2,$10,$a2,$10, $52,$10,$82,$10,$82,$10
	.byte $c4,<ball_tri,>ball_tri





store_sq1:
	.byte $c2,$06
	.byte $32,$10, $a2,$10, $82,$10, $52,$10, $32,$10, $a2,$10, $03,$20
	.byte $32,$10, $a2,$10, $82,$10, $52,$10, $32,$10, $32,$10, $32,$20
	.byte $c4,<store_sq1,>store_sq1
store_sq2:
	.byte $c8,$04
store_sq2_1:
	.byte $c2,$06
	.byte $32,$10, $a2,$10, $82,$10, $52,$10, $32,$10, $a2,$10, $03,$20
	.byte $32,$10, $a2,$10, $82,$10, $52,$10, $32,$08,$32,$08, $32,$08,$32,$08, $32,$20
	.byte $32,$10, $a2,$10, $82,$10, $52,$10, $32,$10, $a2,$10, $03,$20
	.byte $32,$10, $a2,$10, $82,$10, $52,$10, $32,$0c, $33,$10, $63,$24
	.byte $c4,<store_sq2_1,>store_sq2_1
store_tri:
	.byte $c1,$01
	.byte $32,$03,$32,$05,$a1,$08, $a2,$08,$51,$08, $83,$03,$82,$05,$32,$08, $52,$08,$02,$08
	.byte $32,$10, $a2,$10, $02,$08,$03,$08,$02,$08,$03,$08
	.byte $32,$03,$32,$05,$a1,$08, $a2,$08,$51,$08, $83,$03,$82,$05,$32,$08, $52,$08,$02,$08
	.byte $32,$08,$31,$08, $31,$08,$32,$08, $32,$08,$33,$08,$32,$08,$33,$08
	.byte $c4,<store_tri,>store_tri
store_nse:
	.byte $c8,$80
	.byte $c3,<store_nse,>store_nse,$01
store_nse1:
	.byte $c2,$02
	.byte $0f,$08,$00,$08, $00,$08,$00,$04,$00,$04, $0a,$08,$00,$08, $00,$08,$00,$08
	.byte $0f,$08,$00,$08, $00,$08,$00,$04,$00,$04, $0a,$08,$05,$08, $00,$08,$00,$08
	.byte $c4,<store_nse1,>store_nse1





slums_sq1:
	.byte $c8,$80
	.byte $c3,<slums_sq1,>slums_sq1,$03
slums_sq1_1:
	.byte $c2,$0e
	.byte $70,$08,$60,$08,$70,$08,$60,$08,$70,$08,$60,$08,$70,$08,$60,$08
	.byte $50,$08,$40,$08,$50,$08,$40,$08,$50,$08,$40,$08,$50,$08,$40,$08
	.byte $c3,<slums_sq1_1,>slums_sq1_1,$02
	.byte $90,$08,$80,$08,$90,$08,$80,$08,$90,$08,$80,$08,$90,$08,$80,$08
	.byte $70,$08,$60,$08,$70,$08,$60,$08,$70,$08,$60,$08,$70,$08,$60,$08
	.byte $c4,<slums_sq1_1,>slums_sq1_1
slums_sq2:
	.byte $c8,$80
	.byte $c3,<slums_sq2,>slums_sq2,$07
slums_sq2_1:
	.byte $c2,$09
	.byte $33,$18,$c9,$02,$33,$08,$c9,$00, $53,$18,$c9,$02,$53,$08,$c9,$00
	.byte $03,$08,$c9,$01,$03,$18,$c9,$00, $23,$10,$c9,$01,$23,$10,$c9,$00
	.byte $c3,<slums_sq2_1,>slums_sq2_1,$02
slums_sq2_2:
	.byte $34,$18,$c9,$fe,$34,$08,$c9,$00, $54,$18,$c9,$fe,$54,$08,$c9,$00
	.byte $c3,<slums_sq2_2,>slums_sq2_2,$01
	.byte $c4,<slums_sq2,>slums_sq2
slums_tri:
	.byte $72,$08, $92,$08, $02,08, $c8,$08, $02,$08, $c8,$08, $02,$08, $72,$10, $92,$08, $02,$08, $c8,$08, $02,$08, $c8,$18
	.byte $c3,<slums_tri,>slums_tri,$02
	.byte $92,$08, $b2,$08, $22,08, $c8,$08, $22,$08, $c8,$08, $22,$08, $92,$10, $b2,$08, $22,$08, $c8,$08, $22,$08, $c8,$10, $72,$08
	.byte $c4,<slums_tri,>slums_tri
slums_nse:
	.byte $c2,$15
	.byte $0f,$08, $00,$04,$00,$04,$00,$04,$00,$04, $00,$08, $0a,$08, $0f,$10, $0f,$10, $05,$08, $00,$04,$00,$04,$00,$04,$00,$04, $0a,$08, $00,$04,$00,$04,$05,$08,$00,$04,$00,$04
	.byte $c4,<slums_nse,>slums_nse






win_sq2:
	.byte $c2,$0e
	.byte $a3,$10, $83,$08, $a3,$40
	.byte $ff
win_tri:
	.byte $33,$10, $13,$08, $53,$40
	.byte $ff

run_nse:
	.byte $c2,$05
	.byte $00,$08,$01,$08,$00,$08,$01,$08
	.byte $ff


circus_sq1:
	.byte $c2,$05
	.byte $c1,$0c,$33,$10, $23,$10,  $c1,$04,$13,$08,$23,$08,$13,$08,$03,$08, $c1,$0c,$b2,$10, $a2,$10, $c1,$00,$82,$10, $a2,$10
	.byte $c1,$0c,$03,$10, $b2,$10,  $c1,$04,$a2,$08,$b2,$08,$a2,$08,$92,$08, $c1,$0c,$82,$10, $72,$10, $c1,$00,$62,$10, $72,$10
circus_sq1_1:
	.byte $a2,$10, $c1,$04,$82,$08,$82,$08,$c1,$00, $32,$10, $52,$10
	.byte $c3,<circus_sq1_1,>circus_sq1_1,$01
	.byte $23,$08,$33,$08,$43,$08,$53,$08,$63,$08,$73,$08,$83,$08,$93,$08
	.byte $a3,$08,$b3,$08,$04,$08,$24,$08, $04,$10, $a3,$10
	.byte $c4,<circus_sq1,>circus_sq1
circus_sq2:
	.byte $c2,$0e
	.byte $c8,$10
	.byte $c1,$10,$71,$20,$71,$20,$71,$20,$71,$20,$71,$20,$71,$20,$71,$20,$71,$20
	.byte $81,$20,$81,$20,$81,$20,$81,$10
	.byte $81,$10, $71,$10, $51,$10, $31,$10, $21,$10, $01,$10, $a0,$10, $81,$10
	.byte $c4,<circus_sq2,>circus_sq2
circus_tri:
	.byte $c1,$10,$32,$20,$c1,$00, $a1,$20
	.byte $c3,<circus_tri,>circus_tri,$03
	.byte $22,$20, $a1,$20, $22,$20, $a1,$20
	.byte $82,$10, $72,$10, $52,$10, $32,$10, $22,$10, $02,$10, $a1,$10, $22,$10
	.byte $c4,<circus_tri,>circus_tri




karn_sq1:
	.byte $c2,$0e
	.byte $31,$08, $b0,$08, $a0,$08, $b0,$08, $11,$08, $31,$08, $51,$08, $b0,$08
	.byte $61,$08, $51,$08, $31,$08, $51,$08, $11,$08, $b0,$08, $a0,$08, $11,$08
	.byte $80,$08, $a0,$08, $b0,$08, $80,$08, $a0,$08, $b0,$08, $60,$08, $a0,$08
	.byte $80,$20, $c8,$20
	.byte $61,$08, $21,$08, $11,$08, $21,$08, $41,$08, $61,$08, $71,$08, $41,$08
	.byte $91,$08, $81,$08, $61,$08, $81,$08, $21,$08, $41,$08, $11,$08, $90,$08
	.byte $b0,$08, $11,$08, $21,$08, $b0,$08, $11,$08, $21,$08, $90,$08, $11,$08
	.byte $b0,$20, $c8,$20
karn_1second:
	.byte $c2,$0d
	.byte $91,$10, $91,$10, $91,$10, $91,$10, $91,$10, $91,$08, $51,$08, $c8,$08, $c2,$09,$51,$08, $c8,$08, $51,$08
	.byte $c3,<karn_1second,>karn_1second,$01
karn_1third:
	.byte $c2,$0d
	.byte $02,$10, $02,$10, $02,$10, $02,$10, $02,$10, $02,$08, $81,$08, $c8,$08, $c2,$09,$81,$08, $c8,$08, $81,$08
	.byte $c3,<karn_1third,>karn_1third,$01
	.byte $c4,<karn_sq1,>karn_sq1
karn_sq2:
	.byte $c2,$0e
	.byte $a0,$08, $60,$08, $50,$08, $60,$08, $80,$08, $a0,$08, $01,$08, $60,$08
	.byte $11,$08, $01,$08, $a0,$08, $01,$08, $80,$08, $60,$08, $50,$08, $80,$08
	.byte $30,$08, $50,$08, $60,$08, $30,$08, $50,$08, $60,$08, $10,$08, $50,$08
	.byte $30,$20, $c8,$20
	.byte $11,$08, $90,$08, $80,$08, $90,$08, $b0,$08, $11,$08, $21,$08, $b0,$08
	.byte $41,$08, $31,$08, $11,$08, $31,$08, $90,$08, $b0,$08, $80,$08, $40,$08
	.byte $60,$08, $80,$08, $90,$08, $60,$08, $80,$08, $90,$08, $40,$08, $80,$08
	.byte $60,$20, $c8,$20
karn_2second:
	.byte $c2,$0d
	.byte $61,$10, $61,$10, $51,$10, $51,$10, $61,$10, $61,$08, $51,$08, $c8,$20
	.byte $c3,<karn_2second,>karn_2second,$01
karn_2third:
	.byte $91,$10, $91,$10, $81,$10, $81,$10, $91,$10, $91,$08, $81,$08, $c8,$20
	.byte $c3,<karn_2third,>karn_2third,$01
	.byte $c4,<karn_sq2,>karn_sq2
; cheat sheet:
; A=0 #=1 B=2 C=3 #=4 D=5 #=6 E=7 F=8 #=9 G=a #=b
karn_tri:
	.byte $32,$08, $b1,$08, $a1,$08, $b1,$08, $12,$08, $32,$08, $52,$08, $b1,$08
	.byte $62,$08, $52,$08, $32,$08, $52,$08, $12,$08, $b1,$08, $a1,$08, $12,$08
	.byte $81,$08, $a1,$08, $b1,$08, $81,$08, $a1,$08, $b1,$08, $61,$08, $a1,$08
	.byte $81,$20, $c8,$20
	.byte $62,$08, $22,$08, $12,$08, $22,$08, $42,$08, $62,$08, $72,$08, $42,$08
	.byte $92,$08, $82,$08, $62,$08, $82,$08, $22,$08, $42,$08, $12,$08, $91,$08
	.byte $b1,$08, $12,$08, $22,$08, $b1,$08, $12,$08, $22,$08, $91,$08, $12,$08
	.byte $b1,$20, $c8,$20
	.byte $61,$20, $51,$20, $61,$18, $c8,$28
	.byte $61,$20, $51,$20, $61,$18, $c8,$28
	.byte $92,$20, $82,$20, $92,$18, $c8,$28
	.byte $92,$20, $82,$20, $92,$18, $c8,$28
	.byte $c4,<karn_tri,>karn_tri
karn_nse:
	.byte $c2,$06
	.byte $0e,$08,$00,$08, $0a,$08,$00,$08
	.byte $c3,<karn_nse,>karn_nse,$0f
karn_nse1:
	.byte $c2,$06
	.byte $0e,$08,$00,$08,$0e,$08,$00,$08, $0a,$08, $00,$08,$00,$08,$00,$08
	.byte $0e,$08,$00,$08,$00,$08,$00,$08, $0a,$08, $00,$08,$00,$08,$00,$08
	.byte $c3,<karn_nse1,>karn_nse1,$03
	.byte $c4,<karn_nse,>karn_nse




junk_sq1:
	.byte $c2,$01
	.byte $51,$04,$c8,$14,$62,$08, $33,$04,$c8,$0c,$91,$10, $c8,$08,$62,$20, $c8,$04,$13,$08,$c8,$04,$82,$10
	.byte $51,$04,$c8,$14,$62,$08, $33,$04,$c8,$0c,$91,$10, $c8,$08,$62,$60
	.byte $c3,<junk_sq1,>junk_sq1,$01
	.byte $52,$04,$c8,$14,$63,$08, $34,$04,$c8,$0c,$92,$10, $c8,$08,$63,$20, $c8,$04,$14,$08,$c8,$04,$83,$10
	.byte $52,$04,$c8,$14,$63,$08, $34,$04,$c8,$0c,$92,$10, $c8,$08,$63,$60
	.byte $c4,<junk_sq1,>junk_sq1
junk_sq2:
	.byte $c2,$01
	.byte $81,$04,$c8,$14,$92,$08, $63,$04,$c8,$0c,$02,$10, $c8,$08,$92,$20, $c8,$04,$43,$08,$c8,$04,$b2,$10
	.byte $81,$04,$c8,$14,$92,$08, $63,$04,$c8,$0c,$02,$10, $c8,$08,$92,$60
	.byte $c3,<junk_sq2,>junk_sq2,$02
	.byte $51,$04,$c8,$14,$62,$08, $33,$04,$c8,$0c,$91,$10, $c8,$08,$62,$20, $c8,$04,$13,$08,$c8,$04,$82,$10
	.byte $51,$04,$c8,$14,$82,$08, $03,$04,$c8,$0c,$b1,$10, $c8,$08,$a2,$10,$72,$10,$82,$10,$92,$10,$a2,$10,$b2,$10
	.byte $c4,<junk_sq2,>junk_sq2
junk_tri:
	.byte $c1,$01
	.byte $22,$08
	.byte $c3,<junk_tri,>junk_tri,$10
junk_tri1:
	.byte $62,$08
	.byte $c3,<junk_tri1,>junk_tri1,$14
junk_tri2:
	.byte $c1,$01
	.byte $82,$08
	.byte $c3,<junk_tri2,>junk_tri2,$10
junk_tri3:
	.byte $32,$08
	.byte $c3,<junk_tri3,>junk_tri3,$14
	.byte $c4,<junk_tri,>junk_tri
junk_nse:
	.byte $c2,$15
	.byte $0f,$08,$00,$08,$00,$08,$0a,$08,$00,$08,$00,$08
	.byte $c3,<junk_nse,>junk_nse,$02
junk_nse1:
	.byte $0f,$08,$0f,$08,$00,$08,$0a,$08,$00,$08,$00,$08
	.byte $c4,<junk_nse,>junk_nse





btl_intro_sq1:
	.byte $c2,$01
	.byte $a2,$02,$b2,$1e,$a2,$02,$b2,$1e,$a2,$02,$b2,$1e, $ff
btl_intro_sq2:
	.byte $c2,$01
	.byte $32,$02,$42,$1e,$32,$02,$42,$1e,$32,$02,$42,$1e, $ff
btl_intro_tri:
	.byte $32,$02,$42,$1e,$32,$02,$42,$1e,$32,$02,$42,$1e, $ff
btl_intro_nse:
	.byte $c2,$02, $0a,$20, $0a,$20, $0a,$20, $ff



battle_sq1:
	.byte $c2,$05
	.byte $00,$10, $00,$08,$00,$08, $30,$08,$50,$10, $00,$10, $00,$08,$00,$08,$00,$08, $30,$08,$50,$08,$80,$10
	.byte $00,$10, $00,$08,$00,$08, $30,$08,$50,$10, $00,$10, $a0,$08,$80,$08,$50,$08, $80,$08,$50,$08,$30,$10
	.byte $00,$10, $00,$08,$00,$08, $30,$08,$50,$10, $00,$10, $00,$08,$00,$08,$00,$08, $30,$08,$50,$08,$80,$10
	.byte $00,$10, $00,$08,$00,$08, $30,$08,$50,$10, $00,$10, $31,$08,$11,$08,$a0,$08, $80,$08,$50,$08,$30,$10
	.byte $c3,<battle_sq1,>battle_sq1,$02
battle_sq1_1:
	.byte $c2,$05
	.byte $50,$10, $50,$08,$50,$08, $80,$08,$a0,$10, $50,$10, $50,$08,$50,$08,$50,$08, $80,$08,$a0,$08,$11,$10
	.byte $50,$10, $50,$08,$50,$08, $80,$08,$a0,$10, $50,$10, $31,$08,$11,$08,$a0,$08, $11,$08,$a0,$08,$80,$10
	.byte $50,$10, $50,$08,$50,$08, $80,$08,$a0,$10, $50,$10, $50,$08,$50,$08,$50,$08, $80,$08,$a0,$08,$11,$10
	.byte $50,$10, $50,$08,$50,$08, $80,$08,$a0,$10, $50,$10, $81,$08,$61,$08,$31,$08, $11,$08,$a0,$08,$80,$10

	.byte $00,$10, $00,$08,$00,$08, $30,$08,$50,$10, $00,$10, $00,$08,$00,$08,$00,$08, $30,$08,$50,$08,$80,$10
	.byte $70,$10, $70,$08,$70,$08, $a0,$08,$01,$10, $70,$10, $51,$08,$31,$08,$01,$08, $31,$08,$01,$08,$a0,$10
	.byte $50,$10, $50,$08,$50,$08, $80,$08,$a0,$10, $50,$10, $50,$08,$50,$08,$50,$08, $80,$08,$a0,$08,$11,$10
	.byte $00,$10, $00,$08,$00,$08, $30,$08,$50,$10, $70,$10, $91,$08,$71,$08,$41,$08, $21,$08,$b0,$08,$90,$10
	.byte $c4,<battle_sq1,>battle_sq1
battle_sq2:
	.byte $c2,$01
	.byte $50,$10, $50,$08,$50,$08, $80,$08,$a0,$10, $50,$10, $50,$08,$50,$08,$50,$08, $80,$08,$a0,$08,$11,$10
	.byte $50,$10, $50,$08,$50,$08, $80,$08,$a0,$10, $50,$10, $31,$08,$11,$08,$a0,$08, $11,$08,$a0,$08,$80,$10
	.byte $50,$10, $50,$08,$50,$08, $80,$08,$a0,$10, $50,$10, $50,$08,$50,$08,$50,$08, $80,$08,$a0,$08,$11,$10
	.byte $50,$10, $50,$08,$50,$08, $80,$08,$a0,$10, $50,$10, $81,$08,$61,$08,$31,$08, $11,$08,$a0,$08,$80,$10
	.byte $c3,<battle_sq2,>battle_sq2,$01
battle_sq2_1:
	.byte $c2,$0e
	.byte $73,$40,$03,$10,$23,$10,$33,$10,$93,$10
	.byte $73,$20,$23,$20,$03,$10,$a2,$10,$92,$10,$82,$10
	.byte $72,$40,$02,$08,$03,$08,$22,$08,$23,$08,$32,$08,$33,$08,$92,$08,$93,$08
	.byte $c9,$ff,$53,$80, $c9,$00
	.byte $93,$40,$23,$10,$43,$10,$53,$10,$b3,$10
	.byte $93,$40,$23,$10,$43,$10,$53,$10,$b3,$10
	.byte $93,$40,$23,$10,$43,$10,$53,$10,$b3,$10
	.byte $c9,$01,$b3,$80, $c9,$00
battle_sq2_2:
	.byte $c2,$01
	.byte $50,$10, $50,$08,$50,$08, $80,$08,$a0,$10, $50,$10, $50,$08,$50,$08,$50,$08, $80,$08,$a0,$08,$11,$10
	.byte $72,$10, $72,$08,$72,$08, $a2,$08,$02,$10, $72,$10, $52,$08,$32,$08,$02,$08, $32,$08,$02,$08,$a2,$10
	.byte $03,$06,$33,$05,$73,$05,$03,$06,$33,$05,$73,$05,$03,$06,$33,$05,$73,$05,$03,$06,$33,$05,$73,$05
	.byte $c2,$0e, $72,$0c,$73,$04,$93,$10, $c9,$02,$94,$18,$33,$18,$c9,$fe,$33,$38,$c9,$00, $c2,$01, $94,$08,$73,$08,$43,$08, $24,$08,$b3,$08,$93,$10
	.byte $c4,<battle_sq2,>battle_sq2
battle_tri:
	.byte $02,$10, $02,$08,$02,$08, $32,$08,$52,$10, $02,$10, $02,$08,$02,$08,$02,$08, $32,$08,$52,$08,$82,$10
	.byte $02,$10, $02,$08,$02,$08, $32,$08,$52,$10, $02,$10, $a2,$08,$82,$08,$52,$08, $82,$08,$52,$08,$32,$10
	.byte $02,$10, $02,$08,$02,$08, $32,$08,$52,$10, $02,$10, $02,$08,$02,$08,$02,$08, $32,$08,$52,$08,$82,$10
	.byte $02,$10, $02,$08,$02,$08, $32,$08,$52,$10, $02,$10, $33,$08,$13,$08,$a2,$08, $82,$08,$52,$08,$32,$10
	.byte $c3,<battle_tri,>battle_tri,$02
battle_tri1:
	.byte $52,$10, $52,$08,$52,$08, $82,$08,$a2,$10, $52,$10, $52,$08,$52,$08,$52,$08, $82,$08,$a2,$08,$13,$10
	.byte $52,$10, $52,$08,$52,$08, $82,$08,$a2,$10, $52,$10, $33,$08,$13,$08,$a2,$08, $13,$08,$a2,$08,$82,$10
	.byte $52,$10, $52,$08,$52,$08, $82,$08,$a2,$10, $52,$10, $52,$08,$52,$08,$52,$08, $82,$08,$a2,$08,$13,$10
	.byte $52,$10, $52,$08,$52,$08, $82,$08,$a2,$10, $52,$10, $83,$08,$63,$08,$33,$08, $13,$08,$a2,$08,$82,$10

	.byte $02,$10, $02,$08,$02,$08, $32,$08,$52,$10, $02,$10, $02,$08,$02,$08,$02,$08, $32,$08,$52,$08,$82,$10
	.byte $72,$10, $72,$08,$72,$08, $a2,$08,$03,$10, $72,$10, $53,$08,$33,$08,$03,$08, $33,$08,$03,$08,$a2,$10
	.byte $52,$10, $52,$08,$52,$08, $82,$08,$a2,$10, $52,$10, $52,$08,$52,$08,$52,$08, $82,$08,$a2,$08,$13,$10
	.byte $02,$10, $02,$08,$02,$08, $32,$08,$52,$10, $72,$10, $93,$08,$73,$08,$43,$08, $23,$08,$b2,$08,$92,$10
	.byte $c4,<battle_tri,>battle_tri
battle_nse:
	.byte $c2,$15, $0f,$08, $c2,$02,$00,$08, $c2,$15,$0a,$08, $c2,$02,$00,$08	; <--- straight beat
	.byte $c4,<battle_nse,>battle_nse


;battle_sq1:
;	.byte $c2,$05
;	.byte $70,$10, $00,$08,$c8,$08, $c8,$20
;	.byte $c8,$40
;	.byte $c3,<battle_sq1,>battle_sq1,$01
;battle_sq1_1:
;	.byte $90,$20, $70,$08,$90,$08,$70,$10
;	.byte $40,$10,$50,$10,$40,$10, $01,$10
;	.byte $c0,$10, $a0,$10, $90,$20
;	.byte $90,$20, $70,$08,$90,$08,$70,$10
;	.byte $40,$10,$50,$10,$40,$10, $01,$10
;	.byte $a0,$08, $50,$10, $a0,$08, $90,$20
;	.byte $c3,<battle_sq1_1,>battle_sq1_1,$03
;	.byte $ff
;battle_sq2:
;	.byte $c2,$01
;	.byte $70,$10, $00,$08,$c8,$08, $c8,$20
;	.byte $c8,$40
;	.byte $c3,<battle_sq2,>battle_sq2,$01
;battle_sq2_1:
;	.byte $91,$20, $71,$08,$91,$08,$71,$10
;	.byte $41,$10,$51,$10,$41,$10, $02,$10
;	.byte $c0,$10, $a1,$10, $91,$20
;	.byte $91,$20, $71,$08,$91,$08,$71,$10
;	.byte $41,$10,$51,$10,$41,$10, $02,$10
;	.byte $a1,$08, $51,$10, $a1,$08, $91,$20
;	.byte $c3,<battle_sq2_1,>battle_sq2_1,$03
;	.byte $ff






cave_sq1:
	.byte $c2,$16
	.byte $a3,$08,$53,$08,$33,$08,$a3,$08, $b3,$08,$63,$08,$33,$08,$b3,$08
	.byte $14,$08,$83,$08,$63,$08,$14,$08, $b3,$08,$63,$08,$53,$08,$b3,$08
	.byte $c3,<cave_sq1,>cave_sq1,$06
	.byte $a3,$08,$53,$08,$33,$08,$a3,$08, $b3,$08,$63,$08,$33,$08,$b3,$08
	.byte $14,$08,$83,$08,$30,$18,$10,$18
	.byte $c4,<cave_sq1,>cave_sq1
cave_sq2:
	.byte $c2,$05
	.byte $71,$40,$c8,$20,$70,$40,$60,$10, $30,$50
	.byte $61,$40,$c1,$01,$20,$08,$30,$08, $c1,$00,$b0,$50, $60,$30, $30,$18, $10,$18
	.byte $c4,<cave_sq2,>cave_sq2
cave_tri:
	.byte $c1,$01
	.byte $72,$40,$12,$08,$12,$08,$c8,$b0
	.byte $62,$40,$22,$08,$32,$08,$c8,$80, $c1,$00,$32,$18,$12,$18
	.byte $c4,<cave_tri,>cave_tri
cave_nse:
	.byte $c2,$02
	.byte $c8,$70, $00,$08,$00,$08
	.byte $c8,$60, $c2,$05,$00,$10, $c8,$08, $c2,$02,$00,$08
	.byte $c8,$70, $00,$08,$00,$08
	.byte $c8,$68, $c2,$05,$00,$18
	.byte $c2,$02
	.byte $c8,$30, $00,$08, $c8,$38, $00,$08,$c8,$08
	.byte $c8,$60, $c2,$05,$00,$08, $c8,$10, $c2,$02,$00,$08
	.byte $c8,$70, $c8,$08,$00,$08
	.byte $c8,$50, $c2,$05,$01,$18,$00,$18
	.byte $c4,<cave_nse,>cave_nse


shopping_sq1:
	.byte $c2,$16,$c6,$02
	.byte $52,$01,$92,$01,$02,$01,$c8,$05
	.byte $c3,<shopping_sq1,>shopping_sq1,$03
shopping_sq1_1:
	.byte $32,$01,$72,$01,$a1,$01,$c8,$05
	.byte $c3,<shopping_sq1_1,>shopping_sq1_1,$03
shopping_sq1_2:
	.byte $a2,$01,$23,$01,$53,$01,$c8,$05
	.byte $c3,<shopping_sq1_2,>shopping_sq1_2,$02
	.byte $82,$01,$03,$01,$33,$01,$c8,$05
	.byte $c8,$20
	.byte $c4,<shopping_sq1,>shopping_sq1
shopping_sq2:
	.byte $c2,$16,$c6,$02
	.byte $51,$20,$31,$20
	.byte $a1,$18, $81,$28
	.byte $c3,<shopping_sq2,>shopping_sq2,$03
shopping_sq2_1:
	.byte $91,$20,$31,$20
	.byte $51,$18, $02,$28
	.byte $91,$20,$a1,$20
	.byte $52,$18, $53,$28
	.byte $c4,<shopping_sq2,>shopping_sq2
shopping_tri:
	.byte $c1,$04
	.byte $51,$08, $c8,$08, $51,$08, $51,$08,    $31,$08, $c1,$06,$32,$08, $c8,$10
	.byte $c1,$04,$a1,$08, $c1,$06,$a2,$08, $c1,$04,$a1,$08, $81,$08,$c8,$20
	.byte $c1,$04
	.byte $51,$08, $c8,$08, $51,$08, $51,$08,    $31,$08, $c1,$06,$32,$08, $c8,$10
	.byte $c1,$04,$a1,$08, $c1,$06,$a2,$08, $c1,$04,$a1,$08, $81,$08,$c8,$10, $c1,$00,$31,$10
;	.byte $51,$20,$31,$20	orig
;	.byte $a1,$18, $81,$28	orig
	.byte $c4,<shopping_tri,>shopping_tri
shopping_nse:
	.byte $c2,$15,$0f,$08, $c2,$02,$00,$08, $c2,$15,$0f,$08,$0f,$08, $c2,$02,$00,$08,$c2,$15,$0a,$08, $c2,$02,$00,$08,$00,$08
	.byte $c4,<shopping_nse,>shopping_nse



silo_sq1:
	.byte $c2,$05
	.byte $30,$20,$00,$20,$30,$10,$a0,$10,$70,$20
	.byte $50,$08,$50,$08,$c8,$70
	.byte $30,$20,$00,$20,$30,$10,$a0,$10,$70,$20
	.byte $50,$08,$50,$08,	$c2,$16,$61,$28,$91,$10,$51,$38
	.byte $c4,<silo_sq1,>silo_sq1
silo_sq2:
	.byte $c2,$16
	.byte $a0,$08,$70,$08
	.byte $c3,<silo_sq2,>silo_sq2,$07
silo_sq2_1:
	.byte $50,$08,$20,$08
	.byte $c3,<silo_sq2_1,>silo_sq2_1,$07
	.byte $c4,<silo_sq2,>silo_sq2
silo_tri:
	.byte $c1,$08
	.byte $32,$10, $c1,$06,$33,$08, $c1,$08,$32,$10,$c1,$06,$33,$08, $c8,$20, $a1,$10, $32,$08,$c1,$06,$a2,$08, $c1,$00,$42,$10
	.byte $52,$10, $c1,$06,$53,$08, $c1,$08,$52,$10,$c1,$06,$53,$08, $c8,$20, $02,$10, $12,$08,$c1,$06,$82,$08, $c1,$00,$22,$10
	.byte $c4,<silo_tri,>silo_tri
silo_nse:
	.byte $c2,$15,$0f,$10, $c2,$02,$00,$10, $c2,$15,$0a,$10, $c2,$02,$00,$10
	.byte $c3,<silo_nse,>silo_nse,$01
	.byte $c2,$15,$0f,$10, $0f,$08, $c2,$02,$00,$04,$00,$04, $c2,$15,$0a,$10, $c2,$02,$00,$10
	.byte $c2,$15,$0f,$10, $c2,$02,$00,$10, $c2,$15,$0a,$10, $c2,$02,$00,$10
	.byte $c4,<silo_nse,>silo_nse


; cheat sheet:
; A=0 #=1 B=2 C=3 #=4 D=5 #=6 E=7 F=8 #=9 G=a #=b
detec_sq1:
;	.byte $c2,$01
;	.byte $c8,$80, $c8,$80, $c8,$80, $c8,$68
;	.byte $73,$08,$83,$08, $c8,$08
;	.byte $24,$08, $34,$80, $83,$68, $73,$08,$83,$08,$c8,$08 ;$81,$08,$b1,$10
;	.byte $23,$14,$33,$13,$82,$13, $23,$13,$33,$13, $82,$48, $80,$08, $b0,$10
;	.byte $31,$20, $82,$20, $72,$20, $31,$60
	.byte $ff
;	.byte $31, $62, $52, $11, $42, $b0, $b0, $80, $50, $80
detec_sq2:
	.byte $ff
detec_tri:	; c0 length
	.byte $82,$20, $62,$20, $42,$20, $32,$20, $12,$20, $b1,$20, $a1,$20, $c1,$01,$81,$18, $32,$08,$c1,$00
	.byte $c4,<detec_tri,>detec_tri
	.byte $ff
detec_nse:
	.byte $c2,$05
	.byte $00,$20, $c2,$02, $0a,$18, $00,$08
	.byte $c4,<detec_nse,>detec_nse
	.byte $ff





oworld_sq1:
	.byte $c2,$16, $c6,$04
	.byte $a1,$08,$a1,$08, $a1,$08,$02,$08, $12,$08,$32,$08, $32,$08,$32,$08
	.byte $32,$08,$12,$08, $12,$08,$02,$08, $02,$08,$a1,$08, $12,$10
	.byte $a1,$08,$a1,$08, $a1,$08,$02,$08, $12,$08,$32,$08, $32,$08,$52,$08
	.byte $52,$08,$32,$08, $32,$08,$52,$08, $52,$08,$a2,$08, $52,$10
	.byte $c4,<oworld_sq1,>oworld_sq1
oworld_sq2:
	.byte $c2,$04
	.byte $a1,$18,$02,$08, $12,$08,$32,$08, $c8,$08,$32,$08
	.byte $c8,$08,$12,$08, $c8,$08,$02,$08, $c8,$08,$a1,$08, $12,$10
	.byte $a1,$08,$c8,$08, $c8,$08,$02,$08, $12,$08,$32,$08, $c8,$08,$52,$08
	.byte $c8,$08,$32,$08, $c8,$08,$52,$08, $c8,$08,$a2,$08, $52,$10
	.byte $c3,<oworld_sq2,>oworld_sq2,$02
	.byte $c2,$04
	.byte $71,$18,$32,$08, $12,$08,$32,$08, $c8,$08,$72,$08
	.byte $c8,$08,$92,$08, $c8,$08,$82,$08, $c8,$08,$a2,$08, $11,$10
	.byte $71,$08,$c8,$08, $c8,$08,$32,$08, $92,$08,$32,$08, $c8,$08,$82,$08
	.byte $c8,$08,$32,$08, $c8,$08,$52,$08, $c8,$08,$a2,$08, $52,$10
	.byte $c4,<oworld_sq2,>oworld_sq2
oworld_tri:
	.byte $c1,$04
	.byte $a1,$08,$c1,$02,$a1,$04,$a2,$04, $c1,$04,$c8,$08,$02,$08, $c1,$02,$12,$04,$13,$04,$c1,$04,$32,$08, $c1,$00,$c8,$08,$32,$08
	.byte $c8,$08,$12,$08, $c8,$08,$02,$08, $c1,$06,$a1,$08,$a2,$08, $c1,$00,$12,$10
	.byte $a1,$08, $c1,$02,$a1,$04,$a2,$04, $c1,$04,$c8,$08,$02,$08, $c1,$02,$12,$04,$13,$04,$c1,$04,$32,$08, $c1,$06,$c8,$08,$51,$08
	.byte $c1,$06,$53,$08,$c1,$02,$31,$04,$31,$04, $c1,$06,$33,$08,$c1,$06,$51,$08, $c1,$06,$53,$08,$c1,$06,$a1,$08, $c1,$00,$52,$10
	.byte $c4,<oworld_tri,>oworld_tri
;	.byte $a1,$08,$c8,$08, $c8,$08,$02,$08, $12,$08,$32,$08, $c8,$08,$32,$08 <--- original of first riff
;	.byte $c8,$08,$12,$08, $c8,$08,$02,$08, $c8,$08,$a1,$08, $12,$10 <-----------
;	.byte $a1,$08,$c8,$08, $c8,$08,$02,$08, $12,$08,$32,$08, $c8,$08,$52,$08 <---
;	.byte $c8,$08,$32,$08, $c8,$08,$52,$08, $c8,$08,$a2,$08, $52,$10 <-----------
oworld_nse:
	.byte $c2,$15
	.byte $0f,$08,$c2,$02,$00,$04,$0a,$04, $00,$08,$0f,$08, $c2,$15,$0a,$04,$c2,$02,$00,$04,$c2,$15,$0f,$08, $c2,$02,$00,$04,$00,$04,$0a,$04,$c2,$05,$00,$0c
	.byte $c2,$15,$0f,$08, $c2,$02,$00,$04,$00,$04,$0a,$04,$c2,$05,$00,$04, $c2,$15,$0f,$08,$0a,$08, $c2,$02,$07,$10
	.byte $c2,$15
	.byte $0f,$08,$c2,$02,$00,$04,$0a,$04, $00,$08,$0f,$08, $c2,$15,$0a,$04,$c2,$02,$00,$04,$c2,$15,$0f,$08, $c2,$02,$00,$04,$00,$04,$0a,$04,$c2,$02,$00,$04
	.byte $c2,$15,$0a,$08,$c2,$02,$00,$04,$00,$04, $c2,$15,$0a,$08,$0f,$08, $0a,$08,$0a,$08, $c2,$02,$07,$04,$c8,$08,$c2,$15,$0f,$04
	.byte $c4,<oworld_nse,>oworld_nse
;	.byte $c2,$15, $0f,$10, $c2,$02,$00,$10, $c2,$15,$0a,$10, $c2,$02,$00,$10 <--- straight beat


; cheat sheet:
; A=0 #=1 B=2 C=3 #=4 D=5 #=6 E=7 F=8 #=9 G=a #=b
sewer_sq1:
	.byte $c8,$80
	.byte $c3,<sewer_sq1,>sewer_sq1,$03
sewer_sq1_1:
	.byte $c2,$05, $c6,$04
	.byte $20,$18, $c8,$10, $20,$08, $40,$08, $c8,$08, $20,$18, $c8,$10, $20,$08, $10,$08, $00,$08, $c6,$00
	.byte $c2,$16
	.byte $20,$18,$40,$08,$30,$08,$00,$08, $c6,$03,$20,$08,$11,$08, $c6,$02,$20,$08,$11,$08, $c6,$01,$20,$08,$11,$08, $c6,$04,$20,$08,$11,$08, $c6,$00,$c8,$10	;$c8,$64
	.byte $c4,<sewer_sq1_1,>sewer_sq1_1
sewer_sq2:
	.byte $c8,$80
	.byte $c3,<sewer_sq2,>sewer_sq2,$01
sewer_sq2_1:
	.byte $c2,$16
	.byte $a1,$10,$71,$08,$71,$68
	.byte $71,$10,$51,$08,$41,$68
	.byte $c4,<sewer_sq2_1,>sewer_sq2_1
sewer_tri:
	.byte $c1,$04
	.byte $a1,$08,$a1,$08, $c8,$10, $c1,$0e,$a2,$10, $c1,$00,$12,$10,$c1,$08,$a1,$10, $c8,$10, $c1,$0e,$a2,$10,$c8,$10
	.byte $c1,$08
	.byte $a1,$10, $c8,$10, $c1,$0e,$a2,$10, $c8,$10, $c1,$00,$52,$08,$72,$08, $c1,$06,$a1,$08,$a2,$08, $c1,$00,$72,$10,$12,$10
	.byte $c1,$04
	.byte $a1,$08,$a1,$08, $c8,$10, $c1,$0e,$a2,$10, $c1,$00,$12,$10,$c1,$08,$a1,$10, $c8,$10, $c1,$0e,$a2,$10,$c8,$10
	.byte $c1,$08
	.byte $a1,$10, $c8,$10, $c1,$00,$a2,$10, $c1,$01,$71,$20, $c1,$06,$72,$08, $c1,$00,$71,$08, $81,$10,$91,$10
	.byte $c4,<sewer_tri,>sewer_tri
sewer_nse:
	.byte $c2,$15,$0f,$08,$0f,$08, $c2,$02,$00,$10, $c2,$15,$0d,$10, $c2,$05,$00,$10
	.byte $c2,$15,$0f,$04, $c8,$04, $c2,$02,$00,$08,$00,$08,$00,$08, $c2,$15,$0d,$18, $c8,$08
	.byte $c2,$15,$0f,$20, $c2,$05,$00,$18, $c2,$02,$00,$08, $c2,$15,$0b,$10, $00,$08,$0d,$08, $00,$08,$00,$08, $0f,$10
	.byte $c2,$15,$0f,$08,$0f,$08, $c2,$02,$00,$10, $c2,$15,$0d,$10, $c2,$05,$00,$10
	.byte $c2,$15,$0f,$04, $c8,$04, $c2,$02,$00,$08,$00,$08,$00,$08, $c2,$15,$0d,$18, $c8,$08
	.byte $c2,$15,$0f,$20, $c2,$05,$00,$18, $c2,$02,$00,$08, $c2,$15,$0b,$10, $0c,$10, $0a,$10,$0d,$10
	.byte $c4,<sewer_nse,>sewer_nse











golf_sq1:
	.byte $c2,$06
	.byte $80,$08,$a0,$10, $c8,$08, $70,$08,$c8,$10, $a0,$10,$01,$10, $c8,$20
	.byte $80,$10,$a0,$10, $c8,$10, $a0,$08,$a0,$08, $10,$20,$00,$08, $a0,$20
	.byte $c3,<golf_sq1,>golf_sq1,$03
	.byte $00,$38,$70,$08, $10,$38,$80,$08, $20,$38,$90,$08, $30,$38,$a0,$08
	.byte $c1,$01,$b0,$08,$b0,$08,$b0,$08,$b0,$08,$b0,$08,$c8,$18
	.byte $c4,<golf_sq1,>golf_sq1
golf_sq2:
	.byte $c2,$06
	.byte $31,$08,$51,$10, $c8,$08, $21,$08,$c8,$10, $51,$10,$71,$10, $c8,$20
	.byte $31,$10,$51,$10, $c8,$10, $51,$08,$51,$08, $81,$20,$71,$08, $51,$20
	.byte $c3,<golf_sq2,>golf_sq2,$01
golf_sq2_1:
	.byte $c2,$06
	.byte $31,$08,$51,$10, $c8,$08, $21,$08,$c8,$10, $51,$10,$71,$10, $c8,$10,$50,$08,$50,$08
	.byte $31,$10,$51,$08, $50,$08,$50,$08,$70,$08, $51,$08,$51,$08, $81,$20,$71,$08, $51,$20
	.byte $c3,<golf_sq2_1,>golf_sq2_1,$01
	.byte $00,$38,$70,$08, $10,$38,$80,$08, $20,$38,$90,$08, $30,$38,$a0,$08
	.byte $c1,$01,$32,$08,$32,$08,$32,$08,$32,$08,$32,$08,$c8,$18
	.byte $c4,<golf_sq2,>golf_sq2
golf_tri:
	.byte $c1,$01
	.byte $82,$08,$a2,$08, $c1,$07,$a2,$08,$a2,$08, $c1,$04,$73,$08, $c1,$07,$a2,$08,$a2,$08
	.byte $c1,$01,$a2,$10,$03,$08, $c1,$07,$03,$08,$03,$08, $c1,$04,$54,$08, $c1,$01,$53,$08,$53,$08
	.byte $82,$10,$a2,$08, $c1,$07,$a2,$08,$a2,$08, $c1,$04,$73,$08, $c1,$07,$a2,$08,$a2,$08
	.byte $c1,$00,$13,$10, $14,$08, $13,$08,$03,$08, $73,$08, $a2,$08, $82,$08, $72,$08
	.byte $c3,<golf_tri,>golf_tri,$03
	.byte $c1,$01,$02,$08, $c1,$07,$02,$08,$02,$08, $c1,$01,$02,$08, $c1,$04,$03,$08, $c1,$01,$02,$08, $c1,$07,$02,$08,$02,$08
	.byte $c1,$01,$12,$08, $c1,$07,$12,$08,$12,$08, $c1,$01,$12,$08, $c1,$04,$13,$08, $c1,$01,$12,$08, $c1,$07,$12,$08,$12,$08
	.byte $c1,$01,$22,$08, $c1,$07,$22,$08,$22,$08, $c1,$01,$22,$08, $c1,$04,$23,$08, $c1,$01,$22,$08, $c1,$07,$22,$08,$22,$08
	.byte $c1,$01,$32,$08, $c1,$07,$32,$08,$32,$08, $c1,$01,$32,$08, $c1,$04,$33,$08, $c1,$01,$32,$08, $c1,$07,$32,$08,$32,$08
	.byte $c1,$01,$b2,$08,$b2,$08,$b2,$08,$b2,$08,$b2,$08,$c8,$10, $b2,$01,$a2,$01,$92,$01,$82,$01,$72,$01,$62,$01,$52,$01,$42,$01
	.byte $c4,<golf_tri,>golf_tri
golf_nse:
	.byte $c2,$04
	.byte $0e,$08,$0e,$08, $00,$08,$00,$08, $0d,$08, $00,$08,$00,$08, $c2,$05,$00,$10
	.byte $c2,$04,$0e,$08, $00,$08,$00,$08,  $0d,$08, $00,$08,$00,$08
	.byte $c2,$04,$0e,$08,$00,$08, $c2,$04,$0e,$08, $00,$08,$00,$08, $0d,$08, $00,$08,$00,$08
	.byte $c2,$05,$00,$10, $c2,$04,$0b,$08, $0c,$08, $0d,$08, $00,$08, $0e,$08, $0d,$08, $0d,$08
	.byte $c3,<golf_nse,>golf_nse,$03
golf_nse1:
	.byte $c2,$04, $0e,$08,$00,$08,$00,$08,$0e,$08,$0d,$08,$0e,$08,$00,$08,$00,$08
	.byte $c3,<golf_nse1,>golf_nse1,$02
	.byte $0e,$08,$00,$08,$00,$08,$0e,$08,$0b,$08,$0b,$08,$0c,$08,$0d,$08
	.byte $c2,$04, $0a,$08,$0a,$08,$0a,$08,$0a,$08,$0e,$08,$c8,$18
	.byte $c4,<golf_nse,>golf_nse,$0e

intros_sq1:
	 .byte $c2,$01
	 .byte $70,$08, $70,$08, $c8,$30
	 .byte $c4,<intros_sq1,>intros_sq1
intros_sq2:
	 .byte $c2,$01
	 .byte $20,$08, $20,$08, $c8,$30
	 .byte $c4,<intros_sq2,>intros_sq2
intros_tri:
	.byte $c8,$80
intros_tri1:
	.byte $71,$0e, $51,$02, $71,$08, $01,$10, $70,$08, $01,$08, $21,$08
	.byte $71,$0e, $51,$02, $71,$08, $01,$10, $c8,$18
	.byte $c4,<intros_tri1,>intros_tri1
intros_nse:
	.byte $c2,$04,$0e,$08, $0e,$08, $0d,$18, $0e,$08, $0d,$10
	.byte $c4,<intros_nse,>intros_nse









; cheat sheet:
; A=0 #=1 B=2 C=3 #=4 D=5 #=6 E=7 F=8 #=9 G=a #=b
pause_sq1:
	.byte $c2,$05
	.byte $33,$04, $03,$04, $33,$04, $63,$04, $ff

floor_shake_nse:
	.byte $c2,$08, $00,$01, $0a,$01
	.byte $c4,<floor_shake_nse,>floor_shake_nse




; Sound effects - Absolutely everything that applies for the music and songs
; applies here too, except sound effects have their own playlist and their
; own envelope table. Also, all sound effects play at tempo $100, which is
; impossible for music, since music tempo only goes up to $FF. When a sound
; effect is playing, it'll interrupt the corresponding channels of the music,
; and then when the sound effect is finished, the music channels it hogged will
; be audible again.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sound effect envelopes  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sfxenvelopes:
	.addr sfxenv1
	.addr win_env, zecrom_env, tele_env, e_hit_env, windy_env
	.addr bike_env,other_spooky
sfxenv1:
 .byte	$8F,$8D,$88,$8F,$8E,$8D,$8C,$8B,$8A,$89,$88,$87,$86,$85,$84,$83,$82,$81,$80,$FF
win_env:
	.byte $0f,$0f,$0f,$0f,$0e,$0e,$0d,$0d,$0c,$0c,$0d,$0d,$0c,$0c,$0b,$0a,$ff
zecrom_env:
	.byte $88,$89,$8a,$8b,$8c,$8d,$8d,$8f,$8e,$8d,$8c,$8b,$8a,$89,$88,$87,$10,$00;,$86
tele_env:
	.byte $4f,$43,$10,$00
e_hit_env:
	.byte $8f,$10,$00
windy_env:
	.byte $8e,$8d,$8b,$8e,$8d,$8c,$8b,$8a,$89,$88,$87,$88,$89,$8c
	.byte $8d,$8d,$8b,$8e,$8d,$8c,$8b,$8a,$89,$88,$88,$88,$88,$89
	.byte $8a,$8b,$8b,$8a,$89,$89,$89,$89,$89,$88,$87,$86,$85,$84
	.byte $ff
bike_env:
	.byte $0f,$05,$10,$00
other_spooky:
	.byte $43,$44,$45,$46,$48,$4a,$4c,$4a,$48,$46,$44,$43,$44,$45,$46,$48,$4a,$10,$0c
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sound effect table  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
sounds:
	.addr sfx_silence
		  ;10yard     bfight      bball       bball     ccland
	.addr game_score, game_score, game_score, game_hit, game_score	; 1-5
		  ;ccland     dk          dk          dk         dkjr
	.addr game_hit,   game_score, game_hit,   game_jump, game_score ; 6-0a
		  ;dkjr       dk3         dk3         dk3        math
	.addr game_hit,   game_dk3hit,game_hit,   game_woosh,game_score	; 0b-0f
		  ;math       math        dhunt       excite     excite
	.addr game_hit,   game_dk3hit,game_gun,   game_hit,  game_hit	; 10-14
		  ;excite     golf        golf        golf       gshoe
	.addr game_score, game_score, game_hit,   game_jump, game_gun	; 15-19
		  ;gshoe      gmite       gmite       halley     iclimb
	.addr game_hit,   game_score, game_woosh, game_gun,  game_score	; 1a-1e
		  ;iclimb     kfu         kfu         rider      rider
	.addr game_score, game_score, game_hit,   game_gun,  game_score	; 1f-23
		  ;rider      mbros       mbros       mbros      pball
	.addr game_hit,   game_jump,  game_score, game_hit,  game_score	; 24-28
		  ;pball      pball       peye        peye       wrestle
	.addr game_woosh, game_hit,   game_score, game_hit,  game_hit	; 29-2d
		  ;wrestle    slalom      slalom      soccer     smb
	.addr game_score, game_score, game_hit,   game_score,game_score	; 2e-32
		  ;smb        smb         smb         tennis     tennis
	.addr game_hit,   game_jump,  game_dk3hit,game_score,game_jump	; 33-37
		  ;tennis     uchamp      uchamp      vball      vball
	.addr game_dk3hit,game_score, game_hit,   game_jump, game_score	; 38-3c
		  ;vball      wgunman     wgunman     wcrew      wcrew
	.addr game_hit,   game_gun,   game_score, game_hit,  game_score	; 3d-41
		  ;wcrew	  nesvc       karn        karn
	.addr game_dk3hit,game_score, game_score, game_hit,  e_chargesfx; 42-46
	.addr e_hits_sfx, e_kill_sfx, e_miss_sfx, p_chargesfx,p_miss_sfx; 47-4b
	.addr manual_sfx, str_sel_sfx,str_get_sfx,tramp_sfx, climb_sfx 	; 4c-50
	.addr homer_sfx,  sail_sfx,   float_sfx,  bikego_sfx,bikeno_sfx	; 51-55
	.addr launch_sfx, gotit_sfx,  story_sfx,  menu_sfx,  talk_sfx	; 56-5a
	.addr door_sfx,   walk_sfx,   fall_sfx,   abili_sfx, title_sfx	; 5b-5f
	.addr siren_sfx,  pause_sfx,  whistle_sfx,bouldersfx,elec_sfx	; 60-64
	.addr invin_sfx	; 65-
;;;;;;;;;;;;;;;;;;;;;
;;  sound effects  ;;
;;;;;;;;;;;;;;;;;;;;;

; cheat sheet:
; A=0 #=1 B=2 C=3 #=4 D=5 #=6 E=7 F=8 #=9 G=a #=b

sfx_silence:
 .word	$0000, $0000, $0000, $0000


pause_sfx:
	.addr pause_sq, $0000, $0000, $0000
pause_sq:
	.byte $c2,$00
	.byte $33,$04, $03,$04, $33,$04, $63,$04, $ff

;game_score:
;	.addr $0000, $0000, $0000, game_score_nse
;game_score_nse:
;	.byte $c2,$04,$81,$04, $ff
game_score:
	.addr game_score_sq1, $0000, $0000, $0000
game_score_sq1:
	.byte $c2,$04
	.byte $34,$01,$64,$01, $04,$01,$34,$01,  $34,$01,$64,$01,  $64,$01,$94,$01, $ff
game_hit:
	.addr $0000, $0000, $0000, game_hit_nse
game_hit_nse:
	.byte $c2,$04,$0a,$04, $ff
game_jump:
	.addr game_jump_sq1,$0000,$0000,$0000
game_jump_sq1:
	.byte $c7,$f1,$21,$10, $ff
game_woosh:
	.addr $0000,$0000,$0000,game_woosh_nse
game_woosh_nse:
	.byte $c2,$01, $00,$10, $ff
game_dk3hit:
	.addr game_dk3hit_sq1,$0000,$0000,$0000
game_dk3hit_sq1:
	.byte $22,$04,$20,$04, $ff
game_gun:
	.addr $0000,$0000,$0000,game_gun_nse
game_gun_nse:
	.byte $c2,$04, $0d,$08, $ff

e_chargesfx:
	.addr e_chargesq1, $0000, $0000, $0000
e_chargesq1:
	.byte $c2,$04, $c7,$e8,$20,$40, $ff
	

e_hits_sfx:
	.addr e_hits_sq1, $0000, $0000, e_hits_nse
e_hits_sq1:
	.byte $01,$20, $ff
e_hits_nse:
	.byte $c2,$05, $0e,$10, $ff

e_kill_sfx:
	.addr e_kill_sq1, $0000, $0000, e_kill_nse
e_kill_sq1:
	.byte $00,$40, $ff
e_kill_nse:
	.byte $c2,$05, $0e,$40, $ff

e_miss_sfx:
	.addr e_miss_sq1, $0000, $0000, $0000
e_miss_sq1:
	.byte $04,$04, $03,$04, $73,$04, $72,$04, $ff

p_chargesfx:
	.addr p_chargesq1, $0000, $0000, p_chargense
p_chargesq1:
	.byte $c2,$05, $c7,$e8,$20,$18, $ff
p_chargense:
	.byte $c7,$03, $07,$08,$07,$08,$06,$08, $ff

p_miss_sfx:
	.addr $0000, $0000, p_miss_tri, $0000
p_miss_tri:
	.byte $35,$04, $25,$04, $54,$04, $04,$04, $ff

manual_sfx:
	.addr manual_sq1,$0000,$0000,$0000
manual_sq1:
	.byte $c2,$04, $03,$01, $ff

str_sel_sfx:
	.addr $0000,$0000,str_sel_tri,$0000
str_sel_tri:
	.byte $05,$04, $ff

str_get_sfx:
	.addr str_get_sq1,str_get_sq2,str_get_tri,$0000
str_get_sq1:
	.byte $c2,$05
	.byte $c9,$fe,$03,$20,$c9,$00, $ff
str_get_sq2:
	.byte $c2,$05
	.byte $c9,$fe,$04,$20,$c9,$00, $ff
str_get_tri:
	.byte $c1,$01
	.byte $05,$02
	.byte $c3,<str_get_tri,>str_get_tri,$10
	.byte $ff


tramp_sfx:
	.addr tramp_sq1,$0000,$0000,$0000
tramp_sq1:
	.byte $c2,$05, $c9,$e8,$20,$10, $c2,$00,$c9,$f1,$21,$10,$c9,$00, $ff
climb_sfx:
	.addr climb_sq1,$0000,$0000,$0000
climb_sq1:
	.byte $c2,$05, $46,$08, $00,$06, $ff
homer_sfx:
	.addr homer_sq1,homer_sq2,homer_tri,homer_nse
homer_sq1:
	.byte $c8,$44,$c2,$05,$c1,$03
	.byte $13,$20,$13,$20,$ff
homer_sq2:
	.byte $c8,$64, $ff
homer_tri:
	.byte $c8,$44,$c1,$03
	.byte $73,$20,$73,$20,$ff
homer_nse:
	.byte $c2,$00, $05,$10,$00,$02,$04,$10,$00,$02
	.byte $05,$10,$00,$02,$04,$10,$00,$02, $ff

sail_sfx:
	.addr sail_sq1,sail_sq2,sail_tri,sail_nse
sail_sq1:
	.byte $c8,$80
	.byte $c4,<sail_sq1,>sail_sq1
sail_sq2:
	.byte $c8,$80
	.byte $c4,<sail_sq2,>sail_sq2
sail_tri:
	.byte $c8,$80
	.byte $c4,<sail_tri,>sail_tri
sail_nse:
	.byte $c2,$05
	.byte $05,$80
	.byte $c4,<sail_nse,>sail_nse


float_sfx:
	.addr float_sq1, $0000, $0000, $0000
float_sq1:
	.byte $c2,$04, $c9,$fe,$42,$3c,$c9,$00, $00,$04, $ff

bikego_sfx:
	.addr bikego_sq1, bikego_sq2, bikego_tri, $0000
bikego_sq1:
	.byte $c2,$06, $21,$10,$10,$10,$00,$10, $ff
bikego_sq2:
	.byte $c2,$06, $c7,$e8,$41,$04,$61,$04,$41,$04,$61,$04,$c7,$00, $21,$08,$ff
bikego_tri:
	.byte $21,$10,$11,$10,$01,$10, $ff

bikeno_sfx:
	.addr bikeno_sq1, $0000, $0000, $0000
bikeno_sq1:
	.byte $c2,$04, $c7,$e8,$03,$04,$c7,$00,$00,$01
	.byte $c3,<bikeno_sq1,>bikeno_sq1,$03
	.byte $ff

launch_sfx:
	.addr launch_sq1, launch_sq2, launch_tri, $0000
launch_sq1:
	.byte $c2,$06, $22,$10,$11,$10,$01,$10, $ff
launch_sq2:
	.byte $c2,$06, $c7,$e8,$42,$04,$62,$04,$42,$04,$62,$04,$c7,$00, $21,$08,$ff
launch_tri:
	.byte $21,$10,$11,$10,$01,$10, $ff

gotit_sfx:
	.addr gotit_sq1,gotit_sq2,gotit_tri,gotit_nse
gotit_sq1:
	.byte $c2,$05
	.byte $53,$10,$33,$10,$53,$10, $83,$10,$73,$10,$83,$10, $a3,$40, $c8,$50, $ff
gotit_sq2:
	.byte $c2,$01
	.byte $01,$10,$a1,$10,$01,$10, $32,$10,$22,$10,$32,$10, $52,$40, $c8,$50, $ff
gotit_tri:
	.byte $52,$10,$32,$10,$52,$10, $82,$10,$73,$10,$83,$10, $a3,$40, $c8,$50, $ff
gotit_nse:
	.byte $c8,$f0, $ff

story_sfx:
	.addr story_sq1,story_sq2,story_tri,story_nse
story_sq1:
	.byte $a4,$04, $84,$04, $54,$04, $54,$04, $84,$04, $a4,$04, $25,$04, $15,$04, $ff
	.byte $a2,$04, $82,$04, $52,$04, $52,$04, $82,$04, $a2,$04, $23,$04, $13,$04, $ff
story_sq2:
story_tri:
story_nse:
	.byte $c8,$20
	.byte $ff

menu_sfx:
	.addr menu_sq1, $0000, $0000, $0000
menu_sq1:
	.byte $c2,$04
	.byte $33,$04, $03,$04, $33,$04, $63,$04, $ff

talk_sfx:
	.addr talk_sq1, $0000, $0000, $0000
talk_sq1:
	.byte $c2,$05
	.byte $63,$04,$33,$04, $ff

door_sfx:
	.addr $0000,$0000,$0000,door_nse
door_nse:
	.byte $c2,$01
	.byte $0d,$04,$c8,$08,$09,$04,$ff

walk_sfx:
	.addr $0000,$0000,$0000,walk_nse
walk_nse:
	.byte $c2,$01
	.byte $0c,$04,$c8,$0c
	.byte $c3,<walk_nse,>walk_nse,$03
	.byte $ff

fall_sfx:
	.addr fall_sq1,$0000,$0000,$0000
fall_sq1:
	.byte $c9,$09,$53,$20,$c9,$00,$ff

abili_sfx:
	.addr abili_sq1,abili_sq2,abili_tri,abili_nse
abili_sq1:
	.byte $c2,$00
	.byte $33,$08, $a2,$08, $82,$08, $13,$08, $53,$20
	.byte $ff
abili_sq2:
	.byte $c2,$00
	.byte $33,$08, $a2,$08, $82,$08, $13,$08, $53,$20
	.byte $ff
abili_tri:
	.byte $c2,$00
	.byte $33,$08, $a2,$08, $82,$08, $13,$08, $53,$20
	.byte $ff
abili_nse:
	.byte $c8,$40
	.byte $ff

title_sfx:
	.addr title_sq1_sfx, title_sq2_sfx, title_tri_sfx, title_nse_sfx
title_sq1_sfx:
	.byte $c2,$01
	.byte $a0,$01,$b0,$01,$01,$01,$11,$01,$21,$01,$31,$01,$41,$01,$51,$01
	.byte $ff
title_sq2_sfx:
	.byte $c2,$09
	.byte $a2,$01,$b2,$01,$03,$01,$13,$01,$23,$01,$33,$01,$43,$01,$53,$01
	.byte $ff
title_tri_sfx:
	.byte $a2,$01,$b2,$01,$03,$01,$13,$01,$23,$01,$33,$01,$43,$01,$53,$01
	.byte $ff
title_nse_sfx:
	.byte $c8,$08
	.byte $c2,$01,$c9,$01,$0c,$40,$c9,$00
	.byte $ff

siren_sfx:
	.addr siren_sq1_sfx,siren_sq2_sfx,siren_tri_sfx,siren_nse_sfx
siren_sq2_sfx:
	.byte $c2,$00
	.byte $13,$18,$a2,$18
	.byte $c3,<siren_sq2_sfx,>siren_sq2_sfx,$02
	.byte $ff
siren_tri_sfx:
	.byte $c2,$00
	.byte $14,$18,$a3,$18
	.byte $c3,<siren_tri_sfx,>siren_tri_sfx,$02
	.byte $ff
siren_sq1_sfx:
siren_nse_sfx:
	.byte $c8,$90
	.byte $ff

whistle_sfx:
	.addr whistle_sq1_sfx,$0000,$0000,$0000
; Big thanks to Tepples for assistance with this whistle sound
whistle_sq1_sfx:
	.byte $c2,$00, $c9,$ff
	.byte $05,$01,$15,$01,$25,$01,$35,$01,$45,$01,$55,$04,$45,$01,$35,$01,$25,$01,$25,$01,$15,$04
	.byte $25,$01,$35,$01,$45,$01,$55,$01,$65,$04, $c9,$00
	.byte $ff

bouldersfx:
	.addr boulder_sq1,$0000,$0000,boulder_nse
boulder_sq1:
	.byte $c2,$04, $00,$12
	.byte $ff
boulder_nse:
	.byte $c2,$05, $0f,$02,$0e,$02,$0d,$02,$0c,$04,$0b,$04,$0a,$02,$09,$01,$08,$01
	.byte $ff

elec_sfx:
	.addr $0000,$0000,elec_tri,$0000
elec_tri:
	.byte $03,$02,$04,$02
	.byte $c3,<elec_tri,>elec_tri,$07
	.byte $ff

invin_sfx:
	.addr invi_sq1,invi_sq2,invi_tri,invi_nse
invi_sq1:
	.byte $c2,$07
	.byte $c9,$fe, $03,$20, $73,$20, $24,$20, $94,$20, $c9,$00
	.byte $ff
invi_sq2:
	.byte $c2,$07
	.byte $c9,$fe, $43,$20, $b3,$20, $64,$20, $15,$20, $c9,$00
	.byte $ff
invi_tri:
	.byte $c9,$fe, $03,$20, $73,$20, $24,$20, $94,$20, $c9,$00
	.byte $ff
invi_nse:
	.byte $c8,$80
	.byte $ff




