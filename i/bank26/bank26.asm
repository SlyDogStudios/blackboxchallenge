.segment "BANK26"


game_nmi31:	; karnov
	jsr game_write_stats
	jmp end_nmi

karn_wall_y:
.byte $1f,$27,$2f,$37,$3f,$47
karn_wall_placement:
.byte 214,172,130,88,46,0
karn_k_y:
.byte $1f,$27,$2f,$37,$3f,$47,$4f,$57
karn_k_placement:
.byte 224,192,160,128,96,64,32,0

game_loop31: ; karnov
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


	lda $230+3
	bne :++
		ldx #$ff
:		inx
		lda seed2
		cmp karn_k_placement, x
		bcc :-
			lda karn_k_y, x
			sta $230+0
			lda #$d8
			sta $230+3
:

	lda $224+3
	bne :++
		ldx #$ff
:		inx
		lda seed
		cmp karn_wall_placement, x
		bcc :-
			lda karn_wall_y, x
			sta $224+0
			lda #$d8
			sta $224+3
:


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
		cmp #$4f
		beq @no_down
			inc $218
@no_down:
	lda control_pad
	and #left_punch
	beq @no_left
		jsr do_random_set
		lda $220+3
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


	ldx #$00
karn_box_tests:
	lda e1_bot, x
	cmp g_top
		bcc karn_no_coll
	lda e1_top, x
	cmp g_bot
		bcs karn_no_coll
	lda e1_left, x
	cmp g_right
		bcs karn_no_coll
	lda e1_right, x
	cmp g_left
		bcc karn_no_coll
			cpx #$00
			bne karn_hit_k
				inc game_misses
				ldx #$45
				jmp return_sfx_routine
karn_hit:
				jmp karn_done_box
karn_hit_k:			
		lda #$ef
		sta $230+0
		ldx #$44
		jmp return_sfx_routine
karn_beep:
		jsr do_score
		jsr do_score
		jmp karn_done_box
karn_no_coll:
	inx
	cpx #$02
	bne karn_box_tests
karn_done_box:

	inc g_counter1
	lda g_counter1
	cmp #$10
	bne :+
		lda #$00
		sta g_counter1
:	lda g_counter1
	cmp #$08
	bcc :+
		lda #$cc
		sta $220+1
		jmp :++
:
	lda #$cd
	sta $220+1
:

	lda $230+3
	cmp #$80
	bne :+
		lda #$ef
		sta $230+0
:	lda e1_spd_lo
	sec
	sbc #<dkjr_chomp
	sta e1_spd_lo
	lda $230+3
	sbc #>dkjr_chomp
	sta $230+3

	lda $224+3
	cmp #$80
	bne :+
		lda #$00
		sta $224+3
		lda #$d7
		sta $224+0
		bne :++
:	dec $224+3
:

	lda $218+0			; karn lock
	sta $220+0
	clc
	adc #$08
	sta $21c+0
	lda $218+3
	sta $21c+3
	sec
	sbc #$08
	sta $220+3

	lda $218+0			; karn hitbox
	sta g_top
	clc
	adc #$0f
	sta g_bot
	lda $218+3
	sta g_left
	clc
	adc #$05
	sta g_right

	lda $224+0			; lock wall
	clc
	adc #$08
	sta $228+0
	clc
	adc #$08
	sta $22c+0
	lda $224+3
	sta $228+3
	sta $22c+3

	lda $224+0			; wall hitbox
	sta e1_top
	clc
	adc #22
	sta e1_bot
	lda $224+3
	sta e1_left
	clc
	adc #$07
	sta e1_right

	lda $230+0			; 'k' hitbox
	sta e2_top
	clc
	adc #$07
	sta e2_bot
	lda $230+3
	sta e2_left
	clc
	adc #$06
	sta e2_right

	jsr pause_routine
	jmp end_loop




mrider_offset:
	.byte 224,192,160,128,96,64,32,0
mrider_x_start:
	.byte $90,$98,$a0,$a8,$b0,$b8,$c0,$c8
mrider_spd_lo:
	.byte $00,$c0,$80;$80,$c0,$40
mrider_spd_hi:
	.byte $01,$00,$00;$01,$00,$00
mrider_e_pic:
	.byte $e2,$e3,$e4
mrider_spd_pos:
	.byte $47,$2a,$1e;$56,$45,$35;$35,$45,$56

game_loop16:	; m rider
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


	lda e5_spd_lo
	beq :++
		lda $21c+0
		cmp #$24
		bcs :+
			lda #$f0
			sta $21c+0
			sta $21c+3
			dec e5_spd_lo
			jmp :++
:		dec $21c+0
		dec $21c+0
