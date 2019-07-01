.segment "BANK27"
dkong_move:
	asl a
	tay
	lda dkong_move_table+1, y
	pha
	lda dkong_move_table+0, y
	pha
	cpx #$04
	bne :+
		ldy #$01
		bne :+++
:		cpx #$08
		bne :+
			ldy #$02
			bne :++
:	ldy #$00
:
	rts
dkong_move_table:
	.addr dkong_move_nadda-1,dkong_move_right-1,dkong_move_left-1,dkong_move_down-1
dkong_move_nadda:
	rts
dkong_move_left:
	lda s_left, y
	sec
	sbc #<dkjr_chomp
	sta s_left, y
	lda $224+3, x
	sbc #>dkjr_chomp
	sta $224+3, x
	lda #$ce
	sta $224+1, x
	rts
dkong_move_right:
	lda s_left, y
	clc
	adc #<dkjr_chomp
	sta s_left, y
	lda $224+3, x
	adc #>dkjr_chomp
	sta $224+3, x
	lda #$ce
	sta $224+1, x
	rts
dkong_move_down:
	lda s_left, y
	clc
	adc #<dkjr_chomp
	sta s_left, y
	lda $224+0, x
	adc #>dkjr_chomp
	sta $224+0, x
	lda #$df
	sta $224+1, x
	rts
dkong_offset:
	.byte 224,192,160,128,96,64,32,0
dkong_route_lo:
	.byte <dkong_route0,<dkong_route1,<dkong_route2,<dkong_route3
	.byte <dkong_route4,<dkong_route5,<dkong_route6,<dkong_route7
dkong_route_hi:
	.byte >dkong_route0,>dkong_route1,>dkong_route2,>dkong_route3
	.byte >dkong_route4,>dkong_route5,>dkong_route6,>dkong_route7
dkong_route0: ; all long ladders
	.byte $01,$01,$01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$02,$02,$02,$02,$03,$03
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$02,$02,$02,$ff
dkong_route1: ; all short ladders
	.byte $01,$01,$01,$03,$03,$02,$02,$02,$03,$03
	.byte $01,$01,$03,$03,$02,$02,$02,$02,$02,$ff
dkong_route2: ; short long short
	.byte $01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$02,$02,$03,$03
	.byte $01,$01,$01,$01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$ff
dkong_route3: ; short long long
	.byte $01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$02,$02,$03,$03
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$02,$02,$02,$ff
dkong_route4: ; short short long
	.byte $01,$01,$01,$03,$03,$02,$02,$02,$03,$03
	.byte $01,$01,$01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$02,$02,$02,$ff
dkong_route5: ; long long short
	.byte $01,$01,$01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$02,$02,$02,$02,$03,$03
	.byte $01,$01,$01,$01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$ff
dkong_route6: ; long short short
	.byte $01,$01,$01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$03,$03
	.byte $01,$01,$03,$03,$02,$02,$02,$02,$02,$ff
dkong_route7: ; long short long
	.byte $01,$01,$01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$03,$03
	.byte $01,$01,$01,$01,$01,$03,$03,$02,$02,$02,$02,$02,$02,$02,$02,$ff
dkong_spr_mirror: ; d kong
	.byte $55,$dd,$01,$90 ; 218 mario
	.byte $f0,$cc,$02,$98 ; 21c dkong left
	.byte $f0,$cd,$02,$a0 ; 220 dkong right
	.byte $f0,$ce,$03,$a8 ; 224 barrel
	.byte $f0,$ce,$03,$a8 ; 228
	.byte $f0,$ce,$03,$a8 ; 22c
game_loop04:	; dkong
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

	lda g_counter1
	beq @not_wait
		dec g_counter1
		bne :++
			ldx #$00
			stx e6_spd_lo
:			lda dkong_spr_mirror, x
			sta $218+0, x
			inx
			cpx #24
			bne :-
:		jmp end_loop
@not_wait:

	lda e6_spd_lo
	bne :+
		lda #$00
		sta e5_right	; jump
		sta e6_right	; 01 = on ladder
		sta e5_left		; animation
		sta e5_bot		; barrel spr offset
		sta s_left
		sta s_left+1
		sta s_left+2
		sta e4_top
		sta e5_top
		sta e6_top
		sta e1_dir
		sta e2_dir
		sta e3_dir
		lda #$01
		sta e6_bot		; kong wait to throw
		lda #$01
		sta e6_left		; direction
		lda #$07
		sta e5_dir		; y pos
		lda #$02
		sta e6_dir		; x pos
		lda #$20
		sta e5_hit		; counter going up/down
		lda #$10
		sta e6_hit		; counter going left/right
		sta e6_spd_lo
		jmp end_loop
:

	lda $218+0
	cmp #$26
	bcs dkong_not_finished
		lda $218+3
		cmp #$af
		bne dkong_not_finished
			lda #$72
			sta g_counter1
			ldy #$00
:			jsr do_score
			iny
			cpy #$03
			bne :-
			ldx #$07
			jmp return_sfx_routine
dk_beep:
			jmp end_loop
dkong_not_finished:

	lda e6_bot
	cmp #$b8
	bcs :+
		lda #$f0
		sta $21c+0
		sta $220+0
:
	dec e6_bot
	lda e6_bot
	bne @no_new
		lda #$1f
		sta $21c+0
		sta $220+0
		ldx #$ff
:		inx
		lda seed
		cmp dkong_offset, x
		bcc :-
		lda e5_bot
		pha
		lsr
		tay
		lda dkong_route_lo, x
		sta temp_16bit_2+0, y
		lda dkong_route_hi, x
		sta temp_16bit_2+1, y
		pla
		sta e5_bot
		tay
		lda #$27
		sta $224+0, y
		lda #$a8
		sta $224+3, y
		tya
		clc
		adc #$04
		sta e5_bot
		cmp #$0c
		bne :+
			lda #$00
			sta e5_bot
:		lda #$d0
		sta e6_bot
@no_new:

	lda $224+0
	cmp #$f0
	beq @no_first
		ldy e1_dir
		lda (temp_16bit_2), y
		cmp #$ff
		bne :+
			lda #$f0
			sta $224+0
			lda #$00
			sta e1_dir
			sta e4_top
			sta s_left+0
			jmp @no_first
:		ldx #$00
		jsr dkong_move
		inc e4_top
		lda e4_top
		cmp #$10
		bne :+
			lda #$00
			sta e4_top
			inc e1_dir
:
@no_first:
	lda $228+0
	cmp #$f0
	beq @no_second
		ldy e2_dir
		lda (temp_16bit_3), y
		cmp #$ff
		bne :+
			lda #$f0
			sta $228+0
			lda #$00
			sta e2_dir
			sta e5_top
			sta s_left+1
			jmp @no_second
:		ldx #$04
		jsr dkong_move
		inc e5_top
		lda e5_top
		cmp #$10
		bne :+
			lda #$00
			sta e5_top
			inc e2_dir
:
@no_second:
	lda $22c+0
	cmp #$f0
	beq @no_third
		ldy e3_dir
		lda (temp_16bit_4), y
		cmp #$ff
		bne :+
			lda #$f0
			sta $22c+0
			lda #$00
			sta e3_dir
			sta e6_top
			sta s_left+2
			jmp @no_second
:		ldx #$08
		jsr dkong_move
		inc e6_top
		lda e6_top
		cmp #$10
		bne :+
			lda #$00
			sta e6_top
			inc e3_dir
:
@no_third:

	jsr dkong_anim


	lda $218+0
	clc
	adc #$03
	sta g_top
	clc
	adc #$05
	sta g_bot
	lda $218+3
	clc
	adc #$01
	sta g_left
	clc
	adc #$05
	sta g_right
	ldy #$00
	ldx #$00
:	lda $224+0, y
	clc
	adc #$01
	sta e1_top, x
	clc
	adc #$04
	sta e1_bot, x
	lda $224+3, y
	clc
	adc #$01
	sta e1_left, x
	clc
	adc #$04
	sta e1_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$03
	bne :-

	ldx #$00
dk_barrel_try:
	lda e1_left, x
	cmp g_right
		bcs dk_no_coll
	lda e1_right, x
	cmp g_left
		bcc dk_no_coll
	lda e1_top, x
	cmp g_bot
		bcs dk_no_coll
	lda e1_bot, x
	cmp g_top
		bcc dk_no_coll
			inc game_misses
			lda #$72
			sta g_counter1
			ldx #$08
			jmp return_sfx_routine
dk_hit:
			jmp end_loop
dk_no_coll:
	inx
	cpx #$03
	bne dk_barrel_try

	lda e6_hit
	bne :+
		dec e6_dir
		lda #$10
		sta e6_hit
		bne :++
:	cmp #$20
	bne :+
		inc e6_dir
		lda #$10
		sta e6_hit
:
	lda e5_hit
	bne @other
		dec e5_dir
		lda #$20
		sta e5_hit
		bne @done_y
@other:
	cmp #$40
	bne @done_y
		inc e5_dir
		lda #$20
		sta e5_hit
@done_y:

	lda e5_right
	bne :+
		jsr dkong_test_ladder
	lda e6_right		; on or off ladder
	beq :+
		jmp dk_no_right
:
	lda e5_right
	beq dk_not_jumping
		ldy e5_right
		lda $218+0
		clc
		adc dkong_jump_y, y
		sta $218+0
		dey
		sty e5_right
		bne :+
			jmp dk_no_down
:		lda e6_left
		bne :+
			lda #$dd
			sta $218+1
			lda #$41
			sta $218+2
			jmp dk_jump_left
:		lda #$dd
		sta $218+1
		lda #$01
		sta $218+2
		jmp dk_jump_right
dk_not_jumping:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq dk_no_a
		jsr do_random_set
		lda #47
		sta e5_right
		ldx #$09
		jmp return_sfx_routine
dk_jump:
		jmp dk_no_down
dk_no_a:
	lda control_pad
	and #left_punch
	beq dk_no_left
dk_jump_left:
		jsr do_random_set
		lda e6_hit
		cmp #$10
		beq :+
			cmp #$11
			bcs :++
:		ldx e5_dir
		lda dkong_coll_lo, x
		sec
		sbc #$01
		sta temp_16bit_1+0
		lda dkong_coll_hi, x
		sta temp_16bit_1+1
		ldy e6_dir
		lda (temp_16bit_1), y
		cmp #$02
		bne :+
			jmp dk_no_down
:


		lda e5_hit
		cmp #$20
		bne :+
			lda e6_right
			beq :++
:		jmp dk_no_left


:		lda e5_spd_lo
		sec
		sbc #<dkjr_chomp
		sta e5_spd_lo
		lda $218+3
		sbc #>dkjr_chomp
		sta $218+3
		lda #$00
		sta e6_left	; direction
		dec e6_hit
		inc e5_left
		jmp dk_no_down
dk_no_left:
	lda control_pad
	and #right_punch
	beq dk_no_right
dk_jump_right:
		jsr do_random_set
		lda e6_hit
		cmp #$10
		beq :+
			bcc :++
:		ldx e5_dir
		lda dkong_coll_lo, x
		sta temp_16bit_1+0
		lda dkong_coll_hi, x
		sta temp_16bit_1+1
		ldy e6_dir
		iny
		lda (temp_16bit_1), y
		cmp #$02
		bne :+
			jmp dk_no_down
:

		lda e5_hit
		cmp #$20
		bne :+
			lda e6_right
			beq :++
:		jmp dk_no_right


:



		lda e5_spd_lo
		clc
		adc #<dkjr_chomp
		sta e5_spd_lo
		lda $218+3
		adc #>dkjr_chomp
		sta $218+3
		lda #$01
		sta e6_left	; direction
		inc e6_hit
		inc e5_left
		jmp dk_no_down
dk_no_right:
	lda control_pad
	and #up_punch
	beq dk_no_up
		jsr do_random_set
		lda $218+3
		cmp #$d0
		beq :+
			cmp #$88
			beq :+
					jmp dk_no_down
:		lda e5_hit
		cmp #$20
		beq :+
			cmp #$21
			bcs :++
:		ldx e5_dir
		lda dkong_coll_lo, x
		sta temp_16bit_1+0
		lda dkong_coll_hi, x
		sta temp_16bit_1+1
		ldy e6_dir
		lda (temp_16bit_1), y
		cmp #$01
		beq :+
			jmp dk_no_down
:		lda e5_spd_lo
		sec
		sbc #<dkjr_vine
		sta e5_spd_lo
		lda $218+0
		sbc #>dkjr_vine
		sta $218+0
		lda #$01
		sta e6_right
		inc e5_left
		dec e5_hit
		jmp dk_no_down
dk_no_up:
	lda control_pad
	and #down_punch
	beq dk_no_down
		jsr do_random_set
		lda $218+3
		cmp #$d0
		beq :+
			cmp #$88
			beq :+
					jmp dk_no_down
:		lda e5_hit
		cmp #$20
		beq :+
			bcc :++
:		ldx e5_dir
		inx
		lda dkong_coll_lo, x
		sta temp_16bit_1+0
		lda dkong_coll_hi, x
		sta temp_16bit_1+1
		ldy e6_dir
		lda (temp_16bit_1), y
		cmp #$01
		beq :+
			jmp dk_no_down
:		lda e5_spd_lo
		clc
		adc #<dkjr_vine
		sta e5_spd_lo
		lda $218+0
		adc #>dkjr_vine
		sta $218+0
		lda #$01
		sta e6_right
		inc e5_left
		inc e5_hit
dk_no_down:

	lda $218+0
	cmp #$1f
	bcs :+
		lda $218+2
		eor #%00100000
		sta $218+2

:
	jsr pause_routine
	jmp end_loop
dkong_anim:
	lda e5_left
	cmp #$11
	bcc @done_anim
		lda #$00
		sta e5_left
		lda e6_right		; check ladder
		beq :++
			lda $218+2
			cmp #$41
			bne :+
				lda #$cf
				sta $218+1
				lda #$01
				sta $218+2
				jmp @done_anim
:			lda #$cf
			sta $218+1
			lda #$41
			sta $218+2
			jmp @done_anim
:
		lda e6_left
		beq @left_anim
			lda $218+1
			cmp #$dd
			bne :+
				lda #$de
				sta $218+1
				lda #$01
				sta $218+2
				jmp @done_anim
:			lda #$dd
			sta $218+1
			lda #$01
			sta $218+2
			jmp @done_anim
@left_anim:
		lda $218+1
		cmp #$dd
		bne :+
			lda #$de
			sta $218+1
			lda #$41
			sta $218+2
			jmp @done_anim
:		lda #$dd
		sta $218+1
		lda #$41
		sta $218+2
@done_anim:

	rts
dkong_jump_y:
	.byte $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	.byte $00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
dkong_test_ladder:
	lda $218+0
	cmp #$25
	beq :+
		cmp #$35
		beq :+
			cmp #$45
			beq :+
				cmp #$55
				beq :+
					lda #$01
					sta e6_right
					rts
:	lda #$00
	sta e6_right
	rts
game_nmi04:	; dkong
	jsr game_write_stats
	jmp end_nmi
dkong_coll_lo:
	.byte <dkong_coll0,<dkong_coll1,<dkong_coll2,<dkong_coll3
	.byte <dkong_coll4,<dkong_coll5,<dkong_coll6,<dkong_coll7
	.byte <dkong_coll8
dkong_coll_hi:
	.byte >dkong_coll0,>dkong_coll1,>dkong_coll2,>dkong_coll3
	.byte >dkong_coll4,>dkong_coll5,>dkong_coll6,>dkong_coll7
	.byte >dkong_coll8
dkong_coll0:
	.byte $02,$02,$02,$02,$00,$01,$00,$00,$00,$00,$00,$02
dkong_coll1:
	.byte $02,$02,$02,$02,$00,$01,$00,$00,$00,$00,$00,$02
dkong_coll2:
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02
dkong_coll3:
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02
dkong_coll4:
	.byte $02,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
dkong_coll5:
	.byte $02,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
dkong_coll6:
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02
dkong_coll7:
	.byte $02,$02,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02
dkong_coll8:
	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02	; extra data for climbing down first ladder









game_loop12: ; gmite
	lda g_counter3
	beq @not_waiting
		dec g_counter3
		bne :+
			lda #$00
			sta e6_spd_lo
:		jmp end_loop
@not_waiting:
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
	bne @done_inits
		lda #12
		sta e6_spd_lo
		ldx #$00
		ldy #$00
:		lda gmite_coll, x
		sta $740, y
		iny
		inx
		cpx e6_spd_lo
		bne :-
			lda e6_spd_lo
			clc
			adc #12
			sta e6_spd_lo
			iny
			iny
			iny
			iny
			cpy #128
			bne :-
				jsr gmite_setup
				lda #$00
				sta e6_right	; platform switch 0 and 1
				sta e6_top
				sta g_counter1
				sta g_counter2
				lda #$5a
				sta e5_left
				lda #$39
				sta $278+1
				jmp end_loop
@done_inits:
	inc e5_spd_lo

	lda e6_top
	cmp #$02
	bne :+
		lda #$72
		sta g_counter3
		jmp end_loop
:
	lda $278+1
	cmp #$30
	bne :+
		lda #$72
		sta g_counter3
		inc game_misses
		jmp end_loop
:
	dec e5_left
	bne :+
		lda #$5a
		sta e5_left
		dec $278+1
:

	lda e2_dir
	bne @go_up
		lda $21c+0
		cmp #$4f
		bne :+
			inc e2_dir
			jmp :+++
:		inc $21c+0
		jmp :++
@go_up:
	lda $21c+0
	cmp #$1f
	bne :+
		dec e2_dir
		jmp :++
:	dec $21c+0
:
	lda e6_bot
	cmp #$10
	bne :+
		lda #$00
		sta e6_bot
:	cmp #$08
	bcc :+
		lda #$ee
		sta $21c+1
		jmp :++
:	lda #$ed
	sta $21c+1
:	inc e6_bot


	ldy #$00
	ldx #$00
:	lda $218+0, y
	clc
	adc #$03
	sta e1_top, x
	clc
	adc #$03
	sta e1_bot, x
	lda $218+3, y
	clc
	adc #$03
	sta e1_left, x
	clc
	adc #$03
	sta e1_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$04
	bne :-

	ldx #$00
gmite_coll_test:
	lda e2_left, x
	cmp e1_right
		bcs gmite_no_coll
	lda e2_right, x
	cmp e1_left
		bcc gmite_no_coll
	lda e2_top, x
	cmp e1_bot
		bcs gmite_no_coll
	lda e2_bot, x
	cmp e1_top
		bcc gmite_no_coll
			cpx #$01
			bcs :+
				lda #$72
				sta g_counter3
				inc game_misses
				jmp end_loop
:			beq :+
				ldy #$04
				bne :++
:			ldy #$00
:			lda #$f0
			sta $220+0, y
			jsr do_score
			inc e6_top
			ldx #$1b
			jmp return_sfx_routine
gmite_beep:
			jmp gmite_done_coll
gmite_no_coll:
	inx
	cpx #$03
	bne gmite_coll_test
gmite_done_coll:



	lda g_counter1
	cmp #$07
	beq :+
;		cmp #$00
;		bne :+
	ldx s_top
	inx
	lda gmite_coll_lo, x
	sta temp_16bit_1+0
	lda #$07
	sta temp_16bit_1+1
	ldy s_bot
	lda (temp_16bit_1), y
	bne :+
		lda #$07
		sta g_counter1
		lda #17
		sta g_counter2
