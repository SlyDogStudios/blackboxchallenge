; f0=dialog done/change npc dialog number, f1=yes/no, f2=nothing extra
; f3=train in combat
; f4=game from npc, f5=game from search, f6=change for nesvc, f7=item change npc and change another npc dialog

dlg_clear_lo:
	.byte $c5,$e5,$05,$25,$45

loop_print_words:
	ldx #$00
	txa
:	sta dialog_text, x
	inx
	cpx #22
	bne :-

	ldx #$00
	ldy temp_8bit_3
@first_one:
	txa
	bne :+
		lda (temp_16bit_4), y
		bne :+
			iny
:
	lda (temp_16bit_4), y
	sta dialog_text, x
	and #$f0
	cmp #$f0
	bne @continue
		sty temp_8bit_3
		jsr end_of_dialog
		lda quesyesno
		cmp #$fe
		bne :+
			lda #$00
			sta quesyesno
			beq @continue
:		cmp #$ff
		beq :+
			lda #$00
			sta temp_8bit_3
:			lda #$01
			sta temp_8bit_4
		jmp end_loop
@continue:
	iny
	inx
	cpx #22
	bne @first_one

	sty temp_8bit_3

:	dex
	lda dialog_text, x
	beq :+
		lda #$00
		sta dialog_text, x
		dey
		sty temp_8bit_3
		jmp :-
:
	jmp end_loop

nmi_print_words:
	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	sta $2006
	ldy #$00
:	lda dialog_text, y
	and #$f0
	cmp #$f0
	beq :+
		lda dialog_text, y
	sta $2007
	iny
	cpy #22
	bne :-
:
	lda ppu_addy+0
	clc
	adc #$20
	sta ppu_addy+0
	cmp #$65
	bne :+
		lda #$01
		sta temp_8bit_4
		dec ppu_addy+1
		lda #$c5
		sta ppu_addy+0
		bne :++
:	cmp #$05
	bne :+
		inc ppu_addy+1
:
	ldx #$00
	txa
:	sta dialog_text, x
	inx
	cpx #22
	bne :-

	lda temp_8bit_4
	beq :++
		lda quesyesno
		cmp #$ff
		bne :+
			lda #$00
			sta quesyesno
			jmp end_nmi
:		lda #<loop_words_wait
		sta loop_pointer+0
		lda #>loop_words_wait
		sta loop_pointer+1
		lda #<nmi_empty
		sta nmi_pointer+0
		lda #>nmi_empty
		sta nmi_pointer+1
:
	jmp end_nmi

nmi_print_name:
	lda attr_hi
	sec
	sbc #$01
	sta ppu_addy+1
	ldy #$00
	lda (temp_16bit_3), y
	cmp #$ff
	bne :+
		jmp :++++
:	lda ppu_addy+1
	sta $2006
	lda #$85
	sta $2006
	ldy #$00
	sty $2007
:	lda (temp_16bit_3), y
	cmp #$ff
	beq :+
		sta $2007
		iny
		jmp :-
:	lda #$00
	sta $2007
:	lda #$00
	sta temp_8bit_3
	sta temp_8bit_4
	lda #$c5
	sta ppu_addy+0
	lda #<loop_print_words
	sta loop_pointer+0
	lda #>loop_print_words
	sta loop_pointer+1
	lda #<nmi_print_words
	sta nmi_pointer+0
	lda #>nmi_print_words
	sta nmi_pointer+1

	jmp end_nmi




end_of_dialog:
	lda (temp_16bit_4), y
	and #$0f
	asl a
	tay
	lda end_of_dialog_table+1, y
	pha
	lda end_of_dialog_table+0, y
	pha
	rts
end_of_dialog_table:
	.addr eo_dialog0-1
	.addr ques_dialog-1,       no_extra-1,     do_train-1,              game_from_npc-1,   game_from_search-1
	.addr game_nesvc_switch-1, an_item_plus-1, get_maxmoney-1,          change_tune_npc-1, extended_dialog-1
	.addr check_boss_dead-1,   check_chad-1,   do_the_save-1,           dains_stuff-1,     dains_test-1
