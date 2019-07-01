.segment "BANK29"
chr_nes:
.incbin "i\bank29\chall_nes.chr"


fill_nes:
	lda #<chr_nes				;  CHRs are in banks 7, 8 and 9. Only bank
	sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
	lda #>chr_nes				;  correct address for them all
	sta temp_16bit_1+1			;
 	lda #$06					; Get Y ready while also setting up where
	sta $2006					;  to begin storage of the CHR in its RAM
	ldy #$00
	sty $2006					;
	ldx #$04					; Need to loop 4 times
@keep_loading:					;
	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne @keep_loading			;
		inc temp_16bit_1+1		;
		dex						;
		bne @keep_loading		;

	ldy #$00					; load title screen
	ldx #$04
	lda #<play_nam
	sta temp_16bit_1+0
	lda #>play_nam
	sta temp_16bit_1+1
	lda #$2c
	sta $2006
	lda #$00
	sta $2006
:	lda (temp_16bit_1),y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-

	lda #$3f
	sta $2006
	ldx #$00
	stx $2006
:	lda pal_nes, x
	sta pal_address, x
	sta $2007
	inx
	cpx #$14
	bne :-

	lda #$2c
	sta nametable

	lda #$04
	sta seed

	ldx #$00
	stx temp_8bit_1
	stx temp_8bit_3
	lda #<loop_empty
	sta loop_pointer+0
	lda #>loop_empty
	sta loop_pointer+1
	lda #<nmi_loadlist
	sta nmi_pointer+0
	lda #>nmi_loadlist
	sta nmi_pointer+1
	lda #$00
	sta scroll_x
	sta scroll_y
	sta $2005
	sta $2005

:	bit $2002
	bpl :-

	lda #%10000011
	sta $2000
	sta save2000
	lda #%00011000
	sta $2001
	sta save2001
	jsr nmi_wait

	jmp end_loop


game_clear_lo:
	.byte $02,$22,$42,$62,$82,$a2,$c2,$e2,$02,$22,$42
game_clear_hi:
	.byte $2e,$2e,$2e,$2e,$2e,$2e,$2e,$2e,$2f,$2f,$2f
game_clear_routine:
	ldx temp_8bit_2
	lda game_clear_hi, x
	sta $2006
	lda game_clear_lo, x
	sta $2006
	lda #$00
	tay
:	sta $2007
	iny
	cpy #28
	bne :-
		inx
		stx temp_8bit_2
		cpx #11
		bne :+
			lda #$00
			sta temp_8bit_2
			lda #<nmi_desc
			sta nmi_pointer+0
			lda #>nmi_desc
			sta nmi_pointer+1
:	rts
nmi_desc:
	ldx temp_8bit_1
	lda game_desc_lo, x
	sta temp_16bit_1+0
	lda game_desc_hi, x
	sta temp_16bit_1+1
	ldx temp_8bit_2
	lda game_clear_hi, x
	sta $2006
	lda game_clear_lo, x
	sta $2006
	ldy #$00
:	lda (temp_16bit_1), y
	cmp #$ff
	beq :+
		sta $2007
		iny
		jmp :-
:	ldy #$00
	sty temp_8bit_3
	lda #$43
	sta temp_8bit_2
	lda #<nmi_ctrls
	sta nmi_pointer+0
	lda #>nmi_ctrls
	sta nmi_pointer+1
	jmp end_nmi

nmi_ctrls:
	ldx temp_8bit_1
	lda game_ctrls_lo, x
	sta temp_16bit_1+0
	lda game_ctrls_hi, x
	sta temp_16bit_1+1
	lda #$2e
	sta $2006
	lda temp_8bit_2
	sta $2006
	ldy temp_8bit_3
:	lda (temp_16bit_1), y
	cmp #$ff
	beq :++
		cmp #$fe
		bne :+
			iny
			sty temp_8bit_3
			lda temp_8bit_2
			clc
			adc #$40
			sta temp_8bit_2
			jmp end_nmi
:		sta $2007
		iny
		sty temp_8bit_3
		jmp :--
:	lda #<nmi_game_screen0
	sta nmi_pointer+0
	lda #>nmi_game_screen0
	sta nmi_pointer+1
	jmp end_nmi

game_attr_table_lo:
	.byte $cc,$cd,$ce,$d4,$d5,$d6
nmi_game_screen0:
	ldx temp_8bit_1
	lda game_attr_lo, x
	sta temp_16bit_1+0
	lda game_attr_hi, x
	sta temp_16bit_1+1
	ldy #$00
:	lda #$2f
	sta $2006
	lda game_attr_table_lo, y
	sta $2006
	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #$06
	bne :-
	lda #$00
	sta temp_8bit_2
	sta temp_8bit_3
	lda #<nmi_game_screen1
	sta nmi_pointer+0
	lda #>nmi_game_screen1
	sta nmi_pointer+1
	jmp end_nmi

nmi_game_screen2:
	ldx temp_8bit_1
	lda game_bgpal_lo, x
	sta temp_16bit_1+0
	lda game_bgpal_hi, x
	sta temp_16bit_1+1
	ldy #$00
:	lda (temp_16bit_1), y
	cmp #$ff
	beq :+
		sta pal_address+9, y
		iny
		jmp :-
:
	lda game_sprpal_lo, x
	sta temp_16bit_1+0
	lda game_sprpal_hi, x
	sta temp_16bit_1+1
	ldy #$00
:	lda (temp_16bit_1), y
	cmp #$ff
	beq :+
		sta pal_address+21, y
		iny
		jmp :-
:	lda #$00
	sta temp_8bit_2
	sta temp_8bit_3
	lda #<nmi_game_screen3
	sta nmi_pointer+0
	lda #>nmi_game_screen3
	sta nmi_pointer+1
	jmp end_nmi

game_nam_load_lo:
	.byte $90,$b0,$d0,$f0,$10,$30,$50,$70
game_nam_load_hi:
	.byte $2c,$2c,$2c,$2c,$2d,$2d,$2d,$2d
nmi_game_screen3:
	ldx temp_8bit_1
	lda game_nam_lo, x
	sta temp_16bit_1+0
	lda game_nam_hi, x
	sta temp_16bit_1+1
	ldx temp_8bit_3
	lda game_nam_load_hi, x
	sta $2006
	lda game_nam_load_lo, x
	sta $2006
	ldx #$00
	ldy temp_8bit_2
:	lda (temp_16bit_1), y
	sta $2007
	iny
	sty temp_8bit_2
	inx
	cpx #12
	bne :-
		ldx temp_8bit_3
		inx
		stx temp_8bit_3
		cpx #$08
		bne :+
			lda #<nmi_game_info
			sta nmi_pointer+0
			lda #>nmi_game_info
			sta nmi_pointer+1
:
	jmp end_nmi

nmi_game_info:
	lda temp_8bit_1
	cmp #32
	beq :+++
	jsr game_write_stats
	lda #$2f
	sta $2006
	lda #$0a
	sta $2006
	ldx #$00
:	lda game_info0, x
	sta $2007
	inx
	cpx #13
	bne :-
	lda #$2f
	sta $2006
	lda #$2b
	sta $2006
	ldx #$00
:	lda game_info1, x
	sta $2007
	inx
	cpx #11
	bne :-
:
	lda #<nmi_chadscore
	sta nmi_pointer+0
	lda #>nmi_chadscore
	sta nmi_pointer+1
	jmp end_nmi
game_info0:
	.byte $8d,$00,"GAME SELECT"
game_info1:
	.byte $90,$91,$92,$00,"TO PLAY"

nmi_chadscore:
	ldx temp_8bit_1
	cpx #32
	beq @no_chadscore
		lda npc_dialogs+33
		beq @no_chadscore
			cmp #$09
			bcs @no_chadscore
		tay
		lda chadlist_lo, y
		sta temp_16bit_1+0
		lda chadlist_hi, y
		sta temp_16bit_1+1
		ldy #$00
@more_chadcheck:
		lda (temp_16bit_1), y
		cmp temp_8bit_1
		bne :+
			beq :++
:		iny
		cpy #$04
		beq @no_chadscore
		bne @more_chadcheck
:			lda #$2d
			sta $2006
			lda #$cc
			sta $2006
			lda #$43
			sta $2007
			lda #$48
			sta $2007
			lda #$41
			sta $2007
			lda #$44
			sta $2007
			lda #$5e
			sta $2007
			lda chadtens, x
			sta $2007
			lda chadones, x
			sta $2007
@no_chadscore:
	lda #<loop_game_info
	sta loop_pointer+0
	lda #>loop_game_info
	sta loop_pointer+1
	lda #<nmi_empty
	sta nmi_pointer+0
	lda #>nmi_empty
	sta nmi_pointer+1
	jmp end_nmi

loop_game_info:
	lda temp_8bit_1
	cmp #32
	beq @glitched_go


	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq @no_b
		jsr game_clear_ram
		lda #$00
		sta temp_8bit_2
		lda #<loop_empty
		sta loop_pointer+0
		lda #>loop_empty
		sta loop_pointer+1
		lda #<nmi_game_clear_screen
		sta nmi_pointer+0
		lda #>nmi_game_clear_screen
		sta nmi_pointer+1
		jmp end_loop
@no_b:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq @no_start
		lda #$33
		sta cursor+1
		lda #$72
		sta cursor+0
		lda #$a8
		sta cursor+3
@glitched_go:
		jsr game_clear_ram
		ldx temp_8bit_1
		lda game_sprlist_num, x
		sta temp_8bit_2
		lda game_sprlist_lo, x
		sta temp_16bit_1+0
		lda game_sprlist_hi, x
		sta temp_16bit_1+1
		ldy #$00
:		lda (temp_16bit_1), y
		sta game_spr_start, y
		iny
		cpy temp_8bit_2
		bne :-
		lda #$3c
		sta temp_8bit_2
		lda #$04
		sta temp_8bit_4
		jsr store_beep
		lda #<loop_game_count
		sta loop_pointer+0
		lda #>loop_game_count
		sta loop_pointer+1
		lda #<nmi_clear_bottom
		sta nmi_pointer+0
		lda #>nmi_clear_bottom
		sta nmi_pointer+1
@no_start:
	jmp end_loop

nmi_game_clear_screen:
	ldy #$00
	ldx temp_8bit_2
	lda game_nam_load_hi, x
	sta $2006
	lda game_nam_load_lo, x
	sta $2006
	lda #$00
:	sta $2007
	iny
	cpy #12
	bne :-
		inx
		stx temp_8bit_2
		cpx #8
		bne :+
			jsr game_gone_stats
			lda #$00
			sta temp_8bit_2
			lda #<nmi_game_stats_gone
			sta nmi_pointer+0
			lda #>nmi_game_stats_gone
			sta nmi_pointer+1
:	jmp end_nmi
nmi_game_stats_gone:
	jsr game_gone_stats
;	jsr game_clear_ram
	lda #$00
	sta temp_8bit_2
	lda #<nmi_game_clear_back
	sta nmi_pointer+0
	lda #>nmi_game_clear_back
	jmp end_nmi
nmi_game_clear_back:
	ldx temp_8bit_2
	lda game_clear_hi, x
	sta $2006
	lda game_clear_lo, x
	sta $2006
	lda #$00
	tay
:	sta $2007
	iny
	cpy #27
	bne :-
		inx
		stx temp_8bit_2
		cpx #10
		bne :+
			lda temp_8bit_1
			sta temp_8bit_3
			lda #$00
			sta temp_8bit_1
			sta temp_8bit_2
			lda #<nmi_loadlist
			sta nmi_pointer+0
			lda #>nmi_loadlist
			sta nmi_pointer+1
:	jmp end_nmi




play_home_lo:
	.byte <play_nam
play_home_hi:
	.byte >play_nam
play_nt:
	.byte $2c
play_nam:
.incbin "i\bank29\bbc_in_home_play.nam"
pal_nes:
.incbin "i\bank29\bbc_play.pal"
.byte $0f,$30,$00,$22

game_ppu_stars:
	.byte $02,$22,$42,$62,$82
	.byte $a2,$c2,$e2,$02,$22
	.byte $0b,$2b,$4b,$6b,$8b
	.byte $ab,$cb,$eb,$0b,$2b
	.byte $15,$35,$55,$75,$95
	.byte $b5,$d5,$f5,$15,$35
	.byte $47,$50
game_ppu_lo:
	.byte $04,$24,$44,$64,$84
	.byte $a4,$c4,$e4,$04,$24,$44
	.byte $0d,$2d,$4d,$6d,$8d
	.byte $ad,$cd,$ed,$0d,$2d,$4d
	.byte $16,$36,$56,$76,$96
	.byte $b6,$d6,$f6,$16,$36
;	.byte $03,$23,$43,$63,$83
;	.byte $a3,$c3,$e3,$03,$23
;	.byte $0c,$2c,$4c,$6c,$8c
;	.byte $ac,$cc,$ec,$0c,$2c
;	.byte $16,$36,$56,$76,$96
;	.byte $b6,$d6,$f6,$16,$36
;	.byte $48,$51
game_ppu_hi:
	.byte $2e,$2e,$2e,$2e,$2e
	.byte $2e,$2e,$2e,$2f,$2f,$2f
	.byte $2e,$2e,$2e,$2e,$2e
	.byte $2e,$2e,$2e,$2f,$2f,$2f
	.byte $2e,$2e,$2e,$2e,$2e
	.byte $2e,$2e,$2e,$2f,$2f
;	.byte $2e,$2e,$2e,$2e,$2e
;	.byte $2e,$2e,$2e,$2f,$2f
;	.byte $2e,$2e,$2e,$2e,$2e
;	.byte $2e,$2e,$2e,$2f,$2f
;	.byte $2e,$2e,$2e,$2e,$2e
;	.byte $2e,$2e,$2e,$2f,$2f
;	.byte $2f,$2f

game_title_lo:
	.byte <game_title_00,<game_title_01,<game_title_02,<game_title_03,<game_title_04
	.byte <game_title_05,<game_title_06,<game_title_07,<game_title_08,<game_title_09
	.byte <game_title_10,<game_title_11,<game_title_12,<game_title_13,<game_title_14
	.byte <game_title_15,<game_title_16,<game_title_17,<game_title_18,<game_title_19
	.byte <game_title_20,<game_title_21,<game_title_22,<game_title_23,<game_title_24
	.byte <game_title_25,<game_title_26,<game_title_27,<game_title_28,<game_title_29
	.byte <game_title_30,<game_title_31,<game_title_32