:
	jsr gmite_movement
	lda g_counter1
	beq :+
		jmp gmite_no_control
:

	
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq gmite_no_a
		jsr do_random_set
		jsr gmite_switch_plat
		ldx #$1c
		jmp return_sfx_routine
gmite_woosh:
		jmp gmite_no_control
gmite_no_a:
	lda control_pad
	and #left_punch
	beq gmite_no_left
		jsr do_random_set
		lda $218+3
		cmp #$80
		bne :+
			jmp gmite_no_control
:		ldx s_top
		lda gmite_coll_lo, x
		sec
		sbc #$01
		sta temp_16bit_1+0
		lda #$07
		sta temp_16bit_1+1
		ldy s_bot
		lda (temp_16bit_1), y
		cmp #$02
		bne :+
			jsr gmite_test_upleft
			jmp gmite_no_control
:		lda #$01
		sta g_counter1
		lda #$01
		sta e1_dir
		jmp gmite_set_counter
gmite_no_left:
	lda control_pad
	and #right_punch
	beq gmite_no_right
		jsr do_random_set
		lda $218+3
		cmp #$d8
		bne :+
			jmp gmite_no_control
:		ldx s_top
		lda gmite_coll_lo, x
		sta temp_16bit_1+0
		lda #$07
		sta temp_16bit_1+1
		ldy s_bot
		iny
		lda (temp_16bit_1), y
		cmp #$02
		bne :+
			jsr gmite_test_upright
			jmp gmite_no_control
:		lda #$02
		sta g_counter1
		lda #$00
		sta e1_dir
		jmp gmite_set_counter
gmite_no_right:
	lda control_pad
	and #up_punch
	beq gmite_no_up
		jsr do_random_set
		lda $218+0
		cmp #$1f
		bne :+
			jmp gmite_no_control
:		ldx s_top
		dex
		lda gmite_coll_lo, x
		sta temp_16bit_1+0
		lda #$07
		sta temp_16bit_1+1
		ldy s_bot
		lda (temp_16bit_1), y
		cmp #$01
		bne gmite_no_control
			lda #$03
			sta g_counter1
			jmp gmite_set_counter
gmite_no_up:
	lda control_pad
	and #down_punch
	beq gmite_no_down
		jsr do_random_set
		lda $218+0
		cmp #$4f
		bne :+
			jmp gmite_no_control
:		ldx s_top
		lda gmite_coll_lo, x
		sta temp_16bit_1+0
		lda #$07
		sta temp_16bit_1+1
		ldy s_bot
		lda (temp_16bit_1), y
		cmp #$01
		bne gmite_no_control
			lda #$04
			sta g_counter1
			jmp gmite_set_counter
gmite_no_down:
gmite_set_counter:
	lda #17
	sta g_counter2
gmite_no_control:
	jsr pause_routine
	jmp end_loop

gmite_test_upright:
	ldx s_top
	dex
	lda gmite_coll_lo, x
	sta temp_16bit_1+0
	lda #$07
	sta temp_16bit_1+1
	ldy s_bot
	lda (temp_16bit_1), y
	cmp #$02
	beq :+
		lda #$06
		sta g_counter1
		lda #17
		sta g_counter2
:
	rts
gmite_test_upleft:
	ldx s_top
	dex
	lda gmite_coll_lo, x
	sta temp_16bit_1+0
	lda #$07
	sta temp_16bit_1+1
	ldy s_bot
	lda (temp_16bit_1), y
	cmp #$02
	beq :+
		lda #$05
		sta g_counter1
		lda #17
		sta g_counter2
:
	rts
gmite_movement:
	lda g_counter1
	asl a
	tay
	lda gmite_movement_table+1, y
	pha
	lda gmite_movement_table+0, y
	pha
	rts
gmite_movement_table:
	.addr gmite_still-1, gmite_left-1, gmite_right-1, gmite_up-1, gmite_down-1
	.addr gmite_upleft-1, gmite_upright-1, gmite_fall-1
gmite_still:
	ldx s_top
	lda gmite_coll_lo, x
	sta temp_16bit_1+0
	lda #$07
	sta temp_16bit_1+1
	ldy s_bot
	lda (temp_16bit_1), y
	cmp #$01
	bne :+
		lda #$da
		sta $218+1
		lda #$01
		sta $218+2
		rts
:	lda e1_dir
	beq :+
		lda #$d6
		sta $218+1
		lda #$41
		sta $218+2
		rts
:	lda #$d6
	sta $218+1
	lda #$01
	sta $218+2
	rts
gmite_left:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		dec s_bot
		rts
:	lda g_counter2
	cmp #$08
	bcc :+
		lda #$d7
		sta $218+1
		lda #$41
		sta $218+2
		bne :++
:	lda #$d8
	sta $218+1
	lda #$41
	sta $218+2
:	lda e1_spd_lo
	sec
	sbc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+3
	sbc #>dkjr_chomp
	sta $218+3
	rts
gmite_right:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		inc s_bot
		rts
:	lda g_counter2
	cmp #$08
	bcc :+
		lda #$d7
		sta $218+1
		lda #$01
		sta $218+2
		bne :++
:	lda #$d8
	sta $218+1
	lda #$01
	sta $218+2
:	lda e1_spd_lo
	clc
	adc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+3
	adc #>dkjr_chomp
	sta $218+3
	rts
gmite_up:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		dec s_top
		rts
:	lda g_counter2
	cmp #$08
	bcc :+
		lda #$da
		sta $218+1
		lda #$01
		sta $218+2
		bne :++
:	lda #$d9
	sta $218+1
	lda #$01
	sta $218+2
:	lda e1_spd_lo
	sec
	sbc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+0
	sbc #>dkjr_chomp
	sta $218+0
	rts
gmite_down:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		inc s_top
		rts
:	lda #$da
	sta $218+1
	lda #$01
	sta $218+2
	lda e1_spd_lo
	clc
	adc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+0
	adc #>dkjr_chomp
	sta $218+0
	rts
gmite_upleft:
	dec g_counter2
	bne :+
		lda #$01
		sta e1_dir
		lda #$00
		sta g_counter1
		dec s_top
		dec s_bot
		rts
:	lda #$d7
	sta $218+1
	lda #$41
	sta $218+2
	lda e1_spd_lo
	sec
	sbc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+0
	sbc #>dkjr_chomp
	sta $218+0
	lda e6_left
	sec
	sbc #<dkjr_chomp
	sta e6_left
	lda $218+3
	sbc #>dkjr_chomp
	sta $218+3
	rts
gmite_upright:
	dec g_counter2
	bne :+
		lda #$00
		sta e1_dir
		sta g_counter1
		dec s_top
		inc s_bot
		rts
:	lda #$d7
	sta $218+1
	lda #$01
	sta $218+2
	lda e1_spd_lo
	sec
	sbc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+0
	sbc #>dkjr_chomp
	sta $218+0
	lda e6_left
	clc
	adc #<dkjr_chomp
	sta e6_left
	lda $218+3
	adc #>dkjr_chomp
	sta $218+3
	rts
gmite_fall:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		inc s_top
		rts
:	lda e1_spd_lo
	clc
	adc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+0
	adc #>dkjr_chomp
	sta $218+0
	rts
gmite_coll_lo:
	.byte $40,$50,$60,$70,$80,$90,$a0,$b0
gmite_coll:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
gmite_switch_plat:
	lda e6_right
	bne @do_one
		ldx #$00
:		lda $260+0, x
		clc
		adc #$08
		sta $260+0, x
		inx
		inx
		inx
		inx
		cpx #24
		bne :-
		ldy #$00
:		lda e1_hit, y
		tax
		lda #$00
		sta $700, x
		iny
		cpy #$06
		bne :-
		ldy #$00
:		lda e1_hit, y
		clc
		adc #$10
		sta e1_hit, y
		iny
		cpy #$06
		bne :-
		ldy #$00
:		lda e1_hit, y
		tax
		lda #$02
		sta $700, x
		iny
		cpy #$06
		bne :-
		lda #$01
		sta e6_right
		jmp @test_move_up
@do_one:
	ldx #$00
:	lda $260+0, x
	sec
	sbc #$08
	sta $260+0, x
	inx
	inx
	inx
	inx
	cpx #24
	bne :-
	ldy #$00
:	lda e1_hit, y
	tax
	lda #$00
	sta $700, x
	iny
	cpy #$06
	bne :-
	ldy #$00
:	lda e1_hit, y
	sec
	sbc #$10
	sta e1_hit, y
	iny
	cpy #$06
	bne :-
	ldy #$00
:	lda e1_hit, y
	tax
	lda #$02
	sta $700, x
	iny
	cpy #$06
	bne :-
	lda #$00
	sta e6_right
@test_move_up:
	ldx s_top
	lda gmite_coll_lo, x
	sta temp_16bit_1+0
	lda #$07
	sta temp_16bit_1+1
	ldy s_bot
	lda (temp_16bit_1), y
	cmp #$02
	bne :+
		lda $218+0
		sec
		sbc #$08
		sta $218+0
		dec s_top
:
	rts
gmite_chars_offset:
	.byte 192,128,64,0
gmite_p_spr_y:
	.byte $1f,$2f,$4f,$4f
gmite_p_spr_x:
	.byte $88,$d8,$d8,$80
gmite_p_pos_y:
	.byte $00,$02,$06,$06
gmite_p_pos_x:
	.byte $01,$0b,$0b,$00
gmite_e_spr_y:
	.byte $1f,$3f,$2f;$2f,$1f,$3f,$1f
gmite_e_spr_x:
	.byte $90,$d0,$b0;$c8,$98,$a8,$d8
gmite_e_pos_y:
	.byte $02,$00,$02,$00
gmite_e_pos_x:
	.byte $09,$03,$05,$0b
gmite_offset_bombs:
	.byte 210,168,126,84,42,0
gmite_bomb0_y:
	.byte $1f,$2f,$1f,$2f,$2f,$1f
gmite_bomb0_x:
	.byte $a8,$b8,$d8,$98,$88,$b8
gmite_bomb1_y:
	.byte $3f,$3f,$3f,$1f,$3f,$3f
gmite_bomb2_x:
	.byte $c8,$d8,$98,$c8,$b8,$a8
gmite_offset_coll:
	.byte 170,85,0
gmite_plat_coll_lo:
	.byte <gmite_plat_coll0,<gmite_plat_coll1,<gmite_plat_coll2
gmite_plat_coll_hi:
	.byte >gmite_plat_coll0,>gmite_plat_coll1,>gmite_plat_coll2
gmite_vine_coll_lo:
	.byte <gmite_vine_coll0,<gmite_vine_coll1,<gmite_vine_coll2
gmite_vine_coll_hi:
	.byte >gmite_vine_coll0,>gmite_vine_coll1,>gmite_vine_coll2
gmite_setup_spr_lo:
	.byte <gmite_setup_spr0,<gmite_setup_spr1,<gmite_setup_spr2
gmite_setup_spr_hi:
	.byte >gmite_setup_spr0,>gmite_setup_spr1,>gmite_setup_spr2
gmite_setup:
	ldx #$ff
:	inx
	lda seed
	cmp gmite_offset_coll, x
	bcc :-
		stx e6_spd_lo
		ldy #$00
		lda gmite_setup_spr_lo, x
		sta temp_16bit_1+0
		lda gmite_setup_spr_hi, x
		sta temp_16bit_1+1
:		lda (temp_16bit_1), y
		sta $228, y
		iny
		cpy #80
		bne :-
			lda gmite_e_spr_y, x
			sta $21c+0
			lda gmite_e_spr_x, x
			sta $21c+3
		ldy #$00
		lda gmite_vine_coll_lo, x
		sta temp_16bit_1+0
		lda gmite_vine_coll_hi, x
		sta temp_16bit_1+1
:		lda (temp_16bit_1), y
		tax
		lda #$01
		sta $700, x
		iny
		cpy #14
		bne :-
		ldy #$00
		ldx e6_spd_lo
		lda gmite_plat_coll_lo, x
		sta temp_16bit_1+0
		lda gmite_plat_coll_hi, x
		sta temp_16bit_1+1
:		lda (temp_16bit_1), y
		tax
		lda #$02
		sta $700, x
		iny
		cpy #$06
		bne :-
		ldx #$00
		ldy #$00
:		lda (temp_16bit_1), y
		sta e1_hit, x
		iny
		inx
		cpx #$06
		bne :-
		ldx #$ff
:		inx
		lda nmi_num
		cmp gmite_offset_bombs, x
		bcc :-
			lda gmite_bomb0_y, x
			sta $220+0
			lda gmite_bomb0_x, x
			sta $220+3
			lda gmite_bomb1_y, x
			sta $224+0
			lda gmite_bomb2_x, x
			sta $224+3
		ldx #$ff
:		inx
		lda e5_spd_lo
		cmp gmite_chars_offset, x
		bcc :-
			lda gmite_p_spr_y, x
			sta $218+0
			lda gmite_p_spr_x, x
			sta $218+3
			lda gmite_p_pos_y, x
			sta s_top
			lda gmite_p_pos_x, x
			sta s_bot
			lda gmite_e_pos_y, x
			sta s_left
			lda gmite_e_pos_x, x
			sta s_right
		lda #$01
		sta e6_spd_lo
		rts
gmite_plat_coll0:
	.byte $64,$a4,$66,$a6,$6a,$aa
gmite_plat_coll1:
	.byte $62,$a2,$66,$a6,$68,$a8
gmite_plat_coll2:
	.byte $62,$a2,$64,$a4,$6a,$aa

gmite_vine_coll0:
	.byte $42,$52,$62,$72,$82,$92,$a2
	.byte $48,$58,$68,$78,$88,$98,$a8
gmite_vine_coll1:
	.byte $44,$54,$64,$74,$84,$94,$a4
	.byte $4a,$5a,$6a,$7a,$8a,$9a,$aa
gmite_vine_coll2:
	.byte $46,$56,$66,$76,$86,$96,$a6
	.byte $48,$58,$68,$78,$88,$98,$a8
gmite_setup_spr0:
	.byte $1f,$dd,$03,$90
	.byte $27,$dd,$03,$90
	.byte $2f,$dd,$03,$90
	.byte $37,$dd,$03,$90
	.byte $3f,$dd,$03,$90
	.byte $47,$dd,$03,$90
	.byte $4f,$dd,$03,$90
	.byte $1f,$dd,$03,$c0
	.byte $27,$dd,$03,$c0
	.byte $2f,$dd,$03,$c0
	.byte $37,$dd,$03,$c0
	.byte $3f,$dd,$03,$c0
	.byte $47,$dd,$03,$c0
	.byte $4f,$dd,$03,$c0
	.byte $2f,$db,$02,$a0
	.byte $4f,$db,$02,$a0
	.byte $2f,$db,$02,$b0
	.byte $4f,$db,$02,$b0
	.byte $2f,$db,$02,$d0
	.byte $4f,$db,$02,$d0
gmite_setup_spr1:
	.byte $1f,$dd,$03,$a0
	.byte $27,$dd,$03,$a0
	.byte $2f,$dd,$03,$a0
	.byte $37,$dd,$03,$a0
	.byte $3f,$dd,$03,$a0
	.byte $47,$dd,$03,$a0
	.byte $4f,$dd,$03,$a0
	.byte $1f,$dd,$03,$d0
	.byte $27,$dd,$03,$d0
	.byte $2f,$dd,$03,$d0
	.byte $37,$dd,$03,$d0
	.byte $3f,$dd,$03,$d0
	.byte $47,$dd,$03,$d0
	.byte $4f,$dd,$03,$d0
	.byte $2f,$db,$02,$90
	.byte $4f,$db,$02,$90
	.byte $2f,$db,$02,$b0
	.byte $4f,$db,$02,$b0
	.byte $2f,$db,$02,$c0
	.byte $4f,$db,$02,$c0
gmite_setup_spr2:
	.byte $1f,$dd,$03,$b0
	.byte $27,$dd,$03,$b0
	.byte $2f,$dd,$03,$b0
	.byte $37,$dd,$03,$b0
	.byte $3f,$dd,$03,$b0
	.byte $47,$dd,$03,$b0
	.byte $4f,$dd,$03,$b0
	.byte $1f,$dd,$03,$c0
	.byte $27,$dd,$03,$c0
	.byte $2f,$dd,$03,$c0
	.byte $37,$dd,$03,$c0
	.byte $3f,$dd,$03,$c0
	.byte $47,$dd,$03,$c0
	.byte $4f,$dd,$03,$c0
	.byte $2f,$db,$02,$90
	.byte $4f,$db,$02,$90
	.byte $2f,$db,$02,$a0
	.byte $4f,$db,$02,$a0
	.byte $2f,$db,$02,$d0
	.byte $4f,$db,$02,$d0
game_nmi12: ; gmite
	jsr game_write_stats
	jmp end_nmi
	









popeye_spr_mirror: ; popeye
	.byte $46,$e7,$01,$90 ; 218 popeye
	.byte $36,$e9,$02,$c8 ; 21c bluto
	.byte $f0,$ec,$03,$b8 ; 220 heart
	.byte $26,$eb,$03,$b0 ; 224 olive
popeye_heart_x:
	.byte $80,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$80
game_loop19: ; popeye

	lda g_counter3
	beq @no_wait
		dec g_counter3
		bne :++
			ldx #$00
:			lda popeye_spr_mirror, x
			sta $218+0, x
			inx
			cpx #$10
			bne :-
			lda #$00
			sta e6_spd_lo
			sta e5_dir
			sta g_counter1
			sta g_counter2
			sta e1_dir
:		jmp end_loop
@no_wait:
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
	bne @no_inits
		lda #$ff
		sta e2_hit
		lda #$04
		sta s_bot		; popeye x
		lda #$02
		sta s_top		; popeye y
		sta e6_spd_lo
		jmp end_loop
@no_inits:

	ldx #$00
	ldy #$00
:	lda $218+0, y
	clc
	adc #$01
	sta e1_top, x
	clc
	adc #$04
	sta e1_bot, x
	lda $218+3, y
	clc
	adc #$02
	sta e1_left, x
	clc
	adc #$04
	sta e1_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$03
	bne :-

	ldx #$00
peye_test_hit:
	lda e2_left, x
	cmp e1_right
		bcs peye_no_coll
	lda e2_right, x
	cmp e1_left
		bcc peye_no_coll
	lda e2_top, x
	cmp e1_bot
		bcs peye_no_coll
	lda e2_bot, x
	cmp e1_top
		bcc peye_no_coll
			cpx #$01
			beq :+
				lda #$72
				sta g_counter3
				inc game_misses
				ldx #$2c
				jmp return_sfx_routine
peye_hit:
				jmp end_loop
:			jsr do_score
			lda #$f0
			sta $220+0
			ldx #$2b
			jmp return_sfx_routine
peye_beep:
			jmp peye_done_hits
peye_no_coll:
	inx
	cpx #$02
	bne peye_test_hit
peye_done_hits:

	lda e2_hit
	bne @no_vert_change
		inc e5_dir
		lda e5_dir
		cmp #$20
		bne @not_move_yet
			lda $218+0
			cmp $21c+0
			bne :+
				beq :+++
:			bcc :+
				lda $21c+0
				clc
				adc #$08
				sta $21c+0
				jmp :++
:			lda $21c+0
			sec
			sbc #$08
			sta $21c+0
:			lda $218+3
			cmp $21c+3
			bcc :+
				lda #$01
				sta e2_dir
				jmp :++
