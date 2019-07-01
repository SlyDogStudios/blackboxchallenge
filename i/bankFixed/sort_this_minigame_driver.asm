
nmi_loadlist:
	lda #$88
	sta cursor+1
	ldx temp_8bit_1
	lda games, x
	beq @all_games
	lda game_title_lo, x
	sta temp_16bit_1+0
	lda game_title_hi, x
	sta temp_16bit_1+1
	ldy #$00
	lda game_ppu_hi, x
	sta $2006
	lda game_ppu_lo, x
	sta $2006
	cpy #$00
	bne :++
		lda games, x
		and #$c0
		bne :++
			lda #$8a
			sta $2007
:			lda (temp_16bit_1), y
			sta $2007
			iny
			cpy #$06
			bne :-
			beq @all_games
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #$07
	bne :-
@all_games:
	inx
	stx temp_8bit_1
	cpx #32
	bne :++
		lda #$08
		sta temp_8bit_2
		lda temp_8bit_3
		sta temp_8bit_1
		lda temp_8bit_3
		cmp #32
		bne :+
			lda #$00
			sta temp_8bit_1
:
;		lda #<loop_game_select
;		sta loop_pointer+0
;		lda #>loop_game_select
;		sta loop_pointer+1
		lda #<nmi_chadstar
		sta nmi_pointer+0
		lda #>nmi_chadstar
		sta nmi_pointer+1
:
	jmp end_nmi
nmi_game_clear:
	jsr game_clear_routine
	jmp end_nmi

nmi_chadstar:
	lda npc_dialogs+33
	beq :+++
		cmp #$09
		bcs :+++
		tax
		lda chadlist_lo, x
		sta temp_16bit_1+0
		lda chadlist_hi, x
		sta temp_16bit_1+1
		ldy #$00
:		lda (temp_16bit_1), y
		tax
		lda games, x
		beq :+
		lda game_ppu_hi, x
		sta $2006
		lda game_ppu_lo, x
		sec
		sbc #$01
		sta $2006
		lda #$5f
		sta $2007
:		iny
		cpy #$04
		bne :--

:		lda #<loop_game_select
		sta loop_pointer+0
		lda #>loop_game_select
		sta loop_pointer+1
		lda #<nmi_empty
		sta nmi_pointer+0
		lda #>nmi_empty
		sta nmi_pointer+1
	jmp end_nmi


nmi_game_screen1:
;	ldy #30
;	jsr bankswitch
	lda #30
	sta bank_prg
	jsr bank_save
	ldx temp_8bit_2
	lda game_chr_lo_lo, x
	sta temp_16bit_2+0
	lda game_chr_lo_hi, x
	sta temp_16bit_2+1
	ldy temp_8bit_1
	lda (temp_16bit_2), y
	sta temp_16bit_1+0
	lda game_chr_hi_lo, x
	sta temp_16bit_2+0
	lda game_chr_hi_hi, x
	sta temp_16bit_2+1
	lda (temp_16bit_2), y
	sta temp_16bit_1+1
	lda game_tiles_hi, x
	sta $2006
	ldy temp_8bit_3
	sty $2006
	ldx #$00
:	lda (temp_16bit_1), y
	sta $2007
	iny
	inx
	cpx #$10
	bne :-
		lda temp_8bit_3
		clc
		adc #$10
		sta temp_8bit_3
		bne :+
			ldx temp_8bit_2
			inx
			stx temp_8bit_2
			cpx #$04
			bne :+
				lda #<nmi_game_screen2
				sta nmi_pointer+0
				lda #>nmi_game_screen2
				sta nmi_pointer+1
;				ldy #29
;				jsr bankswitch
				lda #29
				sta bank_prg
				jsr bank_save
:	jmp end_nmi

loop_game_select:
;	ldx #30
;	lda games, x
;	cmp #$01
;	bne :+
;		stx temp_8bit_1
;		lda #$f0
;		sta cursor+0
;		lda #$00
;		sta cursor+2
;		sta temp_8bit_2
;		lda #<loop_empty
;		sta loop_pointer+0
;		lda #>loop_empty
;		sta loop_pointer+1
;		lda #<nmi_game_clear
;		sta nmi_pointer+0
;		lda #>nmi_game_clear
;		sta nmi_pointer+1
;		jmp end_loop
;:
	lda goal_offset
	cmp #$f3
	beq @nopers_dont
		ldx #$00
:		lda game_hitens, x
		cmp #$0e
		bne @nopers_dont
			inx
			cpx #32
			bne :-
				lda #$f3
				sta goal_offset
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$65
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
@nopers_dont:
	lda goal_offset
	cmp #$f3
	bne @dont_again
		lda pal_address+2
		beq :+
			lda #$00
			beq :++