game_title_hi:
	.byte >game_title_00,>game_title_01,>game_title_02,>game_title_03,>game_title_04
	.byte >game_title_05,>game_title_06,>game_title_07,>game_title_08,>game_title_09
	.byte >game_title_10,>game_title_11,>game_title_12,>game_title_13,>game_title_14
	.byte >game_title_15,>game_title_16,>game_title_17,>game_title_18,>game_title_19
	.byte >game_title_20,>game_title_21,>game_title_22,>game_title_23,>game_title_24
	.byte >game_title_25,>game_title_26,>game_title_27,>game_title_28,>game_title_29
	.byte >game_title_30,>game_title_31,>game_title_32
game_title_32:
	.byte "        "
game_title_00:
	.byte "10 YARD "
game_title_01:
	.byte "B FIGHT "
game_title_02:
	.byte "B BALL  "
game_title_03:
	.byte "CC LAND "
game_title_04:
	.byte "D KONG  "
game_title_05:
	.byte "DK JR   "
game_title_06:
	.byte "DK 3    "
game_title_07:
	.byte "DK MATH "
game_title_08:
	.byte "D HUNT  "
game_title_09:
	.byte "EXCTEBK "
game_title_10:
	.byte "GOLF    "
game_title_11:
	.byte "G SHOE  "
game_title_12:
	.byte "G MITE  "
game_title_13:
	.byte "H ALLEY "
game_title_14:
	.byte "ICLIMBR "
game_title_15:
	.byte "KUNG FU "
game_title_16:
	.byte "M RIDER "
game_title_17:
	.byte "M BROS  "
game_title_18:
	.byte "PINBALL "
game_title_19:
	.byte "POPEYE  "
game_title_20:
	.byte "PWRSTLG "
game_title_21:
	.byte "SLALOM  "
game_title_22:
	.byte "SOCCER  "
game_title_23:
	.byte "STACKUP "
game_title_24:
	.byte "SMB     "
game_title_25:
	.byte "TENNIS  "
game_title_26:
	.byte "UCHAMPN "
game_title_27:
	.byte "V BALL  "
game_title_28:
	.byte "WGUNMAN "
game_title_29:
	.byte "W CREW  "
game_title_30:
	.byte "NES VC  "
game_title_31:
	.byte "KARNOV  "



;game_title_00:
;	.byte "10-YARDF"
;game_title_01:
;	.byte "BLNFIGHT"
;game_title_02:
;	.byte "BASEBALL"
;game_title_03:
;	.byte "C.C.LAND"
;game_title_04:
;	.byte "DONKYKNG"
;game_title_05:
;	.byte "DNKYKGJR"
;game_title_06:
;	.byte "DONKYKG3"
;game_title_07:
;	.byte "DKNGMATH"
;game_title_08:
;	.byte "DUCKHUNT"
;game_title_09:
;	.byte "EXCTBIKE"
;game_title_10:
;	.byte "GOLF    "
;game_title_11:
;	.byte "GUMSHOE "
;game_title_12:
;	.byte "GYROMITE"
;game_title_13:
;	.byte "HGNALLEY"
;game_title_14:
;	.byte "ICLIMBER"
;game_title_15:
;	.byte "KUNG FU "
;game_title_16:
;	.byte "MCHRIDER"
;game_title_17:
;	.byte "MARIOBRO"
;game_title_18:
;	.byte "PINBALL "
;game_title_19:
;	.byte "POPEYE  "
;game_title_20:
;	.byte "PRWRSTLG"
;game_title_21:
;	.byte "SLALOM  "
;game_title_22:
;	.byte "SOCCER  "
;game_title_23:
;	.byte "STACK-UP"
;game_title_24:
;	.byte "SUPRMARB"
;game_title_25:
;	.byte "TENNIS  "
;game_title_26:
;	.byte "URCHAMPN"
;game_title_27:
;	.byte "VOLLEYBL"
;game_title_28:
;	.byte "WLDGNMAN"
;game_title_29:
;	.byte "WREKCREW"
;game_title_30:
;	.byte "NESVIRUS"
;game_title_31:
;	.byte "KARNOV  "






game_bgpal_lo:
	.byte <game_bgpal00,<game_bgpal01,<game_bgpal02,<game_bgpal03,<game_bgpal04
	.byte <game_bgpal05,<game_bgpal06,<game_bgpal07,<game_bgpal08,<game_bgpal09
	.byte <game_bgpal10,<game_bgpal11,<game_bgpal12,<game_bgpal13,<game_bgpal14
	.byte <game_bgpal15,<game_bgpal16,<game_bgpal17,<game_bgpal18,<game_bgpal19
	.byte <game_bgpal20,<game_bgpal21,<game_bgpal22,<game_bgpal23,<game_bgpal24
	.byte <game_bgpal25,<game_bgpal26,<game_bgpal27,<game_bgpal28,<game_bgpal29
	.byte <game_bgpal30,<game_bgpal31,<game_bgpal00
game_bgpal_hi:
	.byte >game_bgpal00,>game_bgpal01,>game_bgpal02,>game_bgpal03,>game_bgpal04
	.byte >game_bgpal05,>game_bgpal06,>game_bgpal07,>game_bgpal08,>game_bgpal09
	.byte >game_bgpal10,>game_bgpal11,>game_bgpal12,>game_bgpal13,>game_bgpal14
	.byte >game_bgpal15,>game_bgpal16,>game_bgpal17,>game_bgpal18,>game_bgpal19
	.byte >game_bgpal20,>game_bgpal21,>game_bgpal22,>game_bgpal23,>game_bgpal24
	.byte >game_bgpal25,>game_bgpal26,>game_bgpal27,>game_bgpal28,>game_bgpal29
	.byte >game_bgpal30,>game_bgpal31,>game_bgpal00
game_bgpal00:	; 10-YARD
	.byte $19,$19,$19, $ff
game_bgpal01:	; B.FIGHT
	.byte $30,$11,$21, $ff
game_bgpal02:	; B.BALL
	.byte $30,$17,$19,$0f,$30,$07,$19, $ff
game_bgpal03:	; CC LAND
	.byte $05,$25,$30, $ff
game_bgpal04:	; D.KONG
	.byte $05,$11,$21,$0f,$17,$37,$30, $ff
game_bgpal05:	; DK JR
	.byte $12,$21,$30, $ff
game_bgpal06:	; DK 3
	.byte $01,$21,$30,$0f,$2a,$1a,$17, $ff
game_bgpal07:	; DK MATH
	.byte $17,$37,$2a,$0f,$30, $ff
game_bgpal08:	; D.HUNT
	.byte $29,$17,$21,$0f,$29,$19,$21, $ff
game_bgpal09:	; EXCTEBK
	.byte $2a,$27,$18,$0f,$22,$16,$38, $ff
game_bgpal10:	; GOLF
	.byte $29,$1a,$21,$0f,$29,$11,$27, $ff
game_bgpal11:	; GUMSHOE
	.byte $16,$00,$11, $ff
game_bgpal12:	; G.MITE
	.byte $31,$00, $ff
game_bgpal13:	; H.ALLEY
	.byte $11,$01,$3c,$0f,$11,$29,$3c, $ff
game_bgpal14:	; I.CLIMBR
	.byte $30,$22,$30, $ff
game_bgpal15:	; KUNG FU
	.byte $21,$16,$26,$0f,$17,$16, $ff
game_bgpal16:	; M.RIDER
	.byte $1a,$09,$17, $ff
game_bgpal17:	; M.BROS
	.byte $2a,$19,$21,$0f,$2a,$19,$17, $ff
game_bgpal18:	; PINBALL
	.byte $26,$30,$2a,$0f,$28,$30,$25, $ff
game_bgpal19:	; POPEYE
	.byte $21,$17,$10,$0f,$29,$30,$05, $ff
game_bgpal20:	; P.WRSTLG
	.byte $30,$15,$21,$0f,$10,$26,$21, $ff
game_bgpal21:	; SLALOM
	.byte $30,$00, $ff
game_bgpal22:	; SOCCER
	.byte $19,$31,$30, $ff
game_bgpal23:	; STACK-UP
	.byte $ff
game_bgpal24:	; SMB
	.byte $17,$36,$22,$0f,$0f,$30,$22, $ff
game_bgpal25:	; TENNIS
	.byte $1a,$17,$10, $ff
game_bgpal26:	; U.CHAMPN
	.byte $00,$10,$30,$0f,$00,$05,$30, $ff
game_bgpal27:	; V.BALL
	.byte $27,$1c,$30, $ff
game_bgpal28:	; W.GUNMAN
	.byte $26,$17,$30, $ff
game_bgpal29:	; W.CREW
	.byte $01,$2a,$30,$0f,$27,$2a,$10, $ff
game_bgpal30:	; nesvc
	.byte $16,$30,$14, $ff
game_bgpal31:	; karnov
	.byte $0c,$13,$04,$0f,$26,$06,$26, $ff

game_sprpal_lo:
	.byte <game_sprpal00,<game_sprpal01,<game_sprpal02,<game_sprpal03,<game_sprpal04
	.byte <game_sprpal05,<game_sprpal06,<game_sprpal07,<game_sprpal08,<game_sprpal09
	.byte <game_sprpal10,<game_sprpal11,<game_sprpal12,<game_sprpal13,<game_sprpal14
	.byte <game_sprpal15,<game_sprpal16,<game_sprpal17,<game_sprpal18,<game_sprpal19
	.byte <game_sprpal20,<game_sprpal21,<game_sprpal22,<game_sprpal23,<game_sprpal24
	.byte <game_sprpal25,<game_sprpal26,<game_sprpal27,<game_sprpal28,<game_sprpal29
	.byte <game_sprpal30,<game_sprpal31,<game_sprpal00
game_sprpal_hi:
	.byte >game_sprpal00,>game_sprpal01,>game_sprpal02,>game_sprpal03,>game_sprpal04
	.byte >game_sprpal05,>game_sprpal06,>game_sprpal07,>game_sprpal08,>game_sprpal09
	.byte >game_sprpal10,>game_sprpal11,>game_sprpal12,>game_sprpal13,>game_sprpal14
	.byte >game_sprpal15,>game_sprpal16,>game_sprpal17,>game_sprpal18,>game_sprpal19
	.byte >game_sprpal20,>game_sprpal21,>game_sprpal22,>game_sprpal23,>game_sprpal24
	.byte >game_sprpal25,>game_sprpal26,>game_sprpal27,>game_sprpal28,>game_sprpal29
	.byte >game_sprpal30,>game_sprpal31,>game_sprpal00
game_sprpal00:	; 10-YARD
	.byte $27,$12,$16, $0f,$27,$17,$10, $0f,$0f,$26,$30, $ff
game_sprpal01:	; B.FIGHT
	.byte $16,$37,$12, $0f,$2b,$12,$30, $0f,$2b,$12,$30, $ff
game_sprpal02:	; B.BALL
	.byte $16,$21,$27, $0f,$12,$10,$27, $0f,$30, $ff
game_sprpal03:	; CC LAND
	.byte $30,$1c,$16, $0f,$08,$0f,$27, $ff
game_sprpal04:	; D.KONG
	.byte $02,$36,$16, $0f,$17,$36,$30, $0f,$17,$27,$02, $ff
game_sprpal05:	; DK JR
	.byte $30,$06,$36, $0f,$16,$27,$13, $0f,$37,$21,$12, $ff
game_sprpal06:	; DK 3
	.byte $30,$27,$06, $0f,$30,$27,$12, $0f,$16,$2a, $ff
game_sprpal07:	; DK MATH
	.byte $30,$06,$36, $ff
game_sprpal08:	; D.HUNT
	.byte $19,$30,$27, $0f,$17,$19, $ff
game_sprpal09:	; EXCTEBK
	.byte $16,$30,$0f, $0f,$27,$18,$36, $ff
game_sprpal10:	; GOLF
	.byte $30,$01,$27, $0f,$16,$00, $ff
game_sprpal11:	; GUMSHOE
	.byte $36,$17,$0f, $0f,$16,$30,$36, $ff
game_sprpal12:	; G.MITE
	.byte $30,$27,$01, $0f,$31,$11,$18, $0f,$29,$36,$3c, $ff
game_sprpal13:	; H.ALLEY
	.byte $30,$27,$0f, $0f,$06,$27,$0f, $0f,$25,$36,$17, $ff
game_sprpal14:	; I.CLIMBR
	.byte $30,$11,$26, $ff
game_sprpal15:	; KUNG FU
	.byte $30,$27,$0f, $0f,$31,$27,$14, $0f,$21,$16,$26, $ff
game_sprpal16:	; M.RIDER
	.byte $37,$02,$0f, $0f,$37,$16,$0f, $0f,$1a,$09,$17, $ff
game_sprpal17:	; M.BROS
	.byte $16,$37,$12, $0f,$30,$27,$19, $0f,$0f,$21, $ff
game_sprpal18:	; PINBALL
	.byte $ff
game_sprpal19:	; POPEYE
	.byte $36,$30,$12, $0f,$36,$04,$17, $0f,$36,$25,$07, $ff
game_sprpal20:	; P.WRSTLG
	.byte $01,$14,$24, $0f,$0f,$17,$37, $ff
game_sprpal21:	; SLALOM
	.byte $38,$26,$3c, $0f,$16,$0f,$22, $0f,$30,$12,$04, $ff
game_sprpal22:	; SOCCER
	.byte $37,$05,$0f, $0f,$37,$25,$0f, $0f,$0f,$30, $ff
game_sprpal23:	; STACK-UP
	.byte $ff
game_sprpal24:	; SMB
	.byte $18,$27,$16, $0f,$17,$27,$0f, $0f,$1a,$27,$16, $ff
game_sprpal25:	; TENNIS
	.byte $27,$21,$0f, $0f,$36,$2b,$07, $0f,$30,$0f,$2b, $ff
