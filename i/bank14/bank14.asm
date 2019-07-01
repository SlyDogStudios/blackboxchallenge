.segment "BANK14"
chr_training:
.incbin "i\bank14\training.chr"
nam_training:
.incbin "i\bank14\training.nam"
pal_training:
.byte $0f,$30,$00,$0c, $0f,$16,$06,$2c, $0f,$30,$16,$00, $0f,$30,$0f,$0f
.byte $0f,$37,$17,$11, $0f,$27,$16,$29
;.incbin "i\bank14\training.pal"



def_letter_train:
	ldx #$00
:	lda word_jump, x
	sta btl_letters, x
	lda word_cntr, x
	sta btl_letters+3, x
	lda word_blck, x
	sta btl_letters+6, x
	lda word_juke, x
	sta btl_letters+9, x
	inx
	cpx #$03
	bne :-
	rts

att_letter_train:
	ldx #$00
:	lda word_stmp, x
	sta btl_letters, x
	lda word_fire, x
	sta btl_letters+3, x
	lda word_jabs, x
	sta btl_letters+6, x
	lda word_zaps, x
	sta btl_letters+9, x
	inx
	cpx #$03
	bne :-
	rts

spe_letter_train:
	ldx #$00
:	lda word_strg, x
	sta btl_letters, x
	lda word_esca, x
	sta btl_letters+3, x
	lda word_clue, x
	sta btl_letters+6, x
	lda word_adrn, x
	sta btl_letters+9, x
	inx
	cpx #$03
	bne :-
	rts

train_icons:
	lda control_pad
	and #b_punch
	beq @no_b
		lda #$01
		sta battle_active
		jsr att_letter_train
		jmp @not_zero
@no_b:
	lda control_pad
	and #a_punch
	beq @no_a
		lda #$02
		sta battle_active
		jsr spe_letter_train
		jmp @not_zero
@no_a:
	lda #$00
	sta battle_active
	jsr def_letter_train
@not_zero:

	dec temp_8bit_1
	bne :+
		jsr flash_which_icon
:	rts




train_all:
	lda p_anim_state
	beq @doing_move
		dec p_anim_count
		bne :+
			lda #$ef
			sta cursor+4
			lda #$00
			sta p_anim_state
			jsr p_train_anim
:		jmp done_training_slct
@doing_move:
;	jsr train_icons
train_controls:
	jsr train_icons

	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq @no_up
		lda #$b0
		sta cursor+4
		lda #$13
		sta cursor+5
		lda #$01
		sta cursor+6
		lda #$38
		sta cursor+7
		lda battle_active
		bne :+
			lda #$05
			sta p_anim_state
			jsr p_train_anim
			lda #$ef
			sta off_tl
			sta spe_tl
			lda #$2f
			sta def_tl
			jmp done_training_slct
:
		cmp #$01
		bne :+
			lda #$04
			sta p_anim_state
			jsr p_train_anim
			lda #$ef
			sta spe_tl
			sta def_tl
			lda #$2f
			sta off_tl
			jmp done_training_slct
:
		lda #$09
		sta p_anim_state
		jsr p_train_anim
		lda #$ef
		sta off_tl
		sta def_tl
		lda #$2f
		sta spe_tl
		jmp done_training_slct
@no_up:

	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq @no_down
		lda #$be
		sta cursor+4
		lda #$13
		sta cursor+5
		lda #$81
		sta cursor+6
		lda #$38
		sta cursor+7
		lda battle_active
		bne :+
			lda #$06
			sta p_anim_state
			jsr p_train_anim
			lda #$ef
			sta off_tl
			sta spe_tl
			lda #$2f
			sta def_tl
			jmp done_training_slct
:
		cmp #$01
		bne :+
			lda #$02
			sta p_anim_state
			jsr p_train_anim
			lda #$ef
			sta spe_tl
			sta def_tl
			lda #$2f
			sta off_tl
			jmp done_training_slct
