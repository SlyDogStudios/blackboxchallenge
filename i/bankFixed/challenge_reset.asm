reset:
	sei
	ldx #$00
	stx $4015
	ldx #$40
	stx $4017
	ldx #$ff
	txs
	inx
	stx $2000
	stx save2000
	stx $2001
	stx save2001

	ldx #$00
:	lda #$00
	sta $000, x
	sta $100, x
	sta $300, x
	sta $400, x
	sta $500, x
	sta $600, x
	sta $700, x
	lda #$ef
	sta $200, x
	inx
	bne :-

:	bit $2002
	bpl :-

:	bit $2002
	bpl :-

;	jmp jump_over_title

	lda #18
	sta bank_prg
	lda #$00
	sta bank_chr
	jsr bank_save

	ldx #$00
:	lda $8200, x
	sta sds_thingy, x
	inx
	cpx #$04
	bne :-


	ldx #$00
:	lda sds_thingy, x
	cmp sds, x
	bne :+
		inx
		cpx #$04
		bne :-
			lda #$01
			sta temp_8bit_2
:


	lda #22
	sta bank_prg
	jsr bank_save
	jmp setup_title



jump_over_title:
	lda #$09
	sta h0+0
	lda #$0a
	sta h0+1
	lda #$09
	sta h0+2
	lda #$0a
	sta h0+3
	lda #$09
	sta h0+4

;	lda #$0a
;	sta h0+5
;	lda #$09
;	sta h0+6
;	lda #$0a
;	sta h0+7
;	lda #$09
;	sta h0+8
;	lda #$0a
;	sta h0+9

	lda #$0d
	sta m0+0
	sta m0+1
	sta m0+2

;	sta m0+3
;	sta m0+4
;	sta m0+5
;	sta m0+6
;	sta m0+7

	lda #$30
	sta man0+0
	lda #$30
	sta man0+1
	lda #$30
	sta man0+2

;	ldx #$00
;	lda #$81;#$00;
;	sta games+23
;:	sta games, x
;	inx
;	cpx #$20
;	bne :-
;	lda #$01
;	sta uf_have
;	sta pp_have
;	sta pg_have
;	sta db_have
;	sta ls_have
;	sta games+31
;	lda #$ff
;	sta bosses
;	lda #$f3;#$f2;
;	sta goal_offset

;	ldx #$00
;	lda #$01;#$00;
;:	sta enemy_clue, x
;	inx
;	cpx #52
;	bne :-
;	ldx #$00
;	lda #$0e
;:	sta game_hitens, x
;	inx
;	cpx #32
;	bne :-
;	lda #$00
;	sta game_hitens

	lda #$05;#$0a;
	sta p_health_max
	lda #$03;#$08;
	sta p_stam_max


	lda #$01
	sta p_anim_state

;	lda #$2f
;	sta p_topleft+0
;	lda #$30
;	sta p_topleft+3

	lda #$33;#$73;#$c4;
	sta p_pos

	lda #$00;#$0b;#$07;
	sta map_y
	lda #$00;#$0e;#$03;#$0c;
	sta map_x

do_the_continue:

	lda #$04
	sta seed
	lda #$25
	sta seed2
	lda #$67
	sta seed3
	lda #$f2
	sta seed4

:	bit $2002
	bpl :-

	ldx #$00
	lda #$3f
	sta $2006
	lda #$00
	sta $2006
	lda #$0f
:	sta pal_address, x
	sta $2007
	inx
	cpx #$20
	bne :-

	lda #$00
	sta temp_8bit_1
	sta temp_8bit_3
	sta temp_8bit_4
@start_chr:
	ldy temp_8bit_1
	jsr bankswitch
@setup_loading:
	lda #<play_chr				;  CHRs are in banks 7, 8 and 9. Only bank
	sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
	lda #>play_chr				;  correct address for them all
	sta temp_16bit_1+1			;
 	ldy #$00					; Get Y ready while also setting up where
	sty $2006					;  to begin storage of the CHR in its RAM
	sty $2006					;
	ldx #$20					; Need to loop 32 times
@keep_loading:					;
	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne @keep_loading			;
		inc temp_16bit_1+1		;
		dex						;
		bne @keep_loading		;
			lda temp_8bit_1
			clc
			adc #$22
			sta temp_8bit_1
			cmp #$66
			bne @start_chr

	ldx #$00
:	lda cursor_spr, x
	sta cursor+0, x
	inx
	cpx #$20
	bne :-

;	lda #<loop_empty
;	sta loop_pointer+0
;	lda #>loop_empty
;	sta loop_pointer+1
;	lda #<nmi_empty
;	sta nmi_pointer+0
;	lda #>nmi_empty
;	sta nmi_pointer+1

	lda #<loop_load32s
	sta loop_pointer+0
	lda #>loop_load32s
	sta loop_pointer+1
	lda #<nmi_load32s
	sta nmi_pointer+0
	lda #>nmi_load32s
	sta nmi_pointer+1

	lda world_song
	bne :+
		lda #$02
		sta world_song
:

	ldy #11
	jsr bankswitch
	lda #$14;#44;#16;#02;
	sta music_current
	sta music_tester
	jsr music_loadsong

	lda #$20
	sta nametable
	sta ppu_addy+1
	clc
	adc #$03
	sta attr_hi
	lda #$c0
	sta attr_lo
	lda #$00
	sta bank_chr
	lda #$01
	sta bank_prg
;	ldy #$01
	jsr bank_save
	jsr get_bank
	jsr map_coords
	lda #$ff
	sta temp_8bit_1
	lda #$00
	sta temp_8bit_2
	sta ppu_addy+0

	jsr set_pos
	lda p_anim_state
	and #$0f
	sta p_anim_state

		lda #$0a								; are located right below the subroutine.
		sta pal_ticker
		lda #$00
		sta pal_increment

:	bit $2002
	bpl :-

	lda #%10100000
	sta $2000
	sta save2000
	lda #%00011110
	sta $2001
	sta save2001