dains_test:
	ldy temp_8bit_3
	iny
	lda (temp_16bit_4), y
	sta ppu_addy+0
	iny
	lda attr_hi
	sec
	sbc (temp_16bit_4), y
	sta ppu_addy+1

	lda dain_all
	bne :+
		lda #<dain2
		sta temp_16bit_4+0
		lda #>dain2
		sta temp_16bit_4+1
		jmp :++
:
	lda #<dain1			; 4th byte = npc you are talking to new dialog lo
	sta temp_16bit_4+0
	lda #>dain1			; 5th byte = npc you are talking to new dialog hi
	sta temp_16bit_4+1
:
		lda #$01
		sta dain_all
		lda #$66
		sta npc_pos+0
		lda #$5f
		sta p_topleft_save+8
		sta p_topleft_save+12
;		lda #$d1
;		sta p_topleft_save+9
;		lda #$d3
;		sta p_topleft_save+13
		lda #$00
		sta bg_ram+118
		lda #$c6
		sta bg_ram+102
;		jsr adjust_npc1

	ldx #$15
	ldy #$ff
	sty temp_8bit_3
	lda #$fe
	sta quesyesno
	lda #$00
	sta temp_8bit_4
	rts
dains_stuff:
	ldx #$00
	stx dain_game
	stx dain_xtra
	stx dain_peri
	stx dain_all
:	lda games, x
	beq :+
		inc dain_game
:	inx
	cpx #30
	bne :--
	lda dain_game
	cmp #$1e
	bne :+
		lda #$01
		sta dain_all
:
		ldx #$ff	; so x will go back to zero and work off of the first line of text the npc says
		ldy #$00
		sty temp_8bit_3
		lda #$fe
		sta quesyesno
	rts


do_the_save:
	ldy temp_8bit_3
	iny
	ldx npc_offset
	lda (temp_16bit_4), y
	sta npc_dialogs, x
	lda #$01
	sta do_save
	rts
eo_dialog0:
	ldy temp_8bit_3
	iny
	ldx npc_offset
	lda npc_dialogs, x
	and #$80
	beq :+
		lda #$01
		sta quesyesno
:	lda (temp_16bit_4), y
	sta npc_dialogs, x
	lda quesyesno
	beq :+
;		lda npc_dialogs, x
;		eor #$80
;		sta npc_dialogs, x
		lda #$00
		sta quesyesno
:
		lda #$d2
		sta cursor+0
		lda #$d4
		sta cursor+3
	rts
ques_dialog:
	ldy temp_8bit_3
	iny
	ldx npc_offset_offset
	lda (temp_16bit_4), y		; for answering yes
	sta quesyesno
	iny
	lda (temp_16bit_4), y		; for answering no
	sta quesyesno+1
	iny
	lda (temp_16bit_4), y		; if money is involved, the amount you must pay
	sta quesyesno+2				;  (restricted to tens)
	iny
	lda (temp_16bit_4), y		; if you money is involved, the npc dialog for
	sta quesyesno+3				;  the player not having enough money when they say yes
		lda #$48
		sta cursor+3
		lda #$d0
		sta cursor+0
	rts
no_extra:
		lda #$d2
		sta cursor+0
		lda #$d4
		sta cursor+3
	rts
do_train:
	ldy temp_8bit_3
	iny
	ldx npc_offset
	lda (temp_16bit_4), y
	sta npc_dialogs, x
	lda #$01
	sta lets_train
	rts