:
		lda #$0a
		sta p_anim_state
		jsr p_train_anim
		lda #$ef
		sta off_tl
		sta def_tl
		lda #$2f
		sta spe_tl
		jmp done_training_slct
@no_down:

	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq @no_left
		lda #$b7
		sta cursor+4
		lda #$11
		sta cursor+5
		lda #$01
		sta cursor+6
		lda #$31
		sta cursor+7
		lda battle_active
		bne :+
			lda #$08
			sta p_anim_state
			jsr p_train_anim
			lda #$ef
			sta off_tl
			sta spe_tl
			lda #$2f
			sta def_tl
			jmp done_training_slct
:
		cmp #$01
		bne :+
			lda #$03
			sta p_anim_state
			jsr p_train_anim
			lda #$ef
			sta spe_tl
			sta def_tl
			lda #$2f
			sta off_tl
			jmp done_training_slct
:
		lda #$0b
		sta p_anim_state
		jsr p_train_anim
		lda #$ef
		sta off_tl
		sta def_tl
		lda #$2f
		sta spe_tl
		jmp done_training_slct
@no_left:

	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq @no_right
		lda #$b7
		sta cursor+4
		lda #$11
		sta cursor+5
		lda #$41
		sta cursor+6
		lda #$40
		sta cursor+7
		lda battle_active
		bne :+
			lda #$07
			sta p_anim_state
			jsr p_train_anim
			lda #$ef
			sta off_tl
			sta spe_tl
			lda #$2f
			sta def_tl
			jmp done_training_slct
:
		cmp #$01
		bne :+
			lda #$01
			sta p_anim_state
			jsr p_train_anim
			lda #$ef
			sta spe_tl
			sta def_tl
			lda #$2f
			sta off_tl
			jmp done_training_slct
:
		lda #$0c
		sta p_anim_state
		jsr p_train_anim
		lda #$ef
		sta off_tl
		sta def_tl
		lda #$2f
		sta spe_tl
		jmp done_training_slct
@no_right:

done_training_slct:
	rts



start_exit_jmp:
		lda #$01
		sta p_anim_state
		lda #$08
		sta p_anim_count
		ldx #$20
		lda #$00
:		sta p_topleft_save, x
		inx
		bne :-
		lda #$03
		sta bank_btl_save
		ldx #$00
		stx lets_train
		lda #$ef
:		sta $200, x
		sta $600, x
		inx
		inx
		inx
		inx
		bne :-
		ldx #$00
		lda #$0f
:		sta pal_address+0, x
		inx
		cpx #$20
		bne :-
		jsr nmi_wait
	lda #$00
	sta $2000
	sta save2000
	sta $2001
	sta save2001
	jmp regrab_chr


training_load:
;		jsr p_battle_anim
		lda #$ef
		sta p_topleft+0
		sta p_topright+0
		ldx #$00
		lda #$0f
:		sta pal_address+0, x
		inx
		cpx #$20
		bne :-
		jsr nmi_wait
	lda #$00
	sta $2000
	sta save2000
	sta $2001
	sta save2001

	lda #<chr_training			;  CHRs are in banks 7, 8 and 9. Only bank
	sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
	lda #>chr_training			;  correct address for them all
	sta temp_16bit_1+1			;
 	lda #$00					; Get Y ready while also setting up where
	sta $2006					;  to begin storage of the CHR in its RAM
	ldy #$00
	sty $2006					;
	ldx #$10					; Need to loop 16 times
:								;
	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne :-						;
		inc temp_16bit_1+1		;
		dex						;
		bne :-					;

	ldy #$00
	ldx #$04
	lda #<nam_training
	sta temp_16bit_1+0
	lda #>nam_training
	sta temp_16bit_1+1
	lda #$2c
	sta $2006
	lda #$00
	sta $2006