:

	lda $220+0
	cmp #$57
	bne :+
		
				inc game_misses
				ldx #$24
				jmp return_sfx_routine
rider_hit:
:


	ldx #$ff
:	inx
	lda $220+0
	cmp mrider_spd_pos, x
	bcc :-
		stx e1_hit
		ldy e1_hit
		lda $220+1
		beq :+
		lda mrider_e_pic, y	;slalom_ice_pic, x
		sta $220+1
:		lda e1_spd_lo
		clc
		adc mrider_spd_lo, x
		sta e1_spd_lo
		lda $220+0
		adc mrider_spd_hi, x
		sta $220+0
		cmp #$58
		bcc :++
			lda #$22
			sta $220+0
			lda #$02
			sta e1_hit
			
			ldx #$ff
:			inx
			lda seed
			cmp mrider_offset, x
			bcc :-
				lda mrider_x_start, x
				sta $220+3
				lda nmi_num
				cmp #$80
				bcc :+
					lda #$e4
					sta $220+1
					lda #$01
					sta e1_dir
:
	lda $220+0
	cmp #$f0
	bne :+
		lda #$e4
		sta $220+1
:
	lda $21c+0
	clc
	adc #$01
	sta s_top
	clc
	adc #$03
	sta s_bot
	lda $21c+3
	clc
	adc #$02
	sta s_left
	clc
	adc #$03
	sta s_right

	lda $220+0
	clc
	adc #$01
	sta e1_top
	clc
	adc #$03
	sta e1_bot
	lda $220+3
	clc
	adc #$02
	sta e1_left
	clc
	adc #$05
	sta e1_right

	lda e1_left
	cmp s_right
		bcs rider_no_coll
	lda e1_right
	cmp s_left
		bcc rider_no_coll
	lda e1_top
	cmp s_bot
		bcs rider_no_coll
	lda e1_bot
	cmp s_top
		bcc rider_no_coll
			lda #$f0
			sta $21c+0
			sta $21c+3
			sta $220+0
			dec e5_spd_lo
			jsr do_score
			ldx #$23
			jmp return_sfx_routine
rider_beep:
rider_no_coll:

	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq rider_no_a
		lda $218+0
		sta $21c+0
		lda $218+3
		sta $21c+3
		lda #$01
		sta e5_spd_lo
		ldx #$22
		jmp return_sfx_routine
rider_gun:
rider_no_a:
	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq @no_left
		lda $218+3
		cmp #$90
		beq @no_right
			jsr do_random_set
			lda $218+3
			sec
			sbc #$08
			sta $218+3
			lda #$01
			sta g_counter1
			tax
			jsr mrider_trees_move
			bne @no_right
@no_left:
	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq @no_right
		lda $218+3
		cmp #$c8
		beq @no_right
			jsr do_random_set
			lda $218+3
			clc
			adc #$08
			sta $218+3
			lda #$02
			sta g_counter1
			tax
			jsr mrider_trees_move
@no_right:
	jsr pause_routine
	jmp end_loop

game_nmi16:
	jsr game_write_stats
	jmp end_nmi
trees_offset:
	.byte $00,$04,$fc
mrider_trees_move:
	ldy #$00
:	lda $228+3, y
	clc
	adc trees_offset, x
	sta $228+3, y
	iny
	iny
	iny
	iny
	cpy #24
	bne :-
	rts











	
pball_score:
	ldx #$28
	jmp return_sfx_routine
pball_beep:
	rts
pball_bounce:
pball_hit:

pball_enter_dir:
	.byte $00,$01,$00,$01,$00,$01
pball_enter_x:
	.byte $90,$90,$a0,$a0,$c0,$c0
pball_enter_offset:
	.byte 210,168,126,84,42,0
pball_mover:
	lda g_top
	asl a
	tay
	lda pball_table+1, y
	pha
	lda pball_table+0, y
	pha
	rts
pball_table:
	.addr pball_dl-1, pball_dr-1, pball_ul-1, pball_ur-1
pball_dl:
	lda e1_spd_lo
	clc
	adc #$80
	sta e1_spd_lo
	lda $220+0
	adc #$00
	sta $220+0
	lda e2_spd_lo
	sec
	sbc #$80
	sta e2_spd_lo
	lda $220+3
	sbc #$00
	sta $220+3
	rts
pball_dr:
	lda e1_spd_lo
	clc
	adc #$80
	sta e1_spd_lo
	lda $220+0
	adc #$00
	sta $220+0
	lda e2_spd_lo
	clc
	adc #$80
	sta e2_spd_lo
	lda $220+3
	adc #$00
	sta $220+3
	rts
