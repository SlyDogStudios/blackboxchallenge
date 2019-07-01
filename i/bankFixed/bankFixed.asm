.segment "BANKFIXED"
.include "i\bankFixed\challenge_reset.asm"

loop_main:
	jmp (loop_pointer)
end_loop:
	jsr nmi_wait
	jmp loop_main

nmi:
	pha								; Save the registers
	txa								;
	pha								;
	tya								;
	pha								;

	lda $2002

	inc nmi_num

	lda #$02						; Do sprite transfer
	sta $4014						;

	ldx #$00
	lda #$3f						; refresh the palette
	sta $2006						;
	lda #$00						;
	sta $2006						;
:	lda pal_address, x				;
	sta $2007						;
	inx								;
	cpx #32							;
	bne :-							;

	jmp (nmi_pointer)
end_nmi:
	lda save2001
	sta $2001

	lda nametable
	sta $2006
	lda #$00
	sta $2006
	lda scroll_x
	sta $2005
	lda scroll_y
	sta $2005

	lda #11
	clc
	adc bank_chr
	tay
	jsr bankswitch
	jsr music_play	; music play here

	jsr bank_save

	ldx #$01
	stx $4016
	dex
	stx $4016
	lda control_pad
	sta control_old
	ldx #$08
:	lda $4016
	lsr A
	ror control_pad
	dex
	bne :-

	pla								; Restore the registers
	tay								;
	pla								;
	tax								;
	pla								;
irq:
	rti

loop_empty:
	jmp end_loop
nmi_empty:
	jmp end_nmi

nmi_wait:
	lda nmi_num						; Wait for an NMI to happen before running
:	cmp nmi_num						; the main loop again
	beq :-							;
	rts



loop_got_game:
	dec got_a_game
	bne :+
			lda #<loop_play
			sta loop_pointer+0
			lda #>loop_play
			sta loop_pointer+1
;			lda #<nmi_empty
;			sta nmi_pointer+0
;			lda #>nmi_empty
;			sta nmi_pointer+1
:
	jmp end_loop

rtn_from_save:
	lda #$01
	sta bank_prg
	jsr bank_save
	lda do_save
	cmp #$01
	bne :+
		lda #$00
		sta do_save
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
		jmp :++
:
;	lda #$00
;	sta do_save
	lda #$27
	sta $2006
	lda #$57
	sta $2006
	lda #$44
	sta $2007
	lda #$f6
	sta $2007
	lda #$00
	sta $2007
	lda #<loop_empty
	sta loop_pointer+0
	lda #>loop_empty
	sta loop_pointer+1
	lda #<nmi_empty
	sta nmi_pointer+0
	lda #>nmi_empty
	sta nmi_pointer+1

:	bit $2002
	bpl :-

	lda do_save
	beq :+
		lda #$24
		sta nametable
		lda #$00
		sta do_save
		sta $2005
		sta $2005
		lda #%10011001
		sta $2000
		sta save2000
		lda #%00011110
		sta $2001
		sta save2001
		jmp end_loop
:	lda #%10100000
	sta $2000
	sta save2000
	lda #%00011110
	sta $2001
	sta save2001
	jmp end_loop

;check_state:
;.byte $00,$00,$00,$00,$01,$01,$01,$01, $02,$02,$02,$02,$03,$03,$03,$03
check_nt:
.byte $20,$24,$28,$2c,$20,$24,$28,$2c, $20,$24,$28,$2c,$20,$24,$28,$2c
new_nt:
.byte $28,$2c,$20,$24,$28,$2c,$20,$24, $24,$20,$2c,$28,$24,$20,$2c,$28
check_add_sub:
.byte $8d,$8d,$8d,$8d,$0d,$0d,$0d,$0d, $8e,$8e,$8e,$8e,$0e,$0e,$0e,$0e
check_and:
.byte $f0,$f0,$f0,$f0,$f0,$f0,$f0,$f0, $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
check_pos:
.byte $00,$00,$00,$00,$e0,$e0,$e0,$e0, $00,$00,$00,$00,$0f,$0f,$0f,$0f
check_scroll:
.byte $00,$00,$00,$00,$01,$01,$01,$01, $02,$02,$02,$02,$03,$03,$03,$03


sds:
.byte "SDS",$1a
secret_entrance_sprites:
	lda map_x
	cmp #$0a
	bne @not_there
		lda map_y
		cmp #$09
		bne @not_there
			lda p_topleft+3
			cmp #$b0
			bcc @spr_off
				ldx #$00
:				lda #$bf
				sta cursor+0, x
				lda #$11
				sta cursor+1, x
				lda #$c0
				sta cursor+3, x
				inx
				inx
				inx
				inx
				cpx #$20
				bne :-
				rts
@spr_off:
	ldx #$00
:	lda #$ef
	sta cursor+0, x
	lda #$11
	sta cursor+1, x
	inx
	inx
	inx
	inx
	cpx #$20
	bne :-
@not_there:
	rts
desert_injury:
	lda map_y
	cmp #$0e
	bcs :+
		lda #$03
		sta desert_steps
		rts
:	lda map_x
	cmp #$02
	bcc :+
		lda #$03
		sta desert_steps
		rts
:	

	lda desert_steps
	bne :+++++
		ldx #$09
:		lda h0, x
		beq :++
			cmp #$0b
			bcs :++
				lda h0, x
				cmp #$0a
				bne :+
					lda #$0c
					sta h0, x
					bne :+++
:				lda #$0b
				sta h0, x
				bne :++
:
		dex
		bpl :---
:
		lda #$04
		sta desert_steps
		lda #$10
		sta desert_hurt
:	dec desert_steps
	rts


load_save_data:
				lda #18
				sta bank_prg
				jsr bank_save
				lda #$00
				sta temp_16bit_1+0
				lda #$80
				sta temp_16bit_1+1
				ldy #$00
:				lda (temp_16bit_1), y
				sta games+0, y
				iny
				cpy #$46
				bne :-
				lda #$00
				sta temp_16bit_1+0
				lda #$81
				sta temp_16bit_1+1
				ldy #$00
:				lda (temp_16bit_1), y
				sta npc_dialogs, y
				iny
				bne :-
				lda #22
				sta bank_prg
				jsr bank_save
	rts

loop_play:

	lda do_save
	beq :+
;				lda bank_prg
;				sta bank_btl_save
				lda #18
				sta bank_prg
				jsr bank_save
;				pla
;				sta bank_prg
;				jsr bank_save
			lda #$00
			sta $2000
			sta save2000
			sta $2001
			sta save2001
;			lda #<loop_save
;			sta loop_pointer+0
;			lda #>loop_save
;			sta loop_pointer+1
			jmp loop_save
:

	lda lets_train
	beq :+
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$00
				sta music_current
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
				lda #14
				sta bank_prg
				jsr bank_save
				jmp training_load
:

	lda got_a_game
	beq :+++
			cmp #$20
			bne :+
				jsr story_beep
				jmp :++
:			jsr gotit_beep
:			lda #<loop_got_game
			sta loop_pointer+0
			lda #>loop_got_game
			sta loop_pointer+1
			jmp end_loop
:

	jsr secret_entrance_sprites

	lda h0+0
	cmp #$0b
	bcc didnt_die
				lda bank_prg
				pha
				lda #20
				sta bank_prg
				jsr bank_save
				jsr fill_hp_stam_combat
				pla
				sta bank_prg
				jsr bank_save
		lda #$16
		sta pal_address+17
		sta pal_address+18
		sta pal_address+19
		lda p_pos
		sta search_pos
		lda #$45;#$35
		sta search_dir
:		lda	map_y
		bne :+
			lda map_y
			clc
			adc #$80
			sta search_hi
			bne :++
:		dec map_y
		sta search_hi
		jmp :--
:		lda map_x
		beq :+
			lda #$81
:		sta search_lo
		lda #$33
		sta search_p_pos
		lda #$00
		sta set_move
didnt_die:


	lda desert_hurt
	beq :++
		dec desert_hurt
		lda desert_hurt
		cmp #$01
		bne :+
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$47
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
			lda #$37
			sta pal_address+17
			lda #$11
			sta pal_address+18
			lda #$17
			sta pal_address+19
			dec desert_hurt
			jmp :++
:		lda #$16
		sta pal_address+17
		sta pal_address+18
		sta pal_address+19
:


	ldx #$00
:	lda stores_y, x
	cmp map_y
	bne :+
		lda stores_x, x
		cmp map_x
		bne :+
			stx temp_8bit_2
			lda #$00
			sta temp_8bit_1
			lda bank_prg
			sta bank_btl_save
			lda #$03
			sta bank_prg
			jsr bank_save
			lda #<loop_store
			sta loop_pointer+0
			lda #>loop_store
			sta loop_pointer+1
			lda #<nmi_store
			sta nmi_pointer+0
			lda #>nmi_store
			sta nmi_pointer+1
			jmp loop_store
:	inx
	cpx #$03
	bne :--
	jmp not_store
return_from_store:
			lda bank_btl_save
			sta bank_prg
			jsr bank_save

not_store:

	lda map_y
	bne :++
		lda map_x
		cmp #$0e
		bne :++
			lda p_pos
			cmp #$71
			bne :++
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$00
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
				ldx #00
				lda #$0f
:				sta pal_address, x
				inx
				cpx #$20
				bne :-
				lda #$ef
				sta p_topleft
				sta p_topright
				jsr screen_remove_sprites
					jsr nmi_wait
				lda #$00
				sta $2000
				sta save2000
				sta $2001
				sta save2001
				lda #<loop_end_clear
				sta loop_pointer+0
				lda #>loop_end_clear
				sta loop_pointer+1
				lda #<nmi_empty
				sta nmi_pointer+0
				lda #>nmi_empty
				sta nmi_pointer+1
;				lda bank_prg
;				pha
				lda #16
				sta bank_prg
				jsr bank_save
				jmp loop_end_clear
						; GO TO ENDING HERE

:

	lda battle_incrementer
	cmp #100
	bne :+
		lda #$ff
		sta battle_incrementer
:	inc battle_incrementer
	
	jsr do_random_set

	ldx #$00
@switch_nt:
	lda p_pos
	and check_and, x
	cmp check_pos, x
	bne @go_more
		lda nametable
		cmp check_nt, x
		bne @go_more
			lda new_nt, x
			sta ppu_addy+1
			cpx #$08
			bcs @left_right
				lda check_add_sub, x
				and #$80
				beq :+
					lda check_scroll, x
					sta which_scroll_dir
					dec map_y
					lda p_pos
					clc
					adc #$d0
					sta p_pos
					jmp @do_load
:				lda check_scroll, x
				sta which_scroll_dir
				inc map_y
				lda p_pos
				sec
				sbc #$d0
				sta p_pos
				jmp @do_load
@left_right:
			lda check_add_sub, x
			and #$80
			beq :+
				lda check_scroll, x
				sta which_scroll_dir
				dec map_x
				lda p_pos
				clc
				adc #$0e
				sta p_pos
				jmp @do_load
:			lda check_scroll, x
			sta which_scroll_dir
			inc map_x
			lda p_pos
			sec
			sbc #$0e
			sta p_pos
			jmp @do_load
@go_more:
	inx
	cpx #16
	bne @switch_nt
	beq @all_done