:	lda (temp_16bit_1), y
	sta $2007
	iny
	bne :-
		inc temp_16bit_1+1
		dex
		bne :-

	ldx #$00
	stx temp_8bit_1

:	lda pal_training, x
	sta pal_address+0, x
	inx
	cpx #24
	bne :-

	ldx #$30
	lda #$ef
:	sta off_tl, x
	inx
	bne :-

	ldx #$00
:	lda training_sprites, x
	sta off_tl, x
	inx
	cpx #48
	bne :-

	ldx #$00
:	lda training_clu, x
	sta clu1, x
	inx
	cpx #16
	bne :-

		ldy #$00
		tya
:		sta p_com_tlt, y
		sta $261, y
		iny
		iny
		iny
		iny
		cpy #140
		bne :-

	jsr menu_remove_sprites

	lda #$2c
	sta nametable

	lda #$0c
	sta temp_8bit_3
	lda #$00
	sta temp_8bit_4
	sta shake_offset

	ldx #$00
	lda loop_train_lo, x
	sta loop_pointer+0
	lda loop_train_hi, x
	sta loop_pointer+1
	lda nmi_train_lo, x
	sta nmi_pointer+0
	lda nmi_train_hi, x
	sta nmi_pointer+1
	lda #$00
	sta scroll_x
	sta scroll_y
	sta $2005
	sta $2005

:	bit $2002
	bpl :-

			lda #$10
			sta temp_8bit_1

	lda #%10000011
	sta $2000
	sta save2000
	lda #%00011010
	sta $2001
	sta save2001
	jsr nmi_wait

	jsr training_beep

	jmp loop_empty


train_str_lo:
.byte <p_com_tlt
.byte <p_com_tmt,<p_com_trt,<p_com_lm1t,<p_com_mm1t,<p_com_rm1t
.byte <p_com_lm2t,<p_com_mm2t,<p_com_rm2t,<p_com_lm3t,<p_com_mm3t
.byte <p_com_rm3t,<p_com_blt,<p_com_bmt,<p_com_brt,<p_att1t
train_str_hi:
.byte >p_com_tlt
.byte >p_com_tmt,>p_com_trt,>p_com_lm1t,>p_com_mm1t,>p_com_rm1t
.byte >p_com_lm2t,>p_com_mm2t,>p_com_rm2t,>p_com_lm3t,>p_com_mm3t
.byte >p_com_rm3t,>p_com_blt,>p_com_bmt,>p_com_brt,>p_att1t
train_anim_load:
	ldy #$00
	sty temp_8bit_2
:	ldy temp_8bit_2
	lda train_str_lo, y
	sta temp_16bit_1+0
	lda train_str_hi, y
	sta temp_16bit_1+1
	lda (p_anim_addy), y
	ldy #$00
	sta (temp_16bit_1), y
	ldy temp_8bit_2
	iny
	sty temp_8bit_2
	cpy #16
	bne :-
	lda (p_anim_addy), y
	sta p_att1+0
	iny
	lda (p_anim_addy), y
	sta p_att1+3
	iny
	lda (p_anim_addy), y
	sta p_com_tly
	iny
	lda (p_anim_addy), y
	sta p_com_tlx
	lda #$3c
	sta p_anim_count
	lda p_anim_state
	and #$0f
	cmp #$0b
	bne :+
		lda #$20
		sta p_com_tlx
:

	ldy #$00
	tya
:	sta p_com_tla, y
	iny
	iny
	iny
	iny
	cpy #60
	bne :-
	lda #$01
	sta p_att1+2
	rts


p_train_anim:
	lda p_anim_state
	tax
	lda p_battle_anim_lo, x
	sta p_anim_addy+0
	lda p_battle_anim_hi, x
	sta p_anim_addy+1
	jsr train_anim_load

	lda p_stam_ticker
	bne @all_done
	lda p_str_used
	beq :+
		lda #$50
		bne :++