pball_ul:
	lda e1_spd_lo
	sec
	sbc #$80
	sta e1_spd_lo
	lda $220+0
	sbc #$00
	sta $220+0
	lda e2_spd_lo
	sec
	sbc #$80
	sta e2_spd_lo
	lda $220+3
	sbc #$00
	sta $220+3
	rts
pball_ur:
	lda e1_spd_lo
	sec
	sbc #$80
	sta e1_spd_lo
	lda $220+0
	sbc #$00
	sta $220+0
	lda e2_spd_lo
	clc
	adc #$80
	sta e2_spd_lo
	lda $220+3
	adc #$00
	sta $220+3
	rts
game_loop18: ; pinball
	lda g_counter3
	beq :+
		dec g_counter3
		beq :+
			jmp end_loop
:
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

	lda e6_spd_lo
	bne :+
		lda #$ff
		sta g_left
		sta e6_spd_lo
:

;	lda g_left
;	beq :++
;		dec g_left
;		bne :++
	lda $220+0
	cmp #$f0
	bne :++
			ldx #$ff
:			inx
			lda seed
			cmp pball_enter_offset, x
			bcc :-
				lda pball_enter_dir, x
				sta g_top
				lda pball_enter_x, x
				sta $220+3
				lda #$26
				sta $220+0
				lda #$00
				sta g_left
:

	lda g_right
	bne :++
		lda $220+0
		cmp #$1f
		bcc :+
			dec $220+0
			jmp :++
:		lda #$f0
		sta $220+0
		lda #$3c
		sta g_left		; time wait after ball launch
		lda #$01
		sta g_right
:


	lda g_left
	bne :+
		jsr pball_coords
		jsr pball_test_coll
		jsr pball_mover
:

	lda $220+0
	cmp #$57
	bne :+
		inc game_misses
		lda #$72
		sta g_counter3
:

	lda $218+1, y
	cmp #$c9
	bne :+
		jsr pball_leftdown_boxes
		jmp :+++
:	cmp #$ca
	bne :+
		jsr pball_leftmid_boxes
		jmp :++
:	jsr pball_leftup_boxes
:
	lda $21c+1, y
	cmp #$c9
	bne :+
		jsr pball_rightdown_boxes
		jmp :+++
:	cmp #$ca
	bne :+
		jsr pball_rightmid_boxes
		jmp :++
:	jsr pball_rightup_boxes
:

	ldx #$00
pball_box_tests:
	lda e1_bot, x
	cmp s_top
		bcc pball_no_coll
	lda e1_top, x
	cmp s_bot
		bcs pball_no_coll
	lda e1_left, x
	cmp s_right
		bcs pball_no_coll
	lda e1_right, x
	cmp s_left
		bcc pball_no_coll
			cpx #$03
			bcc pball_leftftouch
				lda $21c+1
				cmp #$c9
				beq :+
					jsr pball_switch_dir2
					jmp pball_done_box
:				lda #$00
				sta e1_dir
				jmp pball_done_box
pball_leftftouch:
			lda $218+1
			cmp #$c9
			beq :+
				jsr pball_switch_dir3
				jmp pball_done_box
:			lda #$01
			sta e1_dir
			jmp pball_done_box
pball_no_coll:
	inx
	cpx #$06
	bne pball_box_tests
pball_done_box:



	ldx #$00
:	jsr pinball_anim
	inx
	cpx #$02
	bne :-

	lda control_pad
	eor control_old
	and control_pad
	and #$f0;left_punch
	beq @no_left
		lda e3_dir
		bne @no_left
			lda #$01
			sta e3_dir
			lda #$20
			sta g_counter1
@no_left:
	lda control_pad
	eor control_old
	and control_pad
	and #%00000011;a_punch
	beq @no_a
		lda e4_dir
		bne @no_a
			lda #$01
			sta e4_dir
			lda #$20
			sta g_counter2
@no_a:
	jsr pause_routine
	jmp end_loop

;pball_upfleft0:
;	.byte $00,$03,$00,$02
;pball_upfleft1:
;	.byte $00,$02,$02,$03
;pball_upfleft2:
;	.byte $00,$02,$05,$03
;pball_upfright0:
;	.byte $00,$02,$00,$03
;pball_upfright1:
;	.byte $00,$02,$03,$03
;pball_upfright2:
;	.byte $00,$03,$06,$02
pball_leftup_boxes:
	lda $218+0
	sta e1_top
	clc
	adc #$03
	sta e1_bot
	lda $218+3
	sta e1_left
	clc
	adc #$02
	sta e1_right
	
	lda $218+0
	sta e2_top
	clc
	adc #$02
	sta e2_bot
	lda $218+3
	clc
	adc #$02
	sta e2_left
	clc
	adc #$03
	sta e2_right

	lda $218+0
	sta e3_top
	clc
	adc #$02
	sta e3_bot
	lda $218+3
	clc
	adc #$05
	sta e3_left
	clc
	adc #$03
	sta e3_right
	rts