:		lda #$27
:		sta pal_address+2
@dont_again:
	ldx temp_8bit_1				; used for game offset
	lda game_menu_y, x
	sta cursor+0
	lda game_menu_x, x
	sta cursor+3
	dec temp_8bit_2
	bne :+++
		lda cursor+1
		cmp #$88
		bne :+
			lda #$00
			sta cursor+1
			jmp :++
:		lda #$88
		sta cursor+1
:	lda #$08
	sta temp_8bit_2
:	lda #$00
	sta cursor+2
	
;	jsr testing_switch_nam
	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq @no_up
		lda temp_8bit_1
		beq @no_up
			dec temp_8bit_1
		jsr store_beep
@no_up:
	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq @no_down
		lda temp_8bit_1
		cmp #31
		beq @no_down
			inc temp_8bit_1
		jsr store_beep
@no_down:
	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq @no_left
		lda cursor+3
		cmp #$18
		beq @no_left
			jsr store_beep
;				jmp @no_left
			lda temp_8bit_1
			sec
			sbc #11
			sta temp_8bit_1
		jsr store_beep
@no_left:
	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq @no_right
		lda cursor+3
		cmp #$a8
		beq @no_right
			lda cursor+3
			cmp #$60
			bne :+
				lda cursor+0
				cmp #$cf
				bne :+
					jmp @no_right
:
			jsr store_beep
			lda temp_8bit_1
			clc
			adc #11
			sta temp_8bit_1
		jsr store_beep
@no_right:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		ldx temp_8bit_1
		lda games, x
		beq @no_a
			cpx #30
			beq :+
				lda games+23
				cmp #$41
				bne :+
					ldx #32
					stx temp_8bit_1
:		lda #$f0
		sta cursor+0
		lda #$00
		sta temp_8bit_2
		sta pal_address+2
		lda #<loop_empty
		sta loop_pointer+0
		lda #>loop_empty
		sta loop_pointer+1
		lda #<nmi_game_clear
		sta nmi_pointer+0
		lda #>nmi_game_clear
		sta nmi_pointer+1
		jmp end_loop
@no_a:
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq @no_select
		ldx #$00
		lda #$0f
:		sta pal_address, x
		inx
		cpx #$20
		bne :-
	ldx #$00
:	lda cursor_spr, x
	sta cursor+0, x
	inx
	cpx #$20
	bne :-
					ldy #$00
					lda #$ef
:					sta cursor+0, y
					iny
					iny
					iny
					iny
					bne :-
		jsr nmi_wait
		lda #$00
		sta $2000
		sta $2001
		sta save2000
		sta save2001
		lda #$01
		sta map_y
		lda #$00
		sta map_x
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$14
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save

		jmp back_from_nes
@no_select:
	jmp end_loop

the_sprites:
	.byte $6f,$01,$00,$80
	.byte $6f,$02,$00,$88
	.byte $77,$03,$00,$80
	.byte $77,$04,$00,$88

pal_overworld:
pal_towns:

game_count_tiles:
	.byte $00,$97,$31,$32,$33
loop_game_count:
	lda temp_8bit_1
	cmp #32
	beq :+
	ldx temp_8bit_4
	lda game_count_tiles, x
	sta cursor+1
	dec temp_8bit_2
	bne :+++
		jsr store_beep
		dec temp_8bit_4
		lda temp_8bit_4
		cmp #$01
		bne :++
			jsr store_get
:			lda #$f0
			sta cursor+0
			lda #$00
			sta temp_8bit_4
			ldx temp_8bit_1
			lda game_loop_lo, x
			sta loop_pointer+0
			lda game_loop_hi, x
			sta loop_pointer+1
			lda game_nmi_lo, x
			sta nmi_pointer+0
			lda game_nmi_hi, x
			sta nmi_pointer+1
			lda game_bank, x
			sta bank_prg
			jsr bank_save
			jmp end_loop
:		lda #$3c
		sta temp_8bit_2
:
	jmp end_loop
nmi_clear_bottom:
	lda #$2f
	sta $2006
	lda #$0a
	sta $2006
	ldx #$00
	txa
:	sta $2007
	inx
	cpx #13
	bne :-
	lda #$2f
	sta $2006
	lda #$2b
	sta $2006
	ldx #$00
	txa
:	sta $2007
	inx
	cpx #11
	bne :-
	lda #$2d
	sta $2006
	lda #$87
	sta $2006
	ldx #$00
:	lda game_word, x
	sta $2007
	inx
	cpx #$04
	bne :-
			lda #<nmi_empty
			sta nmi_pointer+0
			lda #>nmi_empty
			sta nmi_pointer+1
	jmp end_nmi