:	lda #$78
:	sta p_stam_ticker
@all_done:
	rts









training_sprites:
.byte $2f,$14,$00,$28
.byte $2f,$15,$00,$30
.byte $37,$16,$00,$28
.byte $37,$17,$00,$30
.byte $2f,$10,$00,$38
.byte $2f,$10,$40,$40
.byte $37,$12,$00,$38
.byte $37,$12,$40,$40
.byte $2f,$18,$00,$48
.byte $2f,$19,$00,$50
.byte $37,$1a,$00,$48
.byte $37,$1b,$00,$50

training_clu:
.byte $ef,$22,$01,$78
.byte $ef,$23,$01,$80
.byte $ef,$20,$01,$78
.byte $ef,$21,$01,$80

do_the_flicker:
	lda sprite_flicker
	cmp #$01
	beq @go_backward_init

@go_forward_init:
	ldy #$30
@go_forward:
	lda bg_ram, y
	sta OAM_ram, y
	iny
	lda bg_ram, y
	sta OAM_ram, y
	iny
	lda bg_ram, y
	sta OAM_ram, y
	iny
	lda bg_ram, y
	sta OAM_ram, y
	iny
	bne @go_forward
		lda #$01
		sta sprite_flicker
		rts
@go_backward_init:
	ldx #$30
	ldy #$fc
@go_backward:
	lda bg_ram, x
	sta OAM_ram, y
	iny
	inx
	lda bg_ram, x
	sta OAM_ram, y
	iny
	inx
	lda bg_ram, x
	sta OAM_ram, y
	iny
	inx
	lda bg_ram, x
	sta OAM_ram, y
	tya
	sec
	sbc #$08
	tay
	iny
	inx
	bne @go_backward
		lda #$00
		sta sprite_flicker
@done:
	rts




















tie_train_sprites:
	ldy #$00
:	lda off_tl+0, y
	sta off_tr+0, y
	clc
	adc #$08
	sta off_bl+0, y
	sta off_br+0, y
	lda off_tl+3, y
	sta off_bl+3, y
	clc
	adc #$08
	sta off_tr+3, y
	sta off_br+3, y
	tya
	clc
	adc #$10
	tay
	cpy #$30
	bne :-

	lda p_com_tly
	sta p_com_tmy
	sta p_com_try
	clc
	adc #$08
	sta p_com_lm1y
	sta p_com_mm1y
	sta p_com_rm1y
	clc
	adc #$08
	sta p_com_lm2y
	sta p_com_mm2y
	sta p_com_rm2y
	clc
	adc #$08
	sta p_com_lm3y
	sta p_com_mm3y
	sta p_com_rm3y
	clc
	adc #$08
	sta p_com_bly
	sta p_com_bmy
	sta p_com_bry

	lda p_com_tlx
	sta p_com_lm1x
	sta p_com_lm2x
	sta p_com_lm3x
	sta p_com_blx
	clc
	adc #$08
	sta p_com_tmx
	sta p_com_mm1x
	sta p_com_mm2x
	sta p_com_mm3x
	sta p_com_bmx
	clc
	adc #$08
	sta p_com_trx
	sta p_com_rm1x
	sta p_com_rm2x
	sta p_com_rm3x
	sta p_com_brx

	lda clu1+0
	sta clu2+0
	clc
	adc #$08
	sta clu3+0
	sta clu4+0
	lda clu1+3
	sta clu3+3
	clc
	adc #$08
	sta clu2+3
	sta clu4+3

	rts

tut_printing:
	ldx temp_8bit_4
	lda tut_lo, x
	sta temp_16bit_4+0
	lda tut_hi, x
	sta temp_16bit_4+1
	lda #$2d
	sta $2006
	lda temp_8bit_3	; #$0c
	sta $2006
	ldy shake_offset
:	lda (temp_16bit_4), y
	cmp #$fe
	beq :+
		sta $2007
		iny
		sty shake_offset
		bne :-