:			lda #$00
			sta e2_dir
:			lda #$00
			sta e5_dir
			dec e2_hit
			jmp @done_bluto
@not_move_yet:
	jmp @done_bluto
@no_vert_change:
	dec e2_hit
	lda $21c+3
	cmp #$80
	bne :++
:		lda e2_dir
		eor #$01
		sta e2_dir
		jmp :++
:	cmp #$d8
	bne :+
		beq :--
:	lda e2_dir
	beq :+
		lda e2_spd_lo
		clc
		adc #<dkjr_vine
		sta e2_spd_lo
		lda $21c+3
		adc #>dkjr_vine
		sta $21c+3
		jmp @done_bluto
:	lda e2_spd_lo
	sec
	sbc #<dkjr_vine
	sta e2_spd_lo
	lda $21c+3
	sbc #>dkjr_vine
	sta $21c+3
@done_bluto:
	lda e2_dir
	beq @left
		lda #$42
		sta $21c+2
		bne :+
@left:
	lda #$02
	sta $21c+2
:	lda e5_hit
	cmp #$10
	bne :+
		lda #$00
		sta e5_hit
:	lda e5_hit
	cmp #$08
	bcc :+
		lda #$e9
		sta $21c+1
		bne :++
:	lda #$e8
	sta $21c+1
:	inc e5_hit

	jsr popeye_do_heart
	jsr popeye_do_olive
	jsr popeye_movement

	lda g_counter1
	beq :+
		jmp @no_control
:	lda control_pad
	and #left_punch
	beq @no_left
		jsr do_random_set
		lda #$01
		sta e1_dir
		lda $218+3
		cmp #$80
		bne :+
			jmp @no_control
:		lda #$01
		sta g_counter1
		jmp @set_counter
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		jsr do_random_set
		lda #$00
		sta e1_dir
		lda $218+3
		cmp #$d8
		bne :+
			jmp @no_control
:		lda #$02
		sta g_counter1
		jmp @set_counter
@no_right:
	lda control_pad
	and #up_punch
	beq @no_up
		jsr do_random_set
		ldx s_top
		lda popeye_coll_lo, x
		sta temp_16bit_1+0
		lda popeye_coll_hi, x
		sta temp_16bit_1+1
		ldy s_bot
		lda (temp_16bit_1), y
		bne :+
			jmp @no_control
:		cmp #$01
		bne :+
			lda #$05
			sta g_counter1
			jmp popeye_vert_counter
:		cmp #$02
		bne :+
			lda #$06
			sta g_counter1
			jmp popeye_vert_counter
:		lda #$03
		sta g_counter1
		jmp popeye_set_ladder
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		jsr do_random_set
		ldx s_top
		inx
		lda popeye_coll_lo, x
		sta temp_16bit_1+0
		lda popeye_coll_hi, x
		sta temp_16bit_1+1
		ldy s_bot
		lda (temp_16bit_1), y
		cmp #$03
		bne :+
			lda #$04
			sta g_counter1
			jmp popeye_set_ladder
:		iny
		lda (temp_16bit_1), y
		cmp #$01
		bne :+
			lda #$08
			sta g_counter1
			jmp popeye_vert_counter
:		dey
		dey
		lda (temp_16bit_1), y
		cmp #$02
		bne :+
			lda #$07
			sta g_counter1
			jmp popeye_vert_counter
:		jmp @no_control
@no_down:
@set_counter:
	lda #17
	sta g_counter2
@no_control:
	jsr pause_routine
	jmp end_loop
popeye_vert_counter:
	lda #33
	sta g_counter2
	jsr pause_routine
	jmp end_loop
popeye_set_ladder:
	lda #65
	sta g_counter2
	jsr pause_routine
	jmp end_loop
popeye_do_heart:
	lda $220+0
	cmp #$f0
	bne :+
		jmp @done_heart
:	cmp #$49
	bcc :+
		jmp @done_heart
:	lda e3_spd_lo
	clc
	adc #<popeye_heart
	sta e3_spd_lo
	lda $220+0
	adc #>popeye_heart
	sta $220+0
	ldx e3_hit
	lda $220+3
	clc
	adc popeye_heart_x, x
	sta $220+3
	lda e3_dir
	beq :+
		dex
		stx e3_hit
		jmp :++
:	inx
	stx e3_hit
:	lda popeye_heart_x, x
	cmp #$80
	bne @done_heart
		lda e3_dir
		eor #$01
		sta e3_dir
		beq :+
			dex
			stx e3_hit
			jmp @done_heart
:	inx
	stx e3_hit
@done_heart:
	rts
popeye_do_olive:
	lda $220+0
	cmp #$f0
	bne :+
		lda $224+3
		sta $220+3
		lda $224+0
		sta $220+0
		lda #$01
		sta e3_hit
		lda #$00
		sta e3_dir
:
	lda $224+3
	cmp #$8e
	bne :+
		lda #$00
		sta e4_dir
		jmp :++
:	cmp #$ca
	bne :+
		lda #$01
		sta e4_dir
:
	lda e4_dir
	beq @move_right
		lda e4_hit
		sec
		sbc #<dkjr_vine
		sta e4_hit
		lda $224+3
		sbc #>dkjr_vine
		sta $224+3
		lda #$43
		sta $224+2
		jmp @tile
@move_right:
	lda e4_hit
	clc
	adc #<dkjr_vine
	sta e4_hit
	lda $224+3
	adc #>dkjr_vine
	sta $224+3
	lda #$03
	sta $224+2
@tile:
	lda $224+3
	bne :+
		lda #$ea
		sta $224+1
		bne @done_move
:	and #%00000100
	bne :+
		lda #$eb
		sta $224+1
		bne @done_move
:	and #%00001000
	bne :+
		lda #$ea
		sta $224+1
		bne @done_move
:	and #%00001100
		lda #$eb
		sta $224+1
@done_move:
	rts
popeye_movement:
	lda g_counter1
	asl a
	tay
	lda popeye_movement_table+1, y
	pha
	lda popeye_movement_table+0, y
	pha
	rts
popeye_movement_table:
	.addr popeye_still-1,popeye_left-1,popeye_right-1,popeye_up-1,popeye_down-1
	.addr popeye_upleft-1,popeye_upright-1,popeye_downleft-1,popeye_downright-1
popeye_still:
	lda #$e7
	sta $218+1
	lda e1_dir
	beq :+
		lda #$41
		sta $218+2
		rts
:	lda #$01
	sta $218+2
	rts
popeye_left:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		dec s_bot
		rts
:	lda g_counter2
	cmp #$08
	bcc :+
		lda #$e7
		sta $218+1
		bne :++
:	lda #$e6
	sta $218+1
:	lda #$41
	sta $218+2
	lda e1_spd_lo
	sec
	sbc #<dkjr_vine
	sta e1_spd_lo
	lda $218+3
	sbc #>dkjr_vine
	sta $218+3
	rts
popeye_right:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		inc s_bot
		rts
:	lda g_counter2
	cmp #$08
	bcc :+
		lda #$e7
		sta $218+1
		bne :++
:	lda #$e6
	sta $218+1
:	lda #$01
	sta $218+2
	lda e1_spd_lo
	clc
	adc #<dkjr_vine
	sta e1_spd_lo
	lda $218+3
	adc #>dkjr_vine
	sta $218+3
	rts
popeye_upleft:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		lda #$01
		sta e1_dir
		dec s_top
		dec s_bot
		rts
:	lda #$e6
	sta $218+1
	lda #$41
	sta $218+2
	lda e1_spd_lo
	sec
	sbc #<popeye_vert
	sta e1_spd_lo
	lda $218+3
	sbc #>popeye_vert
	sta $218+3
	lda e4_spd_lo
	sec
	sbc #<dkjr_vine
	sta e4_spd_lo
	lda $218+0
	sbc #>dkjr_vine
	sta $218+0
	rts
popeye_upright:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		sta e1_dir
		dec s_top
		inc s_bot
		rts
:	lda #$e6
	sta $218+1
	lda #$01
	sta $218+2
	lda e1_spd_lo
	clc
	adc #<popeye_vert
	sta e1_spd_lo
	lda $218+3
	adc #>popeye_vert
	sta $218+3
	lda e4_spd_lo
	sec
	sbc #<dkjr_vine
	sta e4_spd_lo
	lda $218+0
	sbc #>dkjr_vine
	sta $218+0
	rts
popeye_downleft:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		lda #$01
		sta e1_dir
		inc s_top
		dec s_bot
		rts
:	lda #$e6
	sta $218+1
	lda #$41
	sta $218+2
	lda e1_spd_lo
	sec
	sbc #<popeye_vert
	sta e1_spd_lo
	lda $218+3
	sbc #>popeye_vert
	sta $218+3
	lda e4_spd_lo
	clc
	adc #<dkjr_vine
	sta e4_spd_lo
	lda $218+0
	adc #>dkjr_vine
	sta $218+0
	rts
popeye_downright:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		sta e1_dir
		inc s_top
		inc s_bot
		rts
:	lda #$e6
	sta $218+1
	lda #$01
	sta $218+2
	lda e1_spd_lo
	clc
	adc #<popeye_vert
	sta e1_spd_lo
	lda $218+3
	adc #>popeye_vert
	sta $218+3
	lda e4_spd_lo
	clc
	adc #<dkjr_vine
	sta e4_spd_lo
	lda $218+0
	adc #>dkjr_vine
	sta $218+0
	rts
popeye_up:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		dec s_top
		rts
:	lda e4_spd_lo
	sec
	sbc #<popeye_vert
	sta e4_spd_lo
	lda $218+0
	sbc #>popeye_vert
	sta $218+0
	lda #$f9
	sta $218+1
	lda $218+2
	cmp #$01
	beq :+
		lda #$01
		sta $218+2
		rts
:	lda #$41
	sta $218+2
	rts
popeye_down:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		inc s_top
		rts
:	lda e4_spd_lo
	clc
	adc #<popeye_vert
	sta e4_spd_lo
	lda $218+0
	adc #>popeye_vert
	sta $218+0
	lda #$f9
	sta $218+1
	lda $218+2
	cmp #$01
	beq :+
		lda #$01
		sta $218+2
		rts
:	lda #$41
	sta $218+2
	rts
popeye_coll_lo:
	.byte <popeye_coll0,<popeye_coll1,<popeye_coll2,<popeye_coll3
popeye_coll_hi:
	.byte >popeye_coll0,>popeye_coll1,>popeye_coll2,>popeye_coll3
popeye_coll0:
	.byte $00,$00,$00,$00, $00,$00,$00,$00, $00,$00,$00,$00, $00,$00,$00,$00, $00,$00,$00,$00, $00,$00,$00
popeye_coll1:
	.byte $00,$01,$00,$00, $00,$00,$00,$00, $00,$00,$00,$03, $00,$00,$00,$00, $00,$00,$00,$00, $00,$02,$00
popeye_coll2:
	.byte $00,$01,$00,$00, $00,$00,$00,$02, $00,$00,$00,$00, $00,$00,$00,$01, $00,$00,$00,$00, $00,$02,$00
popeye_coll3:
	.byte $04,$04,$04,$04, $04,$04,$04,$04, $04,$04,$04,$04, $04,$04,$04,$04, $04,$04,$04,$04, $04,$04,$04
game_nmi19:	; popeye
	jsr game_write_stats
	jmp end_nmi

cc_spr_mirror: ; cc land
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
cc_offset:
	.byte 192,128,64,0
cc_coins_total:
	.byte $0e,$0f,$0d,$0e
cc_coins_all:
	.byte $1c,$1e,$1a,$1c
cc_coins_score_test:
	.byte $38,$3c,$34,$38
cc_coins_lo:
	.byte <cc_coins0,<cc_coins1,<cc_coins2,<cc_coins3
cc_coins_hi:
	.byte >cc_coins0,>cc_coins1,>cc_coins2,>cc_coins3
cc_coins0:
	.byte $33,$9b,$33,$a3,$33,$b3,$33,$bb,$43,$9b,$43,$bb,$2f,$9f
	.byte $2f,$b7,$37,$9f,$37,$b7,$47,$9f,$47,$a7,$47,$af,$47,$b7
cc_coins1:
	.byte $33,$a3,$33,$b3,$3b,$ab,$43,$9b,$4b,$9b,$43,$bb,$4b,$bb,$2f,$a7
	.byte $37,$a7,$2f,$af,$37,$af,$3f,$9f,$3f,$a7,$3f,$af,$3f,$b7
cc_coins2:
	.byte $2b,$b3,$2b,$c3,$33,$b3,$33,$c3,$3b,$b3,$3b,$c3,$43,$a3
	.byte $43,$c3,$4b,$9b,$4b,$c3,$3f,$a7,$3f,$af,$47,$9f
cc_coins3:
	.byte $33,$9b,$33,$bb,$3b,$9b,$3b,$bb,$43,$bb,$4b,$bb,$2f,$9f
	.byte $2f,$a7,$2f,$af,$2f,$b7,$3f,$9f,$3f,$a7,$3f,$af,$3f,$b7
cc_words_lo:
	.byte <cc_words0,<cc_words1,<cc_words2,<cc_words3
cc_words_hi:
	.byte >cc_words0,>cc_words1,>cc_words2,>cc_words3
cc_words0:
	.byte "CLIK"
cc_words1:
	.byte "HEAD"
cc_words2:
	.byte "BOOT"
cc_words3:
	.byte "FLAG"
game_loop03: ; cc land

	lda g_counter3
	beq @no_wait
		dec g_counter3
		bne :++
			ldx #$00
:			lda cc_spr_mirror, x
			sta $218+0, x
			inx
			cpx #72
			bne :-
			lda #$00
			sta e6_spd_lo
:		jmp end_loop
@no_wait:
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
	beq :+
		jmp @done_init
:		lda #$00
		sta s_left
		sta s_right
		sta s_top
		sta s_bot
		sta e2_dir
		sta e1_dir
		sta e1_hit
		lda #$41
		sta g_counter2
		lda #$21
		sta g_counter1
		lda #$00
		sta e3_dir
		ldx #$ff
:		inx
		lda seed
		cmp cc_offset, x
		bcc :-
			lda cc_words_lo, x
			sta temp_16bit_1+0
			lda cc_words_hi, x
			sta temp_16bit_1+1
			ldy #$00
			sty s_left
			sty s_right
			sty s_top
			sty s_bot
:			lda (temp_16bit_1), y
			sta e3_bot, y
			iny
			cpy #$04
			bne :-
			lda cc_coins_total, x
			sta e4_dir
			lda cc_coins_all, x
			sta e5_dir
			lda cc_coins_score_test, x
			sta e6_dir
			lda cc_coins_lo, x
			sta temp_16bit_1+0
			lda cc_coins_hi, x
			sta temp_16bit_1+1
			ldx #$00
			ldy #$00
:			lda (temp_16bit_1), y
			sta $220+0, x
			iny
			lda (temp_16bit_1), y
			sta $220+3, x
			inx
			inx
			inx
			inx
			iny
			cpy e5_dir
			bne :-

		lda #$01
		sta e6_spd_lo
		jmp end_loop
@done_init:

	lda e4_dir
	cmp e3_dir
	bne :+
		lda #$f0
		sta $218+0
		sta $21c+0
		lda #$72
		sta g_counter3
		lda e3_bot
		sta s_left
		lda e4_bot
		sta s_right
		lda e5_bot
		sta s_top
		lda e6_bot
		sta s_bot
		jmp end_loop
:

	ldy #$00
cc_start_coins:
	lda $218+0
	cmp $220+0, y
	bne cc_inc_it
		lda $218+3
		cmp $220+3, y
		bne cc_inc_it
			lda $220+1, y
			beq :+
				jmp cc_done_coins
:			ldx #$05
			jmp return_sfx_routine
cc_beep:
			lda $220+3, y
			and #$0f
			cmp #$03
			bne :+
				lda #$ec
				sta $220+1, y
				inc e3_dir
				jsr do_score
				jmp cc_done_coins
:			cmp #$0b
			bne :+
				lda #$ec
				sta $220+1, y
				inc e3_dir
				jsr do_score
				jmp cc_done_coins
:			lda #$ed
			sta $220+1, y
			inc e3_dir
			jsr do_score
			jmp cc_done_coins
cc_inc_it:
	iny
	iny
	iny
	iny
	cpy e6_dir
	bne cc_start_coins
cc_done_coins:

	lda pal_address+27
	cmp #$27
	bne :+
		lda #$30
		sta pal_address+27
		bne :++
:	lda #$27
	sta pal_address+27
:

	ldx #$00
	ldy #$00
:	lda $218+0, y
	clc
	adc #$01
	sta e1_top, x
	clc
	adc #$05
	sta e1_bot, x
	lda $218+3, y
	clc
	adc #$01
	sta e1_left, x
	clc
	adc #$05
	sta e1_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$02
	bne :-

	lda e2_left
	cmp e1_right
		bcs cc_no_coll
	lda e2_right
	cmp e1_left
		bcc cc_no_coll
	lda e2_top
	cmp e1_bot
		bcs cc_no_coll
	lda e2_bot
	cmp e1_top
		bcc cc_no_coll
			inc game_misses
			lda #$72
			sta g_counter3
			ldx #$06
			jmp return_sfx_routine
cc_hit:
			jmp end_loop
cc_no_coll:

	lda g_counter2
	beq :+
		jmp @no_new
:		lda $218+0
		cmp $21c+0
		bne @not_h_align
			lda $218+3
			cmp $21c+3
			bcs :+
				lda #$04
				sta e2_dir
				jmp @fast
:			lda #$05
			sta e2_dir
			jmp @fast
@not_h_align:
		lda $218+3
		cmp $21c+3
		bne @not_v_align
			lda $218+0
			cmp $21c+0
			bcs :+
				lda #$06
				sta e2_dir
				jmp @fast
:			lda #$07
			sta e2_dir
			jmp @fast
@not_v_align:
	lda $218+3				; is player to the right of the enemy
	cmp $21c+3
	bcs @player_right
		lda $218+0			; is player above enemy
		cmp $21c+0
		bcs :++
			lda seed
			cmp #$80
			bcc :+
				lda #$00
				sta e2_dir
				jmp @slow
:			lda #$02
			sta e2_dir
			jmp @slow
:		lda seed
		cmp #$80
		bcc :+
			lda #$03
			sta e2_dir
			jmp @slow
:		lda #$00
		sta e2_dir
		jmp @slow
@other:
@player_right:
	lda $218+0
	cmp $21c+0
	bcs :++
		lda seed
		cmp #$80
		bcc :+
			lda #$02
			sta e2_dir
			jmp @slow
:		lda #$01
		sta e2_dir
		jmp @slow
:
	lda seed
	cmp #$80
	bcc :+
		lda #$03
		sta e2_dir
		jmp @slow
:	lda #$01
	sta e2_dir
	jmp @slow

@slow:
	lda #$41
	sta g_counter2
	bne @no_new
@fast:
	lda #$21
	sta g_counter2
@no_new:
	jsr ccland_enemy

	jsr ccland_rebound
	jsr ccland_movement

	lda control_pad
	and #up_punch
	beq @no_up
		jsr do_random_set
		lda e1_hit
		cmp #$03
		bne :+
			jmp @no_right
:		lda #$02
		sta e1_hit
		jmp @no_right
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		jsr do_random_set
		lda e1_hit
		cmp #$02
		bne :+
			jmp @no_right