game_word:
	.byte "GAME"
game_nes_word:
	.byte " NES"
game_bank:
	.byte $1c,$1c,$1d,$1b,$1b ; 10 yard, b fight, b ball, cc land, d kong
	.byte $1c,$1c,$1c,$1d,$1c ; dk jr, dk3, dk math, d hunt, excitebike
	.byte $1c,$1b,$1b,$1c,$1c ; golf, gumshoe, gmite, halley, i climber
	.byte $1c,$1a,$1c,$1a,$1b ; kungfu, mrider, m bros, p ball, p eye
	.byte $1b,$1d,$1c,$1d,$1b ; prowrestling, slalom, soccer, stackup, smb
	.byte $1b,$1c,$1c,$1c,$1b ; tennis, uchamp, vball, wgunman, wcrew
	.byte $1a,$1a,$1c		  ; nesvc, karnov, glitched

game_spr_misses:
	.byte $01,$01,$09,$05,$03
	.byte $06,$03,$03,$05,$03
	.byte $09,$03,$01,$03,$01
	.byte $03,$03,$03,$01,$03
	.byte $01,$03,$01,$03,$03
	.byte $09,$03,$03,$03,$03
	.byte $01,$01,$00

game_write_stats:
	ldx temp_8bit_1
	lda #$2c
	sta $2006
	lda #$69
	sta $2006
	lda game_tens
	clc
	adc #$30
	sta $2007
	lda game_ones
	clc
	adc #$30
	sta $2007
	lda #$2c
	sta $2006
	lda #$c8
	sta $2006
	lda game_misses
	clc
	adc #$30
	sta $2007
	lda #$9d
	sta $2007
	lda game_spr_misses, x
	clc
	adc #$30
	sta $2007
	lda #$2d
	sta $2006
	lda #$29
	sta $2006
	lda game_hitens, x
	clc
	adc #$30
	sta $2007
	lda game_hiones, x
	clc
	adc #$30
	sta $2007
	rts
game_gone_stats:
	lda #$2c
	sta $2006
	lda #$69
	sta $2006
	lda #$00
	sta $2007
	sta $2007
	lda #$2c
	sta $2006
	lda #$c8
	sta $2006
	lda #$00
	sta $2007
	sta $2007
	sta $2007
	lda #$2d
	sta $2006
	lda #$29
	sta $2006
	lda #$00
	sta $2007
	sta $2007
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	lda #$00
	sta $2007
	sta $2007
	sta $2007
	sta $2007
	sta $2007
	sta $2007
	sta $2007
	lda #$2d				; MIGHT NEED TO MOVE ROB
	sta $2006
	lda #$87
	sta $2006
	ldx #$00
:	lda game_nes_word, x
	sta $2007
	inx
	cpx #$04
	bne :-
	rts
game_test_lose:
	ldx temp_8bit_1
	lda game_misses
	cmp game_spr_misses, x
	bne :+
		lda #$30
		sta pal_address+9
		sta pal_address+13
		lda #$10
		sta pal_address+10
		sta pal_address+14
		lda #$00
		sta pal_address+11
		sta pal_address+15
		jsr game_clear_ram
		lda #<loop_empty
		sta loop_pointer+0
		lda #>loop_empty
		sta loop_pointer+1
		lda #<nmi_game_over
		sta nmi_pointer+0
		lda #>nmi_game_over
		sta nmi_pointer+1
:	rts

do_score:
	ldx temp_8bit_1
	lda game_tens
	cmp #$0e
	bne :+
		lda game_ones
		cmp #$0e
		bne :+
			rts
:	lda game_tens
	cmp #$09
	bne :+
		lda game_ones
		cmp #$09
		bne :+
			lda #$0e
			sta game_tens
			sta game_ones
			sta game_hitens, x
			sta game_hiones, x
			rts			; CHANGED FROM JMP TO BEQ TO SAVE A BYTE
:	lda game_ones
	cmp #$09
	beq @do_tens
		lda game_ones
		cmp game_hiones, x
		bne :+
			lda game_tens
			cmp game_hitens, x
			bne :+
				inc game_hiones, x
:		inc game_ones
		bne @done
@do_tens:
	lda game_ones
	cmp game_hiones, x
	bne :+
		lda game_tens
		cmp game_hitens, x
		bne :+
			lda #$00
			sta game_hiones, x
:	lda #$00
	sta game_ones
		lda game_tens
		cmp #$09
		beq @done
			lda game_tens
			cmp game_hitens, x
			bne :+
				lda game_ones
				cmp game_hiones, x
				bne :+
				inc game_hitens, x
:			inc game_tens
@done:
	rts