;	lda #$ff
;	sta quesyesno
;	ldy temp_8bit_3
;	iny
;	lda (temp_16bit_4), y
;	and #$7f
;	tax						; for npc_offset (don't think I need to put it in the variable though)
;	lda npc_dialogs, x
;	and #%10000000
;	bne @have_item
;		iny
;		lda (temp_16bit_4), y
;		sta npc_dialogs, x
;		iny
;		sty temp_8bit_3
;		lda #$d2
;		sta cursor+0
;		lda #$d4
;		sta cursor+3
;		lda #$20
;		sta got_a_game
;		rts
;@have_item:
;	ldy #$00
;	sty temp_8bit_3
;	lda #<search_done
;	sta temp_16bit_3+0
;	lda #>search_done
;	sta temp_16bit_3+1
;	lda #$01
;	sta temp_8bit_4
;		lda #$d2
;		sta cursor+0
;		lda #$d4
;		sta cursor+3
;	rts

game_from_npc:
	ldy temp_8bit_3
	iny
	ldx npc_offset
	lda npc_dialogs, x
	and #$80
	bne :+
		lda #$01
		sta quesyesno
:	lda (temp_16bit_4), y
	sta npc_dialogs, x
	lda quesyesno
	beq :+
;		lda npc_dialogs, x
;		eor #$80
;		sta npc_dialogs, x
		lda #$00
		sta quesyesno
:	iny
	sty temp_8bit_3
	lda (temp_16bit_4), y
	tax
	lda #$01
	sta games, x
		lda #$d2
		sta cursor+0
		lda #$d4
		sta cursor+3
		lda #$f0
		sta got_a_game
	rts

game_from_search:

	rts
game_nesvc_switch:
	lda games+23	; test stackup to see if nes isn't working... if bit 6 is set (#$40) NES not working
	and #$40
	cmp #$40
	beq :+
		ldx #$ff	; so x will go back to zero and work off of the first line of text the npc says
		ldy #$00
		sty temp_8bit_3
		lda #$fe
		sta quesyesno
		rts
:	lda #<bishop1
	sta temp_16bit_4+0
	lda #>bishop1
	sta temp_16bit_4+1
	lda #$ff
	tax
	sta temp_8bit_3
	tay
	lda #$fe
	sta quesyesno
	rts
an_item_plus:
;	lda #$ff
;	sta quesyesno
	ldy temp_8bit_3
	iny
	ldx npc_offset
	lda (temp_16bit_4), y
	sta npc_dialogs, x
		iny
		lda (temp_16bit_4), y
		tax					; next npc offset to coordinate and change
		iny
		lda (temp_16bit_4), y
		sta npc_dialogs, x
		iny
		sty temp_8bit_3
		lda #$d2
		sta cursor+0
		lda #$d4
		sta cursor+3
		lda #$20
		sta got_a_game
		rts

get_maxmoney:			; used for hekl's money thingy
	ldy temp_8bit_3
	iny
	ldx npc_offset
	lda (temp_16bit_4), y
	sta npc_dialogs, x
	lda #$37
	sta man0+0
	lda #$36
	sta man0+1
	lda #$38
	sta man0+2
		lda #$f0
		sta got_a_game
;	iny
;	lda (temp_16bit_4), y
;	tax
;	lda #$01
;	sta pg_have, x
;	iny
;	sty temp_8bit_3
		lda #$d2
		sta cursor+0
		lda #$d4
		sta cursor+3
;		lda #$f0
;		sta got_a_game
	rts

change_tune_npc:
	ldy temp_8bit_3
	iny
	ldx npc_offset
	lda (temp_16bit_4), y
	sta npc_dialogs, x
	lda bank_prg
	pha
	iny
	lda (temp_16bit_4), y
	sty temp_8bit_3
	pha
	lda #11
	sta bank_prg
	jsr bank_save
	pla
	sta world_song
	sta music_current
	sta music_tester
	jsr music_loadsong
	pla
	sta bank_prg
	jsr bank_save
	ldy temp_8bit_3
	rts
extended_dialog:
	ldy temp_8bit_3
	iny
	lda (temp_16bit_4), y
	sta ppu_addy+0
	iny
	lda attr_hi
	sec
	sbc (temp_16bit_4), y
	sta ppu_addy+1

	iny
	lda (temp_16bit_4), y			; 4th byte = npc you are talking to new dialog lo
	pha
	iny
	lda (temp_16bit_4), y			; 5th byte = npc you are talking to new dialog hi
	sta temp_16bit_4+1
	pla
	sta temp_16bit_4+0

	ldx #$15
	ldy #$ff
	sty temp_8bit_3
	lda #$fe
	sta quesyesno
	lda #$00
	sta temp_8bit_4
	rts

check_boss_dead:
	ldy temp_8bit_3
	iny
	lda bosses
	and (temp_16bit_4), y
	beq :+
		iny
		lda (temp_16bit_4), y
		pha
		iny
		lda (temp_16bit_4), y
		sta temp_16bit_4+1
		pla
		sta temp_16bit_4+0
		ldx #$ff
		ldy #$ff
		sty temp_8bit_3
		lda #$fe
		sta quesyesno
		lda #$00
		sta temp_8bit_4
		rts
		
:	iny
	iny
	sty temp_8bit_3
	ldx #$ff
		lda #$fe
		sta quesyesno
	rts

check_chad:
	ldy temp_8bit_3
	iny
	lda (temp_16bit_4), y
	tax
	iny
	lda game_hitens, x
	cmp (temp_16bit_4), y
	bcs :+
		ldy #$0b
		sty temp_8bit_3
		ldx #$ff
		lda #$fe
		sta quesyesno
		rts
:	iny
	lda (temp_16bit_4), y
	tax
	iny
	lda game_hitens, x
	cmp (temp_16bit_4), y
	bcs :+
		ldy #$0b
		sty temp_8bit_3
		ldx #$ff
		lda #$fe
		sta quesyesno
		rts
:	lda npc_dialogs+33
	cmp #$08
	bne :+
		iny
		iny
		iny
		iny
		jmp :+++
:
	iny
	lda (temp_16bit_4), y
	tax
	iny
	lda game_hitens, x
	cmp (temp_16bit_4), y
	bcs :+
		ldy #$0b
		sty temp_8bit_3
		ldx #$ff
		lda #$fe
		sta quesyesno
		rts
:	iny
	lda (temp_16bit_4), y
	tax
	iny
	lda game_hitens, x
	cmp (temp_16bit_4), y
	bcs :+
		ldy #$0b
		sty temp_8bit_3
		ldx #$ff
		lda #$fe
		sta quesyesno
		rts
:	iny
	ldx npc_offset
	lda (temp_16bit_4), y
	sta npc_dialogs, x
		iny
		lda (temp_16bit_4), y
		pha
		iny
		lda (temp_16bit_4), y
		sta temp_16bit_4+1
		pla
		sta temp_16bit_4+0
		ldx #$ff
		ldy #$ff
		sty temp_8bit_3
		lda #$fe
		sta quesyesno
		lda #$00
		sta temp_8bit_4
		lda #$20
		sta got_a_game
	rts





loop_yesno_poll:
	lda control_pad
	and #left_punch
	beq @no_left
		lda #$48
		sta cursor+3
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda #$80
		sta cursor+3
@no_right:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a

		ldx npc_offset
		lda cursor+3
		cmp #$48
		bne :+
			jsr test_door
			jsr test_money
			lda quesyesno
			jmp :++
:		lda quesyesno+1
:		sta npc_dialogs, x

		lda #$00
		sta quesyesno
		sta quesyesno+1
		sta temp_8bit_1
		sta temp_8bit_2
		sta temp_8bit_3
		sta temp_8bit_4
		jsr get_npc_addresses
		lda attr_hi
		sec
		sbc #$01
		sta ppu_addy+1
		lda #$c5
		sta ppu_addy+0
		lda #<loop_empty
		sta loop_pointer+0
		lda #>loop_empty
		sta loop_pointer+1
		lda #<nmi_dialog_clear
		sta nmi_pointer+0
		lda #>nmi_dialog_clear
		sta nmi_pointer+1
		jmp end_loop
@no_a:
	jmp end_loop

test_money:
	lda quesyesno+2
	bne :+
		rts
: 
	lda man0+1
	and #$0f
	cmp quesyesno+2
	bcs take_money
		lda man0+0
		cmp #$31
		bcs take_money
			lda quesyesno+3
			sta quesyesno
			jmp done_money_dialog
take_money:
	dec man0+1
	lda man0+1
	cmp #$2f
	bne :+
		dec man0+0
		lda #$39
		sta man0+1
:
	dec quesyesno+2
	bne take_money
done_money_dialog:
	lda #$00
	sta quesyesno+2
	sta quesyesno+3
	lda npc_offset
	cmp #$0b
	bne :+
		lda #$01
		sta npc_dialogs+27
:
	rts



test_door:
	cpx #$02
	beq do_door
		cpx #$03
		beq do_elec
			cpx #$04
			beq :+
				jmp not_door
:				lda games+29
				and #$c0
				bne :+
					lda #$03
					sta quesyesno
					rts
:				lda #$ef
				sta npc3_topleft+0
				sta npc3_topright+0
				sta p_topleft_save+24
				sta p_topleft_save+28
				pha
				txa
				pha
				tya
				pha
				jsr boulder_beep
				pla
				tay
				pla
				tax
				pla
				lda #$00
				sta npc1+2
				ldy bg_ram_store
				lda #$00
				sta bg_ram, y
				rts
do_door:
			lda games+5
			and #$c0
			bne :+
				lda #$03
				sta quesyesno
				rts
:			lda #$ef
			sta npc2_topleft+0
			sta npc2_topright+0
			sta p_topleft_save+16
			sta p_topleft_save+20
				pha
				txa
				pha
				tya
				pha
				jsr door_beep
				pla
				tay
				pla
				tax
				pla
			lda #$00
			sta npc1+1
			ldy bg_ram_store
			lda #$00
			sta bg_ram, y
			rts
do_elec:
			lda games+12
			and #$c0
			bne :+
				lda #$03
				sta quesyesno
				rts
:			lda #$ef
			sta npc_topleft+0
			sta npc_topright+0
			sta p_topleft_save+8
			sta p_topleft_save+12
				pha
				txa
				pha
				tya
				pha
			jsr elec_door_beep
				pla
				tay
				pla
				tax
				pla
			lda #$00
			sta npc1+0
			ldy bg_ram_store
			lda #$00
			sta bg_ram, y
not_door:
	rts




nmi_yesno_write:
	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	sta $2006
	lda #$59
	sta $2007
	lda #$45
	sta $2007
	lda #$53
	sta $2007
	lda #$00
	sta $2007
	sta $2007
	sta $2007
	sta $2007
	lda #$4e
	sta $2007
	lda #$4f
	sta $2007
	jmp end_nmi


loop_words_wait:
	lda quesyesno
	beq :+
		lda #<loop_yesno_poll
		sta loop_pointer+0
		lda #>loop_yesno_poll
		sta loop_pointer+1
		lda #<nmi_yesno_write
		sta nmi_pointer+0
		lda #>nmi_yesno_write
		sta nmi_pointer+1
		lda attr_hi
		sta ppu_addy+1
		lda #$4a
		sta ppu_addy+0
		jmp end_loop
:
	lda cursor+0
	cmp #$d2
	beq :+
		lda #$d2
		bne :++
:	lda #$f0
:	sta cursor+0
		lda #$d4
		sta cursor+3

	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda #$f0
		sta cursor+0
		lda temp_8bit_3
		bne :+
			lda attr_hi
			sec
			sbc #$01
			sta ppu_addy+1
			lda #$e8
			sta attr_lo
			lda #39
			sta temp_8bit_1
			lda #$a0
			sta temp_8bit_2
			lda #$80
			sta ppu_addy+0
			jsr talk_beep
			jmp leave_dialog
:
		ldx #$00
		stx temp_8bit_4
		lda attr_hi
		sec
		sbc #$01
		sta ppu_addy+1
		lda #$c5
		sta ppu_addy+0
		lda #<loop_empty
		sta loop_pointer+0
		lda #>loop_empty
		sta loop_pointer+1
		lda #<nmi_dialog_clear
		sta nmi_pointer+0
		lda #>nmi_dialog_clear
		sta nmi_pointer+1
@no_a:

	jmp end_loop



nmi_dialog_clear:
	ldx temp_8bit_4
	lda ppu_addy+1
	sta $2006
	lda dlg_clear_lo, x
	sta $2006
	ldy #$00
	tya
:	sta $2007
	iny
	cpy #22
	bne :-
		inx
		cpx #$02
		bne :+
			inc ppu_addy+1
:		cpx #$05
		bne :+
			lda #$00
			sta temp_8bit_4
			lda attr_hi
			sec
			sbc #$01
			sta ppu_addy+1
			lda #$c5
			sta ppu_addy+0
			lda #<loop_print_words
			sta loop_pointer+0
			lda #>loop_print_words
			sta loop_pointer+1
			lda #<nmi_print_words
			sta nmi_pointer+0
			lda #>nmi_print_words
			sta nmi_pointer+1
			jmp end_nmi
:	stx temp_8bit_4
	jmp end_nmi