:		lda #$03
		sta e1_hit
		jmp @no_right
@no_down:
	lda control_pad
	and #left_punch
	beq @no_left
		jsr do_random_set
		lda e1_hit
		bne :+
			jmp @no_right
:		lda #$01
		sta e1_hit
		jmp @no_right
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		jsr do_random_set
		lda e1_hit
		cmp #$01
		bne :+
			jmp @no_right
:		lda #$00
		sta e1_hit
@no_right:
	jsr pause_routine
	jmp end_loop

ccland_enemy:
	lda e2_dir
	asl a
	tay
	lda ccland_enemy_table+1, y
	pha
	lda ccland_enemy_table+0, y
	pha
	rts
ccland_enemy_table:
	.addr cc_enemy_l-1, cc_enemy_r-1, cc_enemy_u-1, cc_enemy_d-1
	.addr cc_enemy_lf-1, cc_enemy_rf-1, cc_enemy_uf-1, cc_enemy_df-1
cc_enemy_l:
	dec g_counter2
	beq :+
	lda e2_spd_lo
	sec
	sbc #<popeye_vert
	sta e2_spd_lo
	lda $21c+3
	sbc #>popeye_vert
	sta $21c+3
	lda #$ef
	sta $21c+1
	lda #$01
	sta $21c+2
:	rts
cc_enemy_r:
	dec g_counter2
	beq :+
	lda e2_spd_lo
	clc
	adc #<popeye_vert
	sta e2_spd_lo
	lda $21c+3
	adc #>popeye_vert
	sta $21c+3
	lda #$ef
	sta $21c+1
	lda #$41
	sta $21c+2
:	rts
cc_enemy_u:
	dec g_counter2
	beq :+
	lda e2_spd_lo
	sec
	sbc #<popeye_vert
	sta e2_spd_lo
	lda $21c+0
	sbc #>popeye_vert
	sta $21c+0
	lda #$ee
	sta $21c+1
	lda #$01
	sta $21c+2
:	rts
cc_enemy_d:
	dec g_counter2
	beq :+
	lda e2_spd_lo
	clc
	adc #<popeye_vert
	sta e2_spd_lo
	lda $21c+0
	adc #>popeye_vert
	sta $21c+0
	lda #$ee
	sta $21c+1
	lda #$81
	sta $21c+2
:	rts
cc_enemy_lf:
	dec g_counter2
	beq :+
	lda e4_spd_lo
	sec
	sbc #<dkjr_vine
	sta e4_spd_lo
	lda $21c+3
	sbc #>dkjr_vine
	sta $21c+3
	lda #$ef
	sta $21c+1
	lda #$01
	sta $21c+2
:	rts
cc_enemy_rf:
	dec g_counter2
	beq :+
	lda e4_spd_lo
	clc
	adc #<dkjr_vine
	sta e4_spd_lo
	lda $21c+3
	adc #>dkjr_vine
	sta $21c+3
	lda #$ef
	sta $21c+1
	lda #$41
	sta $21c+2
:	rts
cc_enemy_uf:
	dec g_counter2
	beq :+
	lda e4_spd_lo
	sec
	sbc #<dkjr_vine
	sta e4_spd_lo
	lda $21c+0
	sbc #>dkjr_vine
	sta $21c+0
	lda #$ee
	sta $21c+1
	lda #$01
	sta $21c+2
:	rts
cc_enemy_df:
	dec g_counter2
	beq :+
	lda e4_spd_lo
	clc
	adc #<dkjr_vine
	sta e4_spd_lo
	lda $21c+0
	adc #>dkjr_vine
	sta $21c+0
	lda #$ee
	sta $21c+1
	lda #$81
	sta $21c+2
:	rts
ccland_movement:
	lda e1_dir
	asl a
	tay
	lda ccland_movement_table+1, y
	pha
	lda ccland_movement_table+0, y
	pha
	rts
ccland_movement_table:
	.addr ccland_right-1, ccland_left-1, ccland_up-1, ccland_down-1
ccland_right:
	dec g_counter1
	bne :+
		lda #$21
		sta g_counter1
		lda e1_hit
		sta e1_dir
		rts
:	lda e1_spd_lo
	clc
	adc #<dkjr_vine
	sta e1_spd_lo
	lda $218+3
	adc #>dkjr_vine
	sta $218+3
	lda #$dc
	sta $218+1
	lda #$41
	sta $218+2
	rts
ccland_left:
	dec g_counter1
	bne :+
		lda #$21
		sta g_counter1
		lda e1_hit
		sta e1_dir
		rts
:
	lda e1_spd_lo
	sec
	sbc #<dkjr_vine
	sta e1_spd_lo
	lda $218+3
	sbc #>dkjr_vine
	sta $218+3
	lda #$dc
	sta $218+1
	lda #$01
	sta $218+2
	rts
ccland_up:
	dec g_counter1
	bne :+
		lda #$21
		sta g_counter1
		lda e1_hit
		sta e1_dir
		rts
:
	lda e3_spd_lo
	sec
	sbc #<dkjr_vine
	sta e3_spd_lo
	lda $218+0
	sbc #>dkjr_vine
	sta $218+0
	lda #$dd
	sta $218+1
	lda #$01
	sta $218+2
	rts
ccland_down:
	dec g_counter1
	bne :+
		lda #$21
		sta g_counter1
		lda e1_hit
		sta e1_dir
		rts
:
	lda e3_spd_lo
	clc
	adc #<dkjr_vine
	sta e3_spd_lo
	lda $218+0
	adc #>dkjr_vine
	sta $218+0
	lda #$dd
	sta $218+1
	lda #$81
	sta $218+2
	rts
ccland_rebound:
	lda $218+0
	cmp #$2b
	bne @test_bot
		lda e1_dir
		cmp #$02
		bne @test_bot
			lda e1_hit
			cmp #$02
			bne @test_bot
				lda #$03
				sta e1_dir
				sta e1_hit
				lda #$20
				sta g_counter1
				jmp @done_switch_tests
@test_bot:
	lda $218+0
	cmp #$4b
	bne @test_left
		lda e1_dir
		cmp #$03
		bne @test_left
			lda e1_hit
			cmp #$03
			bne @test_left
				lda #$02
				sta e1_dir
				sta e1_hit
				lda #$20
				sta g_counter1
				jmp @done_switch_tests
@test_left:
	lda $218+3
	cmp #$8f
	bne @test_right
		lda e1_dir
		cmp #$01
		bne @test_right
			lda e1_hit
			cmp #$01
			bne @test_right
				lda #$00
				sta e1_dir
				sta e1_hit
				lda #$20
				sta g_counter1
				jmp @done_switch_tests
@test_right:
	lda $218+3
	cmp #$c7
	bne @done_switch_tests
		lda e1_dir
		bne @done_switch_tests
			lda e1_hit
			bne @done_switch_tests
				lda #$01
				sta e1_dir
				sta e1_hit
				lda #$20
				sta g_counter1
@done_switch_tests:
	rts
game_nmi03: ; cc land
	jsr game_write_stats
	ldx #$00
	lda #$2d
	sta $2006
	lda #$74
	sta $2006
:	lda s_left, x
	sta $2007
	inx
	cpx #$04
	bne :-
	jmp end_nmi






game_loop11: ; gumshoe
	lda g_counter3
	bne :+++
	jsr game_orig_routine
	lda game_orig_win
	beq :+
		jmp game_orig_jump
:	jsr game_end_game2
	lda game_quit
	beq :+
		jmp game_end_game3
:	jsr game_test_lose
:	jsr do_random_set

	lda game_misses
	cmp #$03
	beq :+++
	lda e6_dir
	cmp #$10
	bne :+
		lda #$00
		sta e6_dir
:	cmp #$08
	bcc :+
		lda #$c9
		sta $220+1
		lda #$ca
		sta $224+1
		jmp :++
:	lda #$cb
	sta $220+1
	lda #$cc
	sta $224+1
:	inc e6_dir

	lda g_counter3
	beq :+
		dec g_counter3
		beq :+
			jmp :+++++
:	lda $228+0
	cmp #$f0
	bne :++
		ldx #$ff
:		inx
		lda seed
		cmp gshoe_offset, x
		bcc :-
			lda gshoe_y, x
			sta $228+0
			lda #$d8
			sta $228+3
			lda gshoe_tile, x
			sta $228+1
			lda gshoe_attr, x
			sta $228+2
:
	lda $228+3
	cmp #$80
	bcs :+
		lda #$f0
		sta $228+0
		jmp :++
:	lda e2_spd_lo
	sec
	sbc #<bball_speed1
	sta e2_spd_lo
	lda $228+3
	sbc #>bball_speed1
	sta $228+3
:

	lda e5_spd_lo
	beq :++
		dec e5_spd_lo
		beq :++
			lda $21c+0
			cmp #$20
			bcs :+
				jmp :+++
:			dec $21c+0
			dec $220+0
			dec $224+0
			jmp :++
:	lda $224+0
	cmp #$51
	beq :+
	lda e4_spd_lo
	clc
	adc #<dkjr_chomp
	sta e4_spd_lo
	lda $21c+0
	adc #>dkjr_chomp
	sta $21c+0
	clc
	adc #$08
	sta $220+0
	clc
	adc #$08
	sta $224+0
:

	lda $218+0
	clc
	adc #$01
	sta e1_top
	clc
	adc #$06
	sta e1_bot
	lda $218+3
	clc
	adc #$01
	sta e1_left
	clc
	adc #$06
	sta e1_right

	lda $21c+0
	clc
	adc #$02
	sta e2_top
	clc
	adc #22
	sta e2_bot
	lda $21c+3
	clc
	adc #$01
	sta e2_left
	clc
	adc #$06
	sta e2_right

	lda $228+0
	clc
	adc #$01
	sta e3_top
	clc
	adc #$06
	sta e3_bot
	lda $228+3
	clc
	adc #$01
	sta e3_left
	clc
	adc #$06
	sta e3_right

	lda e3_left
	cmp e2_right
		bcs gshoe_no_hit
	lda e3_right
	cmp e2_left
		bcc gshoe_no_hit
	lda e3_top
	cmp e2_bot
		bcs gshoe_no_hit
	lda e3_bot
	cmp e2_top
		bcc gshoe_no_hit
			lda $228+1
			cmp #$ce
			beq gshoe_no_hit
			inc game_misses
			lda #$f0
			sta $228+0
			lda #$3c
			sta g_counter3
			ldx #$1a
			jmp return_sfx_routine
gshoe_hit:
gshoe_no_hit:

	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq gshoe_no_a
		ldx #$19
		jmp return_sfx_routine
gshoe_gun:
		ldx #$00
gshoe_tests:
		lda e2_left, x
		cmp e1_right
			bcs gshoe_no_coll
		lda e2_right, x
		cmp e1_left
			bcc gshoe_no_coll
		lda e2_top, x
		cmp e1_bot
			bcs gshoe_no_coll
		lda e2_bot, x
		cmp e1_top
			bcc gshoe_no_coll
				cpx #$01
				bne @guy
					lda $228+1
					cmp #$ce
					bne :+
						lda $218+3
						cmp #$98
						bcc :+
							jsr do_score
							jsr do_score
							lda #$f0
							sta $228+0
:					jmp gshoe_no_control
@guy:
				lda #$10
				sta e5_spd_lo
				jmp gshoe_no_a
gshoe_no_coll:
		inx
		cpx #$02
		bne gshoe_tests
gshoe_no_a:
	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq gshoe_no_b
		lda e1_hit
		eor #$01
		sta e1_hit
		bne :+
			lda e2_hit
			sta $218+0
			lda e3_hit
			sta $218+3
			jmp gshoe_no_control
:		lda $218+0
		sta e2_hit
		lda $218+3
		sta e3_hit
		lda $220+0
		sta $218+0
		lda $220+3
		sta $218+3
		jmp gshoe_no_control
gshoe_no_b:
	lda control_pad
	and #up_punch
	beq gshoe_no_up
		jsr do_random_set
		lda $218+0
		cmp #$1f
		beq gshoe_no_up
			dec $218+0
gshoe_no_up:
	lda control_pad
	and #down_punch
	beq gshoe_no_down
		jsr do_random_set
		lda $218+0
		cmp #$4f
		beq gshoe_no_down
			inc $218+0
gshoe_no_down:
	lda e1_hit
	beq :+
		jmp gshoe_no_control
:	lda control_pad
	and #left_punch
	beq gshoe_no_left
		jsr do_random_set
		lda $218+3
		cmp #$98
		beq gshoe_no_left
			dec $218+3
gshoe_no_left:
	lda control_pad
	and #right_punch
	beq gshoe_no_right
		jsr do_random_set
		lda $218+3
		cmp #$d8
		beq gshoe_no_right
			inc $218+3
gshoe_no_right:
gshoe_no_control:
	jsr pause_routine
	jmp end_loop
gshoe_offset:
	.byte 231,210,189,168,147,126,105,84,63,42,21,0
gshoe_y:
	.byte $27,$27,$2f,$2f,$37,$37,$3f,$3f,$47,$47,$4f,$4f
gshoe_tile:
	.byte $cd,$ce,$cd,$ce,$cd,$ce,$cd,$ce,$cd,$ce,$cd,$ce
gshoe_attr:
	.byte $01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02


game_nmi11: ; gumshoe
	jsr game_write_stats
	jmp end_nmi






do_tennis_score:
	ldy #$00
:	jsr do_score
	iny
	cpy #$05
	bne :-
	rts
tennis_spr_mirror: ; tennis
	.byte $57,$dd,$01,$c8
	.byte $57,$de,$03,$c5	;$cb=testright;$c9=testmid;$c5=testleft;$21,$de,$03,$92
	.byte $1f,$dd,$02,$94
game_loop25: ; tennis
	lda g_counter3
	beq :+++
		dec g_counter3
		bne :++
		ldx #$00
:		lda tennis_spr_mirror, x
		sta $218+0, x
		inx
		cpx #12
		bne :-
			lda #$00
			sta e6_spd_lo
:		jmp end_loop
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
	bne @no_init
		lda #$00
		sta e1_dir
		sta e2_dir
		sta game_xtra0
		sta game_xtra1
		sta game_xtra2
		sta game_xtra3
		sta e3_hit
		sta e4_hit
		sta e5_hit
		sta e6_hit
		sta e1_hit
		sta e2_hit
		sta e1_spd_lo
		sta e2_spd_lo
		sta e3_spd_lo
		sta g_counter1
		sta s_bot
		lda #$40
		sta s_top
		lda #$90
		sta s_left
		sta s_right
		lda #$01
		sta e6_spd_lo
@no_init:

	jsr tennis_test_scoring


	lda $21c+0
	clc
	adc #$03
	sta s_top
	clc
	adc #$01
	sta s_bot
	lda $21c+3
	clc
	adc #$03
	sta s_left
	clc
	adc #$02
	sta s_right

	lda $218+0
	clc
	adc #$03
	sta e1_top
	sta e2_top
	sta e3_top
	clc
	adc #$05
	sta e1_bot
	sta e2_bot
	sta e3_bot
	lda $218+3
	sta e1_left
	clc
	adc #$03
	sta e1_right
	sta e2_left
	clc
	adc #$02
	sta e2_right
	sta e3_left
	clc
	adc #$03
	sta e3_right

	lda $220+0
	clc
	adc #$03
	sta e4_top
	sta e5_top
	sta e6_top
	clc
	adc #$05
	sta e4_bot
	sta e5_bot
	sta e6_bot
	lda $220+3
	sta e4_left
	clc
	adc #$03
	sta e4_right
	sta e5_left
	clc
	adc #$02
	sta e5_right
	sta e6_left
	clc
	adc #$03
	sta e6_right

	lda e1_hit
	cmp #$03
	bcc :+
		jmp @not_e_move
:;	lda e5_right
;	cmp #$d2
;	bcs :+
;		lda e4_left
;		cmp #$90
;		bcs :++
;:			jmp @not_e_move
;:
	lda e2_dir
	bne @tennis_e_other
	lda e4_left
	cmp $21c+3
	bne :+
		jmp @not_e_move
:	bcc :+
		lda e4_left
		cmp #$90
		bcc :++
		lda e3_spd_lo
		sec
		sbc #<dkjr_chomp
		sta e3_spd_lo
		lda $220+3
		sbc #>dkjr_vine
		sta $220+3
		jmp @tennis_e_dir
:	lda e5_right
	cmp #$d2
	bcs :+
	lda e3_spd_lo
	clc
	adc #<dkjr_chomp
	sta e3_spd_lo
	lda $220+3
	adc #>dkjr_vine
	sta $220+3
:	jmp @tennis_e_dir
@tennis_e_other:
	lda e5_left
	cmp $21c+3
	bne :+
		jmp @not_e_move
:	bcc :+
		lda e4_left
		cmp #$90
		bcc @tennis_e_dir
		lda e3_spd_lo
		sec
		sbc #<dkjr_chomp
		sta e3_spd_lo
		lda $220+3
		sbc #>dkjr_vine
		sta $220+3
		jmp @tennis_e_dir
:	lda e5_right
	cmp #$d2
	bcs @tennis_e_dir
	lda e3_spd_lo
	clc
	adc #<dkjr_chomp
	sta e3_spd_lo
	lda $220+3
	adc #>dkjr_vine
	sta $220+3
@tennis_e_dir:
	lda $220+3
	cmp #$b0
	bcs :+
		lda #$01
		sta e2_dir
		lda #$42
		sta $220+2
		jmp @not_e_move
:	lda #$00
	sta e2_dir
	lda #$02
	sta $220+2
@not_e_move:

		ldx #$00
@tests:
		lda e1_left, x
		cmp s_right
			bcs @no_coll
		lda e1_right, x
		cmp s_left
			bcc @no_coll
		lda e1_top, x
		cmp s_bot
			bcs @no_coll
		lda e1_bot, x
		cmp s_top
			bcc @no_coll
				stx e1_hit
				cpx #$03
				bcc :+
					inc $21c+0
					jmp :++
:				dec $21c+0
:				txa
				jsr tennis_ball
				lda game_xtra0
				cmp #$78
				bne :+
					lda game_xtra1
					clc
					adc #$01
					sta game_xtra1
:				lda game_xtra0
				clc
				adc #$08
				sta game_xtra0
				inc game_xtra2
				inc game_xtra2
				jsr tennis_hit_sound
				jmp @done_tests
@no_coll:
		inx
		cpx #$06
		bne @tests
@done_tests:

	lda e1_hit
	cmp #$03
	bcs :+
		jmp @ball_going_up
:		ldy g_counter1
		lda (temp_16bit_1), y
		cmp #$ff
		bne :+
			ldy #$00
			sty g_counter1
:
		lda (temp_16bit_1), y
		clc
		adc game_xtra0
		sta e3_hit
		lda (temp_16bit_2), y
		clc
		adc game_xtra1
		sta e4_hit
		lda (temp_16bit_3), y
		clc
		adc game_xtra2
		sta e5_hit
		lda (temp_16bit_4), y
		clc
		adc game_xtra3
		sta e6_hit
		lda e1_spd_lo
		clc
		adc e3_hit
		sta e1_spd_lo
		lda $21c+0
		adc e4_hit
		sta $21c+0
		lda e1_hit
		cmp #$04
		bcc @left_ex_move
			lda e2_spd_lo
			clc
			adc e5_hit
			sta e2_spd_lo
			lda $21c+3
			adc e6_hit
			sta $21c+3
			iny
			sty g_counter1
			jmp @done_ball_move ; right or mid move