game_sprpal26:	; U.CHAMPN
	.byte $27,$16,$2a, $0f,$37,$01,$31, $0f,$37,$2a,$31, $ff
game_sprpal27:	; V.BALL
	.byte $30,$0f,$17, $0f,$30,$2a,$17, $0f,$30,$10,$00, $ff
game_sprpal28:	; W.GUNMAN
	.byte $30,$16,$27, $0f,$30,$16,$12, $0f,$06,$06,$06, $ff
game_sprpal29:	; W.CREW
	.byte $27,$02,$16, $0f,$06,$30,$14, $0f,$10,$10,$10, $ff
game_sprpal30:
	.byte $21,$00,$10, $0f,$14,$27,$10, $ff
game_sprpal31:
	.byte $37,$16,$0f, $0f,$30,$16,$0f, $0f,$00,$10,$0f, $ff

game_nam_lo:
	.byte <game_nam00, <game_nam01, <game_nam02, <game_nam03, <game_nam04
	.byte <game_nam05, <game_nam06, <game_nam07, <game_nam08, <game_nam09
	.byte <game_nam10, <game_nam11, <game_nam12, <game_nam13, <game_nam14
	.byte <game_nam15, <game_nam16, <game_nam17, <game_nam18, <game_nam19
	.byte <game_nam20, <game_nam21, <game_nam22, <game_nam23, <game_nam24
	.byte <game_nam25, <game_nam26, <game_nam27, <game_nam28, <game_nam29
	.byte <game_nam30, <game_nam31, <game_nam00
game_nam_hi:
	.byte >game_nam00, >game_nam01, >game_nam02, >game_nam03, >game_nam04
	.byte >game_nam05, >game_nam06, >game_nam07, >game_nam08, >game_nam09
	.byte >game_nam10, >game_nam11, >game_nam12, >game_nam13, >game_nam14
	.byte >game_nam15, >game_nam16, >game_nam17, >game_nam18, >game_nam19
	.byte >game_nam20, >game_nam21, >game_nam22, >game_nam23, >game_nam24
	.byte >game_nam25, >game_nam26, >game_nam27, >game_nam28, >game_nam29
	.byte >game_nam30, >game_nam31, >game_nam00

game_attr_lo:
	.byte <game_attr00, <game_attr01, <game_attr02, <game_attr03, <game_attr04
	.byte <game_attr05, <game_attr06, <game_attr07, <game_attr08, <game_attr09
	.byte <game_attr10, <game_attr11, <game_attr12, <game_attr13, <game_attr14
	.byte <game_attr15, <game_attr16, <game_attr17, <game_attr18, <game_attr19
	.byte <game_attr20, <game_attr21, <game_attr22, <game_attr23, <game_attr24
	.byte <game_attr25, <game_attr26, <game_attr27, <game_attr28, <game_attr29
	.byte <game_attr30, <game_attr31, <game_attr00
game_attr_hi:
	.byte >game_attr00, >game_attr01, >game_attr02, >game_attr03, >game_attr04
	.byte >game_attr05, >game_attr06, >game_attr07, >game_attr08, >game_attr09
	.byte >game_attr10, >game_attr11, >game_attr12, >game_attr13, >game_attr14
	.byte >game_attr15, >game_attr16, >game_attr17, >game_attr18, >game_attr19
	.byte >game_attr20, >game_attr21, >game_attr22, >game_attr23, >game_attr24
	.byte >game_attr25, >game_attr26, >game_attr27, >game_attr28, >game_attr29
	.byte >game_attr30, >game_attr31, >game_attr00

game_nam00: ; 10-Yard Fight
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
game_attr00:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam01: ; Balloon Fight
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0
game_attr01:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam02: ; Baseball
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f7,$f8,$f9,$f0,$f0,$f0,$f0,$f5
	.byte $f6,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f5,$f0
	.byte $f0,$f6,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f5,$f0,$f0
	.byte $f0,$f0,$f6,$f0,$f0,$f0,$f0,$f0,$f5,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f6,$f0,$f0,$f0,$f5,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f4,$f2,$f4,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f3,$f1,$f3,$f0,$f0,$f0,$f0,$f0
game_attr02:
	.byte $aa,$af,$aa
	.byte $aa,$aa,$aa

game_nam03: ; Clu Clu Land
	.byte $d3,$d3,$d3,$d3,$d3,$d3,$d3,$d3,$d3,$d3,$d3,$d3
	.byte $d3,$d0,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d5,$d6,$d3
	.byte $d3,$d1,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$d7,$d8,$d3
	.byte $d3,$d1,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$d7,$d8,$d3
	.byte $d3,$d1,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$d7,$d8,$d3
	.byte $d3,$d1,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$d7,$d8,$d3
	.byte $d3,$d2,$d9,$d9,$d9,$d9,$d9,$d9,$d9,$da,$db,$d3
	.byte $d3,$d3,$d3,$00,$00,$00,$00,$00,$00,$d3,$d3,$d3
game_attr03:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam04: ; Donkey Kong
	.byte $00,$c7,$ca,$cb,$00,$c3,$00,$00,$00,$00,$00,$00
	.byte $00,$c6,$c8,$c9,$c1,$c2,$c1,$c1,$c4,$c1,$c4,$00
	.byte $00,$c5,$c5,$c5,$00,$00,$00,$00,$c3,$00,$c3,$00
	.byte $00,$c4,$c1,$c1,$c1,$c4,$c1,$c1,$c1,$c1,$c2,$00
	.byte $00,$c3,$00,$00,$00,$c3,$00,$00,$00,$00,$00,$00
	.byte $00,$c2,$c1,$c1,$c1,$c1,$c1,$c4,$c1,$c1,$c4,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$c3,$00,$00,$c3,$00
	.byte $00,$c0,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c2,$00
game_attr04:
	.byte $af,$aa,$aa
	.byte $aa,$aa,$aa

game_nam05: ; Donkey Kong Jr.
	.byte $c0,$c0,$c4,$c0,$c4,$c0,$c0,$c4,$c0,$c4,$c0,$c0
	.byte $c1,$00,$c3,$00,$c3,$00,$00,$c3,$00,$c3,$00,$c1
	.byte $c1,$00,$c3,$00,$c3,$00,$00,$c3,$00,$c3,$00,$c1
	.byte $c1,$00,$c3,$00,$c3,$00,$00,$c3,$00,$c3,$00,$c1
	.byte $c1,$00,$c3,$00,$c3,$00,$00,$c3,$00,$c3,$00,$c1
	.byte $c1,$00,$c3,$00,$c3,$00,$00,$c3,$00,$c3,$00,$c1
	.byte $c1,$00,$c3,$00,$c3,$00,$00,$c3,$00,$c3,$00,$c1
	.byte $c1,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c1
game_attr05:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam06: ; Donkey Kong 3
	.byte $f6,$f6,$f7,$00,$fd,$fb,$fa,$fc,$00,$f4,$f5,$f5
	.byte $f6,$f7,$f8,$00,$00,$fb,$fa,$00,$00,$f9,$f4,$f5
	.byte $f7,$f8,$00,$00,$00,$fb,$fa,$00,$00,$00,$f9,$f4
	.byte $f8,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$f9
	.byte $00,$00,$00,$f1,$f3,$f3,$f3,$f3,$f2,$00,$00,$00
	.byte $00,$00,$f1,$f3,$f3,$f3,$f3,$f3,$f3,$f2,$00,$00
	.byte $00,$f1,$f3,$f3,$f3,$f3,$f3,$f3,$f3,$f3,$f2,$00
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
game_attr06:
	.byte $ff,$ff,$ff
	.byte $aa,$aa,$aa

game_nam07: ; Donkey Kong Jr. Math
	.byte $c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1
	.byte $00,$c4,$00,$c2,$00,$c2,$00,$c2,$00,$c4,$00,$00
	.byte $00,$c4,$00,$00,$00,$00,$00,$00,$00,$c4,$00,$00
	.byte $00,$c4,$00,$c3,$00,$c3,$00,$c3,$00,$c4,$00,$00
	.byte $00,$c4,$00,$c2,$00,$c2,$00,$c2,$00,$c4,$c5,$c5
	.byte $00,$c4,$00,$00,$00,$00,$00,$00,$00,$c4,$00,$00
	.byte $00,$c4,$00,$c3,$00,$c3,$00,$c3,$00,$c4,$00,$00
	.byte $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
game_attr07:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$ae

game_nam08: ; Duck Hunt
	.byte $d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $d7,$ed,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $df,$ec,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $d7,$dd,$de,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $da,$db,$dc,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $d7,$d8,$d9,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d5,$d6,$d7
	.byte $d0,$d1,$d0,$d2,$d0,$d2,$d0,$d2,$d0,$d4,$d3,$d2
game_attr08:
	.byte $ae,$ff,$ff
	.byte $fa,$ff,$ff

game_nam09: ; Excite Bike
	.byte $ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4
	.byte $d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4
	.byte $d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4
	.byte $d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4
	.byte $d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0
game_attr09:
	.byte $af,$af,$af
	.byte $aa,$aa,$aa

game_nam10: ; Golf
	.byte $f1,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4
	.byte $f1,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4
	.byte $f1,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4
	.byte $f1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1
	.byte $f1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1
	.byte $f1,$c1,$f5,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$f5,$c1
	.byte $f1,$f2,$f2,$f2,$f2,$f2,$f2,$f2,$f2,$f2,$f2,$f2
	.byte $00,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
game_attr10:
	.byte $aa,$aa,$aa
	.byte $ae,$aa,$ae

game_nam11: ; Gumshoe
	.byte $c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6
	.byte $c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6
	.byte $c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6
	.byte $c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6
	.byte $c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6
	.byte $c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6
	.byte $c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6
	.byte $c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7
game_attr11:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam12: ; Gyromite
	.byte $d5,$d1,$d1,$d1,$d1,$d1,$d1,$d1,$d1,$d1,$d1,$d2
	.byte $d4,$d0,$00,$d0,$00,$d0,$00,$d0,$00,$d0,$00,$d0
	.byte $d4,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$d3
	.byte $d4,$d0,$00,$d0,$00,$d0,$00,$d0,$00,$d0,$00,$d0
	.byte $d4,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$d3
	.byte $d4,$d0,$00,$d0,$00,$d0,$00,$d0,$00,$d0,$00,$d0
	.byte $d4,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$d3
	.byte $d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0
game_attr12:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam13: ; Hogan's Alley
	.byte $f0,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f2
	.byte $f1,$f6,$f6,$f6,$f6,$fa,$dc,$f6,$f6,$f6,$f6,$f1
	.byte $f1,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f1
	.byte $f1,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f1
	.byte $f1,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f1
	.byte $f1,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f7,$f1
	.byte $f1,$f6,$f8,$f9,$f6,$f8,$f9,$f6,$f8,$f9,$f6,$f1
	.byte $f3,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f5
game_attr13:
	.byte $aa,$af,$aa
	.byte $aa,$aa,$aa

game_nam14: ; Ice Climber
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5
game_attr14:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam15: ; Kung Fu
	.byte $c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2
	.byte $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
	.byte $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
	.byte $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
	.byte $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
	.byte $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
	.byte $c4,$c4,$c4,$c4,$c4,$c4,$c4,$c4,$c4,$c4,$c4,$c4
	.byte $c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1
game_attr15:
	.byte $aa,$aa,$aa
	.byte $fa,$fa,$fa

game_nam16: ; Mach Rider
game_nam21: ; Slalom
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $f1,$f1,$f3,$f0,$f0,$f0,$f0,$f0,$f0,$f2,$f1,$f1
	.byte $f1,$f3,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f2,$f1
	.byte $f3,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f2
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
game_attr16:
game_attr21:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam17: ; Mario Bros.
	.byte $d6,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$d7
	.byte $d8,$d8,$d8,$d8,$00,$00,$00,$00,$d8,$d8,$d8,$d8
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$d8,$d8,$d8,$d8,$d8,$d8,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $d8,$d8,$d8,$d8,$00,$00,$00,$00,$d8,$d8,$d8,$d8
	.byte $d6,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$d7
	.byte $d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5
game_attr17:
	.byte $aa,$aa,$aa
	.byte $fa,$fa,$fa

game_nam18: ; Pinball
	.byte $c0,$c0,$c3,$c5,$00,$c8,$c8,$c8,$c4,$c0,$00,$c0
	.byte $c0,$c0,$c3,$00,$00,$00,$00,$00,$c4,$c0,$00,$c0
	.byte $c0,$c0,$c3,$00,$c7,$00,$c7,$00,$c4,$c0,$00,$c0
	.byte $c0,$c0,$c3,$00,$00,$00,$00,$00,$c4,$c0,$00,$c0
	.byte $c0,$c0,$c5,$00,$00,$00,$00,$00,$c5,$c0,$00,$c0
	.byte $c0,$c0,$c3,$c5,$00,$00,$00,$c5,$c4,$c0,$00,$c0
	.byte $c0,$c0,$c1,$00,$00,$00,$00,$00,$c2,$c0,$00,$c0
	.byte $c0,$c0,$c0,$c1,$00,$00,$00,$c2,$c0,$c0,$00,$c0
game_attr18:
	.byte $aa,$fa,$aa
	.byte $aa,$ab,$aa

game_nam19: ; Popeye
	.byte $e0,$e1,$00,$00,$00,$00,$00,$00,$00,$00,$e2,$e3
	.byte $fb,$fc,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fd,$fe
	.byte $f7,$f8,$00,$00,$00,$00,$00,$00,$00,$00,$f7,$f8
	.byte $f3,$f3,$f3,$f3,$f3,$e4,$e5,$f3,$f3,$f3,$f3,$f3
	.byte $f1,$f3,$f3,$f3,$f3,$f4,$f5,$f3,$f3,$f3,$f3,$f2
	.byte $f1,$f3,$f3,$f3,$f2,$f3,$f3,$f1,$f3,$f3,$f3,$f2
	.byte $f6,$f6,$f6,$f6,$f6,$f6,$f6,$f6,$f6,$f6,$f6,$f6
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
game_attr19:
	.byte $af,$af,$af
	.byte $aa,$aa,$aa