:		iny
		sty shake_offset
	lda temp_8bit_3
	clc
	adc #$20
	sta temp_8bit_3
	cmp #$0c
	beq :+
		
		rts
:	inc temp_8bit_4
	lda #$2e
	sta $2006
	lda #$37
	sta $2006
	lda #$b0
	sta $2007
	lda #$b1
	sta $2007
	lda #$b2
	sta $2007
;	lda #$0c
;	sta temp_8bit_3
	lda #$00
	sta shake_offset
	rts

clear_tut:
	lda #$2d
	sta $2006
	lda temp_8bit_3	; #$0c
	sta $2006
	ldy #$00
	tya
:	sta $2007
	iny
	cpy #$10
	bne :-
	lda temp_8bit_3
	clc
	adc #$20
	sta temp_8bit_3
	cmp #$0c
	beq :+
		rts
:	inc temp_8bit_4
	lda #$2e
	sta $2006
	lda #$37
	sta $2006
	lda #$00
	sta $2007
	sta $2007
	sta $2007
	lda #$00
	sta shake_offset
	ldx temp_8bit_4
	lda tut_lo, x
	sta temp_16bit_4+0
	lda tut_hi, x
	sta temp_16bit_4+1
		ldx temp_8bit_4
		lda loop_train_lo, x
		sta loop_pointer+0
		lda loop_train_hi, x
		sta loop_pointer+1
		lda nmi_train_lo, x
		sta nmi_pointer+0
		lda nmi_train_hi, x
		sta nmi_pointer+1
	rts

tut00:
.byte "LET'S GO OVER",$fe,"THE LAYOUT. AT",$fe,"THE TOP LEFT IS",$fe,"YOUR LIFE BAR.",$fe,"THE BLUE METER",$fe,"UNDER THAT IS",$fe,"YOUR STAMINA",$fe,"GAUGE.",$fe
tut01:
.byte "THE THREE ICONS",$fe,"UNDER THOSE ARE",$fe,"REPRESENTATIONS",$fe,"OF OFFENSE,",$fe,"DEFENSE, AND",$fe,"SPECIAL MOVES,",$fe,"RESPECTIVELY.",$fe,$fe
tut02:
.byte "WHEN AN ICON IS",$fe,"TURNED ON, A",$fe,"MENU WILL",$fe,"APPEAR IN THE",$fe,"BOTTOM LEFT",$fe,"CORNER OF THE",$fe,"COMBAT SCREEN.",$fe,$fe
tut03:
.byte "HOLDING DOWN",$fe,"THE ",$40," BUTTON",$fe,"WILL TURN ON",$fe,"THE OFFENSIVE",$fe,"ICON, BRINGING",$fe,"UP THE MENU OF",$fe,"ATTACKS AT YOUR",$fe,"DISPOSAL.",$fe
tut04:
.byte "GO AHEAD, HOLD",$fe,$40," FOR AN ATTACK",$fe,"MENU, ",$0e," FOR",$fe,"SPECIALS, OR",$fe,"NO BUTTON FOR",$fe,"DEFENSE MOVES.",$fe,$fe,$fe
tut05:
.byte "EACH MENU ITEM",$fe,"CORRESPONDS",$fe,"TO THE D-PAD.",$fe,"SO IF YOU HOLD",$fe,$40," AND PRESS TO",$fe,"THE RIGHT, YOU",$fe,"WILL EXECUTE AN",$fe,"UPPERCUT.",$fe
tut06:
.byte "TRY OUT THE",$fe,"MOVES! PRESS IN",$fe,"EACH DIRECTION",$fe,"WITH EACH ICON",$fe,"BEING ACTIVE.",$fe,$fe,$fe,$fe
tut07:
.byte "IF YOU HAVEN'T",$fe,"LEARNED A MOVE,",$fe,"THEN YOU CANNOT",$fe,"USE IT DURING",$fe,"COMBAT.",$fe,$fe,$fe,$fe
tut08:
.byte "OH! WHERE IT",$fe,"SAYS MANUALS AT",$fe,"THE BOTTOM IS",$fe,"THE AMOUNT OF",$fe,"MOOLAH YOU HAVE",$fe,"ON YOUR PERSON.",$fe,$fe,$fe
tut09:
.byte "IN THE BOTTOM",$fe,"RIGHT CORNER",$fe,"ARE COMBAT AUTO",$fe,"USE ABILITIES.",$fe,"YOU MUST LEARN",$fe,"THEM BEFORE YOU",$fe,"CAN USE THEM,",$fe,"OF COURSE.",$fe
tut10:
.byte "THESE ARE THE",$fe,"BASICS OF",$fe,"COMBAT THAT YOU",$fe,"NEED TO KNOW.",$fe,"TALK TO OTHER",$fe,"PEOPLE IN THE",$fe,"GAME FOR MORE",$fe,"TIPS! GOODBYE!",$fe