pball_rightup_boxes:
	lda $21c+0
	sta e4_top
	clc
	adc #$02
	sta e4_bot
	lda $21c+3
	sta e4_left
	clc
	adc #$03
	sta e4_right
	
	lda $21c+0
	sta e5_top
	clc
	adc #$02
	sta e5_bot
	lda $21c+3
	clc
	adc #$03
	sta e5_left
	clc
	adc #$03
	sta e5_right

	lda $21c+0
	sta e6_top
	clc
	adc #$03
	sta e6_bot
	lda $21c+3
	clc
	adc #$06
	sta e6_left
	clc
	adc #$02
	sta e6_right
	rts


;pball_midfleft0:
;	.byte $00,$02,$00,$03
;pball_midfleft1:
;	.byte $01,$02,$02,$03
;pball_midfleft2:
;	.byte $02,$02,$04,$03
;pball_midfright0:
;	.byte $02,$02,$01,$03
;pball_midfright1:
;	.byte $01,$02,$03,$03
;pball_midfright2:
;	.byte $00,$02,$05,$03
pball_leftmid_boxes:
	lda $218+0
	sta e1_top
	clc
	adc #$02
	sta e1_bot
	lda $218+3
	sta e1_left
	clc
	adc #$03
	sta e1_right
	
	lda $218+0
	clc
	adc #$01
	sta e2_top
	clc
	adc #$02
	sta e2_bot
	lda $218+3
	clc
	adc #$02
	sta e2_left
	clc
	adc #$03
	sta e2_right

	lda $218+0
	clc
	adc #$02
	sta e3_top
	clc
	adc #$02
	sta e3_bot
	lda $218+3
	clc
	adc #$04
	sta e3_left
	clc
	adc #$03
	sta e3_right
	rts
pball_rightmid_boxes:
	lda $21c+0
	clc
	adc #$02
	sta e4_top
	clc
	adc #$02
	sta e4_bot
	lda $21c+3
	clc
	adc #$01
	sta e4_left
	clc
	adc #$03
	sta e4_right
	
	lda $21c+0
	clc
	adc #$01
	sta e5_top
	clc
	adc #$02
	sta e5_bot
	lda $21c+3
	clc
	adc #$03
	sta e5_left
	clc
	adc #$03
	sta e5_right

	lda $21c+0
	sta e6_top
	clc
	adc #$02
	sta e6_bot
	lda $21c+3
	clc
	adc #$05
	sta e6_left
	clc
	adc #$03
	sta e6_right
	rts

;pball_downfleft0:
;	.byte $00,$03,$00,$03
;pball_downfleft1:
;	.byte $02,$03,$01,$03
;pball_downfleft2:
;	.byte $04,$02,$04,$02
;pball_downfright0:
;	.byte $04,$02,$02,$02
;pball_downfright1:
;	.byte $02,$03,$03,$03
;pball_downfright2:
;	.byte $00,$03,$05,$03
pball_leftdown_boxes:
	lda $218+0
	sta e1_top
	clc
	adc #$03
	sta e1_bot
	lda $218+3
	sta e1_left
	clc
	adc #$03
	sta e1_right
	
	lda $218+0
	clc
	adc #$02
	sta e2_top
	clc
	adc #$03
	sta e2_bot
	lda $218+3
	clc
	adc #$01
	sta e2_left
	clc
	adc #$03
	sta e2_right

	lda $218+0
	clc
	adc #$04
	sta e3_top
	clc
	adc #$02
	sta e3_bot
	lda $218+3
	clc
	adc #$04
	sta e3_left
	clc
	adc #$02
	sta e3_right
	rts
pball_rightdown_boxes:
	lda $21c+0
	clc
	adc #$04
	sta e4_top
	clc
	adc #$02
	sta e4_bot
	lda $21c+3
	clc
	adc #$02
	sta e4_left
	clc
	adc #$02
	sta e4_right
	
	lda $21c+0
	clc
	adc #$02
	sta e5_top
	clc
	adc #$03
	sta e5_bot
	lda $21c+3
	clc
	adc #$03
	sta e5_left
	clc
	adc #$03
	sta e5_right

	lda $21c+0
	sta e6_top
	clc
	adc #$03
	sta e6_bot
	lda $21c+3
	clc
	adc #$05
	sta e6_left
	clc
	adc #$03
	sta e6_right
	rts