game_nam20: ; Pro Wrestling
	.byte $f0,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f2
	.byte $f3,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f4
	.byte $f3,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f4
	.byte $f3,$f8,$f8,$f8,$f9,$fa,$fb,$fc,$f8,$f8,$f8,$f4
	.byte $f3,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f4
	.byte $f3,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f4
	.byte $f3,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f8,$f4
	.byte $f5,$f6,$f6,$f6,$f6,$f6,$f6,$f6,$f6,$f6,$f6,$f7
game_attr20:
	.byte $ff,$af,$ff
	.byte $ff,$ff,$ff

game_nam22: ; Soccer
	.byte $c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c3,$f0
	.byte $ca,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$ca,$f0
	.byte $ca,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$c9,$cd
	.byte $ca,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$c8,$cc
	.byte $ca,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$c7,$cc
	.byte $ca,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$c6,$cb
	.byte $ca,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$c5,$f0
	.byte $c0,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c4,$f0
game_attr22:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam23: ; Stack Up
	.byte $4e,$4f,$00,$52,$4f,$42,$4f,$54,$00,$54,$4f,$00
	.byte $50,$4c,$41,$59,$00,$54,$48,$49,$53,$00,$00,$00
	.byte $57,$49,$54,$48,$3e,$00,$49,$46,$00,$59,$4f,$55
	.byte $47,$4f,$00,$4f,$55,$54,$53,$49,$44,$45,$3c,$00
	.byte $59,$4f,$55,$00,$43,$41,$4e,$00,$4d,$41,$4b,$45
	.byte $4e,$45,$57,$3c,$00,$41,$43,$54,$55,$41,$4c,$00
	.byte $48,$55,$4d,$41,$4e,$5e,$54,$59,$50,$45,$00,$00
	.byte $46,$52,$49,$45,$4e,$44,$53,$3e,$00,$00,$00,$00
game_attr23:
	.byte $00,$00,$00
	.byte $00,$00,$00

game_nam24: ; SMB
	.byte $d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$c6,$c7,$d7,$d7
	.byte $d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7,$d7
	.byte $c5,$c5,$c5,$c5,$c5,$c5,$c5,$c5,$c5,$c5,$c5,$c5
game_attr24:
	.byte $aa,$aa,$ab
	.byte $aa,$aa,$aa

game_nam25: ; Tennis
	.byte $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
	.byte $c0,$c8,$cf,$cf,$cf,$cf,$cf,$cf,$cf,$cf,$c9,$c0
	.byte $c0,$c7,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$ca,$c0
	.byte $c0,$c6,$dc,$dc,$dc,$dc,$dc,$dc,$dc,$dc,$cb,$c0
	.byte $c0,$c5,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$cc,$c0
	.byte $c0,$c4,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$c1,$cd,$c0
	.byte $c0,$c3,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$c2,$ce,$c0
	.byte $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
game_attr25:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam26: ; Urban Champion
	.byte $f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4,$f4
	.byte $f4,$00,$00,$f4,$f4,$00,$00,$f4,$f4,$00,$00,$f4
	.byte $f4,$00,$00,$f4,$f4,$00,$00,$f4,$f4,$00,$00,$f4
	.byte $f5,$f5,$f5,$f5,$f5,$f6,$f7,$f8,$f5,$f5,$f5,$f5
	.byte $f0,$00,$00,$f0,$f0,$00,$00,$f0,$f0,$00,$00,$f0
	.byte $f0,$00,$00,$f0,$f0,$00,$00,$f0,$f0,$00,$00,$f0
	.byte $f0,$f0,$f0,$f0,$f0,$00,$00,$f0,$f0,$f0,$f0,$f0
	.byte $f2,$f3,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f2,$f3
game_attr26:
	.byte $ff,$ff,$ff
	.byte $aa,$aa,$aa

game_nam27: ; Volleyball
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $f8,$ff,$ff,$ff,$ff,$e2,$e3,$ff,$ff,$ff,$ff,$f9
	.byte $f7,$f1,$f1,$f1,$f1,$e0,$e1,$f1,$f1,$f1,$f1,$fa
	.byte $f6,$f1,$f1,$f1,$f1,$e0,$e1,$f1,$f1,$f1,$f1,$fb
	.byte $f5,$f1,$f1,$f1,$f1,$e0,$e1,$f1,$f1,$f1,$f1,$fc
	.byte $f4,$f1,$f1,$f1,$f1,$e0,$e1,$f1,$f1,$f1,$f1,$fd
	.byte $f3,$f2,$f2,$f2,$f2,$e4,$e5,$f2,$f2,$f2,$f2,$fe
	.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0
game_attr27:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam28: ; Wild Gunman
	.byte $f0,$f1,$f2,$f3,$f4,$f0,$f0,$f4,$f1,$f2,$f3,$f0
	.byte $f5,$fc,$fd,$de,$ed,$d7,$d8,$ef,$fc,$fd,$de,$f5
	.byte $f5,$df,$00,$e0,$ee,$d5,$d6,$d0,$df,$00,$e0,$f5
	.byte $f6,$f6,$f6,$f6,$d1,$d2,$d3,$d4,$f6,$f6,$f6,$f6
	.byte $f5,$e1,$e2,$e3,$e4,$00,$00,$e5,$e1,$e2,$e3,$f5
	.byte $f5,$df,$00,$e0,$e6,$00,$00,$e7,$df,$00,$e0,$f5
	.byte $f5,$ea,$eb,$ec,$e8,$00,$00,$e9,$ea,$eb,$ec,$f5
	.byte $f7,$f8,$f7,$f8,$f9,$fa,$fa,$fb,$f8,$f7,$f8,$f7
game_attr28:
	.byte $aa,$aa,$aa
	.byte $aa,$aa,$aa

game_nam29: ; Wrecking Crew
	.byte $d2,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$d2
	.byte $d0,$d3,$d3,$00,$d3,$ef,$d3,$00,$ef,$d3,$d3,$d0
	.byte $d2,$00,$00,$00,$00,$d4,$00,$00,$d4,$00,$00,$d2
	.byte $d0,$d3,$d3,$ef,$00,$ef,$d3,$d3,$ef,$00,$d3,$d0
	.byte $d2,$00,$00,$d4,$00,$d4,$00,$00,$d4,$00,$00,$d2
	.byte $d0,$d3,$ef,$d3,$00,$d4,$00,$d3,$ef,$d3,$d3,$d0
	.byte $d2,$00,$d4,$00,$00,$d4,$00,$00,$d4,$00,$00,$d2
	.byte $d1,$d1,$d1,$d1,$d1,$d1,$d1,$d1,$d1,$d1,$d1,$d1
game_attr29:
	.byte $ee,$ff,$bb
	.byte $ee,$ff,$bb

game_nam30:	; nesvc
	.byte $de,$de,$de,$de,$de,$de,$de,$de,$de,$de,$de,$de
	.byte $de,$df,$00,$00,$00,$00,$00,$00,$00,$00,$df,$de
	.byte $de,$de,$00,$00,$00,$00,$00,$00,$00,$00,$de,$de
	.byte $de,$df,$00,$00,$00,$00,$00,$00,$00,$00,$df,$de
	.byte $de,$de,$00,$00,$00,$00,$00,$00,$00,$00,$de,$de
	.byte $de,$df,$00,$00,$00,$00,$00,$00,$00,$00,$df,$de
	.byte $de,$de,$00,$00,$00,$00,$00,$00,$00,$00,$de,$de
	.byte $de,$de,$de,$de,$de,$00,$00,$c5,$de,$de,$de,$de
game_attr30:
	.byte $2a,$0a,$8a
	.byte $a2,$a0,$a8

game_nam31:	; karnov
	.byte $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
	.byte $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
	.byte $c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6,$c6
	.byte $c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7
	.byte $c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7,$c7
	.byte $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
	.byte $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
	.byte $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
game_attr31:
	.byte $aa,$aa,$aa
	.byte $ff,$ff,$ff

game_menu_y:
	.byte $7f,$87,$8f,$97,$9f,$a7,$af,$b7,$bf,$c7,$cf
	.byte $7f,$87,$8f,$97,$9f,$a7,$af,$b7,$bf,$c7,$cf
	.byte $7f,$87,$8f,$97,$9f,$a7,$af,$b7,$bf,$c7,$f0
	.byte $cf,$cf,$f0
game_menu_x:
	.byte $18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18
	.byte $60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60
	.byte $a8,$a8,$a8,$a8,$a8,$a8,$a8,$a8,$a8,$a8,$f0
	.byte $38,$80,$f0

game_desc_lo:
	.byte <game_desc00, <game_desc01, <game_desc02, <game_desc03, <game_desc04
	.byte <game_desc05, <game_desc06, <game_desc07, <game_desc08, <game_desc09
	.byte <game_desc10, <game_desc11, <game_desc12, <game_desc13, <game_desc14
	.byte <game_desc15, <game_desc16, <game_desc17, <game_desc18, <game_desc19
	.byte <game_desc20, <game_desc21, <game_desc22, <game_desc23, <game_desc24
	.byte <game_desc25, <game_desc26, <game_desc27, <game_desc28, <game_desc29
	.byte <game_desc30, <game_desc31, <game_desc32
game_desc_hi:
	.byte >game_desc00, >game_desc01, >game_desc02, >game_desc03, >game_desc04
	.byte >game_desc05, >game_desc06, >game_desc07, >game_desc08, >game_desc09
	.byte >game_desc10, >game_desc11, >game_desc12, >game_desc13, >game_desc14
	.byte >game_desc15, >game_desc16, >game_desc17, >game_desc18, >game_desc19
	.byte >game_desc20, >game_desc21, >game_desc22, >game_desc23, >game_desc24
	.byte >game_desc25, >game_desc26, >game_desc27, >game_desc28, >game_desc29
	.byte >game_desc30, >game_desc31, >game_desc32
game_desc32: ; glitched
	.byte "YOUR NES ISN'T WORKING!",$ff
game_desc00: ; 10 yard
	.byte "DODGE ALL DEFENDERS",$ff
game_desc01: ; Balloon Fight
	.byte "DODGE STARS",$9d,"GRAB BALLOONS",$ff
game_desc02: ; baseball
	.byte "HOME RUN DERBY",$ff
game_desc03: ; cc land
	.byte "EXPOSE ALL COINS",$ff
game_desc04: ; donkey kong
	.byte "JUMP BARRELS",$9d,"REACH THE TOP",$ff
game_desc05: ; dk jr
	.byte "PUSH KEYS INTO THE LOCKS",$ff
game_desc06: ; dk 3
	.byte "PROTECT FLOWERS-DON'T LET",$ff
game_desc07: ; dk math
	.byte "MAKE CORRECT EQUATIONS",$ff
game_desc08: ; duck hunt
	.byte "SHOOT THE DUCKS",$ff
game_desc09: ; excitebike
	.byte "JUMP RAMPS ",$9d," DODGE OIL",$ff
game_desc10: ; golf
	.byte "LINE UP WITH THE TARGET",$ff
game_desc11: ; gumshoe
	.byte "DODGE SKULLS",$9d,"ZAP BALLOONS",$ff
game_desc12: ; gyromite
	.byte "DEACTIVATE BOMBS BEFORE",$ff
game_desc13: ; halley
	.byte "SHOOT PERPETRATORS",$ff
game_desc14: ; i climber
	.byte "DON'T GET SQUASHED",$ff
game_desc15: ; kung fu
	.byte "BEAT UP ENEMIES",$ff
game_desc16: ; m rider
	.byte "SHOOT ENEMY BIKES",$ff
game_desc17: ; m bros
	.byte "HIT TURTLES FROM BELOW",$ff
game_desc18: ; pinball
	.byte "KEEP THE BALL IN PLAY",$ff
game_desc19: ; popeye
	.byte "COLLECT HEARTS",$ff
game_desc20: ; prowrestling
	.byte $8e,$00,"GRAPPLE",$ff
game_desc21: ; slalom
	.byte "TOUCH THE FLAGS",$ff
game_desc22: ; soccer
game_desc25: ; tennis
game_desc27: ; volleyball
	.byte "SCORE ON THE OPPONENT",$ff
game_desc23: ; stack up
	.byte "SINCE THIS GAME CAN'T BE",$ff
game_desc24: ; smb
	.byte "ELIMINATE BADDIES",$ff
game_desc26: ; urban champ
	.byte "KNOCK HIM IN THE SEWER",$ff
game_desc28: ; w gunman
	.byte "SHOOT THE GUNMEN",$ff
game_desc29: ; w crew
	.byte "HAMMER THE WALLS",$ff
game_desc30:
	.byte "COLLECT VIRUSES",$ff
game_desc31:
	.byte "COLLECT 'K' ICONS",$ff

game_ctrls_lo:
	.byte <game_ctrls00, <game_ctrls01, <game_ctrls02, <game_ctrls03, <game_ctrls04
	.byte <game_ctrls05, <game_ctrls06, <game_ctrls07, <game_ctrls08, <game_ctrls09
	.byte <game_ctrls10, <game_ctrls11, <game_ctrls12, <game_ctrls13, <game_ctrls14
	.byte <game_ctrls15, <game_ctrls16, <game_ctrls17, <game_ctrls18, <game_ctrls19
	.byte <game_ctrls20, <game_ctrls21, <game_ctrls22, <game_ctrls23, <game_ctrls24
	.byte <game_ctrls25, <game_ctrls26, <game_ctrls27, <game_ctrls28, <game_ctrls29
	.byte <game_ctrls30, <game_ctrls31, <game_ctrls32
game_ctrls_hi:
	.byte >game_ctrls00, >game_ctrls01, >game_ctrls02, >game_ctrls03, >game_ctrls04
	.byte >game_ctrls05, >game_ctrls06, >game_ctrls07, >game_ctrls08, >game_ctrls09
	.byte >game_ctrls10, >game_ctrls11, >game_ctrls12, >game_ctrls13, >game_ctrls14
	.byte >game_ctrls15, >game_ctrls16, >game_ctrls17, >game_ctrls18, >game_ctrls19
	.byte >game_ctrls20, >game_ctrls21, >game_ctrls22, >game_ctrls23, >game_ctrls24
	.byte >game_ctrls25, >game_ctrls26, >game_ctrls27, >game_ctrls28, >game_ctrls29
	.byte >game_ctrls30, >game_ctrls31, >game_ctrls32