tut_lo:
.byte <tut00,   $00,      <tut01,   $00,      <tut02,   $00,      <tut03,   $00,      <tut04,   $00,      $00,      <tut05,   $00,      <tut06,   $00,      $00,      <tut07,   $00,      <tut08,   $00,      <tut09,   $00,      <tut10
tut_hi:
.byte >tut00,   $00 ,     >tut01,   $00,      >tut02,   $00,      >tut03,   $00,      >tut04,   $00,      $00,      >tut05,   $00,      >tut06,   $00,      $00,      >tut07,   $00,      >tut08,   $00,      >tut09,   $00,      >tut10
loop_train_lo:
.byte <ltrain00,<ltrain01,<ltrain02,<ltrain01,<ltrain02,<ltrain01,<ltrain02,<ltrain01,<ltrain02,<ltrain03,<ltrain01,<ltrain02,<ltrain01,<ltrain02,<ltrain04,<ltrain01,<ltrain02,<ltrain01,<ltrain02,<ltrain01,<ltrain02,<ltrain01,<ltrain05
loop_train_hi:
.byte >ltrain00,>ltrain01,>ltrain02,>ltrain01,>ltrain02,>ltrain01,>ltrain02,>ltrain01,>ltrain02,>ltrain03,>ltrain01,>ltrain02,>ltrain01,>ltrain02,>ltrain04,>ltrain01,>ltrain02,>ltrain01,>ltrain02,>ltrain01,>ltrain02,>ltrain01,>ltrain05
nmi_train_lo:
.byte <ntrain00,<ntrain01,<ntrain02,<ntrain01,<ntrain03,<ntrain01,<ntrain04,<ntrain01,<ntrain05,<ntrain06,<ntrain01,<ntrain07,<ntrain01,<ntrain08,<ntrain06,<ntrain01,<ntrain09,<ntrain01,<ntrain10,<ntrain01,<ntrain11,<ntrain01,<ntrain12
nmi_train_hi:
.byte >ntrain00,>ntrain01,>ntrain02,>ntrain01,>ntrain03,>ntrain01,>ntrain04,>ntrain01,>ntrain05,>ntrain06,>ntrain01,>ntrain07,>ntrain01,>ntrain08,>ntrain06,>ntrain01,>ntrain09,>ntrain01,>ntrain10,>ntrain01,>ntrain11,>ntrain01,>ntrain12
train_a_button:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq tno_a
		ldx temp_8bit_4
		lda loop_train_lo, x
		sta loop_pointer+0
		lda loop_train_hi, x
		sta loop_pointer+1
		lda nmi_train_lo, x
		sta nmi_pointer+0
		lda nmi_train_hi, x
		sta nmi_pointer+1
tno_a:
	rts