@do_load:
	jsr clear_npc_data
	jsr screen_remove_sprites
		lda #$ff
		sta temp_8bit_1
		lda #$00
		sta temp_8bit_2
		lda #$01
		sta scrn_change_type
	lda ppu_addy+1
	clc
	adc #$03
	sta attr_hi
	lda #$c0
	sta attr_lo
;	ldy #$01
;	jsr bankswitch
	lda #$01
	sta bank_prg
	jsr bank_save
	jsr get_bank
	jsr get_music
	jsr map_coords
	lda #$ff
	sta temp_8bit_1
	lda #$00
	sta temp_8bit_2
	sta ppu_addy+0
		lda #<loop_load32s
		sta loop_pointer+0
		lda #>loop_load32s
		sta loop_pointer+1
		lda #<nmi_load32s
		sta nmi_pointer+0
		lda #>nmi_load32s
		sta nmi_pointer+1
		jmp loop_load32s
@all_done:

	lda goal_offset
	bne :+
		lda map_y
		cmp #$04
		bne :+
			lda map_x
			bne :+
				lda p_pos
				cmp #$61
				bne :+
					lda #$04
					sta search_dir
					sta search_lo
					lda #$01
					sta search_hi
					lda #$c2
					sta search_p_pos
					lda #$01
					sta goal_offset
					jmp @not_dojo_first
:	lda goal_offset
	cmp #$01
	bne :+
		lda map_y
		cmp #$05
		bne :+
			lda map_x
			cmp #$04
			bne :+
				lda p_pos
				cmp #$d2
				bne :+
					lda #$17
					sta search_dir
					lda #$84
					sta search_lo
					lda #$81
					sta search_hi
					lda #$62
					sta search_p_pos
					lda #$f2
					sta goal_offset
:
@not_dojo_first:


	ldx #$00
@check_stairs:
	lda search_dir, x
	and #$0f
	cmp #$04
	bcs :+
		jmp @no_match
:		lda search_pos, x
		cmp p_pos
		beq :+
			jmp @no_match
:			stx temp_8bit_3
			lda search_lo, x
			and #$80
			beq :+
				lda search_lo, x
				and #$0f
				clc
				sta temp_8bit_1
				lda map_x
				sec
				sbc temp_8bit_1
				sta map_x
				jmp :++
:			lda map_x
			clc
			adc search_lo, x
			sta map_x
:			lda search_hi, x
			and #$80
			beq :+
				lda search_hi, x
				and #$0f
				clc
				sta temp_8bit_1
				lda map_y
				sec
				sbc temp_8bit_1
				sta map_y
				jmp :++
:			lda map_y
			clc
			adc search_hi, x
			sta map_y
:				lda #$06
				sta temp_8bit_2
				lda #$10
				sta temp_8bit_1
				lda save2001
				eor #$e0
				sta save2001

				lda search_dir, x
				and #$f0
				bne :+
					jsr walk_beep
					jmp :+++++
:				cmp #$10
				bne :+
					jsr door_beep
					jmp :++++
:				cmp #$20
				bne :+
					jsr fall_beep
					jmp :+++
:				cmp #$30
				bne :+
					jsr start_playing_beep
					jmp :++
:				jsr siren_beep
:				lda #<loop_fadeout
				sta loop_pointer+0
				lda #>loop_fadeout
				sta loop_pointer+1
				jmp end_loop
@no_match:
	inx
	cpx #$05
	beq :+
		jmp @check_stairs
:
	lda bike_move
	beq :+
		jsr bike_controls
		jmp no_control
:
	lda set_move
	beq no_move
		cmp #$80
		bne :+
			inc p_topleft+3
			bne :++++
:		cmp #$40
		bne :+
			dec p_topleft+3
			bne :+++
:		cmp #$20
		bne :+
			inc p_topleft+0
			bne :++
:		cmp #$10
		bne :+
		dec p_topleft+0
:	inc p_move_count
	lda p_move_count
	cmp #$10
	bne dont_set_move_zero
		lda #$00
		sta p_move_count
		sta set_move
		jsr get_pos

		lda bank_prg
		pha
		lda #25
		sta bank_prg
		jsr bank_save
		jmp test_for_battle
done_test_battle:
		pla
		sta bank_prg
		jsr bank_save

		lda p_anim_state
		and #$0f
		cmp #$0c
		bcc :++
			ldx p_pos
			lda bg_ram, x
			cmp #$02
			bcc :+
				lda p_anim_state
				and #$0f
				sec
				sbc #$0c
				sta p_anim_state
			jsr stop_sfx_beep
				jmp :++
:			lda p_anim_state
			and #$0f
			sec
			sbc #$0c
			tax
			lda boat_which, x
			sta set_move
:
dont_set_move_zero:
		jmp no_control
no_move:



	lda control_pad
	and #up_punch
	beq @no_up
		jsr steps_routine
		lda p_anim_state
		cmp #$80
		beq :+
			lda #$00
			sta p_anim_state
:		jsr get_pos
		sec
		sbc #$10
		tax
		lda bg_ram, x
		cmp #$01
		beq :+
			and #$80
			cmp #$80
			beq :+
			lda #$10
			sta set_move
			jsr desert_injury
:		jmp no_control
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		jsr steps_routine
		jsr get_pos
		tax
		lda bg_ram, x
		cmp #$0f
		bne :+
			lda p_anim_state
			cmp #$80
			beq :++
				lda #$00
				sta p_anim_state
				beq :++
:		lda p_anim_state
		cmp #$81
		beq :+
			lda #$01
			sta p_anim_state
:		jsr get_pos
		clc
		adc #$10
		tax
		lda bg_ram, x
		cmp #$01
		beq :+
			and #$80
			cmp #$80
			beq :+
			lda #$20
			sta set_move
	jsr desert_injury
:		jmp no_control
@no_down:
	lda control_pad
	and #left_punch
	beq @no_left
		jsr steps_routine
		lda p_anim_state
		cmp #$82
		beq :+
			lda #$02
			sta p_anim_state
:		jsr get_pos
		tax
		dex
		lda bg_ram, x
		cmp #$01
		beq :+
			and #$80
			cmp #$80
			beq :+
			lda #$40
			sta set_move
	jsr desert_injury
:		jmp no_control
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		jsr steps_routine
		lda p_anim_state
		cmp #$83
		beq :+
			lda #$03
			sta p_anim_state
:		jsr get_pos
		tax
		inx
		lda bg_ram, x
		cmp #$01
		beq :+
			and #$80
			cmp #$80
			beq :+
			lda #$80
			sta set_move
	jsr desert_injury
:		jmp no_control
@no_right:

	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq no_a
		ldx p_pos
		lda bg_ram, x
		bne :+
			lda #$0a
			sta bank_prg
			jsr bank_save
			jsr dialog_remove_sprites
			jsr pdir_jumper
			jsr talk_beep
			lda attr_hi
			sec
			sbc #$01
			sta ppu_addy+1
			lda #$00
			sta temp_8bit_1
			lda #<loop_dlg
			sta loop_pointer+0
			lda #>loop_dlg
			sta loop_pointer+1
			lda #<nmi_dlg
			sta nmi_pointer+0
			lda #>nmi_dlg
			sta nmi_pointer+1
			jmp loop_dlg
:;		and #$80
;		cmp #$80
;		bne :+
		jsr ability_jumper
		jmp no_control
no_a:

	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	bne :+
		jmp no_b
:		lda games+9
		and #$c0
		bne :+
			jmp no_b
:		lda p_anim_state
		and #$0f
		bne :+
			lda p_pos
			sec
			sbc #$10
			tax
			lda bg_ram, x
			bne no_b
				lda #$11
				sta set_move
				bne set_bike
:		cmp #$01
		bne :+
			lda p_pos
			clc
			adc #$10
			tax
			lda bg_ram, x
			bne no_b
				lda #$22
				sta set_move
				bne set_bike
:		cmp #$02
		bne :+
			lda p_pos
			tax
			dex
			lda bg_ram, x
			bne no_b
				lda #$43
				sta set_move
				bne set_bike
:
		lda p_pos
		tax
		inx
		lda bg_ram, x
		bne no_b
			lda #$84
			sta set_move
set_bike:
		lda map_y
		cmp #$08
		bcs :+
			bcc no_b
:		cmp #$10
		bcc :+
			bcs no_b
:		lda map_x
		cmp #$00
		bcs :+
			bcc no_b
:		cmp #$08
		bcc :+
			bcs no_b
:
		jsr bikego_beep
		jsr bike_player
		lda #$01
		sta bike_move
		lda p_anim_state
		and #$0f
		clc
		adc #$08
		sta p_anim_state
		jmp no_control
no_b:


	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq @no_start
;		lda p_topleft
;		sta $6f0
;		lda p_topright
;		sta $6f1
		lda #$03
		sta dialog_type
		jsr save_palettes
		jsr menu_remove_sprites
		lda #$ef
		sta p_topleft
		sta p_topright
		ldx #$00
		lda #$0f
:		sta pal_address+0, x
		inx
		cpx #$20			; was #$1f, no clue why but thought I'd note it
		bne :-
		jsr menu_get
		lda #$1f
		sta cursor+1
		lda pal_animation
		sta temp_16bit_4+1
		lda #<loop_menu_wait
		sta loop_pointer+0
		lda #>loop_menu_wait
		sta loop_pointer+1
		lda #<nmi_empty
		sta nmi_pointer+0
		lda #>nmi_empty
		sta nmi_pointer+1
		jmp end_loop
@no_start:

	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq @no_select
		lda npc1+0
		and #$80
		cmp #$80
		bne @no_select
			lda db_have
			beq @no_select
				lda #$81
				sta db_have
				lda bank_prg
				pha
				lda #25
				sta bank_prg
				jsr bank_save
				jmp get_battle
@no_select:
no_control:

	lda bank_prg
	pha
	lda #08
	sta bank_prg
	jsr bank_save
		jmp do_npc_stuffs
done_npc_stuffs:
	pla
	sta bank_prg
	jsr bank_save

	jsr p_anim
	jsr p_tie_sprites

	lda pal_animation
	beq :+
		jsr palette_animate
:
	jmp end_loop

store_owner:
	lda bank_prg
	pha
	lda #08
	sta bank_prg
	jsr bank_save
	jsr npc1_anim
	jsr npc_tie_sprites
	pla
	sta bank_prg
	jsr bank_save
	rts


steps_routine:
	lda the_steps
	beq :+
		dec the_steps
:	rts

contri_beep:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$1e
				sta music_current
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
	rts
training_beep:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #41
				sta music_current
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
	rts
ender_beep:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #37
				sta music_current
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
	rts
music_beep:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$00
				sta music_current
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
	rts
battle_intro_tune:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$08
				sta music_current
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
	rts
whistle_for_them:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$62;#37
				sta music_current
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
boulder_beep:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$63
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
elec_door_beep:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$64
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
store_beep:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$4d
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts

door_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$5b
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
walk_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$5c
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
fall_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$5d
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts

start_playing_beep:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #40
;				sta music_current
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
	rts
talk_beep:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$5a
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
adjust_npc1:
	lda bank_prg
	pha
	lda #8
	sta bank_prg
	jsr bank_save
	ldx #$00
	lda npc_anim_state+0
	jsr npc1_anim
	pla
	sta bank_prg
	jsr bank_save
	rts