@left_ex_move:
		lda e2_spd_lo
		sec
		sbc e5_hit
		sta e2_spd_lo
		lda $21c+3
		sbc e6_hit
		sta $21c+3
		iny
		sty g_counter1
		jmp @done_ball_move
@ball_going_up:
	ldy g_counter1
	lda (temp_16bit_1), y
	cmp #$ff
	bne :+
		ldy #$00
		sty g_counter1
:
		lda (temp_16bit_1), y
		clc
		adc game_xtra0
		sta e3_hit
		lda (temp_16bit_2), y
		clc
		adc game_xtra1
		sta e4_hit
		lda (temp_16bit_3), y
		clc
		adc game_xtra2
		sta e5_hit
		lda (temp_16bit_4), y
		clc
		adc game_xtra3
		sta e6_hit
	lda e1_spd_lo
	sec
	sbc e3_hit
	sta e1_spd_lo
	lda $21c+0
	sbc e4_hit
	sta $21c+0
	lda e1_hit
	cmp #$01
	bcc @left_x_move
		lda e2_spd_lo
		clc
		adc e5_hit
		sta e2_spd_lo
		lda $21c+3
		adc e6_hit
		sta $21c+3
		iny
		sty g_counter1
		jmp @done_ball_move ; right or mid move
@left_x_move:
	lda e2_spd_lo
	sec
	sbc e5_hit
	sta e2_spd_lo
	lda $21c+3
	sbc e6_hit
	sta $21c+3
	iny
	sty g_counter1
@done_ball_move:

	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda e1_dir
		eor #$01
		sta e1_dir
		beq :+
			lda #$41
			sta $218+2
			bne @no_a
:		lda #$01
		sta $218+2
@no_a:
	lda control_pad
	and #left_punch
	beq @no_left
		lda $218+3
		cmp #$80
		beq @no_control
			jsr do_random_set
			dec $218+3
			jmp @no_control
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda $218+3
		cmp #$d8
		beq @no_control
			jsr do_random_set
			inc $218+3
@no_right:
@no_control:
	jsr pause_routine
	jmp end_loop
tennis_ball:
	asl a
	tay
	lda tennis_table+1, y
	pha
	lda tennis_table+0, y
	pha
	rts
tennis_table:
	.addr tennis_p_l-1, tennis_p_l-1, tennis_p_l-1, tennis_e_l-1, tennis_e_l-1, tennis_e_l-1
tennis_p_l:
	lda #$00
	sta e1_spd_lo
	sta e2_spd_lo
	sta g_counter1
	lda e1_dir
	beq :+
		lda tennis_p_r_ylo0, x
		sta temp_16bit_1+0
		lda tennis_p_r_ylo1, x
		sta temp_16bit_1+1
		lda tennis_p_r_yhi0, x
		sta temp_16bit_2+0
		lda tennis_p_r_yhi1, x
		sta temp_16bit_2+1
		lda tennis_p_r_xlo0, x
		sta temp_16bit_3+0
		lda tennis_p_r_xlo1, x
		sta temp_16bit_3+1
		lda tennis_p_r_xhi0, x
		sta temp_16bit_4+0
		lda tennis_p_r_xhi1, x
		sta temp_16bit_4+1
		rts
:	lda tennis_p_l_ylo0, x
	sta temp_16bit_1+0
	lda tennis_p_l_ylo1, x
	sta temp_16bit_1+1
	lda tennis_p_l_yhi0, x
	sta temp_16bit_2+0
	lda tennis_p_l_yhi1, x
	sta temp_16bit_2+1
	lda tennis_p_l_xlo0, x
	sta temp_16bit_3+0
	lda tennis_p_l_xlo1, x
	sta temp_16bit_3+1
	lda tennis_p_l_xhi0, x
	sta temp_16bit_4+0
	lda tennis_p_l_xhi1, x
	sta temp_16bit_4+1
	rts

tennis_e_l:
	lda #$00
	sta e1_spd_lo
	sta e2_spd_lo
	sta g_counter1
	lda e2_dir
	beq :+
		lda tennis_e_r_ylo0, x
		sta temp_16bit_1+0
		lda tennis_e_r_ylo1, x
		sta temp_16bit_1+1
		lda tennis_e_r_yhi0, x
		sta temp_16bit_2+0
		lda tennis_e_r_yhi1, x
		sta temp_16bit_2+1
		lda tennis_e_r_xlo0, x
		sta temp_16bit_3+0
		lda tennis_e_r_xlo1, x
		sta temp_16bit_3+1
		lda tennis_e_r_xhi0, x
		sta temp_16bit_4+0
		lda tennis_e_r_xhi1, x
		sta temp_16bit_4+1
		rts
:	lda tennis_e_l_ylo0, x
	sta temp_16bit_1+0
	lda tennis_e_l_ylo1, x
	sta temp_16bit_1+1
	lda tennis_e_l_yhi0, x
	sta temp_16bit_2+0
	lda tennis_e_l_yhi1, x
	sta temp_16bit_2+1
	lda tennis_e_l_xlo0, x
	sta temp_16bit_3+0
	lda tennis_e_l_xlo1, x
	sta temp_16bit_3+1
	lda tennis_e_l_xhi0, x
	sta temp_16bit_4+0
	lda tennis_e_l_xhi1, x
	sta temp_16bit_4+1
	rts

; p=player, l/r=direction character facing, l/m/r=which hit box was hit, x/y(hi/lo)=ball direction
tennis_p_l_ylo0:
	.byte <tennis_p_l_l_ylo, <tennis_p_l_m_ylo, <tennis_p_l_r_ylo
tennis_p_l_ylo1:
	.byte >tennis_p_l_l_ylo, >tennis_p_l_m_ylo, >tennis_p_l_r_ylo
tennis_p_l_yhi0:
	.byte <tennis_p_l_l_yhi, <tennis_p_l_m_yhi, <tennis_p_l_r_yhi
tennis_p_l_yhi1:
	.byte >tennis_p_l_l_yhi, >tennis_p_l_m_yhi, >tennis_p_l_r_yhi
tennis_p_l_xlo0:
	.byte <tennis_p_l_l_xlo, <tennis_p_l_m_xlo, <tennis_p_l_r_xlo
tennis_p_l_xlo1:
	.byte >tennis_p_l_l_xlo, >tennis_p_l_m_xlo, >tennis_p_l_r_xlo
tennis_p_l_xhi0:
	.byte <tennis_p_l_l_xhi, <tennis_p_l_m_xhi, <tennis_p_l_r_xhi
tennis_p_l_xhi1:
	.byte >tennis_p_l_l_xhi, >tennis_p_l_m_xhi, >tennis_p_l_r_xhi

tennis_p_r_ylo0:
	.byte <tennis_p_r_l_ylo, <tennis_p_r_m_ylo, <tennis_p_r_r_ylo
tennis_p_r_ylo1:
	.byte >tennis_p_r_l_ylo, >tennis_p_r_m_ylo, >tennis_p_r_r_ylo
tennis_p_r_yhi0:
	.byte <tennis_p_r_l_yhi, <tennis_p_r_m_yhi, <tennis_p_r_r_yhi
tennis_p_r_yhi1:
	.byte >tennis_p_r_l_yhi, >tennis_p_r_m_yhi, >tennis_p_r_r_yhi
tennis_p_r_xlo0:
	.byte <tennis_p_r_l_xlo, <tennis_p_r_m_xlo, <tennis_p_r_r_xlo
tennis_p_r_xlo1:
	.byte >tennis_p_r_l_xlo, >tennis_p_r_m_xlo, >tennis_p_r_r_xlo
tennis_p_r_xhi0:
	.byte <tennis_p_r_l_xhi, <tennis_p_r_m_xhi, <tennis_p_r_r_xhi
tennis_p_r_xhi1:
	.byte >tennis_p_r_l_xhi, >tennis_p_r_m_xhi, >tennis_p_r_r_xhi

tennis_p_l_l_ylo:
	.byte $80,$80,$80,$80,$80,$80,$80,$80,$80, $ff
tennis_p_l_l_yhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00
tennis_p_l_l_xlo:
	.byte $c0,$00,$00,$c0,$00,$00,$c0,$00,$00
tennis_p_l_l_xhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

tennis_p_l_m_ylo:
	.byte $80, $ff
tennis_p_l_m_yhi:
	.byte $00
tennis_p_l_m_xlo:
	.byte $00
tennis_p_l_m_xhi:
	.byte $00

tennis_p_l_r_ylo:
	.byte $80,$80,$80,$80,$80,$80,$80,$80,$80, $ff
tennis_p_l_r_yhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00
tennis_p_l_r_xlo:
	.byte $40,$00,$00,$40,$00,$00,$40,$00,$00
tennis_p_l_r_xhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

tennis_p_r_l_ylo:
	.byte $80,$80,$80,$80,$80,$80,$80,$80,$80, $ff
tennis_p_r_l_yhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00
tennis_p_r_l_xlo:
	.byte $40,$00,$00,$40,$00,$00,$40,$00,$00
tennis_p_r_l_xhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

tennis_p_r_m_ylo:
	.byte $80, $ff
tennis_p_r_m_yhi:
	.byte $00
tennis_p_r_m_xlo:
	.byte $00
tennis_p_r_m_xhi:
	.byte $00

tennis_p_r_r_ylo:
	.byte $80,$80,$80,$80,$80,$80,$80,$80,$80, $ff
tennis_p_r_r_yhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00
tennis_p_r_r_xlo:
	.byte $c0,$00,$00,$c0,$00,$00,$c0,$00,$00
tennis_p_r_r_xhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

tennis_e_l_ylo0:
	.byte <tennis_e_l_l_ylo, <tennis_e_l_m_ylo, <tennis_e_l_r_ylo
	.byte <tennis_e_l_l_ylo, <tennis_e_l_m_ylo, <tennis_e_l_r_ylo
tennis_e_l_ylo1:
	.byte >tennis_e_l_l_ylo, >tennis_e_l_m_ylo, >tennis_e_l_r_ylo
	.byte >tennis_e_l_l_ylo, >tennis_e_l_m_ylo, >tennis_e_l_r_ylo
tennis_e_l_yhi0:
	.byte <tennis_e_l_l_yhi, <tennis_e_l_m_yhi, <tennis_e_l_r_yhi
	.byte <tennis_e_l_l_yhi, <tennis_e_l_m_yhi, <tennis_e_l_r_yhi
tennis_e_l_yhi1:
	.byte >tennis_e_l_l_yhi, >tennis_e_l_m_yhi, >tennis_e_l_r_yhi
	.byte >tennis_e_l_l_yhi, >tennis_e_l_m_yhi, >tennis_e_l_r_yhi
tennis_e_l_xlo0:
	.byte <tennis_e_l_l_xlo, <tennis_e_l_m_xlo, <tennis_e_l_r_xlo
	.byte <tennis_e_l_l_xlo, <tennis_e_l_m_xlo, <tennis_e_l_r_xlo
tennis_e_l_xlo1:
	.byte >tennis_e_l_l_xlo, >tennis_e_l_m_xlo, >tennis_e_l_r_xlo
	.byte >tennis_e_l_l_xlo, >tennis_e_l_m_xlo, >tennis_e_l_r_xlo
tennis_e_l_xhi0:
	.byte <tennis_e_l_l_xhi, <tennis_e_l_m_xhi, <tennis_e_l_r_xhi
	.byte <tennis_e_l_l_xhi, <tennis_e_l_m_xhi, <tennis_e_l_r_xhi
tennis_e_l_xhi1:
	.byte >tennis_e_l_l_xhi, >tennis_e_l_m_xhi, >tennis_e_l_r_xhi
	.byte >tennis_e_l_l_xhi, >tennis_e_l_m_xhi, >tennis_e_l_r_xhi

tennis_e_r_ylo0:
	.byte <tennis_e_r_l_ylo, <tennis_e_r_m_ylo, <tennis_e_r_r_ylo
	.byte <tennis_e_r_l_ylo, <tennis_e_r_m_ylo, <tennis_e_r_r_ylo
tennis_e_r_ylo1:
	.byte >tennis_e_r_l_ylo, >tennis_e_r_m_ylo, >tennis_e_r_r_ylo
	.byte >tennis_e_r_l_ylo, >tennis_e_r_m_ylo, >tennis_e_r_r_ylo
tennis_e_r_yhi0:
	.byte <tennis_e_r_l_yhi, <tennis_e_r_m_yhi, <tennis_e_r_r_yhi
	.byte <tennis_e_r_l_yhi, <tennis_e_r_m_yhi, <tennis_e_r_r_yhi
tennis_e_r_yhi1:
	.byte >tennis_e_r_l_yhi, >tennis_e_r_m_yhi, >tennis_e_r_r_yhi
	.byte >tennis_e_r_l_yhi, >tennis_e_r_m_yhi, >tennis_e_r_r_yhi
tennis_e_r_xlo0:
	.byte <tennis_e_r_l_xlo, <tennis_e_r_m_xlo, <tennis_e_r_r_xlo
	.byte <tennis_e_r_l_xlo, <tennis_e_r_m_xlo, <tennis_e_r_r_xlo
tennis_e_r_xlo1:
	.byte >tennis_e_r_l_xlo, >tennis_e_r_m_xlo, >tennis_e_r_r_xlo
	.byte >tennis_e_r_l_xlo, >tennis_e_r_m_xlo, >tennis_e_r_r_xlo
tennis_e_r_xhi0:
	.byte <tennis_e_r_l_xhi, <tennis_e_r_m_xhi, <tennis_e_r_r_xhi
	.byte <tennis_e_r_l_xhi, <tennis_e_r_m_xhi, <tennis_e_r_r_xhi
tennis_e_r_xhi1:
	.byte >tennis_e_r_l_xhi, >tennis_e_r_m_xhi, >tennis_e_r_r_xhi
	.byte >tennis_e_r_l_xhi, >tennis_e_r_m_xhi, >tennis_e_r_r_xhi

tennis_e_l_l_ylo:
	.byte $80,$80,$80,$80,$80,$80,$80,$80,$80, $ff
tennis_e_l_l_yhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00
tennis_e_l_l_xlo:
	.byte $c0,$00,$00,$c0,$00,$00,$c0,$00,$00
tennis_e_l_l_xhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

tennis_e_l_m_ylo:
	.byte $80, $ff
tennis_e_l_m_yhi:
	.byte $00
tennis_e_l_m_xlo:
	.byte $00
tennis_e_l_m_xhi:
	.byte $00

tennis_e_l_r_ylo:
	.byte $80,$80,$80,$80,$80,$80,$80,$80,$80, $ff
tennis_e_l_r_yhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00
tennis_e_l_r_xlo:
	.byte $40,$00,$00,$40,$00,$00,$40,$00,$00
tennis_e_l_r_xhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

tennis_e_r_l_ylo:
	.byte $80,$80,$80,$80,$80,$80,$80,$80,$80, $ff
tennis_e_r_l_yhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00
tennis_e_r_l_xlo:
	.byte $40,$00,$00,$40,$00,$00,$40,$00,$00
tennis_e_r_l_xhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

tennis_e_r_m_ylo:
	.byte $80, $ff
tennis_e_r_m_yhi:
	.byte $00
tennis_e_r_m_xlo:
	.byte $00
tennis_e_r_m_xhi:
	.byte $00

tennis_e_r_r_ylo:
	.byte $80,$80,$80,$80,$80,$80,$80,$80,$80, $ff
tennis_e_r_r_yhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00
tennis_e_r_r_xlo:
	.byte $c0,$00,$00,$c0,$00,$00,$c0,$00,$00
tennis_e_r_r_xhi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

tennis_score_sound:
	ldx #$36
	jmp return_sfx_routine
tennis_beep:
	rts
tennis_hit_sound:
	ldx #$37
	jmp return_sfx_routine
tennis_hit:
	rts
tennis_miss_sound:
	ldx #$38
	jmp return_sfx_routine
tennis_miss:
	rts
tennis_test_scoring:
	lda s_top
	cmp #$1f
	bcs @not_out_top
		lda s_left
		cmp #$d3
		bcs :+
			lda s_right
			cmp #$8d
			bcc :+
				jsr do_tennis_score
				jsr tennis_score_sound
				jmp :++
:		inc game_misses
		jsr tennis_miss_sound
:		lda #$f0
		sta $21c+0
		lda #$72
		sta g_counter3
		jmp end_loop
@not_out_top:
	lda s_bot
	cmp #$5d
	bcc @not_out_bottom
		lda s_left
		cmp #$d8
		bcs :+
			lda s_right
			cmp #$88
			bcc :+
				inc game_misses
				jsr tennis_miss_sound
				jmp :++
:		jsr do_tennis_score
		jsr tennis_score_sound
:		lda #$f0
		sta $21c+0
		lda #$72
		sta g_counter3
		jmp end_loop
@not_out_bottom:

	lda s_right
	cmp #$df
	bcc @not_out_right
		lda e1_hit
		cmp #$03
		bcc :+
			jsr do_tennis_score
			jsr tennis_score_sound
			jmp :++
:		inc game_misses
		jsr tennis_miss_sound
:		lda #$f0
		sta $21c+0
		lda #$72
		sta g_counter3
@not_out_right:
	lda s_left
	cmp #$81
	bcs @not_out_left
		lda e1_hit
		cmp #$03
		bcc :+
			jsr do_tennis_score
			jsr tennis_score_sound
			jmp :++
:		inc game_misses
		jsr tennis_miss_sound
:		lda #$f0
		sta $21c+0
		lda #$72
		sta g_counter3
@not_out_left:
	rts

game_nmi25: ; tennis
	jsr game_write_stats
	jmp end_nmi





wcrew_ham_sfx:
	ldx #$40
	jmp return_sfx_routine
wcrew_ham:
	rts
wcrew_spr_mirror: ; w crew
	.byte $4f,$d6,$41,$a0 ; 218
	.byte $1f,$db,$42,$88 ; 21c
	.byte $3f,$db,$02,$d0 ; 220
	.byte $f0,$d5,$03,$f0 ; 224
	.byte $f0,$d5,$03,$f0
	.byte $f0,$d5,$03,$f0
	.byte $f0,$d5,$03,$f0
	.byte $f0,$d5,$03,$f0
	.byte $f0,$d5,$03,$f0
game_loop29: ; w crew
	lda g_counter3
	beq :++
		dec g_counter3
		bne :+
			lda #$00
			sta s_right
:		jmp end_loop
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

	lda s_right
	bne @done_inits
		lda #$00
		sta g_counter1
		sta g_counter2
		sta s_left		; door count
		lda #$06
		sta s_top		; y pos
		lda #$04
		sta s_bot		; x pos
		lda #$00
		sta e1_hit		; e1 y pos
		lda #$01
		sta e3_hit		; e1 x pos
		lda #$04
		sta e2_hit		; e2 y pos
		lda #$0a
		sta e4_hit		; e2 x pos
		lda #$00
		sta e5_hit		; enemy move counters
		sta e6_hit		;
		sta e2_dir
		sta e3_dir
		lda #$01
		sta s_right
		ldx #$00
:		lda wcrew_spr_mirror, x
		sta $218+0, x
		inx
		cpx #$24
		bne :-
			ldx #$ff