game_ctrls32: ; glitched
	.byte "THIS IS HORRIBLE!",$fe
	.byte "FIND A WAY TO FIX THIS TO",$fe
	.byte "CONTINUE YOUR QUEST!",$ff
game_ctrls00: ; 10 yard
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$ff
game_ctrls01: ; b fight
	.byte $8e,$00,"KEEP ALOFT",$ff
game_ctrls02: ; b ball
	.byte $8e,$00,"SWING BAT",$ff
game_ctrls03: ; cc land
	.byte $8f,$00,"MOVE CHARACTER",$ff
game_ctrls04: ; d kong
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$fe
	.byte $8b,$00,$8c,$00,"MOVE UP",$9d,"DOWN LADDER",$fe
	.byte $8e,$00,"JUMP FORWARD",$ff
game_ctrls05: ; dk jr
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$fe
	.byte $8b,$00,$8c,$00,"MOVE UP",$9d,"DOWN VINE",$ff
game_ctrls06: ; dk 3
	.byte "KONG FALL TO THE GROUND",$fe
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$fe
	.byte $8e,$00,"FIRE SPRAYER",$ff
game_ctrls07: ; dk math
	.byte "FAR RIGHT VINE TO SOLVE",$fe
	.byte $8f,$00,"MOVE CHARACTER",$ff
game_ctrls08: ; d hunt
	.byte $8f,$00,"MOVE THE RETICLE",$fe
	.byte $8d,$00,"FIRE GUN",$ff
game_ctrls09: ; excitebike
	.byte $8b,$00,$8c,$00,"STEER TO LANE",$ff
game_ctrls10: ; golf
	.byte $8d,$00,"STOP VERTICAL CURSOR",$fe
	.byte $8e,$00,"STOP HORIZONTAL CURSOR",$ff
game_ctrls11: ; gumshoe
	.byte $8f,$00,"MOVE THE RETICLE",$fe
	.byte $8d,$00,"SWAP TO ZAP PLAYER OR",$fe
	.byte "BALLOONS", $00,$8e,$5e,"FIRE GUN",$ff
game_ctrls12: ; gyromite
	.byte "TIME RUNS OUT",$fe
	.byte $8f,$00,"MOVE CHARACTER",$fe
	.byte $8e,$00,"SHIFT PLATFORMS UP",$9d,"DOWN",$ff
game_ctrls13: ; halley
	.byte $89,$00,"SHOOT LEFT TARGET",$fe
	.byte $8b,$00,"SHOOT MIDDLE TARGET",$fe
	.byte $8a,$00,"SHOOT RIGHT TARGET",$ff
game_ctrls14: ; iclimber
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$fe
	.byte $8d,$00,"HAMMER ENEMY",$ff
game_ctrls15: ; kung fu
	.byte $8b,$00,"JUMP KICK",$fe
	.byte $8d,$00,"KICK",$ff
game_ctrls16: ; m rider
	.byte $89,$00,"TAP TO MOVE LEFT",$fe
	.byte $8a,$00,"TAP TO MOVE RIGHT",$fe
	.byte $8e,$00,"FIRE GUN",$ff
game_ctrls17: ; m bros
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$fe
	.byte $8e,$00,"JUMP",$9d,"AUTO TO NEXT FLOOR",$ff
game_ctrls18: ; pinball
	.byte $89,$00,"LEFT FLIPPER",$fe
	.byte $8e,$00,"RIGHT FLIPPER",$ff
game_ctrls19: ; popeye
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$fe
	.byte $8b,$00,$8c,$00,"MOVE UP",$9d,"DOWN LADDER",$ff
game_ctrls20: ; prowrestling
	.byte "GRAPPLE+",$8d,$00,"KICK",$fe
	.byte "GRAPPLE+",$8b,$00,"SUPLEX",$fe
	.byte "GRAPPLE+",$8c,$00,"BODY SLAM",$ff
game_ctrls21: ; slalom
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$ff
game_ctrls22: ; soccer
	.byte $8b,$00,$8c,$00,"MOVE UP OR DOWN",$fe
	.byte $8d,$00,"KICK BALL",$ff
game_ctrls23: ; stack up
	.byte "PLAYED, PRESS ",$90,$91,$92," THEN ",$8e,$fe
	.byte "TO LEARN HOW TO TALK TO",$fe
	.byte "THE PEOPLE YOU MEET!",$ff
game_ctrls24: ; smb
	.byte $89,$00,$8a,$00,"MOVE CHARACTER",$fe
	.byte $8d,$00,"FIREBALLS-WHILE GROUNDED",$fe
	.byte $8e,$00,"JUMP",$ff
game_ctrls25: ; tennis
	.byte "KEEP THE BALL IN BOUNDS",$fe
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$fe
	.byte $8e,$00,"FACE THE OTHER DIRECTION",$ff
game_ctrls26: ; u champ
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$fe
	.byte $8e,$00,"PUNCH",$ff
game_ctrls27: ; v ball
	.byte "HOLD",$00,$8d,$00,"CONTROL BOT. PLAYER",$fe
	.byte "HOLD",$00,$8e,$00,"CONTROL TOP PLAYER",$fe
	.byte $8f,$00,"MOVE CONTROLLED PLAYER",$ff
game_ctrls28: ; w gunman
	.byte $8f,$00,"MOVE THE RETICLE",$fe
	.byte $8d,$00,"FIRE GUN",$ff
game_ctrls29: ; w crew 
	.byte $89,$00,$8a,$00,"MOVE LEFT OR RIGHT",$fe
	.byte $8b,$00,$8c,$00,"MOVE UP",$9d,"DOWN LADDER",$fe
	.byte $8e,$00,"HAMMER WALL",$ff
game_ctrls30:
	.byte $8f,$00,"MOVE CLIK",$ff
game_ctrls31:
	.byte "AVOID WALLS",$fe
	.byte $8f,$00,"MOVE JINBOROV",$ff


game_sprlist_lo:
	.byte <game_sprlist00, <game_sprlist01, <game_sprlist02, <game_sprlist03, <game_sprlist04
	.byte <game_sprlist05, <game_sprlist06, <game_sprlist07, <game_sprlist08, <game_sprlist09
	.byte <game_sprlist10, <game_sprlist11, <game_sprlist12, <game_sprlist13, <game_sprlist14
	.byte <game_sprlist15, <game_sprlist16, <game_sprlist17, <game_sprlist18, <game_sprlist19
	.byte <game_sprlist20, <game_sprlist21, <game_sprlist22, <game_sprlist23, <game_sprlist24
	.byte <game_sprlist25, <game_sprlist26, <game_sprlist27, <game_sprlist28, <game_sprlist29
	.byte <game_sprlist30, <game_sprlist31, <game_sprlist23
game_sprlist_hi:
	.byte >game_sprlist00, >game_sprlist01, >game_sprlist02, >game_sprlist03, >game_sprlist04
	.byte >game_sprlist05, >game_sprlist06, >game_sprlist07, >game_sprlist08, >game_sprlist09
	.byte >game_sprlist10, >game_sprlist11, >game_sprlist12, >game_sprlist13, >game_sprlist14
	.byte >game_sprlist15, >game_sprlist16, >game_sprlist17, >game_sprlist18, >game_sprlist19
	.byte >game_sprlist20, >game_sprlist21, >game_sprlist22, >game_sprlist23, >game_sprlist24
	.byte >game_sprlist25, >game_sprlist26, >game_sprlist27, >game_sprlist28, >game_sprlist29
	.byte >game_sprlist30, >game_sprlist31, >game_sprlist23
game_sprlist_num:
	.byte $28,$10,$10,$48,$18 ; 10 yard, b fight, b ball, cc land, d kong 
	.byte $1c,$2c,$20,$1c,$14 ; dk jr, dk3, dk math, d hunt, excitebike   
	.byte $40,$14,$64,$50,$0c ; golf, gumshoe, gmite, halley, i climber   
	.byte $30,$28,$10,$0c,$10 ; kungfu, mrider, m bros, p ball, p eye     
	.byte $1c,$24,$14,$04,$20 ; prowrestling, slalom, soccer, stackup, smb
	.byte $0c,$3c,$38,$20,$24 ; tennis, uchamp, vball, wgunman, wcrew
	.byte $1c,$20,$04		  ; nesvc, karnov, glitched
game_sprlist00: ; 10 yard
	.byte $4f,$e3,$01,$ac ; 218	; player top
	.byte $57,$e4,$03,$ac ; 21c ; player bot
	.byte $37,$e9,$02,$98 ; 220 ;
	.byte $3f,$ea,$03,$98 ; 224 ;
	.byte $1f,$e9,$02,$c0 ; 228 ;
	.byte $27,$ea,$03,$c0 ; 22c ;
	.byte $1f,$e2,$00,$80 ; 230	; markers
	.byte $1f,$e2,$40,$d8 ; 234 ;
	.byte $3f,$e2,$00,$80 ; 238 ;
	.byte $3f,$e2,$40,$d8 ; 23c ;
game_sprlist01: ; b fight
	.byte $30,$d1,$21,$d4
	.byte $38,$d2,$21,$d4
	.byte $27,$00,$03,$b8
	.byte $47,$00,$02,$90
game_sprlist02: ; b ball
	.byte $50,$fa,$01,$a0	; batter
	.byte $48,$fb,$01,$a0	; top of bat
	.byte $21,$e1,$03,$a8	; ball
	.byte $21,$ff,$02,$a8	; pitcher
game_sprlist03: ; cc land
	.byte $2b,$dc,$41,$8f
	.byte $43,$ef,$01,$c7
	.byte $f0,$00,$02,$9b
	.byte $f0,$00,$02,$bb
	.byte $f0,$00,$02,$9b
	.byte $f0,$00,$02,$bb
	.byte $f0,$00,$02,$bb
	.byte $f0,$00,$02,$bb
	.byte $f0,$00,$02,$9f
	.byte $f0,$00,$02,$a7
	.byte $f0,$00,$02,$af
	.byte $f0,$00,$02,$b7
	.byte $f0,$00,$02,$9f
	.byte $f0,$00,$02,$a7
	.byte $f0,$00,$02,$af
	.byte $f0,$00,$02,$b7

	.byte $f0,$00,$02,$a7
	.byte $f0,$00,$02,$b7
game_sprlist04: ; d kong
	.byte $55,$dd,$01,$90 ; 218 mario
	.byte $f0,$cc,$02,$98 ; 21c dkong left
	.byte $f0,$cd,$02,$a0 ; 220 dkong right
	.byte $f0,$ce,$03,$a8 ; 224 barrel
	.byte $f0,$ce,$03,$a8 ; 228
	.byte $f0,$ce,$03,$a8 ; 22c
game_sprlist05: ; dk jr
	.byte $4f,$c7,$01,$88
	.byte $27,$cd,$42,$d0
	.byte $27,$cc,$02,$a2
	.byte $47,$df,$03,$92
	.byte $47,$df,$03,$a2
	.byte $47,$df,$03,$ba
	.byte $47,$df,$03,$ca
game_sprlist06: ; dk 3
	.byte $4f,$e1,$02,$ac ; 218
	.byte $f0,$e0,$01,$ac ; 21c
	.byte $27,$ce,$01,$a8 ; 220
	.byte $2f,$cf,$01,$a8 ; 224
	.byte $27,$ce,$41,$b0 ; 228
	.byte $2f,$cf,$41,$b0 ; 22c
	.byte $1f,$e3,$02,$80 ; 230
	.byte $1f,$e3,$02,$d8 ; 234
	.byte $57,$e5,$03,$98 ; 238
	.byte $57,$e5,$03,$ac ; 23c
	.byte $57,$e5,$03,$c0 ; 240
game_sprlist07: ; dk math
	.byte $39,$df,$01,$86 ; 218
	.byte $2f,$00,$00,$98 ; 21c top left
	.byte $2f,$00,$00,$a8 ; 220 +
	.byte $2f,$00,$00,$b8 ; 224 top right
	.byte $47,$00,$00,$98 ; 228 bot left
	.byte $47,$00,$00,$a8 ; 22c - 
	.byte $47,$00,$00,$b8 ; 230 bot right
	.byte $47,$00,$00,$d8 ; 234 answer
game_sprlist08: ; d hunt
	.byte $3c,$c0,$01,$ac
	.byte $27,$ef,$41,$d7
	.byte $4f,$c4,$02,$88
	.byte $2f,$c3,$02,$88
	.byte $42,$c2,$02,$83
	.byte $38,$c1,$02,$8f
	.byte $45,$c1,$02,$8f
game_sprlist09: ; excitebike
	.byte $3d,$e6,$01,$81
	.byte $45,$e7,$01,$81
	.byte $45,$e8,$01,$89
	.byte $4f,$00,$02,$ac
	.byte $37,$00,$02,$d8
game_sprlist10: ; golf
	.byte $37,$f3,$01,$80	; 218 
	.byte $57,$df,$01,$a8	; 21c
	.byte $43,$d3,$02,$b8	; 220 
	.byte $4b,$d4,$02,$b8	; 224 
	.byte $4b,$d5,$02,$c0	; 228 
	.byte $4b,$ee,$01,$c4	; 22c 
	.byte $32,$fe,$01,$a8	; 230 
	.byte $32,$ff,$01,$b0	; 234 
	.byte $3a,$e0,$01,$a8	; 238 
	.byte $3a,$e1,$01,$b0	; 23c 
	.byte $42,$e2,$01,$a8	; 240 
	.byte $42,$e3,$01,$b0	; 244 
	.byte $4a,$e4,$01,$a8	; 248 
	.byte $4a,$e5,$01,$b0	; 24c 
	.byte $37,$d2,$02,$90	; 250 
	.byte $f0,$3d,$00,$90	; 254
game_sprlist11: ; gumshoe
	.byte $3c,$cf,$02,$ac
	.byte $41,$c8,$01,$90
	.byte $49,$c9,$01,$90
	.byte $51,$ca,$01,$90
	.byte $2f,$cd,$01,$c8