adjust_npc2:
	lda bank_prg
	pha
	lda #8
	sta bank_prg
	jsr bank_save
	ldx #$01
	lda npc_anim_state+1
	jsr npc2_anim
	pla
	sta bank_prg
	jsr bank_save
	rts
adjust_npc3:
	lda bank_prg
	pha
	lda #8
	sta bank_prg
	jsr bank_save
	ldx #$02
	lda npc_anim_state+2
	jsr npc3_anim
	pla
	sta bank_prg
	jsr bank_save
	rts
store_get:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$4e
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts

menu_get:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$59
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts

gotit_beep:

				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$57
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
story_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$58
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts



tramp_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$4f
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
climb_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$50
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
homer_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$51
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
boat_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$52
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
float_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$53
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
bikego_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$54
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
bikeno_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$55
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
launch_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$56
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
siren_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$60
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
stop_sfx_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				jsr music_stopsfx
				pla
				sta bank_prg
				jsr bank_save
	rts
title_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$1c
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
	rts
story0_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$20
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
	rts
ability_jmp_tbl:
	.addr nada-1
	.addr nada-1, flt_lt-1, flt_rt-1, boat_up-1, boat_dn-1	;1=solid,2=balloon1,3=balloon2,4=sail1,5=sail2
	.addr boat_lt-1, boat_rt-1, nada-1, nada-1, climbing-1	;6=boat1,7=boat2,8=launch1,9=launch2,A=climblt
	.addr go_home-1, climbingr-1, trampl-1, trampr-1,nada-1	;B=transit,C=climbrt,D=tramp1,E=tramp2,F=ladder
ability_jumper:
	lda bg_ram, x
	and #$80
	bne :+
	lda bg_ram, x
	asl a
	tay
	lda ability_jmp_tbl+1, y
	pha
	lda ability_jmp_tbl+0, y
	pha
:	rts

trampl:
	lda games+6
	and #$c0
	beq :+
	lda #$00
	sta set_move
	lda #$12
	sta p_anim_state
	jsr tramp_beep
	lda #<loop_hopl
	sta loop_pointer+0
	lda #>loop_hopl
	sta loop_pointer+1
:	rts
trampr:
	lda games+6
	and #$c0
	beq :+
	lda #$00
	sta set_move
	lda #$13
	sta p_anim_state
	jsr tramp_beep
	lda #<loop_hopr
	sta loop_pointer+0
	lda #>loop_hopr
	sta loop_pointer+1
:	rts
climbingr:
	lda games+14
	and #$c0
	beq :+
	lda #$00
	sta set_move
	ldx #$00
	lda climb_timer, x
	sta temp_8bit_2
	lda #$07
	sta p_anim_state
	jsr climb_player
	lda #<loop_climr
	sta loop_pointer+0
	lda #>loop_climr
	sta loop_pointer+1
:	rts
climbing:
	lda games+14
	and #$c0
	beq :+
	lda #$00
	sta set_move
	ldx #$00
	lda climb_timer, x
	sta temp_8bit_2
	lda #$06
	sta p_anim_state
	jsr climb_player
	lda #<loop_climb
	sta loop_pointer+0
	lda #>loop_climb
	sta loop_pointer+1
:	rts
go_home:
	lda games+2	; must have Baseball(Homer)
	and #$c0
	bne :+
		rts
:	jsr homer_beep
	lda #$06
	sta temp_8bit_2
	lda #$10
	sta temp_8bit_1
	lda save2001
	eor #$e0
	sta save2001
	lda #11
	sta map_y
	lda #03
	sta map_x
	lda #$00			; These two combined make the player
	sta temp_8bit_3		;  face "downward" in loop_fadeout
	lda #$05			;  so that they are facing the screen
	sta search_dir+0	;  when it turns back on.
	lda #$ba
	sta search_p_pos+0
	lda #<loop_fadeout
	sta loop_pointer+0
	lda #>loop_fadeout
	sta loop_pointer+1
	rts
flt_lt:
	lda games+1
	and #$c0
	beq :+
	lda #$04
	sta p_anim_state
	bne other_float_dir
nada:
:	rts
flt_rt:
	lda games+1
	and #$c0
	beq :-
	lda #$05
	sta p_anim_state
other_float_dir:
	lda #$ff
	sta set_move
	lda #$01
	sta p_move_count
	jsr balloon_player
	jsr float_beep
	lda #<loop_float
	sta loop_pointer+0
	lda #>loop_float
	sta loop_pointer+1
	rts
boat_up:
	lda games+19
	and #$c0
	beq :+
	lda #$0c
	sta p_anim_state
	lda #$10
	sta set_move
	jsr boat_beep
:	rts
boat_dn:
	lda games+19
	and #$c0
	beq :+
	lda #$0d
	sta p_anim_state
	lda #$20
	sta set_move
	jsr boat_beep
:	rts
boat_lt:
	lda games+19
	and #$c0
	beq :+
	lda #$0e
	sta p_anim_state
	lda #$40
	sta set_move
	jsr boat_beep
:	rts
boat_rt:
	lda games+19
	and #$c0
	beq :+
	lda #$0f
	sta p_anim_state
	lda #$80
	sta set_move
	jsr boat_beep
:	rts
boat_which:
	.byte $10,$20,$40,$80
loop_float:
	ldx set_move
	cpx #$03
	bne @still_float
		lda p_anim_state
		and #$0f
		cmp #$04
		bne :+
			lda #$02
			sta p_anim_state
			bne :++
:		lda #$03
		sta p_anim_state
:			lda #$00
			sta set_move
			sta p_move_count
			jsr get_pos
			jsr recolor_player
			lda #<loop_play
			sta loop_pointer+0
			lda #>loop_play
			sta loop_pointer+1
			jmp end_loop
@still_float:
	dec p_move_count
	bne :+
		inx
		stx set_move
		lda float_table, x
		sta p_move_count
:	lda p_topleft+0
	clc
	adc float_y, x
	sta p_topleft+0
	lda p_anim_state
	and #$0f
	cmp #$04
	bne :+
		lda p_topleft+3
		clc
		adc l_float_x, x
		sta p_topleft+3
		jmp :++
:	lda p_topleft+3
	clc
	adc r_float_x, x
	sta p_topleft+3
:

	jsr p_tie_sprites
	jmp end_loop
float_table:
	.byte $08,$30,$08
float_y:
	.byte $ff,$00,$01,$00
l_float_x:
	.byte $00,$ff,$00,$00
r_float_x:
	.byte $00,$01,$00,$00

;climb_y:
;	.byte $fd,$00,$00,$fd,$00,$00,$fd,$00,$00,$fd,$00,$00,$fd,$00,$00
;	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
;climb_x:
;	.byte $00,$00,$fd,$00,$00,$fd,$00,$00,$fd,$00,$00,$fd,$00,$00,$00
;	.byte $fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$00,$00,$00,$00,$00,$00
;climr_x:
;	.byte $00,$00,$03,$00,$00,$03,$00,$00,$03,$00,$00,$03,$00,$00,$00
;	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$00,$00,$00,$00,$00
climb_y:
	.byte $fc,$fc,$fc,$fc,$fc,$fc,$fb,$05,$06,$06
	.byte $fd,$00,$00,$fd,$00,$00,$fd,$00,$00,$fd,$00,$00,$fd,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $03,$03,$03,$03
climb_x:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$fd,$00,$00,$fd,$00,$00,$fd,$00,$00,$fd,$00,$00,$00
	.byte $fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00
climr_x:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$03,$00,$00,$03,$00,$00,$03,$00,$00,$03,$00,$00,$00
	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00
loop_hopr:
	ldx set_move
	cpx #44
	bne @still_climb
		lda #$03
		sta p_anim_state
		lda #$00
		sta set_move
		sta p_move_count
		jsr get_pos
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
		jmp end_loop
@still_climb:
	lda p_topleft+0
	clc
	adc climb_y, x
	sta p_topleft+0
	lda p_topleft+3
	clc
	adc climr_x, x
	sta p_topleft+3
	inx
	stx set_move
	jsr p_tie_sprites
	jmp end_loop
loop_hopl:
	ldx set_move
	cpx #44
	bne @still_climb
		lda #$02
		sta p_anim_state
		lda #$00
		sta set_move
		sta p_move_count
		jsr get_pos
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
		jmp end_loop
@still_climb:
	lda p_topleft+0
	clc
	adc climb_y, x
	sta p_topleft+0
	lda p_topleft+3
	clc
	adc climb_x, x
	sta p_topleft+3
	inx
	stx set_move
	jsr p_tie_sprites
	jmp end_loop



climbl_y:
.byte $00,$fc,$fc,$04,$04,$00
climbl_x:
.byte $00,$fc,$fc,$ec,$fc,$fa
climbl_anim:
.byte $06,$06,$06,$07,$07,$02
climb_timer:
.byte $01,$20,$20,$20,$20,$01
climbr_x:
.byte $00,$04,$04,$14,$04,$f9
climbr_anim:
.byte $07,$07,$07,$06,$06,$03
loop_climr:
	ldx set_move
	cpx #$06
	bne @still_climb
		lda #$03
		sta p_anim_state
		lda #$00
		sta set_move
		sta temp_8bit_2
		sta p_move_count
		jsr get_pos
		jsr recolor_player
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
		jmp end_loop
@still_climb:
	dec temp_8bit_2
	bne :++
		ldx set_move
		inx
		stx set_move
		lda climb_timer, x
		sta temp_8bit_2
		lda p_topleft+0
		clc
		adc climbl_y, x
		sta p_topleft+0
		lda p_topleft+3
		clc
		adc climbr_x, x
		sta p_topleft+3
		cpx #$05
		bcs :+
		jsr climb_beep
:		ldx set_move
		lda climbr_anim, x
		sta p_anim_state
		jsr p_anim
		jsr p_tie_sprites
:	jmp end_loop
loop_climb:
	ldx set_move
	cpx #$06
	bne @still_climb
		lda #$02
		sta p_anim_state
		lda #$00
		sta set_move
		sta temp_8bit_2
		sta p_move_count
		jsr get_pos
		jsr recolor_player
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
		jmp end_loop
@still_climb:
	dec temp_8bit_2
	bne :++
		ldx set_move
		inx
		stx set_move
		lda climb_timer, x
		sta temp_8bit_2
		lda p_topleft+0
		clc
		adc climbl_y, x
		sta p_topleft+0
		lda p_topleft+3
		clc
		adc climbl_x, x
		sta p_topleft+3
		cpx #$05
		bcs :+
		jsr climb_beep
:		ldx set_move
		lda climbl_anim, x
		sta p_anim_state
		jsr p_anim
		jsr p_tie_sprites
:	jmp end_loop





ramping_table:
	.byte $02,$04,$21,$21
ramping_left:
	.byte $02,$03,$01,$01,$00
ramping_y:
	.byte $00,$00,$ff,$01,$00
ramping_right:
	.byte $fe,$fd,$ff,$ff,$00
loop_bike_leap:
	ldx temp_8bit_2
	cpx #$04
	bne :+++
		lda p_anim_state
		and #$0f
		bne :+
			lda #$0b
			sta p_anim_state
			bne :++
:		lda #$0a
		sta p_anim_state
:;		lda p_topleft+0
;		clc
;		adc #$02
;		sta p_topleft+0
		jsr get_pos
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
;		jsr p_tie_sprites
		jmp end_loop