game_over_words:
	.byte "GAME  OVER"
nmi_game_over:
	ldx #$00
	lda #$2c
	sta $2006
	lda #$f1
	sta $2006
:	lda game_over_words, x
	sta $2007
	inx
	cpx #10
	bne :-
		lda #<loop_game_ender
		sta loop_pointer+0
		lda #>loop_game_ender
		sta loop_pointer+1
	jmp end_nmi
loop_game_ender:
		lda #$30
		sta pal_address+17
	jsr game_clear_ram
	jsr game_end_game
	jmp end_loop
game_end_game:
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq @no_select
;		ldy #29
;		jsr bank_save
		lda #29
		sta bank_prg
		jsr bank_save
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
@no_select:
	rts

game_end_game2:
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq @no_select
		lda #$01
		sta game_quit
		lda #$30
		sta pal_address+17
@no_select:
	rts
game_end_game3:
;	ldy #29
;	jsr bank_save
	lda #29
	sta bank_prg
	jsr bank_save
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

loop_game_done_win0:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$5e
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
		lda #<loop_game_done_win
		sta loop_pointer+0
		lda #>loop_game_done_win
		sta loop_pointer+1
loop_game_done_win:
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
	jmp end_loop
game_orig_routine:
	ldx temp_8bit_1
	lda games, x
	and #$c0
	bne :+
		lda game_ones
		cmp #$05
		bcc :+
			lda #$30
			sta pal_address+17
			lda #$01
			sta game_orig_win
:
	rts
game_orig_jump:
	inc glitch_count
	lda glitch_count
	cmp #16
	bne :+
		lda #$41
		sta games+23
:
	lda games, x
	eor #$80
	sta games, x
	cpx #30
	bne :+
		lda #$81
		sta games+23
:
;	ldy #29
;	jsr bank_save
	lda #29
	sta bank_prg
	jsr bank_save
	lda #$00
	sta temp_8bit_2
	sta temp_8bit_4
	lda temp_8bit_1
	cmp #30
	bne @not_fixed_nes
		ldx #$00
:		lda games, x
		cmp #$41
		bne :+
			lda #$81
			sta games, x
:		inx
		cpx #32
		bne :--
@not_fixed_nes:
	lda #<loop_empty
	sta loop_pointer+0
	lda #>loop_empty
	sta loop_pointer+1
	lda #<nmi_game_lrned
	sta nmi_pointer+0
	lda #>nmi_game_lrned
	sta nmi_pointer+1
	jmp end_loop

game_clear_ram:
	ldx #$00
	txa
:	sta $700, x
	inx
	cpx #$85
	bne :-
	ldx #$00
	lda #$f0
:	sta $218, x
	inx
	cpx #$e8
	bne :-
	rts

chadlist_lo:
.byte $00,<chadlist_1,<chadlist_2,<chadlist_3,<chadlist_4,<chadlist_5,<chadlist_6,<chadlist_7,<chadlist_8
chadlist_hi:
.byte $00,>chadlist_1,>chadlist_2,>chadlist_3,>chadlist_4,>chadlist_5,>chadlist_6,>chadlist_7,>chadlist_8
chadlist_1:
	.byte $1a,$08,$03,$12
chadlist_2:
	.byte $02,$04,$06,$01
chadlist_3:
	.byte $16,$13,$11,$0f
chadlist_4:
	.byte $14,$09,$1d,$1b
chadlist_5:
	.byte $0d,$18,$15,$00
chadlist_6:
	.byte $0e,$05,$0b,$10
chadlist_7:
	.byte $1c,$07,$0a,$19
chadlist_8:
	.byte $0c,$1e,$0c,$1e

chadones:
.byte $39,    $38,    $39,    $39,    $39,    $38,    $39,    $35,    $39,    $39,    $38,    $38,    $39,    $39,    $39,    $39,    $39,    $39,    $39,    $39,    $35,    $39,    $39,    $00,    $39,    $35,    $35,    $37,    $39,    $39,    $39
chadtens:
.byte $34,    $31,    $00,    $31,    $00,    $31,    $32,    $31,    $32,    $33,    $31,    $31,    $00,    $33,    $32,    $31,    $34,    $32,    $35,    $31,    $31,    $32,    $34,    $00,    $37,    $31,    $31,    $32,    $00,    $32,    $31
	  ;10yard,bfight, bball,  ccland, dkong,  dkongjr,dkong3, dkmath, dhunt,  excitbk,golf,   gshoe,  gmite,  halley, iclimbr,kungfu, mrider, mbros,  pinball,popeye, pwrstlg,slalom, soccer, stackup,smb,    tennis, uchamp, vball,  wgunman,wreckin,nesvc