game_sprlist12: ; gyromite
	.byte $f0,$d6,$01,$80 ; 218
	.byte $f0,$ee,$03,$d8 ; 21c
	.byte $f0,$dc,$02,$a8 ; 220
	.byte $f0,$dc,$02,$c8 ; 224
	.byte $f0,$dd,$03,$90 ; 228 start vines
	.byte $f0,$dd,$03,$90 ; 22c
	.byte $f0,$dd,$03,$90 ; 230
	.byte $f0,$dd,$03,$90 ; 234
	.byte $f0,$dd,$03,$90 ; 238
	.byte $f0,$dd,$03,$90 ; 23c
	.byte $f0,$dd,$03,$90 ; 240
	.byte $f0,$dd,$03,$c0 ; 244
	.byte $f0,$dd,$03,$c0 ; 248
	.byte $f0,$dd,$03,$c0 ; 24c
	.byte $f0,$dd,$03,$c0 ; 250
	.byte $f0,$dd,$03,$c0 ; 254
	.byte $f0,$dd,$03,$c0 ; 258
	.byte $f0,$dd,$03,$c0 ; 25c
	.byte $f0,$db,$02,$a0 ; 260 start platforms
	.byte $f0,$db,$02,$a0 ; 264
	.byte $f0,$db,$02,$b0 ; 268
	.byte $f0,$db,$02,$b0 ; 26c
	.byte $f0,$db,$02,$d0 ; 270
	.byte $f0,$db,$02,$d0 ; 274
	.byte $20,$39,$00,$80 ; 278
game_sprlist13: ; halley
	.byte $37,$00,$03,$90	; 218 x
	.byte $37,$00,$03,$98	; 21c
	.byte $3f,$00,$03,$90	; 220
	.byte $3f,$00,$03,$98	; 224
	.byte $47,$00,$03,$90	; 228
	.byte $47,$00,$03,$98	; 22c
	.byte $37,$00,$02,$c0	; 230 x
	.byte $37,$00,$02,$c8	; 234
	.byte $3f,$00,$02,$c0	; 238
	.byte $3f,$00,$02,$c8	; 23c
	.byte $47,$00,$02,$c0	; 240
	.byte $47,$00,$02,$c8	; 244
	.byte $37,$00,$01,$a8	; 248 x
	.byte $37,$00,$01,$b0	; 24c
	.byte $3f,$00,$01,$a8	; 250
	.byte $3f,$00,$01,$b0	; 254
	.byte $47,$00,$01,$a8	; 258
	.byte $47,$00,$01,$b0	; 25c
	.byte $f0,$fb,$02,$a8	; 260
	.byte $f0,$fc,$02,$b0	; 264
game_sprlist14: ; iclimber
	.byte $47,$00,$41,$b4
	.byte $4f,$e6,$41,$b4
	.byte $f0,$ec,$41,$80
game_sprlist15: ; kung fu
	.byte $37,$c5,$01,$d0 ; 218
	.byte $3f,$c6,$01,$d0 ; 21c
	.byte $47,$c7,$01,$d0 ; 220
	.byte $f0,$00,$01,$f0 ; 224
	
	.byte $f0,$d9,$02,$00 ; 228
	.byte $f0,$da,$02,$00 ; 22c
	.byte $f0,$db,$02,$00 ; 230
	
	.byte $f0,$d9,$02,$00 ; 234
	.byte $f0,$da,$02,$00 ; 238
	.byte $f0,$db,$02,$00 ; 23c
	.byte $1f,$df,$03,$a8 ; 240
	.byte $57,$c3,$03,$a8 ; 244
game_sprlist16: ; m rider
	.byte $56,$e0,$01,$a8
	.byte $f0,$e1,$01,$a8
	.byte $27,$e4,$02,$a0
	.byte $f0,$e3,$02,$f0
	.byte $1f,$ff,$03,$98
	.byte $1f,$ff,$03,$a0
	.byte $1f,$ff,$03,$a8
	.byte $1f,$ff,$03,$b0
	.byte $1f,$ff,$03,$b8
	.byte $1f,$ff,$03,$c0
game_sprlist17: ; m bros
	.byte $4f,$d9,$01,$90
	.byte $1f,$db,$22,$80
	.byte $1f,$db,$62,$d8
	.byte $f0,$de,$03,$80
game_sprlist18: ; pinball
	.byte $4f,$c9,$00,$a0
	.byte $4f,$c9,$40,$b0
	.byte $57,$cc,$00,$d0
game_sprlist19: ; popeye
	.byte $46,$e7,$01,$90 ; 218 popeye
	.byte $36,$e9,$02,$c8 ; 21c bluto
	.byte $f0,$ec,$03,$b8 ; 220 heart
	.byte $26,$eb,$03,$b0 ; 224 olive
game_sprlist20: ; prowrestling
	.byte $f0,$31,$00,$88 ; 218
	.byte $37,$fd,$01,$a0 ; 21c good guy
	.byte $3f,$e1,$01,$a0 ; 220
	.byte $f0,$ff,$01,$00 ; 224
	.byte $37,$fd,$42,$b8 ; 228 bad guy
	.byte $3f,$e1,$42,$b8 ; 22c
	.byte $f0,$ff,$42,$f0 ; 230
game_sprlist21: ; slalom
	.byte $56,$f7,$01,$b0	; player
	.byte $3d,$00,$02,$a0	; ice/flag
	.byte $27,$00,$02,$c8	; ice/flag
	.byte $1f,$f4,$03,$98	; mtn left
	.byte $1f,$f5,$03,$a0	; mtn right
	.byte $1f,$f4,$03,$a8	; mtn left
	.byte $1f,$f5,$03,$b0	; mtn right
	.byte $1f,$f4,$03,$b8	; mtn left
	.byte $1f,$f5,$03,$c0	; mtn right
game_sprlist22: ; soccer
	.byte $37,$db,$01,$83
	.byte $3f,$dc,$01,$83
	.byte $3f,$de,$03,$8b
	.byte $37,$db,$42,$d0
	.byte $3f,$dc,$42,$d0
game_sprlist23: ; stack up
	.byte $f0,$f0,$f0,$f0
game_sprlist24: ; smb
	.byte $4f,$c8,$01,$88	; mario
	.byte $f0,$ca,$02,$d8	; 21c goomba
	.byte $f0,$cb,$02,$d8	; 220 q block
	.byte $f0,$f0,$03,$d8	; 224 fire flower
	.byte $f0,$cd,$03,$d8	; 228 fireball
	.byte $f0,$ce,$00,$a8	; 22c pit
	.byte $f0,$c5,$02,$d8	; 230 brick
	.byte $f8,$cd,$03,$f0	; 234
game_sprlist25: ; tennis
	.byte $57,$dd,$01,$c8
	.byte $57,$de,$03,$c5	;$cb=testright;$c9=testmid;$c5=testleft;$21,$de,$03,$92
	.byte $1f,$dd,$02,$94
game_sprlist26: ; u champion
	.byte $45,$f9,$02,$90 ; 218
	.byte $45,$fa,$02,$98 ; 21c
	.byte $4d,$fb,$02,$90 ; 220
	.byte $4d,$fc,$02,$98 ; 224
	.byte $55,$ff,$01,$90 ; 228
	.byte $55,$e0,$01,$98 ; 22c

	.byte $45,$fa,$43,$c0 ; 230
	.byte $45,$f9,$43,$c8 ; 234
	.byte $4d,$fc,$43,$c0 ; 238
	.byte $4d,$fb,$43,$c8 ; 23c
	.byte $55,$d3,$01,$c0 ; 240
	.byte $55,$d4,$01,$c8 ; 244
	
	.byte $f0,$e8,$02,$01 ; 248 player fist
	.byte $f0,$e8,$43,$f0 ; 24c enemy fist
	.byte $1f,$d7,$01,$ac
game_sprlist27: ; volleyball
	.byte $27,$ea,$03,$d0 ; 218  ; ball
	.byte $3f,$e6,$01,$88 ; 21c  ; bot player 1
	.byte $47,$e7,$01,$88 ; 220  ;
	.byte $27,$e6,$01,$a0 ; 224  ; top player 1
	.byte $2f,$e7,$01,$a0 ; 228  ; 
	.byte $3f,$e6,$42,$b8 ; 22c  ; bot player 2
	.byte $47,$e7,$42,$b8 ; 230  ; 
	.byte $27,$e6,$42,$d0 ; 234  ; top player 2
	.byte $2f,$e7,$42,$d0 ; 238  ; 
	.byte $2f,$eb,$03,$d0 ; 23c  ; shadow
	.byte $f0,$98,$00,$f0 ; 240
	.byte $f0,$98,$00,$f0 ; 244
	.byte $f0,$98,$00,$f0 ; 248
	.byte $f0,$98,$00,$f0 ; 24c
game_sprlist28: ; w gunman  
	.byte $47,$fe,$01,$ac ; 218
	.byte $f0,$db,$03,$b0 ; 21c
	.byte $f0,$00,$01,$00 ; 220
	.byte $f0,$00,$01,$00 ; 224
	.byte $f0,$00,$01,$00 ; 228
	.byte $f0,$00,$01,$00 ; 22c
	.byte $f0,$00,$01,$00 ; 230
	.byte $f0,$00,$01,$00 ; 234
game_sprlist29: ; w crew
	.byte $4f,$d6,$41,$a0 ; 218
	.byte $1f,$db,$42,$88 ; 21c
	.byte $3f,$db,$02,$d0 ; 220
	.byte $f0,$d5,$03,$f0 ; 224
	.byte $f0,$d5,$03,$f0
	.byte $f0,$d5,$03,$f0
	.byte $f0,$d5,$03,$f0
	.byte $f0,$d5,$03,$f0
	.byte $f0,$d5,$03,$f0
game_sprlist30:
	.byte $4f,$c0,$01,$ac ; clik
	.byte $27,$c3,$02,$c2 ; 21c
	.byte $37,$c3,$02,$98 ; 220
	.byte $47,$c3,$02,$a0 ; 224
	.byte $f0,$c4,$02,$f0 ; 228 virus
	.byte $58,$33,$00,$a8 ; 22c time tens
	.byte $58,$30,$00,$b0 ; 230 time ones
game_sprlist31:
	.byte $3f,$ce,$01,$90 ; 218	; player top
	.byte $47,$cf,$01,$90 ; 21c ; player bot
	.byte $3f,$cc,$02,$88 ; 220 ; player wing
	.byte $f0,$ca,$03,$00 ; 224 ; wall
	.byte $f0,$ca,$03,$f0 ; 228 ; wall
	.byte $f0,$ca,$03,$f0 ; 22c ; wall
	.byte $ef,$cb,$02,$07 ; 230 ; k







game_lrn_blank:
	.byte "                          "
game_lrn_ppu_lo:
	.byte $02,$43,$4b,$82,$c3,$0a,$2b
game_lrn_ppu_hi:
	.byte $2e,$2e,$2e,$2e,$2e,$2f,$2f
game_lrn_offset:
	.byte $1b,$1a,$0a,$1b,$1a,$0d,$0b
game_lrn_addys_lo:
	.byte <game_lrned_words1,<game_lrn_blank,<game_lrned_lo,<game_lrned_words2,<game_lrn_lo,<game_info0
game_lrn_addys_hi:
	.byte >game_lrned_words1,>game_lrn_blank,>game_lrned_lo,>game_lrned_words2,>game_lrn_lo,>game_info0
game_addys_lo:
	.byte <game_lrned_words1,<game_lrn_blank,<game_lrned_hi,<game_lrned_words2,<game_lrn_hi
game_addys_hi:
	.byte >game_lrned_words1,>game_lrn_blank,>game_lrned_hi,>game_lrned_words2,>game_lrn_hi
nmi_game_lrned:
	ldy #$00
	lda temp_8bit_2
	cmp #$02
	beq :+
		cmp #$04
		bne :+++
:			ldx temp_8bit_2
			lda game_lrn_offset, x
			sta g_counter1
			lda game_lrn_addys_lo, x
			sta temp_16bit_1+0
			lda game_lrn_addys_hi, x
			sta temp_16bit_1+1
			lda game_addys_lo, x
			sta temp_16bit_2+0
			lda game_addys_hi, x
			sta temp_16bit_2+1
			ldy temp_8bit_1
			lda (temp_16bit_1), y
			sta temp_16bit_3+0
			lda (temp_16bit_2), y
			sta temp_16bit_3+1
			ldy #$00
			lda game_lrn_ppu_hi, x
			sta $2006
			lda game_lrn_ppu_lo, x
			sta $2006
:			lda (temp_16bit_3), y
			sta $2007
			iny
			cpy g_counter1
			bne :-
			jmp :+++
:	ldx temp_8bit_2
	lda game_lrn_offset, x
	sta g_counter1
	lda game_lrn_addys_lo, x
	sta temp_16bit_1+0
	lda game_lrn_addys_hi, x
	sta temp_16bit_1+1
	lda game_lrn_ppu_hi, x
	sta $2006
	lda game_lrn_ppu_lo, x
	sta $2006
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy g_counter1
	bne :-
:		inc temp_8bit_2
		lda temp_8bit_2
		cmp #$06
		bne :+
			lda #<loop_game_done_win0
			sta loop_pointer+0
			lda #>loop_game_done_win0
			sta loop_pointer+1
			lda #<nmi_empty
			sta nmi_pointer+0
			lda #>nmi_empty
			sta nmi_pointer+1
:	jmp end_nmi
game_lrned_lo:
	.byte <game_lrned00, <game_lrned01, <game_lrned02, <game_lrned03, <game_lrned04
	.byte <game_lrned05, <game_lrned06, <game_lrned07, <game_lrned08, <game_lrned09
	.byte <game_lrned10, <game_lrned11, <game_lrned12, <game_lrned13, <game_lrned14
	.byte <game_lrned15, <game_lrned16, <game_lrned17, <game_lrned18, <game_lrned19
	.byte <game_lrned20, <game_lrned21, <game_lrned22, <game_lrned23, <game_lrned24
	.byte <game_lrned25, <game_lrned26, <game_lrned27, <game_lrned28, <game_lrned29
	.byte <game_lrned30, <game_lrned31, <game_lrned00