:
	dec temp_8bit_1
	bne :+
		inx
		stx temp_8bit_2
		lda ramping_table, x
		sta temp_8bit_1
:
	lda p_topleft+0
	clc
	adc ramping_y, x
	sta p_topleft+0

	lda p_anim_state
	and #$0f
	bne @ramp_rgt
		lda p_topleft+3
		clc
		adc ramping_left, x
		sta p_topleft+3
		jmp :+
@ramp_rgt:
	lda p_topleft+3
	clc
	adc ramping_right, x
	sta p_topleft+3

:	jsr p_tie_sprites
	jmp end_loop





npc_not_search:
	ldx npc_offset
	stx bg_ram_store
	lda bg_ram, x
	and #$7f
	sta npc_offset
	cmp #$22
	bcc :+
		sec
		sbc #$22
		sta npc_offset_offset
		lda #15
		sta bank_prg
		jsr bank_save
		jmp :++
:	sta npc_offset_offset
	lda #13
	sta bank_prg
	jsr bank_save
:	jsr get_npc_addresses
	lda #$00
	sta temp_8bit_1
	sta temp_8bit_2
	sta temp_8bit_3
	sta temp_8bit_4
	lda #<loop_empty
	sta loop_pointer+0
	lda #>loop_empty
	sta loop_pointer+1
	lda #<nmi_print_name
	sta nmi_pointer+0
	lda #>nmi_print_name
	sta nmi_pointer+1
	jmp end_loop

get_npc_addresses:
	lda games+23
	and #$c0
	bne :+
		lda npc_offset
		cmp #$01
		beq :+
			lda #13
			sta bank_prg
			jsr bank_save
			ldx #$00
			stx npc_offset
			stx npc_offset_offset
			jsr npc_less_20
			jmp :++
:	
	ldx npc_offset_offset
:	lda npc_offset
	cmp #$22
	bcc :+
		jsr npc_20
		jmp :++
:	jsr npc_less_20
:	rts


npc_20:
	lda npc_words20_lo_lo, x
	sta temp_16bit_1+0
	lda npc_words20_lo_hi, x
	sta temp_16bit_1+1
	lda npc_words20_hi_lo, x
	sta temp_16bit_2+0
	lda npc_words20_hi_hi, x
	sta temp_16bit_2+1
	lda npc_name20_lo, x
	sta temp_16bit_3+0
	lda npc_name20_hi, x
	sta temp_16bit_3+1

	ldx npc_offset
	lda npc_dialogs, x
	and #$0f
	tay
	lda (temp_16bit_1), y
	sta temp_16bit_4+0
	lda (temp_16bit_2), y
	sta temp_16bit_4+1
	rts
npc_less_20:
	lda npc_words_lo_lo, x
	sta temp_16bit_1+0
	lda npc_words_lo_hi, x
	sta temp_16bit_1+1
	lda npc_words_hi_lo, x
	sta temp_16bit_2+0
	lda npc_words_hi_hi, x
	sta temp_16bit_2+1
	lda npc_name_lo, x
	sta temp_16bit_3+0
	lda npc_name_hi, x
	sta temp_16bit_3+1
	cpx #$00
	bne :+
		ldy #$00
		beq :++
:
	ldx npc_offset
	lda npc_dialogs, x
	and #$0f
	tay
:	lda (temp_16bit_1), y
	sta temp_16bit_4+0
	lda (temp_16bit_2), y
	sta temp_16bit_4+1
	rts


loop_menu_wait:
;	ldy #23
;	jsr bankswitch
	lda #25
	sta bank_prg
	jsr bank_save

	jsr goal_testing

	lda #$00
	sta temp_8bit_1
	lda #<loop_empty
	sta loop_pointer+0
	lda #>loop_empty
	sta loop_pointer+1
	lda #<nmi_clear_for_menu
	sta nmi_pointer+0
	lda #>nmi_clear_for_menu
	sta nmi_pointer+1
	jmp end_loop


set_pos:
	lda p_pos
	and #$f0
	sec
	sbc #$01
	sta p_topleft+0
	lda p_pos
	and #$0f
	clc
	rol
	rol
	rol
	rol
	sta p_topleft+3
	rts

get_pos:
	lda p_topleft+0
	clc
	adc #$01
	and #$f0
	sta temp_8bit_1
	lda p_topleft+3
	ror
	ror
	ror
	ror
	and #$0f
	clc
	adc temp_8bit_1
	sta p_pos
	rts

loop_scroll_lo:
	.byte <loop_scrollup,<loop_scrolldown,<loop_scrollleft,<loop_scrollright
loop_scroll_hi:
	.byte >loop_scrollup,>loop_scrolldown,>loop_scrollleft,>loop_scrollright
clear_500:
	ldx #$00
	txa
:	sta $500, x
	inx
	cpx #22
	bne :-
	rts
loop_scrollup:
	jsr clear_500
	lda p_topleft+0
	cmp #$cf
	beq :+
		clc
		adc #$10
		sta p_topleft+0
:	
	lda scroll_y
	sec
	sbc #$10
	sta scroll_y
	bne :+
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
:
	jsr p_tie_sprites
	jmp end_loop
loop_scrolldown:
	lda p_topleft+0
	cmp #$0f
	beq :+
		sec
		sbc #$10
		sta p_topleft+0
:	
	lda scroll_y
	clc
	adc #$10
	sta scroll_y
	cmp #$e0
	bne :+
		lda #$00
		sta scroll_y
		lda attr_hi
		sec
		sbc #$03
		sta nametable
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
:
	jsr p_tie_sprites
	jmp end_loop
loop_scrollleft:
		lda attr_hi
		sec
		sbc #$03
		sta nametable
	lda p_topleft+3
	cmp #$e0
	beq :+
		clc
		adc #$10
		sta p_topleft+3
:	
	lda scroll_x
	sec
	sbc #$10
	sta scroll_x
	bne :+
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
:
	jsr p_tie_sprites
	jmp end_loop
loop_scrollright:
	lda p_topleft+3
	cmp #$10
	beq :+
		sec
		sbc #$10
		sta p_topleft+3
:	
	lda scroll_x
	clc
	adc #$10
	sta scroll_x
	bne :+
		lda attr_hi
		sec
		sbc #$03
		sta nametable
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
:
	jsr p_tie_sprites
	jmp end_loop


save_palettes:
	ldx #$00
:	lda pal_address+0, x
	sta pal_save+0, x
	inx
	cpx #$20
	bne :-
	rts
restore_palettes:
	ldx #$00
:	lda pal_save+0, x
	sta pal_address+0, x
	inx
	cpx #$20
	bne :-
	rts

loop_load32s:

	ldx temp_8bit_1
	inx
	stx temp_8bit_1
	cpx #64
	beq :+
		jmp @extras_done
:
		lda dialog_type
		beq :++
			cmp #$03
			beq :+
			lda #$00
			sta dialog_type
			jsr dialog_replace_sprites
			jmp @skip_extras
:		lda #$00
		sta dialog_type
		jsr restore_palettes
		jmp @skip_extras
		
:


		ldy #$00
		lda (bank_addy), y
		tay
		jsr bankswitch
		txa
		tay
		ldx #$00
:		lda (temp_16bit_1), y
		sta npc1, x
		iny
		inx
		cpx #$09
		bne :-

		ldx #$00
:		lda (temp_16bit_1), y
		sta search_pos, x
		iny
		lda (temp_16bit_1), y
		sta search_dir, x
		iny
		lda (temp_16bit_1), y
		sta search_lo, x
		iny
		lda (temp_16bit_1), y
		sta search_hi, x
		iny
		lda (temp_16bit_1), y
		sta search_p_pos, x
		iny
		inx
		cpx #$05
		bne :-
		iny
		lda (temp_16bit_1), y
		sta pal_animation
		dey


		lda (temp_16bit_1), y
		tax
		lda spr_palettes_lo, x			; here temp_16bit_1 changes from
		sta temp_16bit_1+0				;  room data to palette data
		lda spr_palettes_hi, x
		sta temp_16bit_1+1
		ldy #$00
:		lda (temp_16bit_1), y
		sta pal_address+0, y
		iny
		cpy #$20
		bne :-

		lda bike_move
		beq :+
			jsr bike_player
:

		lda map_y
		bne :+
			lda map_x
			cmp #$0e
			bne :+
				lda dain_all
				beq :+
					lda #$66
					sta npc_pos
:
		ldy #$00
		ldx #$00
:		lda npc_which, x
		and #$0f
		sta npc_anim_state, x
		lda npc_pos, x
		and #$f0
		sec
		sbc #$01
		sta npc_topleft+0, y
		lda npc_pos, x
		and #$0f
		rol
		rol
		rol
		rol
		clc
		and #$f0
		sta npc_topleft+3, y
		tya
		clc
		adc #$08
		tay
		inx
		cpx #$03
		bne :-
		ldx #$00
@do_another_npc:
		lda npc1, x
		beq @next_npc
			cmp #$01
			bne :+
				lda games+27
				and #$c0
				bne :+
					lda map_y
					beq :+
					lda #$00
					sta npc1
					sta npc_pos
					sta npc_which
					lda #$ef
					sta npc_topleft+0
					bne @next_npc
:			ldy npc_pos, x
			lda npc1, x
			clc
			adc #$80
			sta bg_ram, y
@next_npc:
		inx
		cpx #$03
		bne @do_another_npc
			lda #$ef
			sta npc_move_counter+0
			sta npc_move_counter+1
			sta npc_move_counter+2
			lda #$00
			sta npc_do_move+0
			sta npc_do_move+1
			sta npc_do_move+2
	ldx #$00
:	lda #$ef
	sta cursor+0, x
	lda #$11
	sta cursor+1, x
	inx
	inx
	inx
	inx
	cpx #$20
	bne :-
		lda music_current
		cmp music_tester
		beq :+
			lda #11
			sta bank_prg
			jsr bank_save
			lda music_tester
			sta music_current
			jsr music_loadsong
:
@skip_extras:
		lda scrn_change_type
		beq @just_go_play
			lda #$00
			sta scrn_change_type
;			lda p_anim_state
;			and #$0f
;			cmp #$0c
;			bcc :+
;				sec
;				sbc #$0c
;				jmp :++
;:			cmp #$08
;			bcc :+
;				sec
;				sbc #$08
;:

			lda which_scroll_dir
			tax
			bne :+
				lda #$e0
				sta scroll_y
				lda attr_hi
				sec
				sbc #$03
				sta nametable
:			lda loop_scroll_lo, x
			sta loop_pointer+0
			lda loop_scroll_hi, x
			sta loop_pointer+1
			lda #<nmi_empty
			sta nmi_pointer+0
			lda #>nmi_empty
			sta nmi_pointer+1
			jmp end_loop
@just_go_play:
	lda #<loop_play
	sta loop_pointer+0
	lda #>loop_play
	sta loop_pointer+1
	lda #<nmi_empty
	sta nmi_pointer+0
	lda #>nmi_empty
	sta nmi_pointer+1
	jmp end_loop
@extras_done:
	ldy #$00
	lda (bank_addy), y
	and #$60
	sta bank_chr
	lda (bank_addy), y
	and #$1f
	sta bank_prg
	lda (bank_addy), y
	tay
;	jsr bankswitch
	jsr bank_save
	jmp $8000
return_unpack:
	lda #$01
	sta bank_prg