pball_coll_lo:
	.byte <pball_coll0, <pball_coll1, <pball_coll2, <pball_coll3, <pball_coll4, <pball_coll5, <pball_coll6
pball_coll_hi:
	.byte >pball_coll0, >pball_coll1, >pball_coll2, >pball_coll3, >pball_coll4, >pball_coll5, >pball_coll6
pball_coll0:
	.byte $03,$03,$03,$03,$03,$02,$02,$02,$03,$03,$00,$03
pball_coll1:
	.byte $03,$03,$00,$00,$00,$00,$00,$00,$00,$03,$00,$03
pball_coll2:
	.byte $03,$03,$00,$00,$01,$00,$01,$00,$00,$03,$00,$03
pball_coll3:
	.byte $03,$03,$00,$00,$00,$00,$00,$00,$00,$03,$00,$03
pball_coll4:
	.byte $03,$03,$03,$00,$00,$00,$00,$00,$03,$03,$00,$03
pball_coll5:
	.byte $03,$03,$03,$03,$00,$00,$00,$03,$03,$03,$00,$03
pball_coll6:
	.byte $03,$03,$03,$03,$00,$00,$00,$03,$03,$03,$00,$03


pinball_anim:
	lda e3_dir, x
	asl a
	tay
	lda pball_anim_table+1, y
	pha
	lda pball_anim_table+0, y
	pha
	rts
pball_anim_table:
	.addr pball_still-1, pball_move-1
pball_still:
	cpx #$01
	bne :+
		ldy #$04
		bne :++
:	ldy #$00
:	lda #$c9
	sta $218+1, y
	rts
pball_move:
	cpx #$01
	bne :+
		ldy #$04
		bne :++
:	ldy #$00
:	dec g_counter1, x
	bne :+
		lda #$00
		sta e3_dir, x
		rts
:	lda g_counter1, x
	cmp #$18
	bcc :+
		lda #$ca
		sta $218+1, y
		rts
:	cmp #$10
	bcc :+
		lda #$cb
		sta $218+1, y
		rts
:	cmp #$08
	bcc :+
		lda #$ca
		sta $218+1, y
		rts
:	lda #$c9
	sta $218+1, y
	rts

pball_coords:
	lda $220+0		; ball
	clc
	adc #$04
	sta s_top
	clc
	adc #$02
	sta s_bot
	lda $220+3
	clc
	adc #$03
	sta s_left
	clc
	adc #$02
	sta s_right
;	lda s_top
;	and #$f0
;	sta temp_16bit4+0
;	lda s_left
;	and #$0f
;	sta temp_16bit4+1
;	lda temp_16bit4+0
;	clc
;	adc temp_16bit4+1
;	sta game_xtra0		; ball coord top left
;	lda s_top
;	and #$f0
;	sta temp_16bit4+0
;	lda s_right
;	and #$0f
;	sta temp_16bit4+1
;	lda temp_16bit4+0
;	clc
;	adc temp_16bit4+1
;	sta game_xtra1		; ball coord top right
;	lda s_bot
;	and #$f0
;	sta temp_16bit4+0
;	lda s_left
;	and #$0f
;	sta temp_16bit4+1
;	lda temp_16bit4+0
;	clc
;	adc temp_16bit4+1
;	sta game_xtra2		; ball coord bot left
;	lda s_bot
;	and #$f0
;	sta temp_16bit4+0
;	lda s_right
;	and #$0f
;	sta temp_16bit4+1
;	lda temp_16bit4+0
;	clc
;	adc temp_16bit4+1
;	sta game_xtra3		; ball coord bot right
	rts
;pball_dl-1, pball_dr-1, pball_ul-1, pball_ur-1
pball_switch_dir0:	; top left
	lda g_top
	bne :+
		lda #$01
		sta g_top
		rts
:	cmp #$01
	bne :+
		lda #$00
		sta g_top
		rts
:	cmp #$02
	bne :+
		inc $220+3
		dec $220+0
		lda #$03
		sta g_top
		rts
:	lda #$01
	sta g_top
	rts

;pball_dl-1, pball_dr-1, pball_ul-1, pball_ur-1
pball_switch_dir1:	; top right
	lda g_top
	bne :+
		lda #$01
		sta g_top
		rts
:	cmp #$01
	bne :+
		dec $220+3
		lda #$00
		sta g_top
		rts
:	cmp #$02
	bne :+
		lda #$00
		sta g_top
		rts
:	lda #$02
	sta g_top
	rts

;pball_dl-1, pball_dr-1, pball_ul-1, pball_ur-1
pball_switch_dir2:	; bot left
	lda g_top
	bne :+
		dec $220+0
		lda #$02
		sta g_top
		rts
:	cmp #$01
	bne :+
		dec $220+0
		lda #$03
		sta g_top
		rts