game_lrned_hi:
	.byte >game_lrned00, >game_lrned01, >game_lrned02, >game_lrned03, >game_lrned04
	.byte >game_lrned05, >game_lrned06, >game_lrned07, >game_lrned08, >game_lrned09
	.byte >game_lrned10, >game_lrned11, >game_lrned12, >game_lrned13, >game_lrned14
	.byte >game_lrned15, >game_lrned16, >game_lrned17, >game_lrned18, >game_lrned19
	.byte >game_lrned20, >game_lrned21, >game_lrned22, >game_lrned23, >game_lrned24
	.byte >game_lrned25, >game_lrned26, >game_lrned27, >game_lrned28, >game_lrned29
	.byte >game_lrned30, >game_lrned31, >game_lrned00
game_lrned00: ; 10 yard
	.byte "   JUKE   "	; 8y 4x
game_lrned01: ; bfight
	.byte "  FLOAT   "	; 2y 5x
game_lrned02: ; b ball
	.byte "  HOMER   "	; 4y 3x
game_lrned03: ; cc land
	.byte "   CLUE   "	; 4y 4y
game_lrned04: ; dkong
	.byte "   JUMP   "	; y x
game_lrned05:	; dk jr
	.byte " LOCKPICK "	; y x
game_lrned06: ; dk3
	.byte "   HOP    "	; 5y 6x
game_lrned07: ; dk math
	.byte "  HAGGLE  "	; 6y 1x
game_lrned08:	; dhunt
	.byte "  ESCAPE  "	; 4y 4x
game_lrned09: ; excitebike
	.byte "   RIDE   "	; 2y 2x
game_lrned10: ; golf
	.byte " MULLIGAN "	; 8y 5x
game_lrned11: ; gshoe
	.byte "PICKPOCKET"	; 3y 1x
game_lrned12: ; gmite
	.byte "  DEFUSE  "	; y x
game_lrned13: ; halley
	.byte "   ZAP    "	; y x
game_lrned14: ; iclimbr
	.byte "  CLIMB   "	; y x
game_lrned15: ; kung fu
	.byte " SIDESTEP "	; y x
game_lrned16: ; mrider
	.byte "ADRENALINE"	; 2y 2x
game_lrned17: ; m bros
	.byte "  STOMP   "	; y x
game_lrned18: ; pinball
	.byte "  BLOCK   "	; y x
game_lrned19: ; popeye
	.byte "   SAIL   "	; 7y 8x
game_lrned20: ; prowrestling
	.byte "ENDURANCE "	; y x
game_lrned21:	; slalom
	.byte " TAKEOFF  "	; 1y 8x
game_lrned22: ; soccer
	.byte "   GOAL   "	; y x
game_lrned23:	; stackup
	.byte "  MINGLE  "	; 4y 4x
game_lrned24: ; smb
	.byte " FIREBALL "	; y x
game_lrned25: ; tennis
	.byte "ADVANTAGE "	; y x
game_lrned26: ; u champ
	.byte " UPPERCUT "	; 4y 4x
game_lrned27: ; vball
	.byte "   NET    "	; y x
game_lrned28: ; wgunman
	.byte "QUICKDRAW "	; 2y 7x
game_lrned29: ; w crew
	.byte "  HAMMER  "	; y x
game_lrned30:
	.byte "  CLEAN   "	; 4y 8x
game_lrned31:
	.byte "AWESOIME! "	; y x

game_lrned_words1:
	.byte "   CONGRATS! YOU LEARNED   "
game_lrned_words2:
	.byte "        NOW YOU CAN        "

game_lrn_lo:
	.byte <game_lrn00, <game_lrn01, <game_lrn02, <game_lrn03, <game_lrn04
	.byte <game_lrn05, <game_lrn06, <game_lrn07, <game_lrn08, <game_lrn09
	.byte <game_lrn10, <game_lrn11, <game_lrn12, <game_lrn13, <game_lrn14
	.byte <game_lrn15, <game_lrn16, <game_lrn17, <game_lrn18, <game_lrn19
	.byte <game_lrn20, <game_lrn21, <game_lrn22, <game_lrn23, <game_lrn24
	.byte <game_lrn25, <game_lrn26, <game_lrn27, <game_lrn28, <game_lrn29
	.byte <game_lrn30, <game_lrn31, <game_lrn00
game_lrn_hi:
	.byte >game_lrn00, >game_lrn01, >game_lrn02, >game_lrn03, >game_lrn04
	.byte >game_lrn05, >game_lrn06, >game_lrn07, >game_lrn08, >game_lrn09
	.byte >game_lrn10, >game_lrn11, >game_lrn12, >game_lrn13, >game_lrn14
	.byte >game_lrn15, >game_lrn16, >game_lrn17, >game_lrn18, >game_lrn19
	.byte >game_lrn20, >game_lrn21, >game_lrn22, >game_lrn23, >game_lrn24
	.byte >game_lrn25, >game_lrn26, >game_lrn27, >game_lrn28, >game_lrn29
	.byte >game_lrn30, >game_lrn31, >game_lrn00
game_lrn00: ; 10 yard
	.byte " EVADE ATTACKS FROM ABOVE ",$ff
game_lrn01: ; bfight
	.byte "BALLOON OVER WATER STRAITS",$ff
game_lrn02: ; b ball
	.byte "HAVE TRANSIT GET YOU HOME ",$ff
game_lrn03: ; ccland
	.byte "EXPOSE YOUR ENEMY'S STATS ",$ff
game_lrn04: ; dkong
	.byte " LEAP ENEMY'S LOW ATTACKS ",$ff
game_lrn05:	; dk jr
	.byte " UNLOCK WOODEN DOOR LOCKS ",$ff
game_lrn06: ; dk3
	.byte "  VAULT WITH TRAMPOLINES  ",$ff
game_lrn07: ; dk math
	.byte " GET ITEMS AT A DISCOUNT  ",$ff
game_lrn08:	; dhunt
	.byte "     RUN FROM ENEMIES     ",$ff
game_lrn09: ; excitebike
	.byte " DOUBLE SPEED WITH A BIKE ",$ff
game_lrn10: ; golf
	.byte "GET ANOTHER LIFE IN BATTLE",$ff
game_lrn11: ; gshoe
	.byte "EXTRA MANUALS UPON VICTORY",$ff
game_lrn12: ; gmite
	.byte "APPLY FRIEND CODE TO PANEL",$ff
game_lrn13: ; halley
	.byte "    SHOOT YOUR ENEMIES    ",$ff
game_lrn14: ; iclimbr
	.byte " SCALE MOUNTAINS OR HILLS ",$ff
game_lrn15: ; kung fu
	.byte " AVOID REAR ENEMY ATTACKS ",$ff
game_lrn16: ; mrider
	.byte "INCREASE SPEED OF ATTACKS ",$ff
game_lrn17: ; m bros
	.byte "     STOMP ON ENEMIES     ",$ff
game_lrn18: ; pinball
	.byte "BLOCK FRONTAL BODY ATTACKS",$ff
game_lrn19: ; popeye
	.byte "TRAVERSE RIVERS VIA A BOAT",$ff
game_lrn20: ; prowrestling
	.byte "  RAISE STAMINA RECOVERY  ",$ff
game_lrn21:	; slalom
	.byte "LAUNCH BIKE OVER ROAD GAPS",$ff
game_lrn22: ; soccer
	.byte " LOCATE THE NEXT NES GAME ",$ff
game_lrn23:	; stackup
	.byte "  SPEAK TO OTHER PEOPLE   ",$ff
game_lrn24: ; smb
	.byte "SHOOT FIREBALLS IN COMBAT ",$ff
game_lrn25: ; tennis
	.byte " BATTLE WEAKENED ENEMIES  ",$ff
game_lrn26:	; u champ
	.byte "  PERFORM A BASIC ATTACK  ",$ff
game_lrn27: ; vball
	.byte " SAVE AT OTHER COMPUTERS  ",$ff
game_lrn28: ; wgunman
	.byte "GET CHANCE OF FIRST ATTACK",$ff
game_lrn29: ; w crew
	.byte "CRUSH BOULDERS IN YOUR WAY",$ff
game_lrn30:
	.byte "      PLAY YOUR NES!      ",$ff
game_lrn31:
	.byte "  BE AWESOIME IN COMBAT!  ",$ff



game_nmi_lo:
	.byte <game_nmi00, <game_nmi01, <game_nmi02, <game_nmi03, <game_nmi04
	.byte <game_nmi05, <game_nmi06, <game_nmi07, <game_nmi08, <game_nmi09
	.byte <game_nmi10, <game_nmi11, <game_nmi12, <game_nmi13, <game_nmi14
	.byte <game_nmi15, <game_nmi16, <game_nmi17, <game_nmi18, <game_nmi19
	.byte <game_nmi20, <game_nmi21, <game_nmi22, <game_nmi23, <game_nmi24
	.byte <game_nmi25, <game_nmi26, <game_nmi27, <game_nmi28, <game_nmi29
	.byte <game_nmi30, <game_nmi31, <game_nmi32
game_nmi_hi:
	.byte >game_nmi00, >game_nmi01, >game_nmi02, >game_nmi03, >game_nmi04
	.byte >game_nmi05, >game_nmi06, >game_nmi07, >game_nmi08, >game_nmi09
	.byte >game_nmi10, >game_nmi11, >game_nmi12, >game_nmi13, >game_nmi14
	.byte >game_nmi15, >game_nmi16, >game_nmi17, >game_nmi18, >game_nmi19
	.byte >game_nmi20, >game_nmi21, >game_nmi22, >game_nmi23, >game_nmi24
	.byte >game_nmi25, >game_nmi26, >game_nmi27, >game_nmi28, >game_nmi29
	.byte >game_nmi30, >game_nmi31, >game_nmi32

game_nmi02: ; bball
	jsr game_write_stats
	jmp end_nmi
game_nmi08:	; duck hunt
	jsr game_write_stats
	jmp end_nmi
game_nmi21:	; slalom
	jsr game_write_stats
	jmp end_nmi
game_nmi23:	; stackup
	jsr game_write_stats
	jmp end_nmi

game_loop_lo:
	.byte <game_loop00, <game_loop01, <game_loop02, <game_loop03, <game_loop04
	.byte <game_loop05, <game_loop06, <game_loop07, <game_loop08, <game_loop09
	.byte <game_loop10, <game_loop11, <game_loop12, <game_loop13, <game_loop14
	.byte <game_loop15, <game_loop16, <game_loop17, <game_loop18, <game_loop19
	.byte <game_loop20, <game_loop21, <game_loop22, <game_loop23, <game_loop24
	.byte <game_loop25, <game_loop26, <game_loop27, <game_loop28, <game_loop29
	.byte <game_loop30, <game_loop31, <game_loop32
game_loop_hi:
	.byte >game_loop00, >game_loop01, >game_loop02, >game_loop03, >game_loop04
	.byte >game_loop05, >game_loop06, >game_loop07, >game_loop08, >game_loop09
	.byte >game_loop10, >game_loop11, >game_loop12, >game_loop13, >game_loop14
	.byte >game_loop15, >game_loop16, >game_loop17, >game_loop18, >game_loop19
	.byte >game_loop20, >game_loop21, >game_loop22, >game_loop23, >game_loop24
	.byte >game_loop25, >game_loop26, >game_loop27, >game_loop28, >game_loop29
	.byte >game_loop30, >game_loop31, >game_loop32




bball_spd_lo:
	.byte <bball_speed1,<bball_speed2,<bball_speed3,<bball_speed4
bball_spd_hi:
	.byte >bball_speed1,>bball_speed2,>bball_speed3,>bball_speed4
bball_spd_offset_select:
	.byte 192,128,64,0
bball_hit_y:
	.byte $fd,$fc,$fc,$fd
bball_hit_x:
	.byte $ff,$ff,$01,$01
game_loop02: ; bball
	jsr game_orig_routine
	lda game_orig_win
	beq :+
		jmp game_orig_jump
:	jsr game_end_game2
	lda game_quit
	beq :+
		jmp game_end_game3
:	jsr game_test_lose

	lda e1_dir
	beq @not_hit
		ldx g_counter3
		lda $220+0
		clc
		adc bball_hit_y, x
		sta $220+0
		cmp #$22
		bcs :+
			jsr do_score
			lda #$00
			sta e1_dir
			sta g_counter1
			sta g_counter2
			sta e2_left
			lda #$ff
			sta $224+1
			lda #$21
			sta $220+0
			lda #$a8
			sta $220+3
			lda #$72
			sta e1_hit
			jsr bball_start_look
			bne @not_hit
:		lda $220+3
		clc
		adc bball_hit_x, x
		sta $220+3
@not_hit:

	lda e1_dir
	beq :+
		jmp bball_no_coll
:	lda $21c+0
	clc
	adc #$03
	sta g_top
	clc
	adc #$02
	sta g_bot
	lda $21c+3
	sta g_left
	clc
	adc #$08
	sta g_right
	lda $220+0
	clc
	adc #$06
	sta e1_top
	clc
	adc #$02
	sta e1_bot
	lda $220+3
	clc
	adc #$03
	sta e1_left
	clc
	adc #$02
	sta e1_right

	lda e1_left
	cmp g_right
		bcs bball_no_coll
	lda e1_right
	cmp g_left
		bcc bball_no_coll
	lda e1_top
	cmp g_bot
		bcs bball_no_coll
	lda e1_bot
	cmp g_top
		bcc bball_no_coll
			ldx #$ff
:			inx
			lda nmi_num
			cmp bball_spd_offset_select, x
			bcc :-
				stx g_counter3
				lda #$01
				sta e1_dir
				ldx #$03
				jmp return_sfx_routine
bball_beep:
bball_no_coll:

	jsr do_random_set
	lda e1_hit
	beq :+
		dec e1_hit
		jmp bball_no_anim
:	lda g_counter2
	beq :+
		jmp :+++
:
	ldx #$ff
:	inx
	lda seed
	cmp bball_spd_offset_select, x
	bcc :-
		stx e2_right
		inc g_counter2