;	clc
;	adc bank_chr
;	tay
;	jsr bankswitch
	jsr bank_save
	jmp end_loop

leave_dialog:
;	lda #$01
;	clc
;	adc bank_chr
;	tay
;	jsr bankswitch
	lda #$01
	sta bank_prg
	jsr bank_save
	jsr get_bank
	jsr map_coords
	lda #<loop_load32s
	sta loop_pointer+0
	lda #>loop_load32s
	sta loop_pointer+1
	lda #<nmi_load32s
	sta nmi_pointer+0
	lda #>nmi_load32s
	sta nmi_pointer+1
	jmp loop_load32s

loop_fadeout:
	dec temp_8bit_1
	beq :+
		jmp end_loop
:		dec temp_8bit_2
		bne @not_finished
			lda #$00
			sta bike_move
			ldx temp_8bit_3
			lda search_dir, x
			and #$0f
			sec
			sbc #$04
			sta p_anim_state
			lda search_p_pos, x
			sta p_pos
			lda map_x
			cmp #$01
			bne :++
				lda map_y
				cmp #$07
				bne :++
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
;					ldy #29
;					jsr bankswitch
					lda #29
					sta bank_prg
					lda #$00
					sta bank_chr
					jsr bank_save
					jsr nes_beep
					jmp fill_nes
:			jsr set_pos
			jsr p_tie_sprites
			jsr setup_20s
			lda #<loop_load32s
			sta loop_pointer+0
			lda #>loop_load32s
			sta loop_pointer+1
			lda #<nmi_load32s
			sta nmi_pointer+0
			lda #>nmi_load32s
			sta nmi_pointer+1
			jmp loop_load32s
@not_finished:
		lda #$10
		sta temp_8bit_1
	ldx #$00
:	lda pal_address, x
	sec
	sbc #$10
	bpl :+
		lda #$0f
:		sta pal_address, x
	inx
	cpx #$20
	bne :--
	jsr screen_remove_sprites
	jmp end_loop

menu_rtn_thingy:
;	lda $6f0
;	sta p_topleft
;	lda $6f1
;	sta p_topright
	jsr dialog_replace_sprites
nes_rtn_thingy:
	jsr setup_20s
	lda #<loop_load32s
	sta loop_pointer+0
	lda #>loop_load32s
	sta loop_pointer+1
	lda #<nmi_load32s
	sta nmi_pointer+0
	lda #>nmi_load32s
	sta nmi_pointer+1
	jmp loop_load32s

setup_20s:
	lda #$20
	sta nametable
	sta ppu_addy+1
	clc
	adc #$03
	sta attr_hi
	lda #$c0
	sta attr_lo
;	ldy #$01
;	jsr bankswitch
	lda #$01
	sta bank_prg
	jsr bank_save
	jsr get_bank
	jsr get_music
	jsr map_coords
	lda #$ff
	sta temp_8bit_1
	lda #$00
	sta temp_8bit_2
	sta ppu_addy+0
	rts

back_from_nes:
	lda #00
	sta bank_prg
	lda #$00
	sta bank_chr
	jsr bank_save
	lda #<play_chr				;  CHRs are in banks 7, 8 and 9. Only bank
	sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
	lda #>play_chr				;  correct address for them all
	sta temp_16bit_1+1			;
 	ldy #$00					; Get Y ready while also setting up where
	sty $2006					;  to begin storage of the CHR in its RAM
	sty $2006					;
	ldx #$10					; Need to loop 32 times
@keep_loading:					;
	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne @keep_loading			;
		inc temp_16bit_1+1		;
		dex						;
		bne @keep_loading		;
		lda #$64
		sta p_pos
		jsr set_pos
	lda #%10100000
	sta $2000
	sta save2000
	lda #%00011110
	sta $2001
	sta save2001
	jmp nes_rtn_thingy

nmi_load32s:
	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	sta $2006
	lda store_meta16+0
	sta $2007
	lda store_meta16+1
	sta $2007
	lda store_meta16+2
	sta $2007
	lda store_meta16+3
	sta $2007

	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	clc
	adc #$20
	sta $2006
	lda store_meta16+4
	sta $2007
	lda store_meta16+5
	sta $2007
	lda store_meta16+6
	sta $2007
	lda store_meta16+7
	sta $2007

	lda temp_8bit_1
	cmp #56
	bcs :+

	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	clc
	adc #$40
	sta $2006
	lda store_meta16+8
	sta $2007
	lda store_meta16+9
	sta $2007
	lda store_meta16+10
	sta $2007
	lda store_meta16+11
	sta $2007

	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	clc
	adc #$60
	sta $2006
	lda store_meta16+12
	sta $2007
	lda store_meta16+13
	sta $2007
	lda store_meta16+14
	sta $2007
	lda store_meta16+15
	sta $2007
:
	lda attr_hi
	sta $2006
	lda attr_lo
	sta $2006
	lda store_meta16+16
	sta $2007
	inc attr_lo

		lda ppu_addy+0
		clc
		adc #$04
		sta ppu_addy+0
		cmp #$a0
		bne :++
			inc ppu_addy+1
:			lda ppu_addy+0
			clc
			adc #$60
			sta ppu_addy+0
			jmp :++
:		cmp #$20
		beq :--
:
	lda save2001
	and #%00011111
	sta save2001
	jmp end_nmi


.include "i\bankFixed\challenge_anim.asm"
;.include "i\bankFixed\chall_dialog_end.asm"

;pal_play:
;.byte $0f,$0f,$0f,$0f, $0f,$0f,$0f,$0f, $0f,$0f,$0f,$0f, $0f,$0f,$0f,$0f
;.byte $0f,$37,$1c,$17

cursor_spr:
	.byte $ef,$1f,$00,$ef
	.byte $ef,$1d,$20,$ef
	.byte $ef,$1d,$20,$ef
	.byte $ef,$1d,$20,$ef
	.byte $ef,$1d,$20,$ef
	.byte $ef,$1d,$20,$ef
	.byte $ef,$1d,$20,$ef
	.byte $ef,$1d,$20,$ef



do_random_set:
	ldx #$00
:	lda seed, x
	beq @do_eor
	clc
	asl
	beq @no_eor    ;if the input was $80, skip the EOR
	bcc @no_eor
@do_eor:
	eor #$1d
@no_eor:
	sta seed, x
	inx
	cpx #$04
	bne :-
	rts
dialog_replace_sprites:
	ldx #$00
:	lda p_topleft_save, x
	sta p_topleft, x
	lda #$ef
	sta p_topleft_save, x
	inx
	inx
	inx
	inx
	cpx #$20
	bne :-
	rts
menu_remove_sprites:
	ldx #$00
:	lda p_topleft, x
	sta p_topleft_save, x
	lda #$ef
	sta p_topleft, x
	inx
	inx
	inx
	inx
	cpx #$20
	bne :-
	rts
screen_remove_sprites:
;	ldx #$00
;:	lda #$ef
;	sta npc_topleft, x
;	sta p_topleft_save+8, x
;	inx
;	cpx #24
;	bne :-
	ldx #$00
:	lda #$ef
	sta npc_topleft, x
	sta p_topleft_save+8, x
	lda #$11
	sta npc_topleft+1, x
	sta p_topleft_save+9, x
	inx
	inx
	inx
	inx
	cpx #24
	bne :-

	rts
clear_npc_data:
	ldx #$00
	txa
:	sta npc1_anim_addy+0, x
	inx
	cpx #$20
	bne :-
	rts
npc_tie_sprites:
	ldx #$00
	ldy #$00
:	lda npc1, x
	beq :+
		lda npc_topleft+0, y
		sta npc_topright+0, y
		lda npc_topleft+3, y
		clc
		adc #$08
		sta npc_topright+3, y
:	tya
	clc
	adc #$08
	tay
	inx
	cpx #$03
	bne :--
	rts

set_battle:
	pla
	sta bank_prg
	jsr bank_save

;	lda bank_prg
;	pha
	lda #24
	sta bank_prg
	jsr bank_save

	jmp battle_load
rtn_battle_load:

	lda #20
	sta bank_prg
	jsr bank_save


	jmp battle_load_cont
rtn_battle_load_cont:

	lda #$10
	sta temp_8bit_1
		lda #$01
		sta cursor+6
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save

				lda goal_offset
				cmp #$f3
				bne :+
					lda boss_offset
					cmp #$07
					beq :+
					lda #$00
					sta p_qdr_used
					sta e_percent_block
					lda #$80
					sta nmi_num
						lda #39
						jsr music_loadsong
						ldx enemy_choice
						lda #$01
						sta enemy_clue, x
						jmp :+++++
:

				lda boss_switch
				beq :++
					cmp #shadow
					bne :+
						lda #$26
						jsr music_loadsong
						jmp :++++
:					lda #$1d			; boss tune
					jsr music_loadsong
					jmp :+++
:				lda games+31
				and #$c0
				beq :+
					lda #$0f
					jsr music_loadsong
					jmp :++
:				lda #$07				; reg battle tune
				jsr music_loadsong
:				pla
				sta bank_prg
				jsr bank_save
		lda #$40
		sta p_com_tlx
		lda #$60
		sta p_com_tly
		lda #<set_battle2
		sta loop_pointer+0
		lda #>set_battle2
		sta loop_pointer+1
		lda #<nmi_btl_arrows
		sta nmi_pointer+0
		lda #>nmi_btl_arrows
		sta nmi_pointer+1

set_battle2:
	jsr do_random_set


		lda p_anim_state
		cmp #$0b
		bne u_not_escaping
			lda p_anim_count
			cmp #$01
			bne u_not_escaping
			ldy #$ff
:			iny
			lda nmi_num
			cmp enemy_att_table, y
			bcc :-
				lda pp_have
				beq dont_have_pp
					lda e_block_50, y
					beq u_not_escaping
						lda #$00
						sta e_num_manuals
						lda bank_prg
						pha
						lda #11
						sta bank_prg
						jsr bank_save
						lda #$0d
						jsr music_loadsong
						pla
						sta bank_prg
						jsr bank_save
						jmp leaving_btl_area
dont_have_pp:
				lda e_block_40, y
				beq u_not_escaping
					lda #$00
					sta e_num_manuals
						lda bank_prg
						pha
						lda #11
						sta bank_prg
						jsr bank_save
						lda #$0d
						jsr music_loadsong
						pla
						sta bank_prg
						jsr bank_save
					jmp leaving_btl_area
u_not_escaping:


	ldx enemy_choice
	lda enemy_clue, x
	beq :+
		lda #$1f
		sta clu1+0
:

	lda p_qdr_used
	bne :+++
	lda games+28
	and #$c0
	beq :+++
		lda #$01
		sta p_qdr_used
		lda nmi_num
		cmp #$80
		bcc :+
			lda #$01
			sta p_anim_state
			bne :++
:
		lda #$00
		sta p_anim_state
:		lda #$00
		sta p_anim_count
		jsr p_battle_anim
:

	lda enemy_cluster
	cmp #$01
	bne :+
		jmp enemy_done
:
	lda p_anim_state
	cmp #$0d
	bne :+
		jmp enemy_done
:
	lda e_att_counter
	cmp #$ff
	beq :+
		jmp e_is_attacking
:	lda e_att_counter2
	cmp #$ff
	beq :+
		jmp e_is_attacking