:	cmp #$02
	bne :+
		lda #$03
		sta g_top
		rts
:	lda #$02
	sta g_top
	rts

;pball_dl-1, pball_dr-1, pball_ul-1, pball_ur-1
pball_switch_dir3:	; bot right
	lda g_top
	bne :+
		lda #$02
		sta g_top
		rts
:	cmp #$01
	bne :+
		dec $220+0
		lda #$03
		sta g_top
		rts
:	cmp #$02
	bne :+
		lda #$03
		sta g_top
		rts
:	lda #$02
	sta g_top
	rts

pball_test_coll:
	lda s_top
	and #$0f
	cmp #$08
	bcs :+
		lda s_top
		and #$f0
		clc
		ror
		ror
		ror
		ror
		tax
		lda pball_get_realy0, x
		tax
		jmp :++
:	lda s_top
	and #$f0
	clc
	ror
	ror
	ror
	ror
	tax
	lda pball_get_realy1, x
	tax
:
	lda pball_coll_lo, x
	sta temp_16bit_1+0
	lda pball_coll_hi, x
	sta temp_16bit_1+1
	lda s_left
	and #$0f
	cmp #$08
	bcs :+
		lda s_left
		and #$f0
		clc
		ror
		ror
		ror
		ror
		tay
		lda pball_get_realx0, y
		tay
		jmp :++
:	lda s_left
	and #$f0
	clc
	ror
	ror
	ror
	ror
	tay
	lda pball_get_realx1, y
	tay
:		lda (temp_16bit_1), y
		beq pball_test_tr
			cmp #$01
			bne :+
				jsr pball_score
				jsr do_score
				jmp :++
:			cmp #$02
			bne :+
				jsr pball_score
				jsr do_score
:			jsr pball_switch_dir0
			rts
pball_test_tr:
	lda s_top
	and #$0f
	cmp #$08
	bcs :+
		lda s_top
		and #$f0
		clc
		ror
		ror
		ror
		ror
		tax
		lda pball_get_realy0, x
		tax
		jmp :++
:	lda s_top
	and #$f0
	clc
	ror
	ror
	ror
	ror
	tax
	lda pball_get_realy1, x
	tax
:
	lda pball_coll_lo, x
	sta temp_16bit_1+0
	lda pball_coll_hi, x
	sta temp_16bit_1+1
	lda s_right
	and #$0f
	cmp #$08
	bcs :+
		lda s_right
		and #$f0
		clc
		ror
		ror
		ror
		ror
		tay
		lda pball_get_realx0, y
		tay
		jmp :++
:	lda s_right
	and #$f0
	clc
	ror
	ror
	ror
	ror
	tay
	lda pball_get_realx1, y
	tay
:		lda (temp_16bit_1), y
		beq pball_test_bl
			cmp #$01
			bne :+
				jsr pball_score
				jsr do_score
				jmp :++
:			cmp #$02
			bne :+
				jsr pball_score
				jsr do_score
:			jsr pball_switch_dir1
			rts
pball_test_bl:
	lda s_bot
	and #$0f
	cmp #$08
	bcs :+
		lda s_bot
		and #$f0
		clc
		ror
		ror
		ror
		ror
		tax
		lda pball_get_realy0, x
		tax
		jmp :++
:	lda s_bot
	and #$f0
	clc
	ror
	ror
	ror
	ror
	tax
	lda pball_get_realy1, x
	tax
:
	lda pball_coll_lo, x
	sta temp_16bit_1+0
	lda pball_coll_hi, x
	sta temp_16bit_1+1
	lda s_left
	and #$0f
	cmp #$08
	bcs :+
		lda s_left
		and #$f0
		clc
		ror
		ror
		ror
		ror
		tay
		lda pball_get_realx0, y
		tay
		jmp :++
:	lda s_left
	and #$f0
	clc
	ror
	ror
	ror
	ror
	tay
	lda pball_get_realx1, y
	tay
:		lda (temp_16bit_1), y
		beq pball_test_br
			cmp #$01
			bne :+
				jsr pball_score
				jsr do_score
				jmp :++
:			cmp #$02
			bne :+
				jsr pball_score
				jsr do_score
:			jsr pball_switch_dir2
			rts
pball_test_br:
	lda s_bot
	and #$0f
	cmp #$08
	bcs :+
		lda s_bot
		and #$f0
		clc
		ror
		ror
		ror
		ror
		tax
		lda pball_get_realy0, x
		tax
		jmp :++
:	lda s_bot
	and #$f0
	clc
	ror
	ror
	ror
	ror
	tax
	lda pball_get_realy1, x
	tax