:
	ldx e2_right
	lda #$e0
	sta $224+1
	lda e1_spd_lo
	clc
	adc bball_spd_lo, x
	sta e1_spd_lo
	lda $220+0
	adc bball_spd_hi, x
	sta $220+0
	cmp #$58
	bcc :+
		inc game_misses
		lda #$ff
		sta $224+1
		lda #$21
		sta $220+0
		lda #$a8
		sta $220+3
		lda #$00
		sta g_counter1
		sta e2_left
		sta g_counter2
		lda #$72
		sta e1_hit
		jsr bball_start_look
		ldx #$04
		jmp return_sfx_routine
bball_hit:
:


	lda g_counter1
	beq bball_no_anim
	cmp #$10
	bcc :+
		lda #$fe
		sta $218+1
		lda #$f0
		sta $21c+0
		bne @done_anim
:	cmp #$08
	bcc :+
		lda #$fc
		sta $218+1
		lda #$fd
		sta $21c+1
		lda $218+0
		sta $21c+0
		lda $218+3
		clc
		adc #$08
		sta $21c+3
		bne @done_anim
:	lda #$fa
	sta $218+1
	lda #$fb
	sta $21c+1
	lda $218+0
	sec
	sbc #$08
	sta $21c+0
	lda $218+3
	sta $21c+3
@done_anim:
	inc g_counter1
bball_no_anim:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda e2_left
		bne @no_a
		jsr do_random_set
		lda #$01
		sta g_counter1
		sta e2_left

@no_a:
	jsr pause_routine
	jmp end_loop
bball_start_look:
	lda #$fa
	sta $218+1
	lda #$fb
	sta $21c+1
	lda $218+0
	sec
	sbc #$08
	sta $21c+0
	lda $218+3
	sta $21c+3
	rts


.byte "START"
duck_dir_x:	; L/UL/DL/U/    R/DR/UR/D
	.byte $ff,$ff,$ff,$00,$01,$01,$01,$00
duck_dir_y:
	.byte $00,$ff,$01,$ff,$00,$01,$ff,$01
duck_rand_dir:
	.byte 224,192,160,128,96,64,32,0
duck_start_x:
	.byte $a0,$b0,$c0,$d0,$d7,$d7,$d7,$d7
duck_start_y:
	.byte $20,$20,$20,$20,$30,$40,$50,$48
duck_start_dir:
	.byte $07,$07,$07,$07,$00,$00,$00,$00
game_loop08:	; duck hunt
	jsr game_orig_routine
	lda game_orig_win
	beq :+
		jmp game_orig_jump
:	jsr game_end_game2
	lda game_quit
	beq :+
		jmp game_end_game3
:	jsr game_test_lose
	lda g_counter3
	cmp #$03
	bne :+++
		lda $21c+0
		cmp #$1f
		bne :+
			lda #$00
			sta $21c+1
			dec g_counter2
			bne :++
				inc game_misses
				lda #$00
				sta g_counter3
				lda #$ef
				sta $21c+1
				ldx e1_dir
				lda duck_start_x, x
				sta $21c+3
				lda duck_start_y, x
				sta $21c+0
				lda duck_start_dir, x
				sta e1_dir
				lda #$21
				sta pal_address+11
				sta pal_address+15
				jmp end_loop
:		dec $21c+0
:		jmp end_loop
:
	lda e1_hit
	beq :+++
		dec e1_hit
		lda e1_hit
		cmp #$01
		beq :+
		lda $21c+0
		cmp #$50
		bcc :++
			lda #$f0
			sta $21c+0
			jmp end_loop
:			lda #$00
			sta e1_hit
			sta g_counter1
			ldx e1_dir
			lda duck_start_x, x
			sta $21c+3
			lda duck_start_y, x
			sta $21c+0
			lda duck_start_dir, x
			sta e1_dir
			jmp end_loop
:		clc
		adc #$02
		sta $21c+0
		jmp end_loop
:	inc g_counter1
	lda g_counter1
	cmp #$20
	bne :++
		lda #$00
		sta g_counter1
		jsr do_random_set
		ldx #$ff
:		inx
		lda seed
		cmp duck_rand_dir, x
		bcc :-
			stx e1_dir
:	ldx e1_dir
	lda $21c+3
	clc
	adc duck_dir_x, x
	sta $21c+3
	lda $21c+0
	clc
	adc duck_dir_y, x
	sta $21c+0

	lda $21c
	cmp #$20
	bcc @change
		cmp #$56
		bcs @change
			lda $21c+3
			cmp #$81
			bcc @change
				cmp #$d7
				bcs @change
					jmp @no_change
@change:
	lda e1_dir
	cmp #$04
	bcc :+
		lda e1_dir
		sec
		sbc #$04
		sta e1_dir
		jmp :++
:	lda e1_dir
	clc
	adc #$04
	sta e1_dir
:	lda #$00
	sta g_counter1
@no_change:


	lda e1_dir
	cmp #$03
	bcs @anim_next
		inc g_counter2
		lda g_counter2
		cmp #$10
		bne :+
			lda #$00
			sta g_counter2
:		cmp #$08
		bcc :+
			lda #$ee
			sta $21c+1
			bne :++
:		lda #$ef
		sta $21c+1
:		lda #$41
		sta $21c+2
		jmp @anim_done
@anim_next:
		inc g_counter2
		lda g_counter2
		cmp #$10
		bne :+
			lda #$00
			sta g_counter2
:		cmp #$08
		bcc :+
			lda #$ee
			sta $21c+1
			bne :++
:		lda #$ef
		sta $21c+1
:		lda #$01
		sta $21c+2
@anim_done:

	lda $218
	sta g_top
	clc
	adc #$08
	sta g_bot
	lda $218+3
	sta g_left
	clc
	adc #$08
	sta g_right
	lda $21c
	sta e1_top
	clc
	adc #$08
	sta e1_bot
	lda $21c+3
	sta e1_left
	clc
	adc #$08
	sta e1_right

	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq dhunt_no_b
		ldx #$12
		jmp return_sfx_routine
dhunt_gun:
		lda e1_left
		cmp g_right
			bcs dhunt_no_coll
		lda e1_right
		cmp g_left
			bcc dhunt_no_coll
		lda e1_top
		cmp g_bot
			bcs dhunt_no_coll
		lda e1_bot
		cmp g_top
			bcc dhunt_no_coll
				jsr do_score
				lda #$72
				sta e1_hit
				lda #$00
				sta g_counter3
				jmp end_loop
dhunt_no_coll:
	inc g_counter3
	lda g_counter3
	cmp #$03
	bne :+
		lda #$36
		sta pal_address+11
		sta pal_address+15
		lda #$3c
		sta g_counter2
		jmp end_loop
:
dhunt_no_b:
	lda control_pad
	and #up_punch
	beq @no_up
		jsr do_random_set
		lda $218
		cmp #$1f
		beq @no_up
			dec $218
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		jsr do_random_set
		lda $218
		cmp #$57
		beq @no_down
			inc $218
@no_down:
	lda control_pad
	and #left_punch
	beq @no_left
		jsr do_random_set
		lda $218+3
		cmp #$80
		beq @no_left
			dec $218+3
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		jsr do_random_set
		lda $218+3
		cmp #$d8
		beq @no_right
			inc $218+3
@no_right:
	jsr pause_routine
	jmp end_loop
.byte "END"










slalom_offset:
	.byte 224,192,160,128,96,64,32,0
slalom_x_start:
	.byte $90,$98,$a0,$a8,$b0,$b8,$c0,$c8
slalom_spd_lo:
	.byte $80,$40,$00;$80,$c0,$40
slalom_spd_hi:
	.byte $01,$01,$01;$01,$00,$00
slalom_flag_pic:
	.byte $fe,$fd,$fc
slalom_ice_pic:
	.byte $fb,$fa,$f9
slalom_spd_pos:
	.byte $47,$2a,$1e;$56,$45,$35;$35,$45,$56
game_loop21: ; slalom
	jsr game_orig_routine
	lda game_orig_win
	beq :+
		jmp game_orig_jump
:	jsr game_end_game2
	lda game_quit
	beq :+
		jmp game_end_game3
:	jsr game_test_lose
	jsr do_random_set

	lda $218+0
	clc
	adc #$06
	sta g_top
	clc
	adc #$01
	sta g_bot
	lda $218+3
	clc
	adc #$02
	sta g_left
	clc
	adc #$06
	sta g_right

	ldx #$00
	ldy #$00
:	lda $21c+0, y
	clc
	adc #$06
	sta e1_top, x
	clc
	adc #$01
	sta e1_bot, x
	lda $21c+3, y
	clc
	adc #$02
	sta e1_left, x
	clc
	adc #$06
	sta e1_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$02
	bne :-

	ldx #$ff
:	inx
	lda $21c+0
	cmp slalom_spd_pos, x
	bcc :-
		stx e1_hit
		ldy e1_hit
		lda $21c+1
		beq :+
		lda (temp_16bit_1), y;slalom_ice_pic, x
		sta $21c+1
:		lda e1_spd_lo
		clc
		adc slalom_spd_lo, x
		sta e1_spd_lo
		lda $21c+0
		adc slalom_spd_hi, x
		sta $21c+0
		cmp #$58
		bcc :+++
			lda #$22
			sta $21c+0
			lda #$02
			sta e1_hit

			ldx #$ff
:			inx
			lda seed
			cmp slalom_offset, x
			bcc :-
				lda slalom_x_start, x
				sta $21c+3
				lda nmi_num
				cmp #$80
				bcc :+
					lda #$fc
					sta $21c+1
					lda #$01
					sta e1_dir
					lda #<slalom_flag_pic
					sta temp_16bit_1+0
					lda #>slalom_flag_pic
					sta temp_16bit_1+1
					jmp :++
:				lda #$f9
				sta $21c+1
				lda #$02
				sta e1_dir
				lda #<slalom_ice_pic
				sta temp_16bit_1+0
				lda #>slalom_ice_pic
				sta temp_16bit_1+1
:


	ldx #$ff
:	inx
	lda $220+0
	cmp slalom_spd_pos, x
	bcc :-
		stx e2_hit
		ldy e2_hit
		lda $220+1
		beq :+
		lda (temp_16bit_2), y;slalom_ice_pic, x
		sta $220+1
:		lda e2_spd_lo
		clc
		adc slalom_spd_lo, x
		sta e2_spd_lo
		lda $220+0
		adc slalom_spd_hi, x
		sta $220+0
		cmp #$58
		bcc :+++
			lda #$22
			sta $220+0
			lda #$02
			sta e2_hit

			ldx #$ff
:			inx
			lda seed
			cmp slalom_offset, x
			bcc :-
				lda slalom_x_start, x
				sta $220+3
				lda nmi_num
				cmp #$80
				bcc :+
					lda #$f9
					sta $220+1
					lda #$02
					sta e2_dir
					lda #<slalom_ice_pic
					sta temp_16bit_2+0
					lda #>slalom_ice_pic
					sta temp_16bit_2+1
					jmp :++
:
				lda #$fc
				sta $220+1
				lda #$01
				sta e2_dir
				lda #<slalom_flag_pic
				sta temp_16bit_2+0
				lda #>slalom_flag_pic
				sta temp_16bit_2+1
:

	lda $21c+1
	beq :+
		lda $220+1
		bne :++
:			jmp slom_done_hit_tests
:	ldx #$00
slom_hit_tests:
	lda e1_left, x
	cmp g_right
		bcs slom_no_coll
	lda e1_right, x
	cmp g_left
		bcc slom_no_coll
	lda e1_top, x
	cmp g_bot
		bcs slom_no_coll
	lda e1_bot, x
	cmp g_top
		bcc slom_no_coll
			txa
			bne slom_second_item
				lda e1_dir
				cmp #$01
				bne :++
					beq :+
;				jmp @done_hit_tests
slom_second_item:
			lda e2_dir
			cmp #$01
			bne :++
:				jsr do_score
				ldx #$2f
				jmp return_sfx_routine
slom_beep:
				jmp slom_done_hit_tests
:			inc game_misses
			ldx #$30
			jmp return_sfx_routine
slom_hit:
			jmp slom_done_hit_tests
slom_no_coll:
	inx
	cpx #$02
	bne slom_hit_tests
slom_done_hit_tests:

	lda g_counter1
	beq @do_controls
		cmp #$01
		bne @do_right
			dec g_counter2
			beq :+
				dec $218+3
				jmp @no_right
		
@do_right:
	dec g_counter2
	beq :+
		inc $218+3
		jmp @no_right
:	lda #$00
	sta g_counter1
@do_controls:
	lda control_pad
	and #left_punch
	beq @no_left
		lda $218+3
		cmp #$90
		beq @no_right
			jsr do_random_set
			lda #$f6
			sta $218+1
			lda #$09
			sta g_counter2
			lda #$01
			sta g_counter1
			tax
			jsr slalom_mtn_move
			bne @no_right
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda $218+3
		cmp #$c8
		beq @no_right
			jsr do_random_set
			lda #$f8
			sta $218+1
			lda #$09
			sta g_counter2
			lda #$02
			sta g_counter1
			tax
			jsr slalom_mtn_move
@no_right:
	lda g_counter1
	bne :+
		lda #$f7
		sta $218+1
:
	jsr pause_routine
	jmp end_loop
mtn_offset:
	.byte $00,$04,$fc
slalom_mtn_move:
	ldy #$00
:	lda $224+3, y
	clc
	adc mtn_offset, x
	sta $224+3, y
	iny
	iny
	iny
	iny
	cpy #24
	bne :-
	rts


game_loop23:
	jsr game_orig_routine
	lda game_orig_win
	beq :+
		jmp game_orig_jump
:	jsr game_end_game2
	lda game_quit
	beq :+
		jmp game_end_game3
:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda #$0e
		sta game_ones
		sta game_tens
		sta game_hiones+23
		sta game_hitens+23
@no_a:
	jmp end_loop



testing_switch_nam:
	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq @no_b
		lda nametable
		cmp #$2c
		bne :+
			lda #$20
			sta nametable
			bne @no_b
:		cmp #$20
		bne :+
			lda #$24
			sta nametable
			bne @no_b
:		cmp #$24
		bne :+
			lda #$28
			sta nametable
			bne @no_b
:		lda #$28
		sta nametable
@no_b:
	rts