:
	lda e_stamina_bar+7
	bne :+++
;		lda e_stam_tick
;		bne :+++
			
	lda p_anim_state
	cmp #$01
	bcs :+
		jmp :++++
:	cmp #$05
	bcc :+
		jmp :+++
:	jmp enemy_done

:	dec e_stam_tick
	bne not_zero_stam
		lda e_stamina_bar+7
		bne not_new_move
:				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$46
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
			ldy #$ff
:			iny
			lda seed3
			cmp enemy_att_table, y
			bcc :-
				cpy #$00
				bne :+
					iny
					iny
					jmp :++
:				cpy #$01
				bne :+
					iny
:				sty enemy_cluster
				jsr e_battle_anim
				jmp not_zero_stam
not_new_move:
		ldx #$00
:		lda e_stamina_bar+0, x
		beq :+
			lda #$00
			sta e_stamina_bar+0, x
			lda e_stam_tick_perm
			sta e_stam_tick
			bne not_zero_stam
:		inx
		cpx #$08
		bne :--
not_zero_stam:
	jmp e_not_attacking
e_is_attacking:
	lda e_att_counter
	beq :+
		dec e_att_counter
		beq :+
			jmp e_not_attacking
:	lda e_att_counter2
	beq finish_attack
		dec e_att_counter2
		lda e_att_next_which
		and #$0f
		cmp #$01
		bne :+
			lda e_att_next_x
			sta e_com_tlx
			lda #$ef
			sta cur_behind6+0
			jmp e_not_attacking
:		cmp #$02
		bne :+
			lda e_att_next_x
			sta e_att1+3
			lda e_att_next_y
			sta e_att1+0
			lda #$ef
			sta cur_behind6+0
			jmp e_not_attacking
:
finish_attack:
	lda e_att_next_which
	and #$f0
	cmp #$80
	bne :++
		lda p_anim_state
		cmp #$06
		beq :+
			jmp @more_damage
:				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$49
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
			jmp @not_damaged
:	cmp #$40
	bne :++
		lda p_anim_state
		cmp #$07
		beq :+
			jmp @more_damage
:				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$49
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
			jmp @not_damaged
:	cmp #$20
	bne :++++
		lda e_att_next_which
		cmp #$21
		bne :+
			lda e_com_tlx
			cmp #$24
			beq :++
				jmp :+++
:		lda e_att1+0
		cmp #$78
		bcc :++
			lda e_att1+3
			cmp #$40
			bcs :++
:				lda uf_have
				beq :+
					jmp @not_damaged
:
		lda p_anim_state
		cmp #$05
		bne @more_damage
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$49
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
			jmp @not_damaged
:	cmp #$10
	bne @skip_this
		lda p_anim_state
		cmp #$08
		bne @more_damage
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$49
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
			jmp @not_damaged
@skip_this:
@more_damage:
	lda e_att_damage
	cmp #$0f
	bne :+
		jsr subtract_manual
		lda #$01
		sta e_att_damage
		bne @next_test
:
	ldx #$09
:	lda h0, x
	beq @doesnt
		cmp #$0b
		bcs @doesnt
			lda h0, x
			cmp #$0a
			bne :+
				lda #$0c
				sta h0, x
				bne @next_test
:			lda #$0b
			sta h0, x
			bne @next_test
@doesnt:
	dex
	bpl :--
@next_test:
	dec e_att_damage
	bne @more_damage
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$47
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	lda h0+0
	cmp #$0b
	bcc :+
		lda #$0d
		sta p_anim_state
		lda #$00
		sta p_anim_count
		jsr p_battle_anim
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$48
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
:

	lda #$01
	sta shake_offset
@not_damaged:

	lda #$08
	sec
	sbc	e_stam_perm
	sta temp_8bit_2
	ldx #$07				; <<<<<------ changed from 8
:	lda #$0d
	sta e_stamina_bar, x
	dex
	cpx temp_8bit_2
	bpl :-
	lda #$00
	sta enemy_cluster
	jsr e_battle_anim
			lda e_stam_tick_perm
			sta e_stam_tick
	lda #$60
	sta e_com_tly
	lda #$a8
	sta e_com_tlx
	lda #$ef
	sta e_att1+0

e_not_attacking:

enemy_done:

	ldx shake_offset
	beq :+
		lda scroll_x
		clc
		adc shake_table, x
		sta scroll_x
		inx
		stx shake_offset
		cpx #15
		bne :+
			ldx #$00
			stx shake_offset
:


	lda p_anim_state
	beq @doing_move
		lda p_anim_state
		cmp #$0d
		bne :+++
			lda p_anim_count
			cmp #$01
			bne :+++
				lda games+10
				and #$c0
				beq :+
					lda p_mul_used
					beq :++
:						jsr all_sprites_gone
						jsr nmi_wait
						lda #$68
						sta cursor+0
						lda #$70
						sta cursor+3
						lda #$1d
						sta cursor+1
						lda #<loop_dead
						sta loop_pointer+0
						lda #>loop_dead
						sta loop_pointer+1
						lda #<nmi_dead
						sta nmi_pointer+0
						lda #>nmi_dead
						sta nmi_pointer+1
						jmp loop_dead
:					lda #$01
					sta p_mul_used
					jsr fill_hp_stam_combat
					lda #$00
					sta p_anim_count
					sta p_anim_state
					jsr p_battle_anim
					jmp @not_zero

:		jmp done_btl_slct
@doing_move:

	lda control_pad
	and #b_punch
	beq @no_b
		jsr do_random_set
		lda #$01
		sta battle_active
		jsr att_letter_tests
		jmp @not_zero
@no_b:
	lda control_pad
	and #a_punch
	beq @no_a
		jsr do_random_set
		lda #$02
		sta battle_active
		jsr spe_letter_tests
		jmp @not_zero
@no_a:
	lda #$00
	sta battle_active
	jsr def_letter_tests
@not_zero:

	dec temp_8bit_1
	bne :+
		jsr flash_which_icon
:
	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq @no_up
		jsr btl_pushed_up
		lda battle_active
		bne :+
			lda games+4
			and #$c0
			beq @no_up
			lda #$05
			sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
			jsr hold_def
			jmp done_btl_slct
:		lda enemy_cluster
		cmp #$02
		bcs @no_up
		lda battle_active
		cmp #$01
		bne :+
			lda games+17
			and #$c0
			beq @no_up
			lda #$04
			sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
			jsr hold_off
			jmp done_btl_slct
:		lda games+20
		and #$c0
		beq @no_up
		lda p_str_used
		bne @no_up
		lda #$09
		sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
		jsr hold_spe
		lda #$50
		sta p_stam_ticker
		jmp done_btl_slct
@no_up:
	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq @no_down
		jsr btl_pushed_dn
		lda battle_active
		bne :+
			lda games+0
			and #$c0
			beq @no_down
			lda #$06
			sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
			jsr hold_def
			jmp done_btl_slct
:		lda enemy_cluster
		cmp #$02
		bcs @no_down
		lda battle_active
		cmp #$01
		bne :+
			lda games+13
			and #$c0
			beq @no_down
			lda #$02
			sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
			jsr hold_off
			jmp done_btl_slct
:		lda games+16
		and #$c0
		beq @no_down
		lda p_adr_used
		bne @no_down
		lda #$0a
		sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
		jsr hold_spe
		jmp done_btl_slct
@no_down:
	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq @no_left
		jsr btl_pushed_lt
		lda battle_active
		bne :+
			lda games+15
			and #$c0
			beq @no_left
			lda #$08
			sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
			jsr hold_def
			jmp done_btl_slct
:		lda enemy_cluster
		cmp #$02
		bcs @no_left
		lda battle_active
		cmp #$01
		bne :+
			lda games+24
			and #$c0
			beq @no_left
			lda #$03
			sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
			jsr hold_off
			jmp done_btl_slct
:		lda boss_offset
		beq :+
			bne @no_left
:		lda games+8
		and #$c0
		beq @no_left
		lda #$0b
		sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
		jsr hold_spe
		jmp done_btl_slct
@no_left:
	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq @no_right
		jsr btl_pushed_rt
		lda battle_active
		bne :+
			lda games+18
			and #$c0
			beq @no_right
			lda #$07
			sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
			jsr hold_def
			jmp done_btl_slct
:		lda enemy_cluster
		cmp #$02
		bcs @no_right
		lda battle_active
		cmp #$01
		bne :+
			lda games+26
			and #$c0
			beq @no_right
			lda #$01
			sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
			jsr hold_off
			jmp done_btl_slct
:		lda games+3
		and #$c0
		beq @no_right
		lda p_clu_used
		bne @no_right
		lda #$0c
		sta p_anim_state
			jsr p_battle_anim
			jsr enough_stam_test
		jsr hold_spe
		jmp done_btl_slct
@no_right:

done_btl_slct:


	lda p_anim_state
	bne :+
		jmp done_player_stuff
:
	lda p_anim_count_other
	beq :+
		dec p_anim_count_other
		jmp done_player_stuff
:
	lda p_next_which
	cmp #$01
	bne :+
					jsr which_e_block_test
		lda p_next_x
		sta p_com_tlx
		bne :++
:	cmp #$02
	bne :+
					jsr which_e_block_test
		lda p_next_x
		sta p_att1+3
:	lda p_anim_count
	beq :+

		dec p_anim_count
		jmp done_player_stuff
:

	lda p_damage_done
	bne :+
		jmp player_done_stuff
:	lda goal_offset
	cmp #$f3
	bne :+
;		lda boss_offset
;		cmp #$07
;		beq :+
			lda #$0a
			sta p_damage_done
:

	lda boss_offset
	cmp #$07
	bne :+
		lda #$01
		sta p_damage_done
;		lda goal_offset
;		cmp #$f3
;		bne :++
;			lda #$0a
;			sta p_damage_done
		bne :++
:

	lda pg_have
	beq :+
		inc p_damage_done
:
	ldx #$00
go_back_to_it:
	lda enemy_cluster
	cmp #$01
	beq enemy_done_block

	lda e_health_bar, x
	beq do_more_of_them
		cmp #$0b
		bcs do_more_of_them
			cmp #$09
			bne :+
				lda #$0b
				sta e_health_bar, x
				jmp check_done
:			lda #$0c
			sta e_health_bar, x
			jmp check_done
do_more_of_them:
	cpx #$0a
	bne :+
		lda #$01
		sta p_damage_done
		jmp :++
:	inx
	bne go_back_to_it
check_done:

	lda #$01
	sta e_shake_offset
	inx
:	dec p_damage_done
	lda p_damage_done
	bne go_back_to_it
				lda #$00
				sta e_block_test
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$47
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
;	lda p_str_used
;	beq :+
;		lda #$50
;		bne :++
;:	lda #$78
;:	sta p_stam_ticker
	bne player_done_stuff

enemy_done_block:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$4b
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	lda #$00
	sta enemy_cluster
	sta e_block_test
	jsr e_battle_anim
;	lda p_str_used
;	beq :+
;		lda #$50
;		bne :++
;:	lda #$78
;:	sta p_stam_ticker

player_done_stuff:
	lda #$00
	sta p_anim_state
	jsr p_battle_anim
	lda #$ef
	sta cursor+4

done_player_stuff:

	lda control_pad
	and #$f0
	bne :+
	lda #$ef
	sta cursor+4