train_start_button:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq tno_start
		ldx temp_8bit_4
		lda loop_train_lo, x
		sta loop_pointer+0
		lda loop_train_hi, x
		sta loop_pointer+1
		lda nmi_train_lo, x
		sta nmi_pointer+0
		lda nmi_train_hi, x
		sta nmi_pointer+1
tno_start:
	rts
ltrain00:
	lda #$00
	sta p_anim_state
	jsr p_train_anim
	jsr tie_train_sprites
	jsr do_the_flicker
	jsr train_start_button
	jmp end_loop
ltrain01:
	ldx #$00
:	lda training_sprites, x
	sta off_tl, x
	inx
	cpx #48
	bne :-
	lda #$00
	sta p_anim_state
	jsr p_train_anim
	jsr tie_train_sprites
	lda #$ef
	sta cursor+4
	jsr do_the_flicker
	jmp end_loop
ltrain02:
	jsr do_the_flicker
;	lda temp_8bit_4
;	cmp #$09
;	beq :+
;		cmp #$0a
;		beq :+
;			cmp #$0e
;			beq :+
;		jsr train_start_button
;		jmp end_loop
;:	lda #$08
;	sta control_pad
	jsr train_start_button

	jmp end_loop
ltrain03:
	jsr train_icons
	jsr tie_train_sprites
	jsr do_the_flicker
	lda #$0a
	sta temp_8bit_4
	jsr train_start_button
	jmp end_loop
ltrain04:
	jsr train_all
	jsr tie_train_sprites
	jsr do_the_flicker
	lda #$0f
	sta temp_8bit_4
	jsr train_start_button
	jmp end_loop
ltrain05:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq nopers_start
		jmp start_exit_jmp
nopers_start:
	jmp end_loop

ntrain00:
	lda temp_8bit_4
	bne :+
		jsr tut_printing
:
	jmp end_nmi
ntrain01:
	jsr clear_tut
	jmp end_nmi
ntrain02:
	lda temp_8bit_4
	cmp #$02
	bne :+
		jsr tut_printing
		jmp end_nmi
:
	jmp end_nmi
ntrain03:
	lda temp_8bit_4
	cmp #$04
	bne :+
		jsr tut_printing
		jmp end_nmi
:
	jmp end_nmi
ntrain04:
	lda temp_8bit_4
	cmp #$06
	bne :+
		jsr tut_printing
		jmp end_nmi
:
	jmp end_nmi

ntrain05:
	lda temp_8bit_4
	cmp #$08
	bne :+
		jsr tut_printing
		lda temp_8bit_4
		cmp #$09
		bne :+
			lda #$08
			sta control_pad
			jsr train_start_button
			jmp end_nmi
:
	jmp end_nmi

ntrain06:
	lda #$2e
	sta $2006
	lda #$a6;#$aa
	sta $2006
	lda btl_letters+0
	sta $2007
	lda btl_letters+1
	sta $2007
	lda btl_letters+2
	sta $2007

	lda #$2e
	sta $2006
	lda #$e3;#$e7
	sta $2006
	lda btl_letters+3
	sta $2007
	lda btl_letters+4
	sta $2007
	lda btl_letters+5
	sta $2007

	lda #$2e
	sta $2006
	lda #$e9;#$ed
	sta $2006
	lda btl_letters+6
	sta $2007
	lda btl_letters+7
	sta $2007
	lda btl_letters+8
	sta $2007

	lda #$2f
	sta $2006
	lda #$26;#$2a
	sta $2006
	lda btl_letters+9
	sta $2007
	lda btl_letters+10
	sta $2007
	lda btl_letters+11
	sta $2007

	lda temp_8bit_4
	cmp #$0f
	bne :+
		jmp ntrain_xtra
:
rtnxtra:
	jmp end_nmi

ntrain07:
	lda temp_8bit_4
	cmp #$0b
	bne :+
		jsr tut_printing
		jmp end_nmi
:
	jmp end_nmi