:			inx
			lda seed
			cmp wcrew_offset, x
			bcc :-
				lda wcrew_doorsy_lo, x
				sta temp_16bit_1+0
				lda wcrew_doorsy_hi, x
				sta temp_16bit_1+1
				lda wcrew_doorsx_lo, x
				sta temp_16bit_2+0
				lda wcrew_doorsx_hi, x
				sta temp_16bit_2+1
				ldy #$00
				ldx #$00
:				lda (temp_16bit_1), y
				sta $224+0, x
				lda (temp_16bit_2), y
				sta $224+3, x
				inx
				inx
				inx
				inx
				iny
				cpy #$06
				bne :-
@done_inits:

	lda s_left
	cmp #$06
	bne :+
		lda #$72
		sta g_counter3
		jmp end_loop
:

	ldx #$00
:	jsr wcrew_enemy
	lda e2_dir, x
	jsr wcrew_movement
	inx
	cpx #$02
	bne :-

	ldy #$00
	ldx #$00
:	lda $218+0, y
	clc
	adc #$02
	sta e1_top, x
	clc
	adc #$05
	sta e1_bot, x
	lda $218+3, y
	clc
	adc #$02
	sta e1_left, x
	clc
	adc #$05
	sta e1_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$03
	bne :-

	ldx #$00
wcrew_hit_tests:
	lda e2_left, x
	cmp e1_right
		bcs wcrew_no_coll
	lda e2_right, x
	cmp e1_left
		bcc wcrew_no_coll
	lda e2_top, x
	cmp e1_bot
		bcs wcrew_no_coll
	lda e2_bot, x
	cmp e1_top
		bcc wcrew_no_coll
			inc game_misses
			lda #$72
			sta g_counter3
			ldx #$42
			jmp return_sfx_routine
wcrew_hit:
			jmp wcrew_done_tests
wcrew_no_coll:
		inx
		cpx #$02
		bne wcrew_hit_tests
wcrew_done_tests:

	lda g_counter1
	cmp #$06
	beq :+
	ldx s_top
	inx
	lda wcrew_coll_lo, x
	sta temp_16bit_1+0
	lda wcrew_coll_hi, x
	sta temp_16bit_1+1
	ldy s_bot
	lda (temp_16bit_1), y
	bne :+
		lda #$06
		sta g_counter1
		lda #17
		sta g_counter2
:	lda g_counter1
	jsr wcrew_movement
	lda g_counter1
	beq :+
		jmp @no_control
:

	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		ldx s_top
		lda wcrew_coll_lo, x
		sta temp_16bit_1+0
		lda wcrew_coll_hi, x
		sta temp_16bit_1+1
		ldy s_bot
		lda (temp_16bit_1), y
		cmp #$01
		beq :+
			jsr do_random_set
			lda #$05
			sta g_counter1
			lda #49
			sta g_counter2
:		jmp @no_control
@no_a:
	lda control_pad
	and #left_punch
	beq @no_left
		jsr do_random_set
		lda $218+3
		cmp #$80
		bne :+
			lda #$d8
			sta $218+3
			lda #$01
			sta e1_dir
			lda #$0b
			sta s_bot
			jmp @no_control
:		ldx s_top
		lda wcrew_coll_lo, x
		sec
		sbc #$01
		sta temp_16bit_1+0
		lda wcrew_coll_hi, x
		sta temp_16bit_1+1
		ldy s_bot
		lda (temp_16bit_1), y
		cmp #$02
		bne :+
			jmp @no_control
:		lda #$01
		sta g_counter1
		lda #$01
		sta e1_dir
		jmp @set_counter
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		jsr do_random_set
		lda $218+3
		cmp #$d8
		bne :+
			lda #$80
			sta $218+3
			lda #$00
			sta e1_dir
			sta s_bot
			jmp @no_control
:		ldx s_top
		lda wcrew_coll_lo, x
		sta temp_16bit_1+0
		lda wcrew_coll_hi, x
		sta temp_16bit_1+1
		ldy s_bot
		iny
		lda (temp_16bit_1), y
		cmp #$02
		bne :+
			jmp @no_control
:		lda #$02
		sta g_counter1
		lda #$00
		sta e1_dir
		jmp @set_counter
@no_right:
	lda control_pad
	and #up_punch
	beq @no_up
		jsr do_random_set
		lda $218+0
		cmp #$1f
		bne :+
			jmp @no_control
:		ldx s_top
;		dex
		lda wcrew_coll_lo, x
		sta temp_16bit_1+0
		lda wcrew_coll_hi, x
		sta temp_16bit_1+1
		ldy s_bot
		lda (temp_16bit_1), y
		cmp #$01
		bne @no_control
			lda #$03
			sta g_counter1
			jmp @set_counter
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		jsr do_random_set
		lda $218+0
		cmp #$4f
		bne :+
			jmp @no_control
:		ldx s_top
		inx
		lda wcrew_coll_lo, x
		sta temp_16bit_1+0
		lda wcrew_coll_hi, x
		sta temp_16bit_1+1
		ldy s_bot
		lda (temp_16bit_1), y
		cmp #$01
		bne @no_control
			lda #$04
			sta g_counter1
			jmp @set_counter
@no_down:
@set_counter:
	lda #17
	sta g_counter2
@no_control:
	jsr pause_routine
	jmp end_loop

wcrew_enemy:
	lda e5_hit, x
	beq :+
		jmp @done_decision
:	lda e2_dir, x
	cmp #$09
	bcc :+
		jmp @done_decision
:	ldy e1_hit, x
	iny
	lda wcrew_coll_lo, y
	sta temp_16bit_1+0
	lda wcrew_coll_hi, y
	sta temp_16bit_1+1
	ldy e3_hit, x
	lda (temp_16bit_1), y
	bne :+
		lda #$0b
		sta e2_dir, x
		lda #33
		sta e5_hit, x
		jmp @done_decision
:	lda e1_hit, x
	cmp s_top
	bne @no_y_match
		jmp @no_ladder_match
@no_y_match:
	ldy e1_hit, x
	lda wcrew_coll_lo, y
	sta temp_16bit_1+0
	lda wcrew_coll_hi, y
	sta temp_16bit_1+1
	ldy e3_hit, x
	lda (temp_16bit_1), y
	cmp #$01
	bne @no_ladder_match
		lda e1_hit, x
		cmp s_top
		bcc :+
			lda #$09
			sta e2_dir, x
			lda #33
			sta e5_hit, x
			jmp @done_decision
:		lda #$0a
		sta e2_dir, x
		lda #33
		sta e5_hit, x
		jmp @done_decision
@no_ladder_match:
	lda e3_hit, x
	cmp s_bot
	bcc @go_right
		lda #$07
		sta e2_dir, x
		lda #33
		sta e5_hit, x
		jmp @done_decision
@go_right:
	lda #$08
	sta e2_dir, x
	lda #33
	sta e5_hit, x
@done_decision:
	rts



wcrew_doorsy_lo:
	.byte <wcrew_doors0y,<wcrew_doors1y,<wcrew_doors2y,<wcrew_doors3y
wcrew_doorsy_hi:
	.byte >wcrew_doors0y,>wcrew_doors1y,>wcrew_doors2y,>wcrew_doors3y
wcrew_doorsx_lo:
	.byte <wcrew_doors0x,<wcrew_doors1x,<wcrew_doors2x,<wcrew_doors3x
wcrew_doorsx_hi:
	.byte >wcrew_doors0x,>wcrew_doors1x,>wcrew_doors2x,>wcrew_doors3x
wcrew_doors0y:
	.byte $1f,$1f,$2f,$2f,$3f,$4f
wcrew_doors0x:
	.byte $a8,$c8,$88,$b8,$c8,$b8
wcrew_doors1y:
	.byte $1f,$1f,$2f,$3f,$3f,$4f
wcrew_doors1x:
	.byte $90,$a0,$d0,$88,$b8,$c8
wcrew_doors2y:
	.byte $1f,$2f,$2f,$3f,$3f,$4f
wcrew_doors2x:
	.byte $d0,$98,$b8,$88,$d0,$88
wcrew_doors3y:
	.byte $1f,$2f,$2f,$2f,$3f,$3f
wcrew_doors3x:
	.byte $90,$b0,$b8,$d0,$90,$b8
wcrew_offset:
	.byte 192,128,64,0
wcrew_coll_lo:
	.byte <wcrew_coll0,<wcrew_coll1,<wcrew_coll2,<wcrew_coll3
	.byte <wcrew_coll4,<wcrew_coll5,<wcrew_coll6,<wcrew_coll7
wcrew_coll_hi:
	.byte >wcrew_coll0,>wcrew_coll1,>wcrew_coll2,>wcrew_coll3
	.byte >wcrew_coll4,>wcrew_coll5,>wcrew_coll6,>wcrew_coll7
wcrew_coll0:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
wcrew_coll1:
	.byte $02,$02,$02,$00,$02,$01,$02,$00,$01,$02,$02,$02
wcrew_coll2:
	.byte $00,$00,$00,$00,$00,$01,$00,$00,$01,$00,$00,$00
wcrew_coll3:
	.byte $02,$02,$02,$01,$00,$01,$02,$02,$01,$00,$02,$02
wcrew_coll4:
	.byte $00,$00,$00,$01,$00,$01,$00,$00,$01,$00,$00,$00
wcrew_coll5:
	.byte $02,$02,$01,$02,$00,$01,$00,$02,$01,$02,$02,$02
wcrew_coll6:
	.byte $00,$00,$01,$00,$00,$01,$00,$00,$01,$00,$00,$00
wcrew_coll7:
	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

wcrew_test_doors:
	ldy #$00
:	lda $218+0
	cmp $224+0, y
	bne :+
		lda $218+3
		cmp $224+3, y
		bne :+
			lda #$f0
			sta $224+0, y
			inc s_left
			jsr do_score
			ldx #$41
			jmp return_sfx_routine
wcrew_beep:
			rts
:	iny
	iny
	iny
	iny
	cpy #24
	bne :--
	rts

wcrew_movement:
	asl a
	tay
	lda wcrew_movement_table+1, y
	pha
	lda wcrew_movement_table+0, y
	pha
	rts
wcrew_movement_table:
	.addr wcrew_still-1, wcrew_left-1, wcrew_right-1, wcrew_up-1, wcrew_down-1
	.addr wcrew_hammer-1, wcrew_fall-1, wcrew_e_left-1, wcrew_e_right-1, wcrew_e_up-1
	.addr wcrew_e_down-1, wcrew_e_fall-1
wcrew_e_fall:
	dec e5_hit, x
	bne @still_fall
;		ldy e1_hit, x
;		iny
;		lda wcrew_coll_lo, y
;		sta temp_16bit_1+0
;		lda wcrew_coll_hi, y
;		sta temp_16bit_1+1
;		ldy e3_hit, x
;		lda (temp_16bit_1), y
;		bne :+
;			lda #$0b
;			sta e2_dir, x
;			lda #33
;			sta e5_hit, x
;			inc e1_hit, x
;			rts
;:
		lda #$00
		sta e2_dir, x
		inc e1_hit, x
		rts
@still_fall:
	cpx #$01
	bne :+
		ldy #$04
		bne :++
:	ldy #$00
:	lda e2_spd_lo, x
	clc
	adc #<dkjr_vine
	sta e2_spd_lo, x
	lda $21c+0, y
	adc #>dkjr_vine
	sta $21c+0, y
	lda #$dd
	sta $21c+1, y
	rts
wcrew_e_left:
	dec e5_hit, x
	bne :++++
		cpx #$01
		bne :+
			ldy #$04
			bne :++
:		ldy #$00
:		lda $21c+3, y
		cmp #$80
		bne :+
			lda #$08
			sta e2_dir, x
			lda #33
			sta e5_hit, x
			dec e3_hit, x
			rts
:		lda #$00
		sta e2_dir, x
		dec e3_hit, x
		rts
:	cpx #$01
	bne :+
		ldy #$04
		bne :++
:	ldy #$00
:	lda e2_spd_lo, x
	sec
	sbc #<dkjr_vine
	sta e2_spd_lo, x
	lda $21c+3, y
	sbc #>dkjr_vine
	sta $21c+3, y
	lda #$02
	sta $21c+2, y
	lda e5_hit, x
	cmp #$18
	bcc :+
		lda #$db
		sta $21c+1, y
		rts
:	cmp #$10
	bcc :+
		lda #$dc
		sta $21c+1, y
		rts
:	cmp #$08
	bcc :+
		lda #$db
		sta $21c+1, y
		rts
:	lda #$dc
	sta $21c+1, y
	rts
wcrew_e_right:
	dec e5_hit, x
	bne :+
		lda #$00
		sta e2_dir, x
		inc e3_hit, x
		rts
:	cpx #$01
	bne :+
		ldy #$04
		bne :++
:	ldy #$00
:	lda e2_spd_lo, x
	clc
	adc #<dkjr_vine
	sta e2_spd_lo, x
	lda $21c+3, y
	adc #>dkjr_vine
	sta $21c+3, y
	lda #$42
	sta $21c+2, y
	lda e5_hit, x
	cmp #$18
	bcc :+
		lda #$db
		sta $21c+1, y
		rts
:	cmp #$10
	bcc :+
		lda #$dc
		sta $21c+1, y
		rts
:	cmp #$08
	bcc :+
		lda #$db
		sta $21c+1, y
		rts
:	lda #$dc
	sta $21c+1, y
	rts
wcrew_e_up:
	dec e5_hit, x
	bne @still_up
		ldy e1_hit, x
		dey
		lda wcrew_coll_lo, y
		sta temp_16bit_1+0
		lda wcrew_coll_hi, y
		sta temp_16bit_1+1
		ldy e3_hit, x
		lda (temp_16bit_1), y
		cmp #$01
		bne :+
			lda #$09
			sta e2_dir, x
			lda #33
			sta e5_hit, x
			dec e1_hit, x
			rts
:		lda #$00
		sta e2_dir, x
		dec e1_hit, x
		rts
@still_up:
	cpx #$01
	bne :+
		ldy #$04
		bne :++
:	ldy #$00
:	lda e2_spd_lo, x
	sec
	sbc #<dkjr_vine
	sta e2_spd_lo, x
	lda $21c+0, y
	sbc #>dkjr_vine
	sta $21c+0, y
	lda #$dd
	sta $21c+1, y
	lda $21c+2, y
	cmp #$02
	bne :+
		lda #$42
		sta $21c+2, y
		rts
:	lda #$02
	sta $21c+2, y
	rts
wcrew_e_down:
	dec e5_hit, x
	bne @still_down
		ldy e1_hit, x
		iny
		lda wcrew_coll_lo, y
		sta temp_16bit_1+0
		lda wcrew_coll_hi, y
		sta temp_16bit_1+1
		ldy e3_hit, x
		lda (temp_16bit_1), y
		cmp #$02
		bne :+
			lda #$0a
			sta e2_dir, x
			lda #33
			sta e5_hit, x
			inc e1_hit, x
			rts
:		lda #$00
		sta e2_dir, x
		inc e1_hit, x
		rts
@still_down:
	cpx #$01
	bne :+
		ldy #$04
		bne :++
:	ldy #$00
:	lda e2_spd_lo, x
	clc
	adc #<dkjr_vine
	sta e2_spd_lo, x
	lda $21c+0, y
	adc #>dkjr_vine
	sta $21c+0, y
	lda #$dd
	sta $21c+1, y
	lda $21c+2, y
	cmp #$02
	bne :+
		lda #$42
		sta $21c+2, y
		rts
:	lda #$02
	sta $21c+2, y
	rts
wcrew_hammer:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		jsr wcrew_test_doors
		rts
:	lda #$01
	sta $218+2
	lda g_counter2
	cmp #$28
	bcc :+
		lda #$da
		sta $218+1
		rts
:	cmp #$20
	bcc :+
		lda #$d9
		sta $218+1
	jsr wcrew_ham_sfx
		rts
:	cmp #$18
	bcc :+
		lda #$da
		sta $218+1
		rts
:	cmp #$10
	bcc :+
		lda #$d9
		sta $218+1
	jsr wcrew_ham_sfx
		rts
:	cmp #$08
	bcc :+
		lda #$da
		sta $218+1
		rts
:	lda #$d9
	sta $218+1
	jsr wcrew_ham_sfx
	rts
wcrew_still:
	ldx s_top
	lda wcrew_coll_lo, x
	sta temp_16bit_1+0
	lda wcrew_coll_hi, x
	sta temp_16bit_1+1
	ldy s_bot
	lda (temp_16bit_1), y
	cmp #$01
	bne :+
		lda #$da
		sta $218+1
		lda #$01
		sta $218+2
		rts
:	lda e1_dir
	bne :+
		lda #$d6
		sta $218+1
		lda #$41
		sta $218+2
		rts
:	lda #$d6
	sta $218+1
	lda #$01
	sta $218+2
	rts
wcrew_left:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		dec s_bot
		rts
:	lda g_counter2
	cmp #$08
	bcc :+
		lda #$d6
		sta $218+1
		lda #$01
		sta $218+2
		bne :++
:	lda #$d7
	sta $218+1
	lda #$01
	sta $218+2
:	lda e1_spd_lo
	sec
	sbc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+3
	sbc #>dkjr_chomp
	sta $218+3
	rts
wcrew_right:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		inc s_bot
		rts
:	lda g_counter2
	cmp #$08
	bcc :+
		lda #$d6
		sta $218+1
		lda #$41
		sta $218+2
		bne :++
:	lda #$d7
	sta $218+1
	lda #$41
	sta $218+2
:	lda e1_spd_lo
	clc
	adc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+3
	adc #>dkjr_chomp
	sta $218+3
	rts
wcrew_up:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		dec s_top
		rts
:	lda g_counter2
	cmp #$08
	bcc :+
		lda #$da
		sta $218+1
		lda #$01
		sta $218+2
		bne :++
:	lda #$d9
	sta $218+1
	lda #$01
	sta $218+2
:	lda e1_spd_lo
	sec
	sbc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+0
	sbc #>dkjr_chomp
	sta $218+0
	rts
wcrew_down:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		inc s_top
		rts
:	lda g_counter2
	cmp #$08
	bcc :+
		lda #$da
		sta $218+1
		lda #$01
		sta $218+2
		bne :++
:	lda #$d9
	sta $218+1
	lda #$01
	sta $218+2
:	lda e1_spd_lo
	clc
	adc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+0
	adc #>dkjr_chomp
	sta $218+0
	rts
wcrew_fall:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		inc s_top
		rts
:	lda e1_spd_lo
	clc
	adc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+0
	adc #>dkjr_chomp
	sta $218+0
	rts

game_nmi29: ; w crew
	jsr game_write_stats
	jmp end_nmi













pwrestle_spr_mirror: ; prowrestling
	.byte $f0,$31,$00,$88 ; 218
	.byte $37,$fd,$01,$a0 ; 21c good guy
	.byte $3f,$e1,$01,$a0 ; 220
	.byte $f0,$ff,$01,$00 ; 224
	.byte $37,$fd,$42,$b8 ; 228 bad guy
	.byte $3f,$e1,$42,$b8 ; 22c
	.byte $f0,$ff,$42,$f0 ; 230

game_loop20: ; prowrestling

	lda g_counter3
	beq @wait
		dec g_counter3
		bne @still_wait
			ldx #$00
:			lda pwrestle_spr_mirror, x
			sta $218+0, x
			inx
			cpx #28
			bne :-
			lda #$00
			sta e6_spd_lo
@still_wait:
		jmp end_loop