:
	lda pball_coll_lo, x
	sta temp_16bit_1+0
	lda pball_coll_hi, x
	sta temp_16bit_1+1
	lda s_right
	and #$0f
	cmp #$08
	bcs :+
		lda s_right
		and #$f0
		clc
		ror
		ror
		ror
		ror
		tay
		lda pball_get_realx0, y
		tay
		jmp :++
:	lda s_right
	and #$f0
	clc
	ror
	ror
	ror
	ror
	tay
	lda pball_get_realx1, y
	tay
:		lda (temp_16bit_1), y
		beq pball_test_done
			cmp #$01
			bne :+
				jsr pball_score
				jsr do_score
				jmp :++
:			cmp #$02
			bne :+
				jsr pball_score
				jsr do_score
:			jsr pball_switch_dir3
			rts
pball_test_done:
	rts
pball_get_realx0:
	.byte $03,$03,$03,$03,$03,$03,$03,$03, $00,$02, $04,$06, $08,$0a, $0c,$07, $08,$09
pball_get_realx1:
	.byte $03,$03,$03,$03,$03,$03,$03,$03, $01,$03, $05,$07, $09,$0b, $0d,$07, $08,$09


pball_get_realy0:
	.byte $03,$03, $00,$02, $04,$06, $08,$0a, $0c,$07, $08,$09
pball_get_realy1:
	.byte $03,$03, $01,$03, $05,$07, $09,$0b, $0d,$07, $08,$09
game_nmi18:	; pinball
	jsr game_write_stats
	jmp end_nmi



game_loop30:	; 	nesvc
	lda g_counter3
	beq :+
		dec g_counter3
		beq :+
			jmp end_loop
:
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

	lda e6_spd_lo
	bne @done_init
		lda #$1f
		sta e5_dir
		lda #$a0
		sta e6_dir
		lda #$00
		sta e2_dir
		sta e4_dir
		lda #$01
		sta e3_dir
		lda #$3c
		sta e6_hit	; 1 second timer
		lda #$60
		sta g_right
		lda #$80
		sta g_top
		lda #$40
		sta g_bot
		lda #$10
		sta g_counter2
		sta e6_spd_lo
@done_init:

	jsr virus_e_move
	jsr virus_e_rotate
	jsr virus_routine
	jsr virus_boxes_define
	jsr virus_touches
	jsr virus_timer

	lda control_pad
	and #up_punch
	beq @no_up
		lda $218+0
		cmp #$27
		beq @no_up
			lda #$c2
			sta $218+1
			lda #$01
			sta $218+2
			dec $218+0
			bne @no_right
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		lda $218+0
		cmp #$4f
		beq @no_down
			lda #$c0
			sta $218+1
			lda #$01
			sta $218+2
			inc $218+0
			bne @no_right
@no_down:
	lda control_pad
	and #left_punch
	beq @no_left
		lda $218+3
		cmp #$90
		beq @no_left
			lda #$c1
			sta $218+1
			lda #$41
			sta $218+2
			dec $218+3
			bne @no_right
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda $218+3
		cmp #$c8
		beq @no_right
			lda #$c1
			sta $218+1
			lda #$01
			sta $218+2
			inc $218+3
@no_right:
	jsr pause_routine
	jmp end_loop

virus_e_move:
	ldy #$00
	ldx #$00
@start_move:
	lda e2_dir, x
	beq @other_dir
		lda e2_spd_lo, x
		sec
		sbc g_right, x
		sta e2_spd_lo, x
		lda $21c+3, y
		sbc e2_hit, x
		sta $21c+3, y
		cmp #$90
		bcs :+
			dec e2_dir, x
:		jmp @inc_em
@other_dir:
	lda e2_spd_lo, x
	clc
	adc g_right, x
	sta e2_spd_lo, x
	lda $21c+3, y
	adc e2_hit, x
	sta $21c+3, y
	cmp #$c8
	bcc :+
		inc e2_dir, x
:
@inc_em:
	iny
	iny
	iny
	iny
	inx
	cpx #$03
	bne @start_move
	rts

virus_timer:
	lda $230+1
	cmp #$30
	bne :+
		lda $22c+1
		cmp #$30
		bne :+
			inc game_misses
			lda #$72
			sta g_counter3
			rts
:
	dec e6_hit
	bne :++
		lda #$3c
		sta e6_hit
		dec $230+1
		lda $230+1
		cmp #$2f
		bne :+
			lda #$39
			sta $230+1
			dec $22c+1
:
:	rts

virus_e_rotate:
	dec g_counter2
	bne :+
		lda #$10
		sta g_counter2