ntrain08:
	lda temp_8bit_4
	cmp #$0d
	bne :+
		jsr tut_printing
		lda temp_8bit_4
		cmp #$0e
		bne :+
			lda #$08
			sta control_pad
			jsr train_start_button
			jmp end_nmi
:
	jmp end_nmi

ntrain09:
	lda temp_8bit_4
	cmp #$10
	bne :+
		jsr tut_printing
		jmp end_nmi
:
	jmp end_nmi

ntrain10:
	lda temp_8bit_4
	cmp #$12
	bne :+
		jsr tut_printing
		jmp end_nmi
:

	jmp end_nmi

ntrain11:
	lda temp_8bit_4
	cmp #$14
	bne :+
		jsr tut_printing
		jmp end_nmi
:

	jmp end_nmi

ntrain12:
	lda temp_8bit_4
	cmp #$16
	bne :+
		jsr tut_printing
		jmp end_nmi
:

	jmp end_nmi

ntrain_xtra:
	lda p_anim_state
	and #$0f
	beq rtn_xtra
		tax
		lda xtra_lo, x
		sta temp_16bit_3+0
		lda xtra_hi, x
		sta temp_16bit_3+1
		jmp (temp_16bit_3)
rtn_xtra:
	jmp rtnxtra
xtra_lo:
.byte $00
.byte <nupp,<nzap,<nfir,<nstp,<njmp
.byte <njke,<nblk,<nsid,<nend,<nadr
.byte <nesc,<nclu
xtra_hi:
.byte $00
.byte >nupp,>nzap,>nfir,>nstp,>njmp
.byte >njke,>nblk,>nsid,>nend,>nadr
.byte >nesc,>nclu
upp_trn0:
.byte "UPPERCUT        "
upp_trn1:
.byte "STAM-1  DAMAGE-1"
zap_trn0:
.byte "ZAP             "
zap_trn1:
.byte "STAM-4  DAMAGE-4"
fir_trn0:
.byte "FIREBALL        "
fir_trn1:
.byte "STAM-3  DAMAGE-3"
stp_trn0:
.byte "STOMP           "
stp_trn1:
.byte "STAM-2  DAMAGE-2"
jmp_trn0:
.byte "JUMP            "
jmp_trn1:
.byte "STAMINA - 1     "
jke_trn0:
.byte "JUKE            "
jke_trn1:
.byte "STAMINA - 1     "
blk_trn0:
.byte "BLOCK           "
blk_trn1:
.byte "STAMINA - 1     "
sid_trn0:
.byte "SIDESTEP        "
sid_trn1:
.byte "STAMINA - 1     "
end_trn0:
.byte "ENDURANCE       "
end_trn1:
.byte "STAMINA - 3     "
adr_trn0:
.byte "ADRENALINE      "
adr_trn1:
.byte "STAMINA - 3     "
esc_trn0:
.byte "ESCAPE          "
esc_trn1:
.byte "STAMINA - ALL   "
clu_trn0:
.byte "CLUE            "
clu_trn1:
.byte "STAMINA - 2     "
nupp:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda upp_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda upp_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
nzap:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda zap_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda zap_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
nfir:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda fir_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda fir_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
nstp:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda stp_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda stp_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
njmp:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda jmp_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda jmp_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
njke:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda jke_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda jke_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
nblk:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda blk_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda blk_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
nsid:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda sid_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda sid_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
nend:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda end_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda end_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
nadr:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda adr_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda adr_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
nesc:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda esc_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda esc_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
nclu:
	lda #$2d
	sta $2006
	lda #$cc
	sta $2006
	ldy #$00
:	lda clu_trn0, y
	sta $2007
	iny
	cpy #16
	bne :-
	lda #$2d
	sta $2006
	lda #$ec
	sta $2006
	ldy #$00
:	lda clu_trn1, y
	sta $2007
	iny
	cpy #16
	bne :-
	jmp rtn_xtra