@wait:

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
		lda #$0a
		sta e2_hit
		lda #$10
		sta e5_bot
		sta e6_bot
		lda #$3c
		sta e6_right
		lda #$00
		sta e1_hit
		sta e5_hit
		sta e6_hit
		lda #$01
		sta e6_spd_lo
@done_init:




	lda e1_hit
	cmp #$05
	bne @not_pin
		lda $218+1
		cmp #$33
		bne :++
			ldy #$00
:			jsr do_score
			iny
			cpy #$05
			bne :-
			lda #$72
			sta g_counter3
		jsr wrestle_beep
			jmp end_loop
:		lda #$27
		sta $218+0
		dec e6_right
		bne :+
			lda #$3c
			sta e6_right
			inc $218+1
:
@not_pin:

	lda e2_hit
	cmp #$0f
	bne @not_pinning
		lda $218+1
		cmp #$33
		bne :+
			inc game_misses
			lda #$72
			sta g_counter3
			jmp end_loop
:		lda #$27
		sta $218+0
		dec e6_right
		bne :+
			lda #$3c
			sta e6_right
			inc $218+1
:
@not_pinning:

	lda $21c+3
	cmp $228+3
	bcc :+
		lda #$01
		sta e1_dir
		lda #$00
		sta e2_dir
		beq :++
:	lda #$00
	sta e1_dir
	lda #$01
	sta e2_dir
:
	lda e1_hit
	bne @not_feet
		lda e5_hit
		bne @not_feet
			lda #$20
			sta e5_hit
@not_feet:
	lda e2_hit
	cmp #$0a
	bne @not_efeet
		lda e6_hit
		bne @not_efeet
			lda #$20
			sta e6_hit

@not_efeet:


	lda e2_hit
	cmp #$0a
	bne :+
		jsr pwrestle_emove
:
	ldx #$00
:	jsr pwrestle_anim
	inx
	cpx #$02
	bne :-


	lda g_counter1
	bne @no_grab
	lda s_left
	cmp g_right
		bcs @no_grab
	lda s_right
	cmp g_left
		bcc @no_grab
	lda s_top
	cmp g_bot
		bcs @no_grab
	lda s_bot
	cmp g_top
		bcc @no_grab
			lda e1_hit
			cmp #$02
			bne @no_grab
				lda e2_hit
				cmp #$0c
				bne @no_grab
					lda #$40
					sta e5_hit
					sta e6_hit
					lda #$01
					sta g_counter1
					sta g_counter2
@no_grab:


	lda e1_hit
	bne :+
		jmp @just_feet
:		cmp #$02
		beq :+
			jmp @not_grapple_ctrl
:			lda g_counter1
			bne :+
				jmp @not_grapple_ctrl
:				lda control_pad
				eor control_old
				and control_pad
				and #up_punch
				beq @test_down
					lda #$03
					sta e1_hit
					lda #$10
					sta e2_hit
					lda #$40
					sta e5_hit
					sta e6_hit
					jmp @no_control
@test_down:	
				lda control_pad
				eor control_old
				and control_pad
				and #down_punch
				beq @test_kick
					lda #$04
					sta e1_hit
					lda #$10
					sta e2_hit
					lda #$40
					sta e5_hit
					sta e6_hit
					jmp @no_control
@test_kick:
				lda control_pad
				eor control_old
				and control_pad
				and #b_punch
				beq @not_grapple_ctrl
					jsr do_random_set
					lda #$01
					sta e1_hit
					lda #$10
					sta e5_hit
					lda #$0a
					sta e2_hit
					lda #$00
					sta e6_hit
					dec e6_bot
					dec e6_bot
					lda e1_dir
					beq :++
						lda $228+3
						sec
						sbc #$08
						sta $228+3
						cmp #$80
						bcc :+
							jmp @no_control
:						lda #$80
						sta $228+3
						jmp @no_control
:					lda $228+3
					clc
					adc #$08
					sta $228+3
					cmp #$d9
					bcs :+
						jmp @no_control
:					lda #$d8
					sta $228+3
					jmp @no_control
@not_grapple_ctrl:
		jmp @no_control
@just_feet:

@no_b:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		jsr do_random_set
		lda #$02
		sta e1_hit
		lda #$10
		sta e5_hit
		lda e1_dir
		beq :++
			lda $21c+3
			sec
			sbc $228+3
			cmp #$0f
			bcc :+
				jmp @no_control
:			lda #$0c
			sta e2_hit
			lda #$10
			sta e6_hit
			jmp @no_control
:		lda $228+3
		sec
		sbc $21c+3
		cmp #$0f
		bcc :+
			jmp @no_control
:		lda #$0c
		sta e2_hit
		lda #$10
		sta e6_hit
		jmp @no_control
@no_a:
	lda control_pad
	and #up_punch
	beq @no_up
		lda $21c+0
		cmp #$26
		bne :+
			jmp @no_up
:		jsr do_random_set
		lda e1_spd_lo
		sec
		sbc #<dkjr_vine
		sta e1_spd_lo
		lda $21c+0
		sbc #>dkjr_vine
		sta $21c+0
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		lda $21c+0
		cmp #$46
		bne :+
			jmp @no_down
:		jsr do_random_set
		lda e1_spd_lo
		clc
		adc #<dkjr_vine
		sta e1_spd_lo
		lda $21c+0
		adc #>dkjr_vine
		sta $21c+0
@no_down:
	lda control_pad
	and #left_punch
	beq @no_left
		lda $21c+3
		cmp #$88
		bne :+
			jmp @no_left
:		jsr do_random_set
		lda e3_spd_lo
		sec
		sbc #<dkjr_vine
		sta e3_spd_lo
		lda $21c+3
		sbc #>dkjr_vine
		sta $21c+3
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda $21c+3
		cmp #$d0
		bne :+
			jmp @no_right
:		jsr do_random_set
		lda e3_spd_lo
		clc
		adc #<dkjr_vine
		sta e3_spd_lo
		lda $21c+3
		adc #>dkjr_vine
		sta $21c+3
@no_right:

@no_control:
	lda e1_hit
	cmp #$08
	beq :+
		lda $21c+0
		clc
		adc #$02
		sta e1_top
		clc
		adc #$06
		sta $220+0
		clc
		adc #$05
		sta e1_bot
		lda $21c+3
		sta $220+3
		sta e1_left
		clc
		adc #$06
		sta e1_right
		jmp :++
:	lda $21c+0
	sta $220+0
	lda $21c+3
	clc
	adc #$08
	sta $220+3
:

	lda e2_hit
	cmp #$12
	beq :+
		lda $228+0
		clc
		adc #$02
		sta e2_top
		clc
		adc #$06
		sta $22c+0
		clc
		adc #$05
		sta e2_bot
		lda $228+3
		sta $22c+3
		sta e2_left
		clc
		adc #$06
		sta e2_right
		jmp :++
:	lda $228+0
	sta $22c+0
	lda $228+3
	clc
	adc #$08
	sta $22c+3
:
	lda $224+0
	clc
	adc #$03
	sta g_top
	clc
	adc #$02
	sta g_bot
	lda e1_dir
	bne :+
		lda $224+3
		sta g_left
		clc
		adc #$05
		sta g_right
		jmp :++
:	lda $224+3
	clc
	adc #$04
	sta g_left
	clc
	adc #$03
	sta g_right
:

	lda $230+0
	clc
	adc #$03
	sta s_top
	clc
	adc #$02
	sta s_bot
	lda e2_dir
	beq :+
		lda $230+3
		clc
		adc #$04
		sta s_left
		clc
		adc #$03
		sta s_right
		jmp :++
:	lda $230+3
	sta s_left
	clc
	adc #$03
	sta s_right
:
	jsr pause_routine
	jmp end_loop
pwrestle_anim:
	lda e1_hit, x
	asl a
	tay
	lda pwrestle_table+1, y
	pha
	lda pwrestle_table+0, y
	pha
	rts
pwrestle_table:
	.addr pwrestle_feet-1, pwrestle_kick-1, pwrestle_grapple-1, pwrestle_suplex-1, pwrestle_slam-1
	.addr pwrestle_pin-1, pwrestle_suplexed-1, pwrestle_slammed-1, pwrestle_mat-1, pwrestle_nada-1
	.addr pwrestle_efeet-1, pwrestle_ekick-1, pwrestle_egrapple-1, pwrestle_esuplex-1, pwrestle_eslam-1
	.addr pwrestle_epin-1, pwrestle_esuplexed-1, pwrestle_eslammed-1, pwrestle_emat-1, pwrestle_nada-1
pwrestle_nada:
	rts
pwrestle_feet:
	dec e5_hit
	lda #$fd
	sta $21c+1
	lda e5_hit
	cmp #$10
	bcc :+
		lda #$e1
		sta $220+1
		bne :++
:	lda #$e3
	sta $220+1
:	lda e1_dir
	beq :+
		lda #$41
		bne :++
:	lda #$01
:	sta $21c+2
	sta $220+2
	lda #$f0
	sta $224+0
	lda #$00
	sta $224+3
	rts
pwrestle_kick:
	dec e5_hit
	bne :+
		jsr wrestle_hit
		lda #$00
		sta e1_hit
		rts
:
	lda #$e5
	sta $224+1
	lda #$e4
	sta $21c+1
	lda #$e6
	sta $220+1
	lda $21c+0
	sta $224+0
	lda e1_dir
	beq :+
		lda $21c+3
		sec
		sbc #$08
		sta $224+3
		lda #$41
		sta $224+2
		rts
:	lda $21c+3
	clc
	adc #$08
	sta $224+3
	lda #$01
	sta $224+2
	rts
pwrestle_grapple:
	dec e5_hit
	bne :+
		lda #$00
		sta e1_hit
		sta g_counter1
		rts
:
	lda #$ff
	sta $224+1
	lda #$fe
	sta $21c+1
	lda $21c+0
	sta $224+0
	lda e1_dir
	beq :+
		lda $21c+3
		sec
		sbc #$08
		sta $224+3
		lda #$41
		sta $224+2
		rts
:	lda $21c+3
	clc
	adc #$08
	sta $224+3
	lda #$01
	sta $224+2
	rts
pwrestle_suplex:
	dec e5_hit
	bne :+++
		jsr wrestle_hit
		lda $220+0
		sta $228+0
		sta $21c+0
		lda e1_dir
		beq :+
			lda $220+3
			clc
			adc #$10
			sta $228+3
			jmp :++
:		lda $220+3
		sec
		sbc #$10
		sta $228+3
:		lda #$08
		sta e1_hit
		lda #$30
		sta e5_hit
		rts
:	lda #$e0
	sta $21c+1
	lda #$e1
	sta $220+1
	lda #$f0
	sta $224+0
	lda #$00
	sta $224+3
	lda $21c+0
	sec
	sbc #$0a
	sta $228+0
	lda e1_dir
	beq @left
		lda #$a0
		sta $21c+3
		lda #$41
		sta $21c+2
		sta $220+2
		lda $21c+3
		sec
		sbc #$02
		sta $228+3
		rts
@left:
	lda #$b8
	sta $21c+3
	lda #$01
	sta $21c+2
	sta $220+2
	lda $21c+3
	clc
	adc #$02
	sta $228+3
	rts
pwrestle_slam:
	dec e5_hit
	bne :+++
		jsr wrestle_hit
		lda $220+0
		sta $228+0
		lda e1_dir
		beq :+
			lda $220+3
			clc
			adc #$10
			sta $228+3
			jmp :++
:		lda $220+3
		sec
		sbc #$10
		sta $228+3
:		lda #$00
		sta e1_hit
		lda #$30
		sta e5_hit
		rts
:	lda #$e0
	sta $21c+1
	lda #$e1
	sta $220+1
	lda #$f0
	sta $224+0
	lda #$00
	sta $224+3
	lda $21c+0
	sec
	sbc #$06
	sta $228+0
	lda e1_dir
	beq @left
		lda #$a0
		sta $21c+3
		lda #$41
		sta $21c+2
		sta $220+2
		lda $21c+3
		sec
		sbc #$02
		sta $228+3
		rts
@left:
	lda #$b8
	sta $21c+3
	lda #$01
	sta $21c+2
	sta $220+2
	lda $21c+3
	clc
	adc #$02
	sta $228+3
	rts
pwrestle_pin:
	lda #$e9
	sta $21c+1
	lda #$ea
	sta $220+1
	lda $228+0
	sec
	sbc #$04
	sta $21c+0
	lda $228+3
	clc
	adc #$04
	sta $21c+3
	rts
pwrestle_suplexed:
	dec e5_hit
	bne :+
		lda e5_bot
		sec
		sbc #$05
		sta e5_bot
		lda #$08
		sta e1_hit
		lda #$30
		sta e5_hit
		rts
:
	lda #$e9
	sta $21c+1
	lda #$ea
	sta $220+1
	lda #$f0
	sta $224+0
	lda #$00
	sta $224+3
	lda e1_dir
	beq @other_dir1
		lda #$01
		sta $21c+2
		sta $220+2
		rts
@other_dir1:
	lda #$41
	sta $21c+2
	sta $220+2
	rts
pwrestle_slammed:
	
	rts
pwrestle_mat:
	lda e5_bot
	bpl :+
	lda #$0f
	sta e2_hit
	lda #$01
	sta e6_hit
	lda #$f0
	sta $224+0
	lda #$00
	sta $224+3
	lda e1_dir
	beq @other_dir0
		lda #$e7
		sta $21c+1
		lda #$e8
		sta $220+1
		lda #$01
		sta $21c+2
		sta $220+2
		rts
@other_dir0:
	lda #$e8
	sta $21c+1
	lda #$e7
	sta $220+1
	lda #$41
	sta $21c+2
	sta $220+2
		rts
:
	dec e5_hit
	bne :+
		lda $220+0
		sec
		sbc #$08
		sta $21c+0
		lda $220+3
		sta $21c+3
		lda #$00
		sta e1_hit
		rts
:
	lda #$f0
	sta $224+0
	lda #$00
	sta $224+3
	lda e2_dir
	beq @other_dir1
		lda #$e8
		sta $21c+1
		lda #$e7
		sta $220+1
		lda #$41
		sta $21c+2
		sta $220+2
		rts
@other_dir1:
	lda #$e7
	sta $21c+1
	lda #$e8
	sta $220+1
	lda #$01
	sta $21c+2
	sta $220+2
	rts
wrestle_hit:
	ldx #$2d
	jmp return_sfx_routine
wrestle_hit1:
	rts
wrestle_beep:
	ldx #$2e
	jmp return_sfx_routine
wrestle_score:
	rts
pwrestle_efeet:
	dec e6_hit
	lda #$fd
	sta $228+1
	lda e6_hit
	cmp #$10
	bcc :+
		lda #$e1
		sta $22c+1
		bne :++
:	lda #$e3
	sta $22c+1
:	lda e2_dir
	beq :+
		lda #$42
		bne :++
:	lda #$02
:	sta $228+2
	sta $22c+2
	lda #$f0
	sta $230+0
	sta $230+3
	rts
pwrestle_ekick:
	
	rts
pwrestle_egrapple:
	dec e6_hit
	bne :+
		lda #$0a
		sta e2_hit
		lda #$00
		sta g_counter2
		rts
:	lda e6_hit
	cmp #$01
	bne :+++
		lda nmi_num
		cmp #$80
		bcc :+
			lda #$0d
			sta e2_hit
			bne :++
:		lda #$0e
		sta e2_hit
:		lda #$30
		sta e5_hit
		sta e6_hit
		lda #$06
		sta e1_hit
		rts
:
	lda #$ff
	sta $230+1
	lda #$fe
	sta $228+1
	lda $228+0
	sta $230+0
	lda e2_dir
	beq :+
		lda $228+3
		sec
		sbc #$08
		sta $230+3
		lda #$42
		sta $230+2
		rts
:	lda $228+3
	clc
	adc #$08
	sta $230+3
	lda #$02
	sta $230+2
	rts
pwrestle_esuplex:
	dec e6_hit
	bne :+++
		jsr wrestle_hit
		lda $22c+0 ; 22c
		sta $228+0
		sta $21c+0 ; 21c
		sta $220+0 ; 220
		lda e2_dir
		beq :+
			lda $22c+3
			clc
			adc #$10
			sta $21c+3
			jmp :++
:		lda $22c+3
		sec
		sbc #$10
		sta $21c+3
:		lda #$12
		sta e2_hit
		lda #$30
		sta e6_hit
		rts
:	lda #$e0
	sta $228+1
	lda #$e1
	sta $22c+1
	lda #$f0
	sta $230+0
	sta $230+3
	lda $228+0
	sec
	sbc #$0a
	sta $21c+0
	lda e2_dir
	beq @left
		lda #$a0
		sta $228+3
		lda #$42
		sta $228+2
		sta $22c+2
		lda $228+3
		sec
		sbc #$02
		sta $21c+3
		rts
@left:
	lda #$b8
	sta $228+3
	lda #$02
	sta $228+2
	sta $22c+2
	lda $228+3
	clc
	adc #$02
	sta $21c+3
	rts
pwrestle_eslam:
	dec e6_hit
	bne :+++
		jsr wrestle_hit
		lda $22c+0
		sta $21c+0
		lda e2_dir
		beq :+
			lda $22c+3
			clc
			adc #$10
			sta $21c+3
			jmp :++
:		lda $22c+3
		sec
		sbc #$10
		sta $21c+3
:		lda #$0a
		sta e2_hit
		lda #$30
		sta e6_hit
		rts
:	lda #$e0
	sta $228+1
	lda #$e1
	sta $22c+1
	lda #$f0
	sta $230+0
	sta $230+3
	lda $228+0
	sec
	sbc #$06
	sta $21c+0
	lda e2_dir
	beq @left
		lda #$a0
		sta $228+3
		lda #$42
		sta $228+2
		sta $22c+2
		lda $228+3
		sec
		sbc #$02
		sta $21c+3
		rts
@left:
	lda #$b8
	sta $228+3
	lda #$02
	sta $228+2
	sta $22c+2
	lda $228+3
	clc
	adc #$02
	sta $21c+3
	rts
pwrestle_epin:
	lda #$e9
	sta $228+1
	lda #$ea
	sta $22c+1
	lda $21c+0
	sec
	sbc #$0b
	sta $228+0
	lda $21c+3
	clc
	adc #$04
	sta $228+3
	rts
pwrestle_esuplexed:
	dec e6_hit
	bne :+
		lda e6_bot
		sec
		sbc #$05
		sta e6_bot
		lda #$12
		sta e2_hit
		lda #$30
		sta e6_hit
		rts
:
	lda #$e9
	sta $228+1
	lda #$ea
	sta $22c+1
	lda #$f0
	sta $230+0
	sta $230+3
	lda e2_dir
	beq @other_dir1
		lda #$02
		sta $228+2
		sta $22c+2
		rts
@other_dir1:
	lda #$42
	sta $228+2
	sta $22c+2
	rts
pwrestle_eslammed:
	
	rts
pwrestle_emat:
	lda e6_bot
	bpl :+
	lda #$05
	sta e1_hit
	lda #$01
	sta e5_hit
	lda #$f0
	sta $230+0
	sta $230+3
	lda e2_dir
	beq @other_dir0
		lda #$e7
		sta $228+1
		lda #$e8
		sta $22c+1
		lda #$02
		sta $228+2
		sta $22c+2
		rts
@other_dir0:
	lda #$e8
	sta $228+1
	lda #$e7
	sta $22c+1
	lda #$42
	sta $228+2
	sta $22c+2
		rts