:	lda g_counter2
	cmp #$08
	bcc :+
		lda #$11
		sta pal_address+11
		sta pal_address+25
		lda #$27
		sta pal_address+26
		lda #$82
		bne :++
:	lda #$14
	sta pal_address+11
	sta pal_address+25
	lda #$30
	sta pal_address+26
	lda #$02
:	sta $21c+2
	sta $220+2
	sta $224+2
	rts

virus_routine:
	lda e5_dir	; virus_y
	clc
	adc #$08
	sta e5_dir
	cmp #$57
	bne :+
		lda #$27
		sta e5_dir
:	lda e6_dir
	clc
	adc #$08
	sta e6_dir
	cmp #$d0
	bne :+
		lda #$90
		sta e6_dir
:
	lda $228+0
	cmp #$f0
	bne :+
		lda e5_dir
		sta $228+0
		lda e6_dir
		sta $228+3
:	rts

virus_boxes_define:
	ldx #$00
	ldy #$00
:	lda $21c+0, y
	clc
	adc #$02
	sta e2_top, x
	clc
	adc #$03
	sta e2_bot, x
	lda $21c+3, y
	sta e2_left, x
	clc
	adc #$07
	sta e2_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$03
	bne :-
	lda $218+0
	sta e1_top
	clc
	adc #$07
	sta e1_bot
	lda $218+3
	sta e1_left
	clc
	adc #$07
	sta e1_right
	lda $228+0
	clc
	adc #$01
	sta s_top
	clc
	adc #$06
	sta s_bot
	lda $228+3
	clc
	adc #$01
	sta s_left
	clc
	adc #$06
	sta s_right
	rts

virus_touches:
	ldx #$00
virus_tests:
	lda e2_bot, x
	cmp e1_top
		bcc virus_no_coll
	lda e2_top, x
	cmp e1_bot
		bcs virus_no_coll
	lda e2_left, x
	cmp e1_right
		bcs virus_no_coll
	lda e2_right, x
	cmp e1_left
		bcc virus_no_coll
			inc game_misses
			lda #$72
			sta g_counter3
			bne virus_coll_done
virus_no_coll:
	inx
	cpx #$03
	bne virus_tests
virus_coll_done:

	lda e1_bot
	cmp s_top
		bcs :+
			jmp virus_no_touch
:	lda e1_top
	cmp s_bot
		bcc :+
			jmp virus_no_touch
:	lda e1_left
	cmp s_right
		bcc	:+
			jmp virus_no_touch
:	lda e1_right
	cmp s_left
		bcs	:+
			jmp virus_no_touch
:			jsr do_score
			jsr do_score
			lda #$f0
			sta $228+0
			lda g_right
			clc
			adc #$04
			sta g_right
			bne :+
				inc e2_hit
:			lda g_top
			clc
			adc #$04
			sta g_top
			bne :+
				inc e3_hit
:			lda g_bot
			clc
			adc #$04
			sta g_bot
			bne :+
				inc e4_hit
:			lda $22c+1
			cmp #$39
			bne :+
				lda $230+1
				cmp #$37
				bcc :+
					lda #$39
					sta $230+1
					sta $22c+1
					bne :++++
:
			inc $230+1
			lda $230+1
			cmp #$3a
			bne :+
				lda #$30
				sta $230+1
				inc $22c+1
:			inc $230+1
			lda $230+1
			cmp #$3a
			bne :+
				lda #$30
				sta $230+1
				inc $22c+1
:			inc $230+1
			lda $230+1
			cmp #$3a
			bne :+
				lda #$30
				sta $230+1
				inc $22c+1
:			lda #$3c
			sta e6_hit

			ldx #$43
			jmp return_sfx_routine
virus_beep:
virus_no_touch:
	rts

virus_y:
	.byte $27,$27,$27,$27,$27,$27,$27,$27
	.byte $2f,$2f,$2f,$2f,$2f,$2f,$2f,$2f
	.byte $37,$37,$37,$37,$37,$37,$37,$37
	.byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
	.byte $47,$47,$47,$47,$47,$47,$47,$47
	.byte $4f,$4f,$4f,$4f,$4f,$4f,$4f,$4f
virus_x:
	.byte $90,$98,$a0,$a8,$b0,$b8,$c0,$c8
	.byte $90,$98,$a0,$a8,$b0,$b8,$c0,$c8
	.byte $90,$98,$a0,$a8,$b0,$b8,$c0,$c8
	.byte $90,$98,$a0,$a8,$b0,$b8,$c0,$c8
	.byte $90,$98,$a0,$a8,$b0,$b8,$c0,$c8
	.byte $90,$98,$a0,$a8,$b0,$b8,$c0,$c8

game_nmi30:	; nesvc
	jsr game_write_stats
	jmp end_nmi