:

	lda e_health_bar+9
	cmp #$0b
	bcc e_not_yet_dead
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				jsr music_stopsfx
				lda #$0b
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
leaving_btl_area:
			jsr btl_win
			lda #<loop_btl_man_add
			sta loop_pointer+0
			lda #>loop_btl_man_add
			sta loop_pointer+1
			lda #<nmi_btl_man_add
			sta nmi_pointer+0
			lda #>nmi_btl_man_add
			sta nmi_pointer+1
			jmp loop_btl_man_add
e_not_yet_dead:
	ldx e_shake_offset
	beq :+
		lda e_com_tlx
		clc
		adc shake_table, x
		sta e_com_tlx
		inx
		stx e_shake_offset
		cpx #15
		bne :+
			ldx #$00
			stx e_shake_offset
:

	jsr stamina_replenish


	jsr tie_battle_sprites
	jsr flicker_em

	lda goal_offset
	cmp #$f3
	bne :+
		lda boss_offset
		cmp #$07
		beq :+
			lda #$06
			sta pal_animation
			jsr palette_animate
:
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq @no_select
		lda ls_have
		beq @no_start
			lda ls_have
			eor #$80
			sta ls_have
			and #$80
			beq :+
				lda #$00
				sta pal_address+2
				beq :++
:			lda #$26
			sta pal_address+2
:			jsr store_beep
			jmp @no_start
@no_select:

	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq @no_start
		jsr nes_btl_pause
		lda #<loop_pauseit
		sta loop_pointer+0
		lda #>loop_pauseit
		sta loop_pointer+1
@no_start:

	jmp end_loop

loop_pauseit:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq @no_start
		lda #<set_battle2
		sta loop_pointer+0
		lda #>set_battle2
		sta loop_pointer+1
@no_start:
	jmp end_loop


hero_build_sfx:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$4a
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
				rts




loop_btl_man_add:

	lda temp_8bit_1
	cmp #$30
	bne :+
		lda temp_8bit_2
		cmp #$30
		bne :+
			lda #$3c
			sta temp_8bit_1
			lda #<loop_btl_setup_rtn
			sta loop_pointer+0
			lda #>loop_btl_setup_rtn
			sta loop_pointer+1
			jmp :++
:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$4c
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
		jsr add_manual
		lda temp_8bit_1
		sec
		sbc #$01
		sta temp_8bit_1
		cmp #$2f
		bne :+
			lda #$39
			sta temp_8bit_1
			lda temp_8bit_2
			cmp #$30
			beq :+
				sec
				sbc #$01
				sta temp_8bit_2
				cmp #$2f
				bne :+
					lda #$39
					sta temp_8bit_1
:
	jmp end_loop
nmi_btl_man_add:

	ldx enemy_choice
	lda enemy_clue, x
	beq :+
	lda #$20
	sta $2006
	lda #$91
	sta $2006
	lda e_health_bar+0
	sta $2007
	lda e_health_bar+1
	sta $2007
	lda e_health_bar+2
	sta $2007
	lda e_health_bar+3
	sta $2007
	lda e_health_bar+4
	sta $2007
	lda e_health_bar+5
	sta $2007
	lda e_health_bar+6
	sta $2007
	lda e_health_bar+7
	sta $2007
	lda e_health_bar+8
	sta $2007
	lda e_health_bar+9
	sta $2007
:

	lda #$22
	sta $2006
	lda #$d4
	sta $2006
;	lda man0+0
;	sta $2007
;	lda man0+1
;	sta $2007
;	lda man0+2
;	sta $2007
	jsr manual_no_zeroes

	lda temp_8bit_1
	cmp #$30
	bne :+
		lda temp_8bit_2
		cmp #$30
		bne :+
			lda #<nmi_empty
			sta nmi_pointer+0
			lda #>nmi_empty
			sta nmi_pointer+1
:
	jmp end_nmi


nmi_btl_arrows:
	lda #$22
	sta $2006
	lda #$a6;#$aa
	sta $2006
	lda btl_letters+0
	sta $2007
	lda btl_letters+1
	sta $2007
	lda btl_letters+2
	sta $2007

	lda #$22
	sta $2006
	lda #$e3;#$e7
	sta $2006
	lda btl_letters+3
	sta $2007
	lda btl_letters+4
	sta $2007
	lda btl_letters+5
	sta $2007

	lda #$22
	sta $2006
	lda #$e9;#$ed
	sta $2006
	lda btl_letters+6
	sta $2007
	lda btl_letters+7
	sta $2007
	lda btl_letters+8
	sta $2007

	lda #$23
	sta $2006
	lda #$26;#$2a
	sta $2006
	lda btl_letters+9
	sta $2007
	lda btl_letters+10
	sta $2007
	lda btl_letters+11
	sta $2007

	lda #$22
	sta $2006
	lda #$d4
	sta $2006
;	lda man0+0
;	sta $2007
;	lda man0+1
;	sta $2007
;	lda man0+2
;	sta $2007
	jsr manual_no_zeroes


		lda #<nmi_btl_meters
		sta nmi_pointer+0
		lda #>nmi_btl_meters
		sta nmi_pointer+1

	jmp end_nmi

manual_no_zeroes:
	lda man0+0
	cmp #$30
	bne :+
		lda #$00
:	sta $2007
	lda man0+1
	cmp #$30
	bne :+
		lda man0+0
		cmp #$30
		bne :+
			lda #$00
			beq :++
:	lda man0+1
:	sta $2007
	lda man0+2
	sta $2007
	rts

nmi_btl_meters:
	lda #$20
	sta $2006
	lda #$a5
	sta $2006
	lda m0+0
	sta $2007
	lda m0+1
	sta $2007
	lda m0+2
	sta $2007
	lda m0+3
	sta $2007
	lda m0+4
	sta $2007
	lda m0+5
	sta $2007
	lda m0+6
	sta $2007
	lda m0+7
	sta $2007
	
	ldx enemy_choice
	lda enemy_clue, x
	beq :+
		lda #$20
		sta $2006
		lda #$b3
		sta $2006
		lda e_stamina_bar+0
		sta $2007
		lda e_stamina_bar+1
		sta $2007
		lda e_stamina_bar+2
		sta $2007
		lda e_stamina_bar+3
		sta $2007
		lda e_stamina_bar+4
		sta $2007
		lda e_stamina_bar+5
		sta $2007
		lda e_stamina_bar+6
		sta $2007
		lda e_stamina_bar+7
		sta $2007
:
		lda #<nmi_btl_health
		sta nmi_pointer+0
		lda #>nmi_btl_health
		sta nmi_pointer+1

	jmp end_nmi
nmi_btl_health:
	lda #$20
	sta $2006
	lda #$85
	sta $2006
	lda h0+0
	sta $2007
	lda h0+1
	sta $2007
	lda h0+2
	sta $2007
	lda h0+3
	sta $2007
	lda h0+4
	sta $2007
	lda h0+5
	sta $2007
	lda h0+6
	sta $2007
	lda h0+7
	sta $2007
	lda h0+8
	sta $2007
	lda h0+9
	sta $2007
	lda #$00
	sta $2007
	sta $2007

	ldx enemy_choice
	lda enemy_clue, x
	beq :+
	lda e_health_bar+0
	sta $2007
	lda e_health_bar+1
	sta $2007
	lda e_health_bar+2
	sta $2007
	lda e_health_bar+3
	sta $2007
	lda e_health_bar+4
	sta $2007
	lda e_health_bar+5
	sta $2007
	lda e_health_bar+6
	sta $2007
	lda e_health_bar+7
	sta $2007
	lda e_health_bar+8
	sta $2007
	lda e_health_bar+9
	sta $2007
:
	lda ls_have
	beq :++
		cmp #$01			; 0x will be on and 8x will be off (laser scope)
		bne :+
			lda #$23
			sta $2006
			lda #$34
			sta $2006
			lda #$00
			sta $2007
			lda #$4f
			sta $2007
			lda #$4e
			sta $2007
			bne :++
:		lda #$23
		sta $2006
		lda #$34
		sta $2006
		lda #$4f
		sta $2007
		lda #$46
		sta $2007
		sta $2007
:
		lda #<nmi_btl_arrows
		sta nmi_pointer+0
		lda #>nmi_btl_arrows
		sta nmi_pointer+1

	jmp end_nmi

word_jump:
.byte "JMP"	; up games+4
word_juke:
.byte "JKE" ; dn games+0
word_blck:
.byte "BLK" ; lt games+18
word_cntr:
.byte "SID" ; rt games+15

word_jabs:
.byte "UPP" ; rt games+26
word_fire:
.byte "FIR" ; lt games+24
word_stmp:
.byte "SMP" ; up games+17
word_zaps:
.byte "ZAP" ; dn games+13

word_strg:
.byte "END" ; up games+20
word_adrn:
.byte "ADR" ; dn games+16
word_esca:
.byte "ESC" ; lt games+8
word_clue:
.byte "CLU" ; rt games+11


flash_which_icon:
	lda battle_active
	bne @one
		lda def_tl+0
		cmp #$ef
		bne :++
			lda #$2f
			sta def_tl+0
:			lda #$2f
			sta off_tl+0
			sta spe_tl+0
			lda #$10
			sta temp_8bit_1
			rts
:		lda #$ef
		sta def_tl+0
		bne :--
@one:
	cmp #$01
	bne @two
		lda off_tl+0
		cmp #$ef
		bne :++
			lda #$2f
			sta off_tl+0
:			lda #$2f
			sta def_tl+0
			sta spe_tl+0
			lda #$10
			sta temp_8bit_1
			rts
:		lda #$ef
		sta off_tl+0
		bne :--
@two:
	lda spe_tl+0
	cmp #$ef
	bne :++
		lda #$2f
		sta spe_tl+0
:		lda #$2f
		sta off_tl+0
		sta def_tl+0
			lda #$10
			sta temp_8bit_1
		rts
:	lda #$ef
	sta spe_tl+0
	bne :--

regrab_chr:
	lda bank_btl_save
	cmp #$03
	bne :+
		lda #$00
		sta bank_prg
		jmp :+++
:	cmp #$25
	bne :+
		lda #$02
		sta bank_prg
		jmp :++
:	lda #$04
	sta bank_prg
:	jsr bank_save
	lda #<play_chr				;  CHRs are in banks 7, 8 and 9. Only bank
	sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
	lda #>play_chr				;  correct address for them all
	sta temp_16bit_1+1			;
 	ldy #$00					; Get Y ready while also setting up where
	sty $2006					;  to begin storage of the CHR in its RAM
	sty $2006					;
	ldx #$20					; Need to loop 32 times
:								;
	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne :-						;
		inc temp_16bit_1+1		;
		dex						;
		bne :-					;
					jsr set_pos
			jsr p_tie_sprites
			jsr setup_20s
			lda #$00
			sta enemy_choice
			lda p_anim_state_save
			sta p_anim_state
			
:	bit $2002
	bpl :-

	lda #%10100000
	sta $2000
	sta save2000
	lda #%00011110
	sta $2001
	sta save2001
			lda #<loop_load32s
			sta loop_pointer+0
			lda #>loop_load32s
			sta loop_pointer+1
			lda #<nmi_load32s
			sta nmi_pointer+0
			lda #>nmi_load32s
			sta nmi_pointer+1
			jmp loop_load32s
	jmp end_loop