:
	dec e6_hit
	bne :+
		lda $22c+0
		sec
		sbc #$08
		sta $228+0
		lda $22c+3
		sta $2228+3
		lda #$0a
		sta e2_hit
		rts
:
	lda #$f0
	sta $230+0
	sta $230+3
	lda e2_dir
	beq @other_dir1
		lda #$e7
		sta $228+1
		lda #$e8
		sta $22c+1
		lda #$02
		sta $228+2
		sta $22c+2
		rts
@other_dir1:
	lda #$e8
	sta $228+1
	lda #$e7
	sta $22c+1
	lda #$42
	sta $228+2
	sta $22c+2
	rts

pwrestle_emove:
	lda $228+0
	cmp $21c+0
	beq @side_test
	bcc :+
		lda e2_spd_lo
		sec
		sbc #$40
		sta e2_spd_lo
		lda $228+0
		sbc #$00
		sta $228+0
		jmp @side_test
:	lda e2_spd_lo
	clc
	adc #$40
	sta e2_spd_lo
	lda $228+0
	adc #$00
	sta $228+0
@side_test:
	lda $228+3
	sec
	sbc #$0a
	cmp $21c+3
	bcs :+
		lda $21c+3
		sec
		sbc #$0a
		cmp $228+3
		bcs :+
			rts
:
	lda $228+3
	cmp $21c+3
	bcc :+
		lda e4_spd_lo
		sec
		sbc #$40
		sta e4_spd_lo
		lda $228+3
		sbc #$00
		sta $228+3
		rts
:	lda e4_spd_lo
	clc
	adc #$40
	sta e4_spd_lo
	lda $228+3
	adc #$00
	sta $228+3
	rts
game_nmi20:	; prowrestling
	jsr game_write_stats
	jmp end_nmi
	
	
	










; boxes 4=?,1=block,2=pipe,3=goomba,0=pit
smb_coll:
	.byte $06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
smb_y:
	.byte $37, $37,$37,$37,$37,$37, $4f,$4f, $4f, $47,$4f,$47,$4f, $4f, $47,$4f,$47,$4f, $4f,$4f, $47,$4f,$47,$4f, $37, $57,$57, $37,$37,$37, $57,$57, $37,$4f,$4f,$37,$37, $37,$4f,$37,$37, $4f,$4f,$37, $4f,$4f,$4f,$37,$37,$4f, $4f,$47,$3f,$3f,$47,$4f, $4f,$47,$57,$57,$47,$4f, $4f,$4f, $3f,$3f,$3f,$3f, $4f,$4f, $4f,$47,$3f,$37,$ff
smb_700offset:
	.byte $0b, $0b,$0b,$0b,$0b,$0b, $3b,$3b, $3b, $2b,$3b,$2b,$3b, $3b, $2b,$3b,$2b,$3b, $3b,$3b, $2b,$3b,$2b,$3b, $0b, $4b,$4b, $0b,$0b,$0b, $4b,$4b, $0b,$3b,$3b,$0b,$0b, $0b,$3b,$0b,$0b, $3b,$3b,$0b, $3b,$3b,$3b,$0b,$0b,$3b, $3b,$2b,$1b,$1b,$2b,$3b, $3b,$2b,$4b,$4b,$2b,$3b, $3b,$3b, $1b,$1b,$1b,$1b, $3b,$3b, $3b,$2b,$1b,$0b
smb_tile:                                                                                                                                            
	.byte $cb, $c5,$cb,$c5,$cb,$c5, $cf,$cf, $ca, $cf,$6b,$cf,$65, $ca, $cf,$6b,$cf,$65, $ca,$ca, $cf,$6b,$cf,$65, $cb, $ce,$ce, $c5,$cb,$c5, $ce,$ce, $c5,$ca,$ca,$c5,$c5, $cb,$ca,$cb,$cb, $ca,$ca,$c5, $ca,$ca,$ca,$c5,$c5,$ca, $c5,$c5,$c5,$c5,$c5,$c5, $c5,$c5,$ce,$ce,$c5,$c5, $cf,$cf, $c5,$c5,$cb,$c5, $ca,$ca, $c5,$c5,$c5,$c5
smb_attr:                                                                                                                                            
	.byte $02, $02,$02,$02,$02,$02, $03,$43, $02, $03,$03,$43,$03, $02, $03,$03,$43,$03, $02,$02, $03,$03,$43,$03, $02, $00,$00, $02,$02,$02, $00,$00, $02,$02,$02,$02,$02, $02,$02,$02,$02, $02,$02,$02, $02,$02,$02,$02,$02,$02, $02,$02,$02,$02,$02,$02, $02,$02,$00,$00,$02,$02, $03,$43, $02,$02,$02,$02, $02,$02, $02,$02,$02,$02
smb_box:                                                                                                                                             
	.byte $04, $01,$04,$01,$04,$01, $02,$02, $03, $02,$02,$02,$02, $03, $02,$02,$02,$02, $03,$03, $02,$02,$02,$02, $04, $00,$00, $01,$04,$01, $00,$00, $01,$03,$03,$01,$01, $04,$03,$04,$04, $03,$03,$01, $03,$03,$03,$01,$01,$03, $01,$01,$01,$01,$01,$01, $01,$01,$00,$00,$01,$01, $02,$02, $01,$01,$04,$01, $03,$03, $01,$01,$01,$01
smb_wait:                                                                                                                                            
	.byte $05, $01,$01,$01,$01,$07, $01,$05, $06, $00,$01,$00,$07, $07, $00,$01,$00,$05, $02,$06, $00,$01,$00,$06, $04, $01,$05, $01,$01,$06, $01,$05, $04,$03,$02,$01,$06, $01,$02,$03,$04, $02,$03,$05, $02,$02,$03,$01,$00,$08, $01,$01,$03,$01,$01,$07, $01,$01,$01,$01,$01,$08, $01,$04, $01,$01,$01,$05, $02,$07, $01,$01,$01,$05
smb_spr_mirror: ; smb
	.byte $4f,$c8,$01,$88	; mario
	.byte $f0,$ca,$02,$d8	; 21c goomba
	.byte $f0,$cb,$02,$d8	; 220 q block
	.byte $f0,$f0,$03,$d8	; 224 fire flower
	.byte $f0,$cd,$03,$d8	; 228 fireball
	.byte $f0,$ce,$00,$a8	; 22c pit
	.byte $f0,$c5,$02,$d8	; 230 brick
	.byte $f8,$cd,$03,$f0	; 234
game_loop24: ; smb
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
		lda #$20
		sta g_counter2				; delay to bring on objects
		sta e6_spd_lo
		lda #12
		sta e6_spd_lo
		ldx #$00
		stx g_counter1
		stx g_left
		ldy #$00
:		lda smb_coll, x
		sta $740, y
		iny
		inx
		cpx e6_spd_lo
		bne :-
			lda e6_spd_lo
			clc
			adc #12
			sta e6_spd_lo
			iny
			iny
			iny
			iny
			cpy #128
			bne :-
		lda #$06
		sta $7bc
		lda #$06
		sta s_top				; mario y
		lda #$01
		sta s_bot				; mario x
		ldx #$00
:		lda smb_spr_mirror, x
		sta $218+0, x
		inx
		cpx #$20
		bne :-
		jmp end_loop
@done_init:


	lda e5_spd_lo					; smb_wait goes in here
	bne @no_new
@smb_new:
		ldx g_counter1
		ldy e4_spd_lo				; sprite offset for y (by 4's)
		lda smb_y, x
		cmp #$ff
		bne :+
			lda #$72
			sta g_counter3
			lda #$00
			sta e6_spd_lo
			jmp end_loop
:		sta $21c+0, y
		lda smb_tile, x
		sta $21c+1, y
		lda smb_attr, x
		sta $21c+2, y
		lda #$d8
		sta $21c+3, y
		ldy e3_spd_lo				; offset for the six (by 1's)
		lda smb_box, x
		sta e1_hit, y
		lda smb_wait, x
		sta e5_spd_lo
		lda smb_700offset, x
		tay
		lda smb_box, x
		sta $770, y
		inc e3_spd_lo
		lda e4_spd_lo
		clc
		adc #$04
		sta e4_spd_lo
		cmp #24
		bne :+
			lda #$00
			sta e4_spd_lo
			sta e3_spd_lo
:
		inc g_counter1
		lda e5_spd_lo
		bne :+
			jmp @smb_new
:
@no_new:

	lda game_misses
	cmp #$03
	bne :+
		lda #$72
		sta g_counter3
		jmp end_loop
:

	dec g_counter2
	bne @bg_not_moving
		dec e5_spd_lo
		ldy #$00
@smb_more_spr:
		lda $21c+3, y
		sec
		sbc #$08
		sta $21c+3, y
		cmp #$78
		bne :+
			lda #$f0
			sta $21c+0, y
:		lda $21c+1, y
		cmp #$ca
		bne :+
			lda $21c+2, y
			eor #%01000000
			sta $21c+2, y
:		lda $21c+1, y
		cmp #$cc
		bne :+
			lda #$30
			sta pal_address+21
			lda #$f0
			sta $21c+0, y
			lda #$00
			sta $21c+1, y
:
		iny
		iny
		iny
		iny
		cpy #24
		bne @smb_more_spr
		ldy #$00
:		lda $771, y
		sta $770, y
		lda $781, y
		sta $780, y
		lda $791, y
		sta $790, y
		lda $7a1, y
		sta $7a0, y
		lda $7b1, y
		sta $7b0, y
		iny
		cpy #12
		bne :-
		lda #$20
		sta g_counter2
@bg_not_moving:

	ldx s_top
	lda smb_coll_lo, x
	sta temp_16bit_1+0
	lda #$07
	sta temp_16bit_1+1
	ldy s_bot
	lda (temp_16bit_1), y
	beq :+
		cmp #$03
		bne :+
			jsr smb_test_baddie
:

	ldx s_left
	lda smb_coll_lo, x
	sta temp_16bit_1+0
	lda #$07
	sta temp_16bit_1+1
	ldy s_right
	lda (temp_16bit_1), y
	beq :++
		cmp #$03
		bne :+
			jsr smb_test_fire
:	lda #$f8
	sta $234+0
	lda #$f0
	sta $234+3
:
	lda g_counter2
	cmp #$20
	bne :+
		jsr smb_test_back
		jmp @smb_same_time
:	cmp #$18
	bne :+
		jmp @smb_same_time
:	cmp #$10
	bne :+
		jmp @smb_same_time
:	cmp #$08
	beq @smb_same_time
		jmp @no_control
@smb_same_time:

	lda $218+0
	cmp #$57
	bne :+
		lda #$03
		sta game_misses
		lda #$72
		sta g_counter3
		jmp end_loop
:
	lda e2_spd_lo
	cmp #$02
	beq @no_fall_test
		ldx s_top
		inx
		lda smb_coll_lo, x
		sta temp_16bit_1+0
		lda #$07
		sta temp_16bit_1+1
		ldy s_bot
		lda (temp_16bit_1), y
		beq :++
			cmp #$03
			bne :+
				lda #$01
				sta e1_dir
				bne :++
:
			lda #$00
			sta e1_spd_lo
			sta e2_spd_lo
			sta g_left
			jmp @no_fall_test
:
		lda $218+0
		clc
		adc #$08
		sta $218+0
		inc s_top
		dec e1_spd_lo
;		jmp @no_control
@no_fall_test:

	jsr smb_test_in

	lda $234+2
	cmp #$03
	bne :+
		lda #$83
		sta $234+2
		bne :++
:	lda #$03
	sta $234+2
:
	lda $234+0
	cmp #$f8
	bne :++
:			lda #$f8
			sta $234+0
			lda #$f0
			sta $234+3
			bne @done_fireball_move
:		lda s_right
		cmp #$0b
		beq :--
		lda $234+3
		clc
		adc #$08
		sta $234+3
		inc s_right
@done_fireball_move:

	lda $218+1
	cmp #$c8
	bne :+
		lda #$c9
		sta $218+1
		bne :++
:	lda #$c8
	sta $218+1
:
	lda $218+3
	cmp #$78
	bne :+
		lda $218+2
		eor #%00100000
		sta $218+2
		lda #$03
		sta game_misses
		lda #$72
		sta g_counter3
		lda #$f0
		sta $218+0
:

	lda control_pad
	and #a_punch
	beq @no_a
			ldx s_top
			dex
			lda smb_coll_lo, x
			sta temp_16bit_1+0
			lda #$07
			sta temp_16bit_1+1
			ldy s_bot
			lda (temp_16bit_1), y
			cmp #$06
			bne :+
				lda #$01
				sta e2_spd_lo
				jmp @no_a
:		lda e2_spd_lo
		beq :+
			cmp #$02
			beq :+
				jmp @no_a
:		lda e1_spd_lo
		cmp #$03
		bne :+
			lda #$01
			sta e2_spd_lo
			jmp @no_a
:		inc e1_spd_lo
		lda #$02
		sta e2_spd_lo
		lda $218+0
		sec
		sbc #$08
		sta $218+0
		dec s_top
		lda g_left
		bne :+
			jsr smb_jump_sound
			lda #$01
			sta g_left
:
@no_a:
	lda control_pad
	and #b_punch
	beq @no_b
		lda $234+0
		cmp #$f8
		beq :+
			jmp @no_b
:		lda pal_address+21
		cmp #$30
		bne @no_b
			lda s_top
			cmp #$06
			beq :+
				jmp @no_b
:			lda $218+0
			sta $234+0
			lda $218+3
			clc
			adc #$08
			sta $234+3
			lda #$06
			sta s_left	; fireball y pos
			lda s_bot
			clc
			adc #$01
			sta s_right	; fireball x pos
			jsr smb_fire_sound
@no_b:
	lda control_pad
	and #left_punch
	beq @no_left
		lda $218+3
		cmp #$80
		beq @no_right
			ldx s_top
			lda smb_coll_lo, x
			sec
			sbc #$01
			sta temp_16bit_1+0
			lda #$07
			sta temp_16bit_1+1
			ldy s_bot
			lda (temp_16bit_1), y
			beq :+
				cmp #$03
				beq :+
				jmp @no_control
:			lda $218+3
			sec
			sbc #$08
			sta $218+3
			dec s_bot
			jmp @no_right
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda $218+3
		cmp #$d0
		beq @no_right
			ldx s_top
			lda smb_coll_lo, x
			sta temp_16bit_1+0
			lda #$07
			sta temp_16bit_1+1
			ldy s_bot
			iny
			lda (temp_16bit_1), y
			beq :++
				cmp #$03
				bne :+	
					lda $218+3
					clc
					adc #$08
					sta $218+3
					inc s_bot
:				jmp @no_control
:			lda $218+3
			clc
			adc #$08
			sta $218+3
			inc s_bot
@no_right:
	lda e2_spd_lo
	cmp #$02
	bne :+
		lda control_pad
		and #a_punch
		bne :+
			lda #$01
			sta e2_spd_lo
:

@no_control:
	jsr pause_routine
	jmp end_loop

smb_coll_lo:
	.byte $40,$50,$60,$70,$80,$90,$a0,$b0

smb_test_back:
		ldy #$00
@beginning:
		lda $218+0
		cmp $21c+0, y
		bne @inc_more
			lda $218+3
			cmp $21c+3, y
			bne @inc_more
				lda $21c+1, y
				cmp #$ca
				bne :+
					inc game_misses
					lda #$00
					sta e1_dir
					jsr smb_tester
					jsr smb_hit_sound
					jmp @no_move
:				lda $218+3
				sec
				sbc #$08
				sta $218+3
				dec s_bot
				rts
@inc_more:
		iny
		iny
		iny
		iny
		cpy #24
		bne @beginning
@no_move:
		rts
smb_test_baddie:
		ldy #$00
@beginning:
		lda $218+0
		cmp $21c+0, y
		bne @inc_more
			lda $218+3
			cmp $21c+3, y
			bne @inc_more
				lda $21c+1, y
				cmp #$ca
				bne :++
					lda #$f0
					sta $21c+0, y
					ldx s_top
					lda smb_coll_lo, x
					sta temp_16bit_1+0
					lda #$07
					sta temp_16bit_1+1
					ldy s_bot
					lda #$00
					sta (temp_16bit_1), y
					lda pal_address+21
					cmp #$30
					bne :+
						lda #$18
						sta pal_address+21
:					inc game_misses
					jsr smb_hit_sound
					jmp @no_move
:				rts
@inc_more:
		iny
		iny
		iny
		iny
		cpy #24
		bne @beginning
@no_move:
		rts



smb_test_fire:
		ldy #$00
@beginning:
		lda $234+0
		cmp $21c+0, y
		bne @inc_more
			lda $234+3
			cmp $21c+3, y
			bne @inc_more
				lda $21c+1, y
				cmp #$ca
				bne :+
					lda #$f0
					sta $21c+0, y
					ldx s_left
					lda smb_coll_lo, x
					sta temp_16bit_1+0
					lda #$07
					sta temp_16bit_1+1
					ldy s_right
					lda #$00
					sta (temp_16bit_1), y
					jsr do_score
	jsr smb_score_sound
					jmp @no_move
:				rts
@inc_more:
		iny
		iny
		iny
		iny
		cpy #24
		bne @beginning
@no_move:
		rts

smb_test_in:
		ldy #$00
@beginning:
		lda $218+0
		cmp $21c+0, y
		bne @inc_more
			lda $218+3
			cmp $21c+3, y
			bne @inc_more
				tya
				lsr
				lsr
				tax
				jsr smb_tester
				rts
@inc_more:
		iny
		iny
		iny
		iny
		cpy #24
		bne @beginning
@no_move:
		rts
; boxes 4=?,1=block,2=pipe,3=goomba,0=pit
smb_tester:
	lda e1_hit, x
	asl a
	tax
	lda smb_table+1, x
	pha
	lda smb_table+0, x
	pha
	rts
smb_table:
	.addr smb_pit-1, smb_block-1, smb_pipe-1, smb_goomba-1, smb_question-1
smb_pit:

	rts
smb_block:
	lda #$f0
	sta $21c+0, y
	jsr smb_coll_remove
	jsr do_score
	jsr smb_score_sound
	rts
smb_pipe:

	rts
smb_goomba:
	lda e1_dir
	bne :+
;		inc game_misses
		jmp :++
:
	jsr do_score
:	lda #$f0
	sta $21c+0, y
	jsr smb_coll_remove
	lda #$00
	sta e1_dir
	jsr smb_score_sound
	rts
smb_question:
	lda $21c+0, y
	sec
	sbc #$08
	sta $21c+0, y
	lda #$cc
	sta $21c+1, y
	lda #$03
	sta $21c+2, y
	jsr smb_coll_remove
	jsr do_score
	jsr smb_score_sound
	rts
smb_score_sound:
	ldx #$32
	jmp return_sfx_routine
smb_beep:
	rts
smb_hit_sound:
	ldx #$33
	jmp return_sfx_routine
smb_hit:
	rts
smb_jump_sound:
	ldx #$34
	jmp return_sfx_routine
smb_jump:
	rts
smb_fire_sound:
	ldx #$35
	jmp return_sfx_routine
smb_fire:
	rts
smb_coll_remove:
	ldx s_top
	lda smb_coll_lo, x
	sta temp_16bit_1+0
	lda #$07
	sta temp_16bit_1+1
	ldy s_bot
	lda #$00
	sta (temp_16bit_1), y
	rts

game_nmi24: ; smb
	jsr game_write_stats
	jmp end_nmi