recolor_player:
	lda #$37
	sta pal_address+17
	lda #$11
	sta pal_address+18
	lda #$17
	sta pal_address+19
	rts
balloon_player:
	lda #$27
	sta pal_address+17
	lda #$0f
	sta pal_address+18
	lda #$16
	sta pal_address+19
	rts
bike_player:
	lda #$30
	sta pal_address+17
	lda #$16
	sta pal_address+18
	lda #$0f
	sta pal_address+19
	rts
climb_player:
	lda #$10
	sta pal_address+17
	lda #$11
	sta pal_address+18
	lda #$37
	sta pal_address+19
	rts
nes_beep:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$1b
				jsr music_loadsong
				pla
				sta bank_prg
				jsr bank_save
	rts
nes_btl_pause:
				lda bank_prg
				pha
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$61
				jsr music_loadsfx
				pla
				sta bank_prg
				jsr bank_save
	rts

.include "i\bankFixed\bbc_minigame_snd.asm"
.include "i\bankFixed\sort_this_minigame_driver.asm"
.include "i\bankFixed\chall_dialog_end.asm"

e_set_lo:
.byte <e_set00
.byte <e_set01,<e_set02,<e_set03,<e_set04,<e_set05,<e_set06,<e_set07,<e_set08
.byte <e_set09,<e_set10,<e_set11,<e_set12,<e_set13,<e_set14,<e_set15,<e_set16
.byte <e_set17,<e_set18,<e_set19,<e_set20,<e_set21,<e_set22,<e_set23,<e_set24
.byte <e_set25,<e_set26,<e_set27,<e_set28,<e_set29;,<e_set30,<e_set31,<e_set32
;.byte <e_set33,<e_set34,<e_set35,<e_set36,<e_set37,<e_set38,<e_set39,<e_set40
e_set_hi:
.byte >e_set00
.byte >e_set01,>e_set02,>e_set03,>e_set04,>e_set05,>e_set06,>e_set07,>e_set08
.byte >e_set09,>e_set10,>e_set11,>e_set12,>e_set13,>e_set14,>e_set15,>e_set16
.byte >e_set17,>e_set18,>e_set19,>e_set20,>e_set21,>e_set22,>e_set23,>e_set24
.byte >e_set25,>e_set26,>e_set27,>e_set28,>e_set29;,>e_set30,>e_set31,>e_set32
;.byte >e_set33,>e_set34,>e_set35,>e_set36,>e_set37,>e_set38,>e_set39,>e_set40

e_set00:
.byte casual,casual,casual,casual,casual
e_set01:
.byte casual,review,casual,review,casual
e_set02:
.byte fleaes,casual,review,fleaes,casual
e_set03:
.byte bullys,bullys,bullys,bullys,bullys
e_set04:
.byte casual,pakrat,review,pakrat,review
e_set05:
.byte buyers,newbie,pakrat,buyers,newbie
e_set06:
.byte fright,lurker,hobbyi,fright,lurker
e_set07:
.byte hobbyi,casual,review,fleaes,pakrat
e_set08:
.byte social,gamerg,social,gamerg,seller
e_set09:
.byte fabric,fabric,preser,preser,bullys
e_set10: ; 8a
.byte pirate,phanto,trolls,fabric,pirate
e_set11: ; 8b
.byte trolls,hacker,preser,hacker,trolls
e_set12: ; 8c
.byte scaven,brewer,profit,phanto,scaven
e_set13: ; 8d
.byte hunter,collec,collec,review,profit
e_set14: ; 8e
.byte hunter,collec,collec,hunter,profit
e_set15: ; 8f
.byte social,gamerg,seller,review,casual
e_set16: ; 90
.byte larper,reprod,larper,reprod,scaven
e_set17: ; 91
.byte larper,hacker,reprod,hacker,reprod
e_set18: ; 92
.byte boothb,dealer,resell,boothb,dealer
e_set19: ; 93
.byte modera,histor,critic,modera,histor
e_set20: ; 94
.byte pcgame,youtub,pcgame,pcgame,reseal
e_set21: ; 95
.byte reseal,reseal,pcgame,pcgame,youtub
e_set22: ; 96
.byte scamme,reseal,vendor,vendor,reseal
e_set23: ; 97
.byte trader,admins,hoarde,trader,hoarde
e_set24: ; 98
.byte ghosts,brewer,vendor,vendor,ghosts
e_set25: ; 99
.byte scamme,ghosts,auctio,auctio,ghosts
e_set26: ; 9a
.byte ghosts,hoarde,vendor,auctio,auctio
e_set27: ; 9b
.byte cospla,cospla,ghosts,trader,scamme

e_set28: ; 9c
.byte sniper,revisi,cospla,ghosts,brewer

e_set29: ; 9d
.byte sniper,revisi,cospla,revisi,cospla

;e_set30:
;.byte nilene,nilene,nilene,nilene,nilene
;e_set31:
;.byte nilene,nilene,nilene,nilene,nilene
;e_set32:
;.byte nilene,nilene,nilene,nilene,nilene
;e_set33:
;.byte nilene,nilene,nilene,nilene,nilene
;e_set34:
;.byte nilene,nilene,nilene,nilene,nilene
;e_set35:
;.byte nilene,nilene,nilene,nilene,nilene
;e_set36:
;.byte nilene,nilene,nilene,nilene,nilene
;e_set37:
;.byte nilene,nilene,nilene,nilene,nilene
;e_set38:
;.byte nilene,nilene,nilene,nilene,nilene
;e_set39:
;.byte nilene,nilene,nilene,nilene,nilene
;e_set40:
;.byte nilene,nilene,nilene,nilene,nilene

game_over_done:
.byte "CONTINUE?"
loop_dead:
	ldx #$00
		stx enemy_choice
		stx boss_offset
		stx boss_switch
	lda #$0f
:	sta pal_address, x
	inx
	cpx #13
	bne :-

	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq not_up_cont
		lda #$68
		sta cursor+0
		bne not_down_cont
not_up_cont:
	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq not_down_cont
		lda #$78
		sta cursor+0
not_down_cont:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq not_start_cont
		lda cursor+0
		cmp #$68
		bne :+
			lda #$00
			sta map_x
			sta map_y
			lda #$01
			sta p_anim_state
			lda #$2f
			sta p_topleft+0
			lda #$30
			sta p_topleft+3
			lda #$33
			sta p_pos

			jsr all_sprites_gone
			jsr black_out_pal
			jsr fill_hp_stam_combat
			jsr nmi_wait
			lda #$00
			sta $2000
			sta save2000
			sta $2001
			sta save2001
				lda #11
				sta bank_prg
				jsr bank_save
				lda #$00
				sta music_current
				jsr music_loadsong
				jsr game_clear_ram
				jmp do_the_continue
:
		jsr all_sprites_gone
		jsr black_out_pal
		jsr nmi_wait
		jmp reset

not_start_cont:
	jmp end_loop
black_out_pal:
		ldx #$00
		lda #$0f
:		sta pal_address+0
		inx
		cpx #$20
		bne :-
		rts
nmi_dead:
	lda #$21
	sta $2006
	lda #$4c
	sta $2006
	ldx #$00
:	lda game_over_done, x
	sta $2007
	inx
	cpx #(loop_dead - game_over_done)
	bne :-
	lda #$21
	sta $2006
	lda #$b0
	sta $2006
	lda #$59
	sta $2007
	lda #$45
	sta $2007
	lda #$53
	sta $2007
	lda #$21
	sta $2006
	lda #$f0
	sta $2006
	lda #$4e
	sta $2007
	lda #$4f
	sta $2007
	jmp end_nmi

boss_hexnum:
	.byte $00,    $02,    $04,    $08,    $10,    $20,    $40,    $80

stores_y:
.byte $02,$05,$05
stores_x:
.byte $02,$05,$06


palette_animate:
	dec pal_ticker							; This controls the letters in the title of the game
	bne :++										; and also the bouncing cursor. The LUTs for this code
		lda #$0a								; are located right below the subroutine.
		sta pal_ticker						;
		ldx pal_increment								;
		cpx #$0b								;
		bne :+									;
			ldx #$00							;
			stx pal_increment							;
			jmp @next							;
:		inx										;
		stx pal_increment								;
		jmp @next								;
:	ldx pal_increment									;
	jsr pal_anim_choice
@next:
	rts

pal_anim_choice:
	lda pal_animation
	asl a
	tay
	lda pal_anim_table+1, y
	pha
	lda pal_anim_table+0, y
	pha
	rts

pal_anim_table:
	.addr no_anim-1
	.addr ship_anim-1, cave_anim-1, mine_anim-1, sewer_anim-1, water_anim-1
	.addr invi_anim-1, star_anim-1

invi_anim:
	lda grid_flash, x
	sta pal_address+3
	lda flesh_flash, x
	sta pal_address+17
	lda brown_flash, x
	sta pal_address+18
	rts
star_anim:
	lda star_flash, x
	sta pal_address+9
	rts
ship_anim:
	lda ship_fire, x
	sta pal_address+9
no_anim:
	rts
cave_anim:
	lda ship_fire, x
	sta pal_address+11
	rts
mine_anim:
	lda mine_light, x
	sta pal_address+15
	lda mine_ore, x
	sta pal_address+11
	rts
sewer_anim:
	lda sewer_thin, x
	sta pal_address+14
	lda sewer_thick, x
	sta pal_address+13
	rts
water_anim:
	lda water_motion, x
	sta pal_address+14
	rts
grid_flash:
	.byte $0c, $0c, $27, $27, $0c, $0c, $27, $27, $0c, $0c, $27, $27
brown_flash:
	.byte $30, $17, $30, $17, $30, $17, $30, $17, $30, $17, $30, $17
star_flash:
	.byte $30, $27, $30, $27, $30, $27, $30, $27, $30, $27, $30, $27
flesh_flash:
	.byte $22, $37, $22, $37, $22, $37, $22, $37, $22, $37, $22, $37
ship_fire:
	.byte $16, $05, $16, $05, $16, $05, $16, $05, $16, $05, $16, $05
mine_light:
	.byte $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $0f
mine_ore:
	.byte $3b, $2b, $2b, $2b, $1b, $1b, $13, $13, $13, $13, $13, $13
sewer_thin:
	.byte $17, $17, $17, $17, $18, $18, $18, $18, $07, $07, $07, $07
sewer_thick:
	.byte $07, $07, $07, $07, $07, $07, $07, $07, $17, $17, $17, $17
water_motion:
	.byte $30, $31, $21, $22, $21, $31, $30, $31, $21, $22, $21, $31





loop_final_saved:

	jmp end_loop




.segment "BANKTABLE"
banks:
	.byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f
	.byte $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f
	.byte $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f
	.byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f
	.byte $40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4a,$4b,$4c,$4d,$4e,$4f
	.byte $50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5a,$5b,$5c,$5d,$5e,$5f
	.byte $60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6a,$6b,$6c,$6d,$6e,$6f
	.byte $70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7a,$7b,$7c,$7d,$7e,$7f
bank_save:
	lda bank_prg
	clc
	adc bank_chr
	sta bank
	tay
;	sty bank
bankswitch:
	lda banks, y		; read a byte from the banktable (banks)
	sta banks, y		;  and write it back, switching banks
	rts					;  store the current bank in RAM

.segment "VECTORS"
	.addr nmi
	.addr reset
	.addr irq
