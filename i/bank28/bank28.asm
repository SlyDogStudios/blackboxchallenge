.segment "BANK28"


; THE GLITCHED "GAME"
game_loop32:
	jsr game_end_game2
	lda game_quit
	beq :+
		jmp game_end_game3
:
	jmp end_loop
game_nmi32:
	inc e1_spd_lo
	lda e1_spd_lo
	cmp #$3c
	bne :++
		lda #$00
		sta e1_spd_lo
		lda pal_address+11
		cmp #$19
		bne :+
			lda #$0f
			sta pal_address+11
			bne :++
:		lda #$19
		sta pal_address+11
:
	jmp end_nmi





dkmath_top_lo:
	.byte <dkmath_zero0,<dkmath_one0,<dkmath_two0,<dkmath_three0,<dkmath_four0
	.byte <dkmath_five0,<dkmath_six0,<dkmath_seven0,<dkmath_eight0,<dkmath_nine0
dkmath_top_hi:
	.byte >dkmath_zero0,>dkmath_one0,>dkmath_two0,>dkmath_three0,>dkmath_four0
	.byte >dkmath_five0,>dkmath_six0,>dkmath_seven0,>dkmath_eight0,>dkmath_nine0
dkmath_bot_lo:
	.byte <dkmath_zero1,<dkmath_one1,<dkmath_two1,<dkmath_three1,<dkmath_four1
	.byte <dkmath_five1,<dkmath_six1,<dkmath_seven1,<dkmath_eight1,<dkmath_nine1
dkmath_bot_hi:
	.byte >dkmath_zero1,>dkmath_one1,>dkmath_two1,>dkmath_three1,>dkmath_four1
	.byte >dkmath_five1,>dkmath_six1,>dkmath_seven1,>dkmath_eight1,>dkmath_nine1
dkmath_zero0:
	.byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39
dkmath_zero1:
	.byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39
dkmath_one0:
	.byte $30,$31, $32,$33,$34,$35,$36,$37,$38,$39
dkmath_one1:
	.byte $31,$30, $31,$32,$33,$34,$35,$36,$37,$38
dkmath_two0:
	.byte $30,$32,$31, $33,$34,$35,$36,$37,$38,$39
dkmath_two1:
	.byte $32,$30,$31, $31,$32,$33,$34,$35,$36,$37
dkmath_three0:
	.byte $33,$30,$32,$31, $34,$35,$36,$37,$38,$39
dkmath_three1:
	.byte $30,$33,$31,$32, $31,$32,$33,$34,$35,$36
dkmath_four0:
	.byte $34,$30,$32,$31,$33, $35,$36,$37,$38,$39
dkmath_four1:
	.byte $30,$34,$32,$33,$31, $31,$32,$33,$34,$35
dkmath_five0:
	.byte $35,$30,$32,$33,$34,$31, $36,$37,$38,$39
dkmath_five1:
	.byte $30,$35,$33,$32,$31,$34, $31,$32,$33,$34
dkmath_six0:
	.byte $36,$30,$33,$34,$32,$35,$31, $37,$38,$39
dkmath_six1:
	.byte $30,$36,$33,$32,$34,$31,$35, $31,$32,$33
dkmath_seven0:
	.byte $37,$30,$35,$32,$33,$34,$36,$31, $38,$39
dkmath_seven1:
	.byte $30,$37,$32,$35,$34,$33,$31,$36, $31,$32
dkmath_eight0:
	.byte $38,$30,$34,$33,$35,$36,$32,$37,$31, $39
dkmath_eight1:
	.byte $30,$38,$34,$35,$33,$32,$36,$31,$37, $31
dkmath_nine0:
	.byte $39,$30,$31,$38,$32,$37,$33,$36,$34,$35
dkmath_nine1:
	.byte $30,$39,$38,$31,$37,$32,$36,$33,$35,$34

dkmath_nums_y:
	.byte $2f,$2f,$2f,$47,$47,$47
dkmath_nums_x:
	.byte $98,$a8,$b8,$98,$a8,$b8
dkmath_pos_y:
	.byte $2f,$37,$37,$2f,$37,$37
dkmath_pos_x:
	.byte $d8,$d0,$d8,$d8,$d0,$d8
dkmath_answer:
	.byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39;$39,$38,$37,$36,$35,$34,$33,$32,$31,$30
dkmath_offset:
	.byte 225,200,175,150,125,100,75,50,25,0
dkmath_spr_mirror:
	.byte $39,$df,$01,$86 ; 218
	.byte $2f,$00,$00,$98 ; 21c top left
	.byte $2f,$00,$00,$a8 ; 220 +
	.byte $2f,$00,$00,$b8 ; 224 top right
	.byte $47,$00,$00,$98 ; 228 bot left
	.byte $47,$00,$00,$a8 ; 22c - 
	.byte $47,$00,$00,$b8 ; 230 bot right
	.byte $47,$00,$00,$d8 ; 234 answer
game_loop07: ; dk math
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

	lda g_counter3
	beq @not_done_counter
		dec g_counter3
		bne @not_done
			ldx #$00
:			lda dkmath_spr_mirror, x
			sta $218+0, x
			inx
			cpx #32
			bne :-
			lda #$00
			sta e1_hit
			sta e2_hit
			sta e3_hit
			sta e4_hit
;			lda #$39
;			sta $218+0
;			lda #$86
;			sta $218+3
@not_done:
	jmp end_loop
@not_done_counter:


	inc g_counter1			; offset of equation
	lda g_counter1
	cmp #10
	bne :+
		lda #$00
		sta g_counter1
:
	inc e5_hit				; top or bottom of left number
	lda e5_hit
	cmp #2
	bne :+
		lda #$00
		sta e5_hit
:
	inc e1_spd_lo			; other left side number
	lda e1_spd_lo
	cmp #100
	bne :+
		lda #$00
		sta e1_spd_lo
:
	dec e2_spd_lo			; other right side number
	lda e2_spd_lo
	cmp #$ff
	bne :+
		lda #99
		sta e2_spd_lo
:

	lda $220+1
	beq :+
		jmp @skip_new
:		ldx #$ff
:		inx
		lda seed
		cmp dkmath_offset, x
		bcc :-
			lda dkmath_answer, x
			sta $234+1
			and #$0f
			sta e4_hit
			lda #$5d
			sta $220+1
			lda #$5e
			sta $22c+1
			lda dkmath_top_lo, x
			sta temp_16bit_1+0
			lda dkmath_top_hi, x
			sta temp_16bit_1+1
			lda dkmath_bot_lo, x
			sta temp_16bit_2+0
			lda dkmath_bot_hi, x
			sta temp_16bit_2+1
			ldy g_counter1
			lda e5_hit
			beq :+
				lda (temp_16bit_1), y
				sta $21c+1
				ldx e1_spd_lo
				lda dkmath_zero0, x
				sta $228+1
				jmp :++
:			lda (temp_16bit_1), y
			sta $228+1
			ldx e1_spd_lo
			lda dkmath_zero0, x
			sta $21c+1
:			jsr do_random_set
			lda seed
			cmp #$80
			bcc :+
				lda (temp_16bit_2), y
				sta $224+1
				ldx e2_spd_lo
				lda dkmath_zero0, x
				sta $230+1
				jmp :++
:			lda (temp_16bit_2), y
			sta $230+1
			ldx e2_spd_lo
			lda dkmath_zero0, x
			sta $224+1
:
@skip_new:

	lda $218+3
	cmp #$c6
	bne math_no_solve
		lda e2_hit
		cmp #$5d
		bne math_subtract
			lda e1_hit
			clc
			adc e3_hit
			cmp e4_hit
			bne math_wrong
				jmp :+
math_subtract:
		lda e2_hit
		cmp #$5e
		bne math_wrong
		lda e1_hit
		sec
		sbc e3_hit
		cmp e4_hit
		bne math_wrong
:			jsr do_score
			jsr do_score
			jsr do_score
			jsr do_score
			jsr do_score
			lda #$72
			sta g_counter3
			ldx #$0f
			jmp return_sfx_routine
math_beep:
			jmp end_loop
math_wrong:
	inc game_misses
	lda #$72
	sta g_counter3
	ldx #$10
	jmp return_sfx_routine
math_hit:
	jmp end_loop
math_no_solve:

	lda $218+0
	sta g_top
	clc
	adc #$08
	sta g_bot
	lda $218+3
	sta g_left
	clc
	adc #$08
	sta g_right

	ldx #$00
	ldy #$00
math_hit_boxes:
	lda $21c+0, y
	sta e1_top, x
	clc
	adc #$08
	sta e1_bot, x
	lda $21c+3, y
	sta e1_left, x
	clc
	adc #$08
	sta e1_right, x

math_hit_tests:
	lda e1_left, x
	cmp g_right
		bcs math_no_coll
	lda e1_right, x
	cmp g_left
		bcc math_no_coll
	lda e1_top, x
	cmp g_bot
		bcs math_no_coll
	lda e1_bot, x
	cmp g_top
		bcc math_no_coll
			lda dkmath_nums_x, x
			cmp #$98
			beq :++
				cmp #$a8
				beq :+
					lda $21c+1, y
					and #$0f
					sta e3_hit
					jmp :+++
:				lda $21c+1, y
				sta e2_hit
				jmp :++
:			lda $21c+1, y
			and #$0f
			sta e1_hit
:			lda dkmath_pos_y, x
			sta $21c+0, y
			lda dkmath_pos_x, x
			sta $21c+3, y
			txa
			cmp #$03
			bcs :+
				inx
				inx
				inx
				tya
				clc
				adc #12
				tay
				bne :++
:			dex
			dex
			dex
			tya
			sec
			sbc #12
			tay
:			lda dkmath_nums_y, x
			sta $21c+0, y
			lda dkmath_nums_x, x
			sta $21c+3, y
			ldx #$11
			jmp return_sfx_routine
math_switch:
			jmp end_loop
math_no_coll:
	iny
	iny
	iny
	iny
	inx
	cpx #$06
	beq math_done_hit_tests
		jmp math_hit_boxes
math_done_hit_tests:

	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq @no_left
		lda $218+3
		cmp #$86
		beq @no_left
			sec
			sbc #$10
			sta $218+3
			jsr do_random_set
			jmp @no_down
@no_left:
	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq @no_right
		lda $218+3
		cmp #$c6
		beq @no_right
			clc
			adc #$10
			sta $218+3
			jsr do_random_set
			jmp @no_down
@no_right:
	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq @no_up
		lda $218+0
		cmp #$2d
		beq @no_up
			sec
			sbc #$0c
			sta $218+0
			jsr do_random_set
			jmp @no_down
@no_up:
	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq @no_down
		lda $218+0
		cmp #$45
		beq @no_down
			clc
			adc #$0c
			sta $218+0
			jsr do_random_set
@no_down:

	jsr pause_routine
	jmp end_loop
game_nmi07: ; dk math
	jsr game_write_stats
	jmp end_nmi

halley_x_0:
	.byte $90,$98,$90,$98,$90,$98
halley_x_1:
	.byte $a8,$b0,$a8,$b0,$a8,$b0
halley_x_2:
	.byte $c0,$c8,$c0,$c8,$c0,$c8
halley_x_lo:
	.byte <halley_x_0,<halley_x_1,<halley_x_2
halley_x_hi:
	.byte >halley_x_0,>halley_x_1,>halley_x_2
halley_spr_lo:
	.byte $19,$31,$49
halley_blank:
	.byte $00,$00,$00,$00,$00,$00, $02
halley_girl:
	.byte $d0,$d1,$d2,$d3,$d4,$d5, $03
halley_old:
	.byte $ea,$eb,$ec,$ed,$ee,$ef, $02
halley_trench:
	.byte $fd,$fe,$e0,$e1,$e2,$e3, $01
halley_shades:
	.byte $e4,$e5,$e6,$e7,$e8,$e9, $01
halley_shot:
	.byte $d6,$d7,$d8,$d9,$da,$db, $02
halley_peeps_lo:
	.byte <halley_blank,<halley_girl,<halley_old,<halley_trench,<halley_shades,<halley_shot
halley_peeps_hi:
	.byte >halley_blank,>halley_girl,>halley_old,>halley_trench,>halley_shades,>halley_shot
halley_table0:
	.byte 1,3,2
halley_table1:
	.byte 2,1,3
halley_table2:
	.byte 3,2,1
halley_table3:
	.byte 2,4,1
halley_table4:
	.byte 4,1,2
halley_table5:
	.byte 1,2,4
halley_table_lo:
	.byte <halley_table0,<halley_table1,<halley_table2,<halley_table3,<halley_table4,<halley_table5
halley_table_hi:
	.byte >halley_table0,>halley_table1,>halley_table2,>halley_table3,>halley_table4,>halley_table5
halley_offset:
	.byte 210,168,126,84,42,0
game_loop13:	; halley
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
	beq @done_wait
		dec g_counter1
		lda g_counter1
		cmp #$3c
		bne :++
			ldy #$00
			lda #$19
			sta temp_16bit_1+0
			lda #$02
			sta temp_16bit_1+1
			lda #$00
:			sta (temp_16bit_1), y
			iny
			iny
			iny
			iny
			cpy #72
			bne :-
				dec e3_spd_lo
				lda #$3c
				sta g_counter3
				lda #$f0
				sta $260
				sta $264
:		jmp end_loop
@done_wait:

	lda e3_spd_lo
	beq @load_peeps
		jmp @flash_miss
@load_peeps:
	ldx #$ff
:	inx
	lda seed
	cmp halley_offset, x
	bcc :-
		lda halley_table_lo, x
		sta temp_16bit_1+0
		lda halley_table_hi, x
		sta temp_16bit_1+1
		ldy #$00
:		lda (temp_16bit_1), y
		sta e1_dir, y
		iny
		cpy #$03
		bne :-
		ldx #$00
		stx g_counter2
:		ldy #$00
		sty e1_spd_lo
		sty e2_spd_lo
		ldx g_counter2
		lda halley_spr_lo, x
		sta temp_16bit_2+0
		lda #$02
		sta temp_16bit_2+1
		lda e1_dir, x
		tax
		lda halley_peeps_lo, x
		sta temp_16bit_1+0
		lda halley_peeps_hi, x
		sta temp_16bit_1+1
:		ldy e1_spd_lo
		lda (temp_16bit_1), y
		iny
		sty e1_spd_lo
		ldy e2_spd_lo
		sta (temp_16bit_2), y
		iny
		iny
		iny
		iny
		sty e2_spd_lo
		cpy #24
		bne :-
			inc temp_16bit_2+0
			lda #$02
			sta temp_16bit_2+1
			ldy #$06
			lda (temp_16bit_1), y
			ldy #$00
:			sta (temp_16bit_2), y
			iny
			iny
			iny
			iny
			cpy #24
			bne :-
				ldy #$00
				sty e1_spd_lo
				sty e2_spd_lo
				inc temp_16bit_2+0
				lda #$02
				sta temp_16bit_2+1
				ldx g_counter2
				lda halley_x_lo, x
				sta temp_16bit_1+0
				lda halley_x_hi, x
				sta temp_16bit_1+1
:				ldy e1_spd_lo
				lda (temp_16bit_1), y
				iny
				sty e1_spd_lo
				ldy e2_spd_lo
				sta (temp_16bit_2), y
				iny
				iny
				iny
				iny
				sty e2_spd_lo
				cpy #24
				bne :-
					inc g_counter2
					lda g_counter2
					cmp #$03
					beq :+
						jmp :----
:					inc e3_spd_lo
					jmp end_loop

@flash_miss:
	dec g_counter3
	bne @not_miss
		ldx #$00
:		lda e1_dir, x
		cmp #$03
		bcs :+
			inx
			bne :-
:		lda halley_x_lo, x
		sta temp_16bit_1+0
		lda halley_x_hi, x
		sta temp_16bit_1+1
		ldy #$00
		lda #$4f
		sta $260
		sta $264
		lda (temp_16bit_1), y
		sta $260+3
		iny
		lda (temp_16bit_1), y
		sta $264+3
		lda #$72
		sta g_counter1
		inc game_misses
		jmp end_loop
;	lda e2_hit
;	bne @not_miss
@not_miss:

@hit_baddie:
	lda e3_hit
	bne :+
		jmp @do_controls
:	tax
	lda halley_peeps_lo, x
	sta temp_16bit_1+0
	lda halley_peeps_hi, x
	sta temp_16bit_1+1
	ldx e1_hit
	lda halley_spr_lo, x
	sta temp_16bit_2+0
	lda #$02
	sta temp_16bit_2+1
	ldy #$00
	sty e1_spd_lo
	sty e2_spd_lo
:	ldy e1_spd_lo
	lda (temp_16bit_1), y
	iny
	sty e1_spd_lo
	ldy e2_spd_lo
	sta (temp_16bit_2), y
	iny
	iny
	iny
	iny
	sty e2_spd_lo
	cpy #24
	bne :-
		jsr do_score
		lda #$72
		sta g_counter1
		lda #$00
		sta e3_hit
		jmp end_loop
@do_controls:
	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq halley_no_left
		jsr do_random_set
		lda #$00
		sta e1_hit
		jsr halley_test_hit
		bne halley_no_right
halley_no_left:
	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq halley_no_up
		jsr do_random_set
		lda #$01
		sta e1_hit
		jsr halley_test_hit
		bne halley_no_right
halley_no_up:
	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq halley_no_shot
		jsr do_random_set
		lda #$02
		sta e1_hit
		jsr halley_test_hit
halley_no_right:
	ldx #$1d
	jmp return_sfx_routine
halley_gun:
halley_no_shot:
	jsr pause_routine
	jmp end_loop

halley_test_hit:
	ldx e1_hit
	lda e1_dir, x
	cmp #$03
	bcs :+
		lda #$01
		sta g_counter3
		rts
:	lda #$05
	sta e3_hit
	rts
game_nmi13:
	jsr game_write_stats
	jmp end_nmi


excite_item:
	.byte $ec,$ed,$ec,$ed,$ec,$ed,$ec,$ec
excite_x:
	.byte $37,$37,$3f,$3f,$47,$47,$4f,$4f
excite_rand:
	.byte 224,192,160,128,96,64,32,0
excite_hop:
	.byte $fe,$fe,$fe,$fe,$fe,$ff,$ff,$02,$02,$02,$02,$01,$01,$01,$01
game_loop09: ; excitebike
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


	lda $224+0
	cmp #$f0
	bne :++
		ldx #$ff
:		inx
		lda seed
		cmp excite_rand, x
		bcc :-
			lda excite_item, x
			sta e1_dir
			sta $224+1
			lda excite_x, x
			sta $224+0
			lda #$d8
			sta $224+3
:	dec $224+3
	lda $224+3
	cmp #$80
	bne :+
		lda #$f0
		sta $224+0
		lda e1_dir
		cmp #$ed
		bne :+
			lda e1_hit
			bne :+
				jmp :++++
:

	lda $228+0
	cmp #$f0
	bne :++
		ldx #$ff
:		inx
		lda seed
		cmp excite_rand, x
		bcc :-
			lda excite_item, x
			sta e2_dir
			sta $228+1
			lda excite_x, x
			sta $228+0
			lda #$d8
			sta $228+3
:	dec $228+3
	lda $228+3
	cmp #$80
	bne :++
		lda #$f0
		sta $228+0
		lda e2_dir
		cmp #$ed
		bne :++
			lda e1_hit
			bne :++
:				inc game_misses
				ldx #$13
				jmp return_sfx_routine
excite_hit1:
:

	lda $218+0
	clc
	adc #$0c
	sta g_top
	clc
	adc #$02
	sta g_bot
	lda $218+3
	sta g_left
	clc
	adc #$09
	sta g_right

	ldx #$00
	ldy #$00
:	lda $224+0, y
	clc
	adc #$02
	sta e1_top, x
	clc
	adc #$05
	sta e1_bot, x
	lda $224+3, y
	clc
	adc #$01
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

	lda e1_hit
	beq :+
		ldx e2_hit
		lda $218+0
		clc
		adc excite_hop, x
		sta $218+0
		lda $21c+0
		clc
		adc excite_hop, x
		sta $21c+0
		sta $220+0
		inx
		stx e2_hit
		cpx #15
		bne :+
			lda #$00
			sta e1_hit
			sta e2_hit
			lda #$e6
			sta $218+1
			lda #$e7
			sta $21c+1
			lda #$e8
			sta $220+1
			jsr do_score
			ldx #$15
			jmp return_sfx_routine
excite_beep:
:

	lda g_counter3
	beq :+
		dec g_counter3
		jmp excite_done_hit_tests
:	lda $224+1
	beq :+
		lda $228+1
		bne :++
:			jmp excite_done_hit_tests
:

	ldx #$00
excite_hit_tests:
	lda e1_left, x
	cmp g_right
		bcs excite_no_coll
	lda e1_right, x
	cmp g_left
		bcc excite_no_coll
	lda e1_top, x
	cmp g_bot
		bcs excite_no_coll
	lda e1_bot, x
	cmp g_top
		bcc excite_no_coll
			lda e1_dir, x
			cmp #$ec
			bne excite_ramp
				inc game_misses
				lda #$10
				sta g_counter3
				ldx #$14
				jmp return_sfx_routine
excite_hit2:
				jmp excite_done_hit_tests
excite_ramp:
			lda #$e9
			sta $218+1
			lda #$ea
			sta $21c+1
			lda #$eb
			sta $220+1
			lda #$10
			sta g_counter3
			lda #$01
			sta e1_hit
			jmp excite_done_hit_tests
excite_no_coll:
	inx
	cpx #$02
	bne excite_hit_tests
excite_done_hit_tests:

	lda g_counter1
	beq @do_controls
		cmp #$01
		bne @do_down
			dec g_counter2
			beq :+
				dec $218+0
				dec $21c+0
				dec $220+0
				jmp @no_down
@do_down:
	dec g_counter2
	beq :+
		inc $218+0
		inc $21c+0
		inc $220+0
		jmp @no_down
:	lda #$00
	sta g_counter1
@do_controls:
	lda e1_hit
	beq :+
		jmp @no_down
:	lda control_pad
	and #up_punch
	beq @no_up
		lda $218+0
		cmp #$2d
		beq @no_down
			jsr do_random_set
			lda #$09
			sta g_counter2
			lda #$01
			sta g_counter1
			bne @no_down
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		lda $218+0
		cmp #$45
		beq @no_down
			jsr do_random_set
			lda #$09
			sta g_counter2
			lda #$02
			sta g_counter1
@no_down:
	jsr pause_routine
	jmp end_loop

excite_bot_tiles:
	.byte $d0,$d1,$d2,$d3,$d0,$d1,$d2,$d3,$d0,$d1,$d2,$d3
excite_top_tiles:
	.byte $d5,$d5,$d5,$d6,$d6,$d6,$d7,$d7,$d7,$d8,$d8,$d8
game_nmi09: ; excitebike
	jsr game_write_stats
	ldx e3_hit
	lda #$2d
	sta $2006
	lda #$70
	sta $2006
	ldy #$00
	lda excite_bot_tiles, x
:	sta $2007
	iny
	cpy #12
	bne :-
	lda #$2c
	sta $2006
	lda #$90
	sta $2006
	ldy #$00
	lda excite_top_tiles, x
:	sta $2007
	iny
	cpy #12
	bne :-
		inx
		cpx #12
		bne :+
			ldx #$00
:		stx e3_hit
		
	jmp end_nmi

golf_target_x:
	.byte $90,$98,$a0,$a8,$b0,$b8,$c0,$c8,$d0
	.byte $90,$98,$a0,$a8,$b0,$b8,$c0,$c8,$d0
	.byte $90,$98,$a0,$c0,$c8,$d0
golf_target_y:
	.byte $27,$27,$27,$27,$27,$27,$27,$27,$27
	.byte $2f,$2f,$2f,$2f,$2f,$2f,$2f,$2f,$2f
	.byte $37,$37,$37,$37,$37,$37
golf_golfer_tiles_lo:
	.byte <golf_golfer_tiles0,<golf_golfer_tiles1,<golf_golfer_tiles2,<golf_golfer_tiles2
golf_golfer_tiles_hi:
	.byte >golf_golfer_tiles0,>golf_golfer_tiles1,>golf_golfer_tiles2,>golf_golfer_tiles2
golf_golfer_tiles0:
	.byte $43,$d3,$02,$b8, $4b,$d4,$02,$b8, $4b,$d5,$02,$c0, $4b,$ee,$01,$c4
	.byte $32,$fe,$01,$a8, $32,$ff,$01,$b0, $3a,$e0,$01,$a8, $3a,$e1,$01,$b0
	.byte $42,$e2,$01,$a8, $42,$e3,$01,$b0, $4a,$e4,$01,$a8, $4a,$e5,$01,$b0
golf_golfer_tiles1:
	.byte $25,$d6,$02,$a2, $2d,$d7,$02,$a2, $35,$d9,$02,$aa, $4b,$ee,$01,$c4
	.byte $32,$f6,$01,$a8, $32,$f7,$01,$b0, $3a,$f8,$01,$a8, $3a,$f9,$01,$b0
	.byte $42,$fa,$01,$a8, $42,$fb,$01,$b0, $4a,$fc,$01,$a8, $4a,$fd,$01,$b0
golf_golfer_tiles2:
	.byte $34,$da,$02,$ac, $34,$db,$02,$b4, $f0,$d5,$02,$c0, $4b,$ef,$01,$c4
	.byte $32,$e6,$01,$a8, $32,$e7,$01,$b0, $3a,$e8,$01,$a8, $3a,$e9,$01,$b0
	.byte $42,$ea,$01,$a8, $42,$eb,$01,$b0, $4a,$ec,$01,$a8, $4a,$ed,$01,$b0
game_loop10: ; golf
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

	lda e1_spd_lo
	cmp #23
	bne :+
		lda #$ff
		sta e1_spd_lo
:	inc e1_spd_lo

	lda g_counter3
	beq @play
		dec g_counter3
		bne @play
			lda #$00
			sta e1_hit
			sta e2_hit
			sta e3_hit
			lda #$f0
			sta $254+0
			ldx e1_spd_lo
			lda golf_target_y, x
			sta $250+0
			lda golf_target_x, x
			sta $250+3
@play:

	lda g_counter2
	bne :+
		jmp golf_skip_em
:	lda $254+0
	cmp e3_dir
	beq :+
		clc
		adc #$01
		sta $254+0
		jmp end_loop
:		lda $250+0
	sta e1_top
	clc
	adc #$07
	sta e1_bot
	lda $250+3
	sta e1_left
	clc
	adc #$07
	sta e1_right

	lda $254+0
	clc
	adc #$06
	sta g_top
	clc
	adc #$01
	sta g_bot
	lda $254+3
	clc
	adc #$02
	sta g_left
	clc
	adc #$02
	sta g_right

	lda e1_left
	cmp g_right
		bcs golf_no_coll
	lda e1_right
	cmp g_left
		bcc golf_no_coll
	lda e1_top
	cmp g_bot
		bcs golf_no_coll
	lda e1_bot
	cmp g_top
		bcc golf_no_coll
			jsr do_score
			jsr do_score
			lda #$00
			sta g_counter2
			lda #$72
			sta g_counter3
			ldx #$16
			jmp return_sfx_routine
golf_beep:
			jmp end_loop
golf_no_coll:
	inc game_misses
	lda #$00
	sta g_counter2
	lda #$72
	sta g_counter3
	ldx #$17
	jmp return_sfx_routine
golf_hit:
	jmp end_loop
golf_skip_em:

	lda g_counter1
	beq :+
		dec g_counter1
		bne :+
			lda #$01
			sta g_counter2
			lda #$19
			sta $254+0
:

	ldx e3_hit
	lda golf_golfer_tiles_lo, x
	sta temp_16bit_1+0
	lda golf_golfer_tiles_hi, x
	sta temp_16bit_1+1
	ldy #$00
:	lda (temp_16bit_1), y
	sta $220, y
	iny
	cpy #48
	bne :-

	lda e3_hit
	cmp #$02
	bne golf_not_hit_yet
		inc e3_hit
		lda $21c+3
		clc
		adc #$03
		sta $254+3
		lda $218+0
		sec
		sbc #$01
		sta e3_dir
		lda #$72
		sta g_counter1
		ldx #$18
		jmp return_sfx_routine
golf_woosh:
golf_not_hit_yet:

	lda e1_hit
	bne @done_left
	lda e1_dir
	bne @go_down
		lda $218+0
		cmp #$1b
		bne :+
			inc e1_dir
			jmp @done_left
:		sec
		sbc #$01
		sta $218+0
		bne @done_left
@go_down:
	lda $218+0
	cmp #$4f
	bne :+
		dec e1_dir
		jmp @done_left
:	clc
	adc #$01
	sta $218+0
@done_left:
	lda e2_hit
	bne @done_right
	lda e2_dir
	bne @go_right
		lda $21c+3
		cmp #$84
		bne :+
			inc e2_dir
			jmp @done_right
:		sec
		sbc #$01
		sta $21c+3
		bne @done_right
@go_right:
	lda $21c+3
	cmp #$d8
	bne :+
		dec e2_dir
		jmp @done_right
:	clc
	adc #$01
	sta $21c+3
@done_right:

	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq @no_b
		lda e1_hit
		bne @no_a
			inc e3_hit
			lda #$01
			sta e1_hit
			bne @no_a
@no_b:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda e2_hit
		bne @no_a
			inc e3_hit
			lda #$01
			sta e2_hit
@no_a:
	jsr pause_routine
	jmp end_loop

game_nmi10:	; golf
	jsr game_write_stats
	jmp end_nmi








game_loop05: ; dk jr
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

	lda e4_spd_lo
	bne @done_inits
		lda #$06
		sta e5_spd_lo
		lda #$01
		sta e6_spd_lo
		sta e4_spd_lo
		sta e2_hit
		lda #$05
		sta e3_hit
		lda #$06
		sta e4_hit
@done_inits:
	
	lda e6_hit
	cmp #$04
	bne :+
		lda #$00
		sta e6_hit
		lda #28
		sta s_right
		lda #$72
		sta e5_hit
		jmp end_loop
:
	lda e5_hit
	beq :++
		dec e5_hit
		bne :+
			jsr dkjr_init
			lda #$72
			sta s_left
:			jmp end_loop
:
	lda s_left
	beq :+
		dec s_left
		jmp end_loop
:
	lda e2_dir
	bne @go_up
		lda $220+0
		cmp #$51
		bne :+
			inc e2_dir
			lda #$04
			sta e3_hit
			jmp @done_chomp
:	lda e2_spd_lo
	clc
	adc #<dkjr_chomp
	sta e2_spd_lo
	lda $220+0
	adc #>dkjr_chomp
	sta $220+0
		bne @done_chomp
@go_up:
	lda $220+0
	cmp #$1f
	bne @do_it
		ldx #$ff
:		inx
		lda seed
		cmp dkjr_offset, x
		bcc :-
			lda dkjr_chomp_x, x
			sta $220+3
			dec e2_dir
			lda #$05
			sta e3_hit
			jmp @done_chomp
@do_it:
	lda e2_spd_lo
	sec
	sbc #<dkjr_chomp
	sta e2_spd_lo
	lda $220+0
	sbc #>dkjr_chomp
	sta $220+0
@done_chomp:

	lda e1_dir
	beq @bird_left
		cmp #$01
		bne :+
			jmp @bird_down
:		cmp #$02
		beq @bird_right
			lda $21c+0
			cmp #$27
			beq :+
				dec $21c+0
				jmp @bird_done
:			lda #$00
			sta e1_dir
			lda #$06
			sta e4_hit
			jmp @bird_done
@bird_right:
	lda $21c+3
	cmp #$d0
	bne :++
		lda $21c+0
		cmp #$4f
		bne :+
			lda #$08
			sta e4_hit
			lda #$03
			sta e1_dir
			jmp @bird_done
:		lda #$01
		sta e1_dir
		lda #$08
		sta e3_dir
		lda #$09
		sta e4_hit
		jmp @bird_done
:	lda e1_spd_lo
	clc
	adc #<dkjr_chomp
	sta e1_spd_lo
	lda $21c+3
	adc #>dkjr_chomp
	sta $21c+3
	bne @bird_done
@bird_left:
	lda $21c+3
	cmp #$88
	bne :+
		lda #$09
		sta e4_hit
		lda #$01
		sta e1_dir
		lda #$08
		sta e3_dir
		bne @bird_done
:	lda e1_spd_lo
	sec
	sbc #<dkjr_chomp
	sta e1_spd_lo
	lda $21c+3
	sbc #>dkjr_chomp
	sta $21c+3
	bne @bird_done
@bird_down:
	inc $21c+0
	dec e3_dir
	bne @bird_done
		lda $21c+3
		cmp #$88
		bne :+
			lda #$02
			sta e1_dir
			lda #$07
			sta e4_hit
			bne @bird_done
:		lda #$00
		sta e1_dir
		lda #$06
		sta e4_hit
@bird_done:

	inc e4_dir			; animations
	lda e4_dir
	cmp #$10
	bne :+
		lda #$00
		sta e4_dir
:

	ldx #$00
:	jsr dkjr_anim
	inx
	cpx #$03
	bne :-

	lda $218+0
	clc
	adc #$02
	sta g_top
	clc
	adc #$05
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
	adc #$02
	sta e1_top, x
	clc
	adc #$05
	sta e1_bot, x
	lda $21c+3, y
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
	cpx #$06
	bne :-

	ldx #$00
dkjr_hit_tests:
	lda e1_left, x
	cmp g_right
		bcs dkjr_no_coll
	lda e1_right, x
	cmp g_left
		bcc dkjr_no_coll
	lda e1_top, x
	cmp g_bot
		bcs dkjr_no_coll
	lda e1_bot, x
	cmp g_top
		bcc dkjr_no_coll
			cpx #$02
			bcs dkjr_key
				inc game_misses
				lda #$72
				sta e5_hit
				lda #12
				sta s_right
				ldx #$0b
				jmp return_sfx_routine
dkjr_hit:
				jmp end_loop
dkjr_key:
	lda dkjr_y_lo, x
	sta temp_16bit_1+0
	lda #$02
	sta temp_16bit_1+1
	ldy #$00
	lda (temp_16bit_1), y
	sec
	sbc #$08
	sta (temp_16bit_1), y
	cmp #$1f
	bne :+
		jsr do_score
		jsr do_score
		inc e6_hit
		ldx #$0a
		jmp return_sfx_routine
dkjr_beep:
:	jmp dkjr_done_hit_tests
dkjr_no_coll:
	inx
	cpx #$06
	bne dkjr_hit_tests
dkjr_done_hit_tests:


	lda g_counter1
	beq @do_controls
		cmp #$01
		beq @do_left
			cmp #$02
			beq @do_right
				cmp #$03
				beq @do_up
					cmp #$04
					beq @do_down
@do_up:
	dec g_counter2
	beq :+
	lda e3_spd_lo
	sec
	sbc #<dkjr_vine
	sta e3_spd_lo
	lda $218+0
	sbc #>dkjr_vine
	sta $218+0
	jmp @no_control
@do_down:
	dec g_counter2
	beq :+
		inc $218+0
		jmp @no_control
@do_left:			
	dec g_counter2
	beq :+
		dec $218+3
		jmp @no_control
@do_right:
	dec g_counter2
	beq :+
		inc $218+3
		jmp @no_control
:	lda #$00
	sta g_counter1
@do_controls:
	lda control_pad
	and #up_punch
	beq @no_up
		jsr do_random_set
		ldx e5_spd_lo
		dex
		lda dkjr_coll_lo, x
		sta temp_16bit_1+0
		lda dkjr_coll_hi, x
		sta temp_16bit_1+1
		ldy e6_spd_lo
		lda (temp_16bit_1), y
		cmp #$01
		beq :+
			jmp @no_control
:		lda #$03
		sta g_counter1
		lda #$21
		sta g_counter2
		dec e5_spd_lo
		lda #$02
		sta e2_hit
		jmp @no_control
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		jsr do_random_set
		ldx e5_spd_lo
		inx
		lda dkjr_coll_lo, x
		sta temp_16bit_1+0
		lda dkjr_coll_hi, x
		sta temp_16bit_1+1
		ldy e6_spd_lo
		lda (temp_16bit_1), y
		cmp #$02
		bne :+
			jmp @no_control
:		lda #$04
		sta g_counter1
		inc e5_spd_lo
		lda #$03
		sta e2_hit
		jmp @set_counter
@no_down:
	lda control_pad
	and #left_punch
	beq @no_left
		jsr do_random_set
		lda $218+0
		cmp #$4f
		beq :+
			jmp @no_control
:		ldx e5_spd_lo
		lda dkjr_coll_lo, x
		sec
		sbc #$01
		sta temp_16bit_1+0
		lda dkjr_coll_hi, x
		sta temp_16bit_1+1
		ldy e6_spd_lo
		lda (temp_16bit_1), y
		cmp #$02
		beq @no_control
			lda #$01
			sta g_counter1
			dec e6_spd_lo
			lda #$00
			sta e2_hit
			jmp @set_counter
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		jsr do_random_set
		lda $218+0
		cmp #$4f
		beq :+
			jmp @no_control
:		ldx e5_spd_lo
		lda dkjr_coll_lo, x
		sta temp_16bit_1+0
		lda dkjr_coll_hi, x
		sta temp_16bit_1+1
		ldy e6_spd_lo
		iny
		lda (temp_16bit_1), y
		cmp #$02
		beq @no_control
			lda #$02
			sta g_counter1
			lda #$01
			sta e2_hit
			inc e6_spd_lo
@no_right:
@set_counter:
	lda #$09
	sta g_counter2
@no_control:
	jsr pause_routine
	jmp end_loop

dkjr_anim:
	lda e2_hit, x
	asl a
	tay
	lda dkjr_anim_table+1, y
	pha
	lda dkjr_anim_table+0, y
	pha
	rts
dkjr_anim_table:
	.addr dkjr_left-1, dkjr_right-1, dkjr_up-1, dkjr_down-1, dkjr_chomp_up-1
	.addr dkjr_chomp_down-1, dkjr_bird_left-1, dkjr_bird_right-1, dkjr_bird_up-1, dkjr_bird_down-1
dkjr_left:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$c7
		sta $218+1
		lda #$41
		sta $218+2
		rts
:	lda #$c8
	sta $218+1
	lda #$41
	sta $218+2
	rts
dkjr_right:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$c7
		sta $218+1
		lda #$01
		sta $218+2
		rts
:	lda #$c8
	sta $218+1
	lda #$01
	sta $218+2
	rts
dkjr_up:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$c5
		sta $218+1
		lda #$01
		sta $218+2
		rts
:	lda #$c6
	sta $218+1
	lda #$01
	sta $218+2
	rts
dkjr_down:
	lda #$c5
	sta $218+1
	rts
dkjr_chomp_up:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$c9
		sta $220+1
		rts
:	lda #$ca
	sta $220+1
	rts
dkjr_chomp_down:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$cb
		sta $220+1
		rts
:	lda #$cc
	sta $220+1
	rts
dkjr_bird_left:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$cd
		sta $21c+1
		lda #$42
		sta $21c+2
		rts
:	lda #$ce
	sta $21c+1
	lda #$42
	sta $21c+2
	rts
dkjr_bird_right:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$cd
		sta $21c+1
		lda #$02
		sta $21c+2
		rts
:	lda #$ce
	sta $21c+1
	lda #$02
	sta $21c+2
	rts
dkjr_bird_up:
	lda #$cf
	sta $21c+1
	lda #$82
	sta $21c+2
	rts
dkjr_bird_down:
	lda #$cf
	sta $21c+1
	rts
dkjr_chomp_x:
	.byte $92,$a2,$ba,$ca
dkjr_offset:
	.byte 192,128,64,0
dkjr_y_lo:
	.byte $1c,$20,$24,$28,$2c,$30
dkjr_coll_lo:
	.byte <dkjr_coll0,<dkjr_coll1,<dkjr_coll2,<dkjr_coll3,<dkjr_coll4,<dkjr_coll5,<dkjr_coll6,<dkjr_coll7
dkjr_coll_hi:
	.byte >dkjr_coll0,>dkjr_coll1,>dkjr_coll2,>dkjr_coll3,>dkjr_coll4,>dkjr_coll5,>dkjr_coll6,>dkjr_coll7
dkjr_coll0:
	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
dkjr_coll1:
	.byte $02,$00,$01,$00,$01,$00,$00,$01,$00,$01,$00,$02
dkjr_coll2:
	.byte $02,$00,$01,$00,$01,$00,$00,$01,$00,$01,$00,$02
dkjr_coll3:
	.byte $02,$00,$01,$00,$01,$00,$00,$01,$00,$01,$00,$02
dkjr_coll4:
	.byte $02,$00,$01,$00,$01,$00,$00,$01,$00,$01,$00,$02
dkjr_coll5:
	.byte $02,$00,$01,$00,$01,$00,$00,$01,$00,$01,$00,$02
dkjr_coll6:
	.byte $02,$00,$01,$00,$01,$00,$00,$01,$00,$01,$00,$02
dkjr_coll7:
	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
dkjr_init:
	lda #$06
	sta e5_spd_lo
	lda #$01
	sta e6_spd_lo
	sta e4_spd_lo
	sta e2_hit
	lda #$05
	sta e3_hit
	lda #$06
	sta e4_hit
	ldx #$00
	stx g_counter2
	stx g_counter1
	stx e1_dir
	stx e2_dir
:	lda dkjr_spr_mirror, x
	sta $218, x
	inx
	cpx s_right
	bne :-
	rts
dkjr_spr_mirror:
	.byte $4f,$c7,$01,$88
	.byte $27,$cd,$42,$d0
	.byte $27,$cc,$02,$a2
	.byte $47,$df,$03,$92
	.byte $47,$df,$03,$a2
	.byte $47,$df,$03,$ba
	.byte $47,$df,$03,$ca
game_nmi05: ; dk jr
	jsr game_write_stats
	jmp end_nmi




game_loop14: ; iceclimber
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

	lda g_counter1		; amount of time for floor to move down
	beq :++
		dec g_counter1
		bne :+
			inc e3_dir
			lda #$20
			sta g_counter1
			lda e2_top
			clc
			adc #$08
			sta e2_top
			clc
			adc #$08
			sta e2_bot
			lda e3_top
			clc
			adc #$08
			sta e3_top
			clc
			adc #$08
			sta e3_bot
			bne :++
:		lda g_counter1
		cmp #$01
		bne :+
			lda e3_dir
			cmp #$06
			bne :+
			lda #$00
			sta e2_dir
			jsr do_score
			ldx #$1f
			jmp return_sfx_routine
climb_beep2:
:
		

	lda e2_dir ; whether or not to bring on a floor. 0 == bring one on
	bne @no_new
		ldx #$ff
:		inx
		lda seed
		cmp iclimb_offset, x
		bcc :-
			lda iclimb_row_lo, x
			sta temp_16bit_1+0
			lda iclimb_row_hi, x
			sta temp_16bit_1+1
			lda #$80
			sta e2_left
			lda iclimb_row_x_left, x
			sta e2_right
			lda #$20
			sta e2_top
			sta e3_top
			lda #$28
			sta e2_bot
			sta e3_bot
			lda iclimb_row_x_right, x
			sta e3_left
			lda #$e0
			sta e3_right
			ldx #$00
			stx e3_dir
			lda #$20
			sta g_counter1
			sta e2_dir
@no_new:

	lda $220+0
	cmp #$f0
	bne @move
		dec e5_hit
		bne @move
		lda nmi_num
		cmp #$80
		bcc :+
			lda #$01
			sta e1_dir
			lda #$d7
			sta $220+3
			lda #$4f
			sta $220+0
			bne @move
:		lda #$00
		sta e1_dir
		lda #$81
		sta $220+3
		lda #$4f
		sta $220+0
@move:


	lda $21c+0	; character
	clc
	adc #$02
	sta g_top
	clc
	adc #$05
	sta g_bot
	lda $21c+3
	clc
	adc #$02
	sta g_left
	clc
	adc #$05
	sta g_right

	lda $218+0	; hammer
	sta s_top
	clc
	adc #$05
	sta s_bot
	lda $218+3
	clc
	adc #$02
	sta s_left
	clc
	adc #$05
	sta s_right

	lda $220+0	; hammer
	sta e1_top
	clc
	adc #$05
	sta e1_bot
	lda $220+3
	clc
	adc #$01
	sta e1_left
	clc
	adc #$06
	sta e1_right

	ldx #$00
@hit_tests:
	lda e1_left, x
	cmp g_right
		bcs @no_coll
	lda e1_right, x
	cmp g_left
		bcc @no_coll
	lda e1_top, x
	cmp g_bot
		bcs @no_coll
	lda e1_bot, x
	cmp g_top
		bcc @no_coll
			inc game_misses
			jmp end_loop
@no_coll:
	inx
	cpx #$03
	bne @hit_tests
@done_enemy_hits:

	lda e1_left
	cmp s_right
		bcs climb_no_hammer
	lda e1_right
	cmp s_left
		bcc climb_no_hammer
	lda e1_top
	cmp s_bot
		bcs climb_no_hammer
	lda e1_bot
	cmp s_top
		bcc climb_no_hammer
			jsr do_score
			jsr do_score
			lda #$f0
			sta $220+0
			lda $f8
			sta $220+3
			ldx #$1e
			jmp return_sfx_routine
climb_beep1:
climb_no_hammer:

	lda e1_dir
	bne @e_dir
		lda $220+3
		cmp #$d8
		beq :+
			lda e1_spd_lo
			clc
			adc #<dkjr_vine
			sta e1_spd_lo
			lda $220+3
			adc #>dkjr_vine
			sta $220+3
			jmp @done_dir
:		lda #$f0
		sta $220+0
		sta $220+3
		jmp @done_dir
@e_dir:
	lda $220+3
	cmp #$80
	beq :+
		lda e1_spd_lo
		sec
		sbc #<dkjr_vine
		sta e1_spd_lo
		lda $220+3
		sbc #>dkjr_vine
		sta $220+3
		jmp @done_dir
:	lda #$f0
	sta $220+0
	sta $220+3
@done_dir:

	lda e6_left
	cmp #$10
	bcc @first_e_anim
		lda #$00
		sta e6_left
@first_e_anim:
	cmp #$08
	bcc @second_e_anim
		lda e1_dir
		beq :+
			lda #$01
			sta $220+2
			bne :++
:		lda #$41
		sta $220+2
:		lda #$ec
		sta $220+1
		inc e6_left
		bne @done_e_anim
@second_e_anim:
		lda e1_dir
		beq :+
			lda #$01
			sta $220+2
			bne :++
:		lda #$41
		sta $220+2
:		lda #$ed
		sta $220+1
		inc e6_left
@done_e_anim:

	lda e5_dir
	bne :+
		jmp @no_attack
:		dec e5_dir
		bne :+
			lda #$f0
			sta $218+0
			jmp @no_attack
:		lda e5_dir
		cmp #$18
		bcc @other_anim
			lda e5_spd_lo
			beq :+
				lda $21c+3
				sta $218+3
				lda $21c+0
				sec
				sbc #$08
				sta $218+0
				lda #$01
				sta $21c+2
				sta $218+2
				bne :++
:			lda #$41
			sta $21c+2
			sta $218+2
			lda $21c+3
			sta $218+3
			lda $21c+0
			sec
			sbc #$08
			sta $218+0
:			lda #$e8
			sta $21c+1
			lda #$e9
			sta $218+1
			jmp @no_right
@other_anim:
		lda e5_spd_lo
		beq :+
			lda $21c+3
			clc
			adc #$08
			sta $218+3
			lda $21c+0
			sta $218+0
			lda #$01
			sta $21c+2
			sta $218+2
			bne :++
:		lda #$41
		sta $21c+2
		sta $218+2
		lda $21c+3
		sec
		sbc #$08
		sta $218+3
		lda $21c+0
		sta $218+0
:		lda #$ea
		sta $21c+1
		lda #$eb
		sta $218+1
		jmp @no_right
@no_attack:


	lda e6_spd_lo
	cmp #$20
	bcc @first_anim
		lda #$00
		sta e6_spd_lo
@first_anim:
	cmp #$10
	bcc @second_anim
		lda e5_spd_lo
		beq :+
			lda #$01
			sta $21c+2
			bne :++
:		lda #$41
		sta $21c+2
:		lda #$e7
		sta $21c+1
		bne @done_anim
@second_anim:
		lda e5_spd_lo
		beq :+
			lda #$01
			sta $21c+2
			bne :++
:		lda #$41
		sta $21c+2
:		lda #$e6
		sta $21c+1
@done_anim:

	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq @no_b
		lda #$30
		sta e5_dir
		bne @no_right
@no_b:
	lda control_pad
	and #left_punch
	beq @no_left
		lda $21c+3
		cmp #$88
		beq @no_right
			jsr do_random_set
			lda e4_spd_lo
			sec
			sbc #<dkjr_chomp
			sta e4_spd_lo
			lda $21c+3
			sbc #>dkjr_chomp
			sta $21c+3
			sta $218+3
			inc e6_spd_lo
			lda #$00
			sta e5_spd_lo
			bne @no_right
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda $21c+3
		cmp #$d0
		beq @no_right
			jsr do_random_set
			lda e4_spd_lo
			clc
			adc #<dkjr_chomp
			sta e4_spd_lo
			lda $21c+3
			adc #>dkjr_chomp
			sta $21c+3
			sta $218+3
			lda #$01
			sta e5_spd_lo	; direction
			inc e6_spd_lo	; anim "offset"
@no_right:
@no_control:

	jsr pause_routine
	jmp end_loop

iclimb_ppu_lo:
	.byte $90,$b0,$d0,$f0,$10,$30,$50
iclimb_ppu_hi:
	.byte $2c,$2c,$2c,$2c,$2d,$2d,$2d
iclimb_offset:
	.byte 224,196,168,140,112,84,56,28,0
iclimb_row_x_left:
	.byte $88,$90,$98,$a0,$a8,$b0,$b8,$c0,$c8
iclimb_row_x_right:
	.byte $98,$a0,$a8,$b0,$b8,$c0,$c8,$d0,$d8
iclimb_row_lo:
	.byte <iclimb_row0,<iclimb_row1,<iclimb_row2,<iclimb_row3,<iclimb_row4
	.byte <iclimb_row5,<iclimb_row6,<iclimb_row7,<iclimb_row8
iclimb_row_hi:
	.byte >iclimb_row0,>iclimb_row1,>iclimb_row2,>iclimb_row3,>iclimb_row4
	.byte >iclimb_row5,>iclimb_row6,>iclimb_row7,>iclimb_row8
iclimb_row0:
	.byte $e5,$00,$00,$e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5
iclimb_row1:
	.byte $e5,$e5,$00,$00,$e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5
iclimb_row2:
	.byte $e5,$e5,$e5,$00,$00,$e5,$e5,$e5,$e5,$e5,$e5,$e5
iclimb_row3:
	.byte $e5,$e5,$e5,$e5,$00,$00,$e5,$e5,$e5,$e5,$e5,$e5
iclimb_row4:
	.byte $e5,$e5,$e5,$e5,$e5,$00,$00,$e5,$e5,$e5,$e5,$e5
iclimb_row5:
	.byte $e5,$e5,$e5,$e5,$e5,$e5,$00,$00,$e5,$e5,$e5,$e5
iclimb_row6:
	.byte $e5,$e5,$e5,$e5,$e5,$e5,$e5,$00,$00,$e5,$e5,$e5
iclimb_row7:
	.byte $e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5,$00,$00,$e5,$e5
iclimb_row8:
	.byte $e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5,$e5,$00,$00,$e5

game_nmi14: ; iceclimber
	jsr game_write_stats
	ldx e3_dir
	dex
	cpx #$ff
	bne :+
		ldx #$06
		stx e3_dir
:	ldy #$00
	lda iclimb_ppu_hi, x
	sta $2006
	lda iclimb_ppu_lo, x
	sta $2006
	lda #$00
:	sta $2007
	iny
	cpy #12
	bne :-
	ldy #$00
	inx
	stx e3_dir
	cpx #$07
	bne :+
		ldx #$00
		stx e3_dir
:
	lda iclimb_ppu_hi, x
	sta $2006
	lda iclimb_ppu_lo, x
	sta $2006
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #12
	bne :-

	jmp end_nmi







game_loop15: ; kungfu
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

	lda g_counter3
	beq :++
		dec g_counter3
		bne :+
			lda #$f0
			sta $228+0
			sta $234+0
			sta e1_left
			sta e2_left
			lda #$00
			sta $228+3
			sta $234+3
			sta e1_hit
			sta e2_hit
			sta g_counter2
:		jmp end_loop
			
:

	dec g_counter2
	lda g_counter2
	beq @do_second
		cmp #$80
		beq @do_first
			jmp @dont_do
@do_first:
	lda #$37
	sta $228+0
	lda #$80
	sta $228+3
	ldx #$ff
:	inx
	lda seed
	cmp kfu_offset, x
	bcc :-
		lda kfu_spd_lo, x
		sta e5_hit
		lda kfu_spd_hi, x
		sta e5_spd_lo
	jmp @dont_do
@do_second:
	lda #$37
	sta $234+0
	lda #$80
	sta $234+3
	ldx #$ff
:	inx
	lda seed
	cmp kfu_offset, x
	bcc :-
		lda kfu_spd_lo, x
		sta e6_hit
		lda kfu_spd_hi, x
		sta e6_spd_lo
@dont_do:

	lda e1_hit
	beq :+
		dec $228+0
		dec $228+3
		dec e1_hit
		bne :++
			lda #$00
			sta $228+3
			lda #$f0
			sta $228+0
			bne :++
:	lda $228+0
	cmp #$f0
	beq :+
		lda e1_spd_lo
		clc
		adc e5_hit		; lo num
		sta e1_spd_lo
		lda $228+3
		adc e5_spd_lo
		sta $228+3
:	lda e2_hit
	beq :+
		dec $234+0
		dec $234+3
		dec e2_hit
		bne :++
			lda #$00
			sta $234+3
			lda #$f0
			sta $234+0
			bne :++
:	lda $234+0
	cmp #$f0
	beq :+
		lda e2_spd_lo
		clc
		adc e6_hit
		sta e2_spd_lo
		lda $234+3
		adc e6_spd_lo
		sta $234+3
:

	ldx #$00
kfu_body_tests:
	lda e1_left, x
	cmp g_right
		bcs kfu_no_coll
	lda e1_right, x
	cmp g_left
		bcc kfu_no_coll
	lda e1_top, x
	cmp g_bot
		bcs kfu_no_coll
	lda e1_bot, x
	cmp g_top
		bcc kfu_no_coll
			inc game_misses
			lda #$72
			sta g_counter3
			ldx #$21
			jmp return_sfx_routine
kfu_hit:
			jmp end_loop
kfu_no_coll:
	inx
	cpx #$02
	bne kfu_body_tests

	ldx #$00
kfu_kick_tests:
	lda e1_left, x
	cmp s_right
		bcs kfu_no_kick
	lda e1_right, x
	cmp s_left
		bcc kfu_no_kick
	lda e1_top, x
	cmp s_bot
		bcs kfu_no_kick
	lda e1_bot, x
	cmp s_top
		bcc kfu_no_kick
			txa
			pha
			ldx #$20
			jmp return_sfx_routine
kfu_beep:
			pla
			tax
			cpx #$01
			bne :+
				lda e2_hit
				bne kfu_done_kicks
				lda #$10
				sta e2_hit
				jsr do_score
				lda e4_dir
				beq kfu_done_kicks
				jsr do_score
				jmp end_loop
:			lda e1_hit
			bne kfu_done_kicks
			lda #$10
			sta e1_hit
			jsr do_score
				lda e4_dir
				beq kfu_done_kicks
				jsr do_score
			jmp end_loop
kfu_no_kick:
	inx
	cpx #$02
	bne kfu_kick_tests
kfu_done_kicks:

	lda $218+0
	sta g_top
	clc
	adc #$18
	sta g_bot
	lda $218+3
	clc
	adc #$03
	sta g_left
	clc
	adc #$08
	sta g_right
	lda $224+0
	sta s_top
	clc
	adc #$08
	sta s_bot
	lda $224+3
	clc
	adc #$04
	sta s_left
	clc
	adc #$08
	sta s_right

	lda $228+0
	sta e1_top
	clc
	adc #$08
	sta $22c+0
	clc
	adc #$08
	sta $230+0
	sta e1_bot
	lda $228+3
	sta e1_left
	sta $22c+3
	sta $230+3
	clc
	adc #$08
	sta e1_right

	lda $234+0
	sta e2_top
	clc
	adc #$08
	sta $238+0
	clc
	adc #$08
	sta $23c+0
	sta e2_bot
	lda $234+3
	sta e2_left
	sta $238+3
	sta $23c+3
	clc
	adc #$08
	sta e2_right

	lda e1_hit
	bne :+++
	lda e5_dir
	cmp #$10
	bcc :+
		lda #$00
		sta e5_dir
		jmp :+++
:	cmp #$08
	bcc :+
	lda #$d9
	sta $228+1
	lda #$da
	sta $22c+1
	lda #$db
	sta $230+1
	inc e5_dir
	jmp :++
:
	lda #$dc
	sta $228+1
	lda #$dd
	sta $22c+1
	lda #$de
	sta $230+1
	inc e5_dir
:
	lda e2_hit
	bne :+++
	lda e6_dir
	cmp #$10
	bcc :+
		lda #$00
		sta e6_dir
		jmp :+++
:	cmp #$08
	bcc :+
	lda #$d9
	sta $234+1
	lda #$da
	sta $238+1
	lda #$db
	sta $23c+1
	inc e6_dir
	jmp :++
:
	lda #$dc
	sta $234+1
	lda #$dd
	sta $238+1
	lda #$de
	sta $23c+1
	inc e6_dir
:

	lda e4_dir
	beq :+
		tax
		lda $218+0
		clc
		adc kfu_jump, x
		sta $218+0
		clc
		adc #$08
		sta $21c+0
		sta $224+0
		clc
		adc #$08
		sta $220+0
		dex
		stx e4_dir
:

	jsr kfu_anim

	lda e4_dir
	bne :+
	lda e4_spd_lo
	bne :+++
:		lda $240+3
		cmp #$d8
		bne :+
			lda #$7f
			sta $240+3
			sta $244+3
:		inc $240+3
		inc $244+3
:

	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq @no_up
		lda e4_spd_lo
		bne @no_b
			jsr do_random_set
			lda #$01
			sta e4_spd_lo
			lda #$00
			sta g_counter1
			lda #20
			sta e4_dir
			jmp @no_b
@no_up:
	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq @no_b
		lda e4_spd_lo
		bne @no_b
			jsr do_random_set
			lda #$01
			sta e4_spd_lo
			lda #$00
			sta g_counter1
@no_b:
	jsr pause_routine
	jmp end_loop
kfu_offset:
	.byte 192,128,64,0
kfu_spd_lo:
	.byte $00,$40,$80,$c0
kfu_spd_hi:
	.byte $01,$01,$01,$00
kfu_anim:
	lda e4_spd_lo
	asl a
	tay
	lda kfu_anim_table+1, y
	pha
	lda kfu_anim_table+0, y
	pha
	rts
kfu_jump:
	.byte $00,$02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$00,$ff,$ff,$ff,$fd,$fd,$fd,$fd,$fd
kfu_anim_table:
	.addr kfu_walk-1,kfu_kick-1
kfu_walk:
	lda g_counter1
	cmp #$10
	bcc :+
		lda #$00
		sta g_counter1
		rts
:	cmp #$08
	bcc :+
	lda #$c5
	sta $218+1
	lda #$c6
	sta $21c+1
	lda #$c7
	sta $220+1
	lda #$00
	sta $224+1
		lda #$f0
		sta $224+0
		sta $224+3
	inc g_counter1
	rts
:
	lda #$c8
	sta $218+1
	lda #$c9
	sta $21c+1
	lda #$ca
	sta $220+1
	lda #$00
	sta $224+1
		lda #$f0
		sta $224+0
		sta $224+3
	inc g_counter1
	rts
kfu_kick:
	lda g_counter1
	cmp #$18
	bcc :+
		lda #$00
		sta g_counter1
		sta e4_spd_lo
		rts
:	cmp #$10
	bcc :+
		lda #$c8
		sta $218+1
		lda #$cb
		sta $21c+1
		lda #$cc
		sta $220+1
		lda #$00
		sta $224+1
		lda #$f0
		sta $224+0
		sta $224+3
		inc g_counter1
		rts
:	cmp #$08
	bcc :+
		lda #$cd
		sta $218+1
		lda #$ce
		sta $21c+1
		lda #$cf
		sta $220+1
		lda #$d8
		sta $224+1
		lda $21c+0
		sta $224+0
		lda $21c+3
		sec
		sbc #$08
		sta $224+3
		inc g_counter1
		rts
:
	lda #$c8
	sta $218+1
	lda #$cb
	sta $21c+1
	lda #$cc
	sta $220+1
	lda #$00
	sta $224+1
	lda #$f0
	sta $224+0
	inc g_counter1
	rts
game_nmi15: ; kungfu
	jsr game_write_stats
	jmp end_nmi


game_loop22: ; soccer
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

	lda e6_hit
	bne :+
		lda #$01
		sta e2_spd_lo
		lda #$ff
		sta e3_spd_lo
		sta e6_hit
:

	lda e1_hit
	beq :+
		lda $220+3
		clc
		adc #$02
		sta $220+3
:


	lda e1_dir
	beq :++
		lda e1_spd_lo
		sec
		sbc e2_dir
		sta e1_spd_lo
		lda $224+0
		sbc e2_spd_lo
		sta $224+0
		clc
		adc #$08
		sta $228+0
		cmp #$29
		bcs :+
			dec e1_dir
:		jmp @done_dir
:	lda e1_spd_lo
	clc
	adc e2_dir
	sta e1_spd_lo
	lda $224+0
	adc e2_spd_lo
	sta $224+0
	clc
	adc #$08
	sta $228+0
	cmp #$55
	bcc :+
		inc e1_dir
:

@done_dir:
	inc e3_dir			; animations
	lda e3_dir
	cmp #$10
	bne :+
		lda #$00
		sta e3_dir
:
	lda e3_dir
	cmp #$08
	bcc :+
		lda #$dc
		sta $228+1
		lda #$42
		sta $228+2
		bne :++
:	lda #$df
	sta $228+1
	lda #$02
	sta $228+2
:
	lda $224+0
	clc
	adc #$04
	sta e1_top
	clc
	adc #$06
	sta e1_bot
	lda $224+3
	sta e1_left
	clc
	adc #$07
	sta e1_right
	lda #$34
	sta e2_top
	lda #$46
	sta e2_bot
	lda #$d8
	sta e2_left
	lda #$e0
	sta e2_right
	lda $220+0
	clc
	adc #$03
	sta s_top
	clc
	adc #$07
	sta s_bot
	lda $220+3
	sta s_left
	clc
	adc #$01
	sta s_right

	ldx #$00
soc_hit_tests:
	lda e1_left, x
	cmp s_right
		bcs soc_no_coll
	lda e1_right, x
	cmp s_left
		bcc soc_no_coll
	lda e1_top, x
	cmp s_bot
		bcs soc_no_coll
	lda e1_bot, x
	cmp s_top
		bcc soc_no_coll
			cpx #$01
			bne :+
				inc e2_dir
				inc e2_dir
				jsr do_score
				ldx #$31
				jmp return_sfx_routine
soc_beep:
				jmp :++
:			inc game_misses
:		jsr soccer_reset_ball
		jmp end_loop
soc_no_coll:
	inx
	cpx #$02
	bne soc_hit_tests


	lda $220+3
	cmp #$d8
	bcc :+
		inc game_misses
		jsr soccer_reset_ball
		jmp end_loop
:


	lda control_pad
	and #up_punch
	beq @no_up
		lda $218+0
		cmp #$20
		beq @no_b
			dec $218+0
			dec $21c+0
			dec $220+0
			jmp @no_b
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		lda $218+0
		cmp #$4e
		beq @no_b
			inc $218+0
			inc $21c+0
			inc $220+0
			jmp @no_b
@no_down:
	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq @no_b
		lda #$dd
		sta $21c+1
		lda #$01
		sta e1_hit
@no_b:
	jsr pause_routine
	jmp end_loop
soccer_reset_ball:
	lda $21c+0
	sta $220+0
	lda $21c+3
	clc
	adc #$08
	sta $220+3
	lda #$dc
	sta $21c+1
	lda #$00
	sta e1_hit
	rts


game_nmi22: ; soccer
	jsr game_write_stats
	jmp end_nmi



game_loop28: ; wgunman
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

	lda g_counter2
	beq @not_ready
		dec g_counter2
		cmp #$3c
		bcc :+
			jmp end_loop
:		ldx #$00
		lda #$f0
:		sta $21c+0, x
		inx
		cpx #28
		bne :-
		lda #$db
		sta $21c+1
		lda #$03
		sta $21c+2
		jmp end_loop
	
@not_ready:

	lda g_counter1
	beq :+
		dec g_counter1
		bne :+
			jsr gunman_shot_sound
			inc game_misses
			lda e1_dir
			sta $21c+0
			lda e2_dir
			sta $21c+3
			lda #$72
			sta g_counter2
			jmp end_loop
:

	lda $220+0
	cmp #$f0
	bne @no_new
		ldx #$ff
:		inx
		lda seed
		cmp gunman_offset, x
		bcc :-
			lda gunman_lo, x
			sta temp_16bit_1+0
			lda gunman_hi, x
			sta temp_16bit_1+1
			ldy #$00
:			lda (temp_16bit_1), y
			sta $220+0, y
			iny
			cpy #24
			bne :-
			lda (temp_16bit_1), y
			sta e1_dir
			iny
			lda (temp_16bit_1), y
			sta e2_dir
			txa
			cmp #$0c
			bcs :+
				lda $220+0
				sta e1_top
				clc
				adc #$0f
				sta e1_bot
				lda $220+3
				sta e1_left
				clc
				adc #$0f
				sta e1_right
				jmp :++
:			lda $220+0
			sta e1_top
			clc
			adc #$17
			sta e1_bot
			lda $220+3
			sta e1_left
			clc
			adc #$0f
			sta e1_right
:			lda #$5a
			sta g_counter1
@no_new:

	lda $218+0
	sta s_top
	clc
	adc #$07
	sta s_bot
	lda $218+3
	sta s_left
	clc
	adc #$07
	sta s_right

	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq @no_b
		jsr do_random_set
		jsr gunman_shot_sound
		lda e1_left
		cmp s_right
			bcs @no_coll
		lda e1_right
		cmp s_left
			bcc @no_coll
		lda e1_top
		cmp s_bot
			bcs @no_coll
		lda e1_bot
		cmp s_top
			bcc @no_coll
				jsr do_score
				jsr gunman_score_sound
				lda #$00
				sta $220+1
				sta $224+1
				sta $230+1
				sta $234+1
				lda #$dc
				sta $228+1
				lda #$dd
				sta $22c+1
				lda #$22
				sta $228+2
				sta $22c+2
				lda #$72
				sta g_counter2
				jmp end_loop
@no_coll:
	lda #$01
	sta g_counter1
	jmp end_loop
@no_b:
	lda control_pad
	and #up_punch
	beq @no_up
		jsr do_random_set
		lda $218+0
		cmp #$1f
		beq @no_up
			dec $218+0
			dec $218+0
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		jsr do_random_set
		lda $218+0
		cmp #$57
		beq @no_down
			inc $218+0
			inc $218+0
@no_down:
	lda control_pad
	and #left_punch
	beq @no_left
		jsr do_random_set
		lda $218+3
		cmp #$80
		beq @no_left
			dec $218+3
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
			inc $218+3
@no_right:
	jsr pause_routine
	jmp end_loop
gunman_shot_sound:
	ldx #$3e
	jmp return_sfx_routine
gunman_shot:
	rts
gunman_score_sound:
	ldx #$3f
	jmp return_sfx_routine
gunman_beep:
	rts
gunman_lo:
	.byte <gunman_cowboy_tl,<gunman_mexican_tl,<gunman_stache_tl,<gunman_cowboy_tr,<gunman_mexican_tr
	.byte <gunman_stache_tr,<gunman_cowboy_bl,<gunman_mexican_bl,<gunman_stache_bl,<gunman_cowboy_br
	.byte <gunman_mexican_br,<gunman_stache_br,<gunman_cowboy_c,<gunman_mexican_c,<gunman_stache_c
gunman_hi:
	.byte >gunman_cowboy_tl,>gunman_mexican_tl,>gunman_stache_tl,>gunman_cowboy_tr,>gunman_mexican_tr
	.byte >gunman_stache_tr,>gunman_cowboy_bl,>gunman_mexican_bl,>gunman_stache_bl,>gunman_cowboy_br
	.byte >gunman_mexican_br,>gunman_stache_br,>gunman_cowboy_c,>gunman_mexican_c,>gunman_stache_c
gunman_offset:
	.byte 238,221,204,187,170,153,136,119,102,85,68,51,34,17,0
gunman_cowboy_tl:
	.byte $28,$c0,$21,$8d ; 220
	.byte $28,$c1,$21,$95 ; 224
	.byte $30,$c2,$21,$8d ; 228
	.byte $30,$c3,$21,$95 ; 22c
	.byte $38,$c4,$22,$8d ; 230
	.byte $38,$c5,$22,$95 ; 234
	.byte $31,$95
gunman_mexican_tl:
	.byte $28,$c6,$21,$8d ; 220
	.byte $28,$c7,$21,$95 ; 224
	.byte $30,$c8,$21,$8d ; 228
	.byte $30,$c9,$21,$95 ; 22c
	.byte $38,$ca,$22,$8d ; 230
	.byte $38,$cb,$22,$95 ; 234
	.byte $32,$8e
gunman_stache_tl:
	.byte $28,$cc,$21,$8d ; 220
	.byte $28,$cd,$21,$95 ; 224
	.byte $30,$ce,$21,$8d ; 228
	.byte $30,$cf,$21,$95 ; 22c
	.byte $38,$d9,$21,$8d ; 230
	.byte $38,$da,$21,$95 ; 234
	.byte $32,$8c

gunman_cowboy_tr:
	.byte $28,$c0,$21,$c4 ; 220
	.byte $28,$c1,$21,$cc ; 224
	.byte $30,$c2,$21,$c4 ; 228
	.byte $30,$c3,$21,$cc ; 22c
	.byte $38,$c4,$22,$c4 ; 230
	.byte $38,$c5,$22,$cc ; 234
	.byte $31,$cc
gunman_mexican_tr:   
	.byte $28,$c6,$21,$c4 ; 220
	.byte $28,$c7,$21,$cc ; 224
	.byte $30,$c8,$21,$c4 ; 228
	.byte $30,$c9,$21,$cc ; 22c
	.byte $38,$ca,$22,$c4 ; 230
	.byte $38,$cb,$22,$cc ; 234
	.byte $32,$c5
gunman_stache_tr:    
	.byte $28,$cc,$21,$c4 ; 220
	.byte $28,$cd,$21,$cc ; 224
	.byte $30,$ce,$21,$c4 ; 228
	.byte $30,$cf,$21,$cc ; 22c
	.byte $38,$d9,$21,$c4 ; 230
	.byte $38,$da,$21,$cc ; 234
	.byte $32,$c3

gunman_cowboy_bl:
	.byte $44,$c0,$21,$8d ; 220
	.byte $44,$c1,$21,$95 ; 224
	.byte $4c,$c2,$21,$8d ; 228
	.byte $4c,$c3,$21,$95 ; 22c
	.byte $54,$c4,$22,$8d ; 230
	.byte $54,$c5,$22,$95 ; 234
	.byte $4d,$95
gunman_mexican_bl:   
	.byte $44,$c6,$21,$8d ; 220
	.byte $44,$c7,$21,$95 ; 224
	.byte $4c,$c8,$21,$8d ; 228
	.byte $4c,$c9,$21,$95 ; 22c
	.byte $54,$ca,$22,$8d ; 230
	.byte $54,$cb,$22,$95 ; 234
	.byte $4e,$8e
gunman_stache_bl:    
	.byte $44,$cc,$21,$8d ; 220
	.byte $44,$cd,$21,$95 ; 224
	.byte $4c,$ce,$21,$8d ; 228
	.byte $4c,$cf,$21,$95 ; 22c
	.byte $54,$d9,$21,$8d ; 230
	.byte $54,$da,$21,$95 ; 234
	.byte $4e,$8c

gunman_cowboy_c:
	.byte $42,$c0,$21,$a8 ; 220
	.byte $42,$c1,$21,$b0 ; 224
	.byte $4a,$c2,$21,$a8 ; 228
	.byte $4a,$c3,$21,$b0 ; 22c
	.byte $52,$c4,$22,$a8 ; 230
	.byte $52,$c5,$22,$b0 ; 234
	.byte $4b,$b0
gunman_mexican_c:    
	.byte $42,$c6,$21,$a8 ; 220
	.byte $42,$c7,$21,$b0 ; 224
	.byte $4a,$c8,$21,$a8 ; 228
	.byte $4a,$c9,$21,$b0 ; 22c
	.byte $52,$ca,$22,$a8 ; 230
	.byte $52,$cb,$22,$b0 ; 234
	.byte $4b,$a9
gunman_stache_c:     
	.byte $42,$cc,$21,$a8 ; 220
	.byte $42,$cd,$21,$b0 ; 224
	.byte $4a,$ce,$21,$a8 ; 228
	.byte $4a,$cf,$21,$b0 ; 22c
	.byte $52,$d9,$21,$a8 ; 230
	.byte $52,$da,$21,$b0 ; 234
	.byte $4c,$a7

gunman_cowboy_br:
	.byte $44,$c0,$21,$c4 ; 220
	.byte $44,$c1,$21,$cc ; 224
	.byte $4c,$c2,$21,$c4 ; 228
	.byte $4c,$c3,$21,$cc ; 22c
	.byte $54,$c4,$22,$c4 ; 230
	.byte $54,$c5,$22,$cc ; 234
	.byte $4d,$cc
gunman_mexican_br:   
	.byte $44,$c6,$21,$c4 ; 220
	.byte $44,$c7,$21,$cc ; 224
	.byte $4c,$c8,$21,$c4 ; 228
	.byte $4c,$c9,$21,$cc ; 22c
	.byte $54,$ca,$22,$c4 ; 230
	.byte $54,$cb,$22,$cc ; 234
	.byte $4e,$c5
gunman_stache_br:    
	.byte $44,$cc,$21,$c4 ; 220
	.byte $44,$cd,$21,$cc ; 224
	.byte $4c,$ce,$21,$c4 ; 228
	.byte $4c,$cf,$21,$cc ; 22c
	.byte $54,$d9,$21,$c4 ; 230
	.byte $54,$da,$21,$cc ; 234
	.byte $4e,$c3
game_nmi28: ; wgunman
	jsr game_write_stats
	jmp end_nmi



game_loop06: ; dk 3

	lda e1_hit
	beq :+
		dec e1_hit
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

	lda e5_spd_lo
	bne :+
		lda #$01
		sta e5_spd_lo
		sta e6_spd_lo
		lda #$02
		sta e3_dir
		sta e2_dir
		lda #$3c
		sta e2_spd_lo
:

	lda e3_spd_lo
	beq :++
		lda $220+0
		cmp #$4f
		bcc :+
			lda #$03
			sta game_misses
			lda #$3c
			sta e1_hit
			jmp end_loop
:		clc
		adc #$01
		sta $220+0
		sta $228+0
		clc
		adc #$08
		sta $224+0
		sta $22c+0
		jmp end_loop
:

	dec e2_spd_lo
	bne :++
		lda $220+0
		cmp #$37
		bcc :+
			lda #$01
			sta e3_spd_lo
			bne :++
:		clc
		adc #$02
		sta $220+0
		sta $228+0
		clc
		adc #$08
		sta $224+0
		sta $22c+0
		lda #$3c
		sta e2_spd_lo
:


	ldy e2_dir
	cpy #$02
	bne @continue_fly1
		ldx #$ff
:		inx
		lda seed
		cmp dk3_offset, x
		bcc :-
			lda dk3_fly1_lo, x
			sta temp_16bit_1+0
			lda dk3_fly1_hi, x
			sta temp_16bit_1+1
@continue_fly1:
	inc g_counter2
	lda g_counter2
	cmp #$0c
	bne :++
		lda (temp_16bit_1), y
		cmp #$ff
		bne :+
			ldy #$00
:		lda (temp_16bit_1), y
		sta $230+0
		iny
		lda (temp_16bit_1), y
		sta $230+3
		iny
		sty e2_dir
		lda #$00
		sta g_counter2
:
	ldy e3_dir
	cpy #$02
	bne @continue_fly2
		ldx #$ff
:		inx
		lda seed
		cmp dk3_offset, x
		bcc :-
			lda dk3_fly2_lo, x
			sta temp_16bit_2+0
			lda dk3_fly2_hi, x
			sta temp_16bit_2+1
@continue_fly2:
	inc g_counter3
	lda g_counter3
	cmp #$0c
	bne :++
		lda (temp_16bit_2), y
		cmp #$ff
		bne :+
			ldy #$00
:		lda (temp_16bit_2), y
		sta $234+0
		iny
		lda (temp_16bit_2), y
		sta $234+3
		iny
		sty e3_dir
		lda #$00
		sta g_counter3
:

	lda e1_spd_lo
	beq @done_shot
		lda $21c+0
		cmp #$1f
		beq :+
			dec $21c+0
			dec $21c+0
			jmp @done_shot
:		jsr dk3_shot_gone
@done_shot:

	lda $218+0	; char box
	clc
	adc #$02
	sta g_top
	clc
	adc #$04
	sta g_bot
	lda $218+3
	clc
	adc #$02
	sta g_left
	clc
	adc #$04
	sta g_right

	lda $21c+0	; shot box
	clc
	adc #$02
	sta s_top
	clc
	adc #$05
	sta s_bot
	lda $21c+3
	clc
	adc #$02
	sta s_left
	clc
	adc #$05
	sta s_right

	ldy #$00	; flower boxes
	ldx #$00
:	lda $238+0, y
	sta e4_top, x
	clc
	adc #$07
	sta e4_bot, x
	lda $238+3, y
	sta e4_left, x
	clc
	adc #$07
	sta e4_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$03
	bne :-
	lda $220+0	; kong box
	sta e1_top
	clc
	adc #$08
	sta e1_bot
	lda $220+3
	sta e1_left
	clc
	adc #$0f
	sta e1_right
	ldy #$00	; fly boxes
	ldx #$00
:	lda $230+0, y
	sta e2_top, x
	clc
	adc #$07
	sta e2_bot, x
	lda $230+3, y
	sta e2_left, x
	clc
	adc #$07
	sta e2_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$02
	bne :-

	ldx #$00
dk3_next_flower:
	ldy #$00
dk3_test_flower:
	lda e2_bot, x
	cmp e4_top, y
		bcc dk3_no_flower
	lda e2_top, x
	cmp e4_bot, y
		bcs dk3_no_flower
	lda e2_left, x
	cmp e4_right, y
		bcs dk3_no_flower
	lda e2_right, x
	cmp e4_left, y
		bcc dk3_no_flower
			cpy #$01
			bne :+
				lda #$f0
				sta $23c+0
				bne :+++
:			cpy #$02
			bne :+
				lda #$f0
				sta $240+0
				bne :++
:			lda #$f0
			sta $238+0
:			inc game_misses
			txa
			pha
			ldx #$0d
			jmp return_sfx_routine
dk3_hit:
			pla
			tax
			lda game_misses
			cmp #$03
			bne :+
				lda #$3c
				sta e1_hit
:
dk3_no_flower:
	iny
	cpy #$03
	bne dk3_test_flower
		inx
		cpx #$02
		bne dk3_next_flower

	ldx #$00
dk3_test_shot:
	lda e1_bot, x
	cmp s_top
		bcc dk3_no_shot
	lda e1_top, x
	cmp s_bot
		bcs dk3_no_shot
	lda e1_left, x
	cmp s_right
		bcs dk3_no_shot
	lda e1_right, x
	cmp s_left
		bcc dk3_no_shot
			cpx #$01
			bcc dk3_move_kong
				bne :+
					lda #$f0
					sta $230+0
					lda #$00
					sta $230+3
					lda #$02
					sta e2_dir
					bne :++
:				lda #$f0
				sta $234+0
				lda #$00
				sta $234+3
				lda #$02
				sta e3_dir
:				jsr do_score
				jsr dk3_shot_gone
				ldx #$0c
				jmp return_sfx_routine
dk3_ehit:
				jmp dk3_done_shot_check
dk3_move_kong:
			lda $220+0
			cmp #$20
			bcc :+
				sec
				sbc #$02
				sta $220+0
				sta $228+0
				clc
				adc #$08
				sta $224+0
				sta $22c+0
:			jsr dk3_shot_gone
			lda #$3c
			sta e2_spd_lo
			jmp dk3_done_shot_check
dk3_no_shot:
	inx
	cpx #$03
	bne dk3_test_shot
dk3_done_shot_check:

;	ldx #$00
;@test_body:
;	lda e2_bot, x
;	cmp g_top
;		bcc @no_body
;	lda e2_top, x
;	cmp g_bot
;		bcs @no_body
;	lda e2_left, x
;	cmp g_right
;		bcs @no_body
;	lda e2_right, x
;	cmp g_left
;		bcc @no_body
;			inc game_misses
;@no_body:
;	inx
;	cpx #$02
;	bne @test_body


	inc e4_dir			; animations
	lda e4_dir
	cmp #$08
	bne :+
		lda #$00
		sta e4_dir
:
	ldx #$00
:	jsr dk3_anim
	inx
	cpx #$02
	bne :-

	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq dk3_no_a
		lda e1_spd_lo
		bne dk3_no_right
			ldx #$0e
			jmp return_sfx_routine
dk3_woosh:
			jsr do_random_set
			lda #$01
			sta e1_spd_lo
			lda $218+0
			sta $21c+0
			lda $218+3
			sta $21c+3
			jmp dk3_no_right
dk3_no_a:
	lda control_pad
	and #left_punch
	beq dk3_no_left
		lda $218+3
		cmp #$80
		beq dk3_no_left
			jsr do_random_set
			dec $218+3
			beq dk3_no_right
dk3_no_left:
	lda control_pad
	and #right_punch
	beq dk3_no_right
		lda $218+3
		cmp #$d8
		beq dk3_no_right
		jsr do_random_set
			inc $218+3
dk3_no_right:
	jsr pause_routine
	jmp end_loop
dk3_offset:
	.byte 170,85,0
dk3_fly1_lo:
	.byte <dk3_tl_0,<dk3_tl_1,<dk3_tl_2
dk3_fly1_hi:
	.byte >dk3_tl_0,>dk3_tl_1,>dk3_tl_2
dk3_fly2_lo:
	.byte <dk3_tr_0,<dk3_tr_1,<dk3_tr_2
dk3_fly2_hi:
	.byte >dk3_tr_0,>dk3_tr_1,>dk3_tr_2
dk3_tl_0:
	.byte $1f,$80, $1f,$88, $1f,$90, $1f,$98
	.byte $27,$98, $27,$90, $27,$88, $27,$80
	.byte $2f,$80, $2f,$88, $2f,$90, $2f,$98
	.byte $37,$98, $37,$90, $37,$88, $37,$80
	.byte $3f,$80, $3f,$88, $3f,$90, $3f,$98
	.byte $47,$98, $4f,$98, $57,$98, $ff
dk3_tl_1:
	.byte $1f,$80, $1f,$88, $1f,$90, $1f,$98
	.byte $27,$98, $27,$90, $27,$88, $27,$80
	.byte $2f,$80, $2f,$88, $2f,$90, $2f,$98
	.byte $37,$98, $3f,$98, $3f,$90, $3f,$88
	.byte $47,$88, $47,$90, $47,$98, $47,$a0
	.byte $47,$a8, $47,$ac, $4f,$ac, $57,$ac
	.byte $ff
dk3_tl_2:
	.byte $1f,$80, $1f,$88, $1f,$90, $1f,$98
	.byte $27,$98, $27,$90, $27,$88, $27,$80
	.byte $2f,$80, $2f,$88, $2f,$90, $2f,$98
	.byte $37,$98, $37,$a0, $37,$a8, $37,$b0
	.byte $37,$b8, $37,$c0, $37,$c8, $37,$d0
	.byte $37,$d8, $3f,$d8, $47,$d8, $47,$d0
	.byte $47,$c8, $47,$c0, $4f,$c0, $57,$c0
	.byte $ff
dk3_tr_0:
	.byte $1f,$d8, $1f,$d0, $1f,$c8, $1f,$c0
	.byte $27,$c0, $27,$c8, $27,$d0, $27,$d8
	.byte $2f,$d8, $2f,$d0, $2f,$c8, $2f,$c0
	.byte $37,$c0, $37,$c8, $37,$d0, $37,$d8
	.byte $3f,$d8, $3f,$d0, $3f,$c8, $3f,$c0
	.byte $47,$c0, $4f,$c0, $57,$c0, $ff
dk3_tr_1:
	.byte $1f,$d8, $1f,$d0, $1f,$c8, $1f,$c0
	.byte $27,$c0, $27,$c8, $27,$d0, $27,$d8
	.byte $2f,$d8, $2f,$d0, $2f,$c8, $2f,$c0
	.byte $37,$c0, $3f,$c0, $3f,$c8, $3f,$d0
	.byte $3f,$d8, $47,$d8, $47,$d0, $47,$c8
	.byte $47,$c0, $47,$b8, $47,$b0, $47,$ac
	.byte $4f,$ac, $57,$ac, $ff 
dk3_tr_2:
	.byte $1f,$d8, $1f,$d0, $1f,$c8, $1f,$c0
	.byte $27,$c0, $27,$c8, $27,$d0, $27,$d8
	.byte $2f,$d8, $2f,$d0, $2f,$c8, $2f,$c0
	.byte $37,$c0, $37,$b8, $37,$b0, $37,$a8
	.byte $37,$a0, $37,$98, $37,$90, $37,$88
	.byte $37,$80, $3f,$80, $47,$80, $47,$88
	.byte $47,$90, $47,$98, $4f,$98, $57,$98
	.byte $ff
dk3_anim:
	lda e4_spd_lo, x
	asl a
	tay
	lda dk3_anim_table+1, y
	pha
	lda dk3_anim_table+0, y
	pha
	rts
dk3_anim_table:
	.addr dk3_left-1,dk3_fly-1
dk3_left:
	lda e4_dir
	cmp #$04
	bcc :+
		lda #$e2
		sta $218+1
		rts
:	lda #$e1
	sta $218+1
	rts
dk3_fly:
	lda e4_dir
	cmp #$04
	bcc :+
		lda #$e4
		sta $230+1
		sta $234+1
		rts
:	lda #$e3
	sta $230+1
	sta $234+1
	rts
dk3_shot_gone:
	lda #$f0
	sta $21c+0
	lda #$00
	sta e1_spd_lo
	rts
game_nmi06: ; dk 3
	jsr game_write_stats
	jmp end_nmi










game_loop01: ; b fight
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
	cmp #$10
	bne :+
		lda #$00
		sta g_counter1
:	cmp #$08
	bcc :+
		lda #$30
		sta pal_address+26
		lda #$27
		sta pal_address+27
		lda #$11
		sta pal_address+11
		jmp :++
:	lda #$30
	sta pal_address+26
	lda #$0f
	sta pal_address+27
	lda #$21
	sta pal_address+11
:	inc g_counter1

	lda $220+0
	cmp #$f0
	bne :++
		ldx #$ff
:		inx
		lda seed
		cmp bfight_rand, x
		bcc :-
			lda bfight_item, x
			sta e1_dir
			sta $220+1
			lda bfight_y, x
			sta $220+0
			lda bfight_pal, x
			sta $220+2
			lda #$80
			sta $220+3
:	lda e1_spd_lo
	clc
	adc #<dkjr_chomp
	sta e1_spd_lo
	lda $220+3
	adc #>dkjr_chomp
	sta $220+3
	cmp #$d8
	bne :+
		lda #$f0
		sta $220+0
:

	lda $224+0
	cmp #$f0
	bne :++
		ldx #$ff
:		inx
		lda seed
		cmp bfight_rand, x
		bcc :-
			lda bfight_item, x
			sta e2_dir
			sta $224+1
			lda bfight_y, x
			sta $224+0
			lda bfight_pal, x
			sta $224+2
			lda #$80
			sta $224+3
:	lda e2_spd_lo
	clc
	adc #<dkjr_chomp
	sta e2_spd_lo
	lda $224+3
	adc #>dkjr_chomp
	sta $224+3
	cmp #$d8
	bne :+
		lda #$f0
		sta $224+0
:

	lda $218+0
	clc
	adc #$02
	sta g_top
	clc
	adc #$08
	sta g_bot
	lda $218+3
	clc
	adc #$02
	sta g_left
	clc
	adc #$05
	sta g_right

	ldx #$00
	ldy #$00
:	lda $220+0, y
	clc
	adc #$02
	sta e1_top, x
	clc
	adc #$05
	sta e1_bot, x
	lda $220+3, y
	clc
	adc #$01
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



	lda $220+1
	beq :+
		lda $224+1
		bne :++
:			jmp bfight_done_hit_tests
:
	ldx #$00
bfight_hit_tests:
	lda e1_left, x
	cmp g_right
		bcs bfight_no_coll
	lda e1_right, x
	cmp g_left
		bcc bfight_no_coll
	lda e1_top, x
	cmp g_bot
		bcs bfight_no_coll
	lda e1_bot, x
	cmp g_top
		bcc bfight_no_coll
			lda e1_dir, x
			cmp #$ee
			bne bfight_balloon
				cpx #$01
				bne :+
					lda #$f0
					sta $224+0
					bne :++
:				lda #$f0
				sta $220+0
:				inc game_misses
				jmp bfight_done_hit_tests
bfight_balloon:
			cpx #$01
			bne :+
				lda #$f0
				sta $224+0
				bne :++
:			lda #$f0
			sta $220+0
:			jsr do_score
			jsr do_score
			ldx #$02
			jmp return_sfx_routine
bfight_beep:
			jmp bfight_done_hit_tests
bfight_no_coll:
	inx
	cpx #$02
	bne bfight_hit_tests
bfight_done_hit_tests:

	lda e5_spd_lo
	beq :++
		dec e5_spd_lo
		beq :++
			lda $218+0
			cmp #$20
			bcs :+
				jmp :+++
:			dec $218+0
			dec $21c+0
			jmp :++
:	lda $218+0
	lda e4_spd_lo
	clc
	adc #<dkjr_chomp
	sta e4_spd_lo
	lda $218+0
	adc #>dkjr_chomp
	sta $218+0
	clc
	adc #$08
	sta $21c+0
	cmp #$57
	bcc :+
		inc game_misses
:


	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda $218+0
		cmp #$1f
		beq @no_a
			jsr do_random_set
			lda #$10
			sta e5_spd_lo
@no_a:

	jsr pause_routine
	jmp end_loop
bfight_pal:
	.byte $03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02
bfight_item:
	.byte $d4,$ee,$d4,$ee,$d4,$ee,$d4,$ee,$d4,$ee,$d4,$ee
bfight_y:
	.byte $27,$27,$2f,$2f,$37,$37,$3f,$3f,$47,$47,$4f,$4f
bfight_rand:
	.byte 231,210,189,168,147,126,105,84,63,42,21,0
game_nmi01: ; b fight
	jsr game_write_stats
	jmp end_nmi







game_loop27: ; vball
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

	lda g_counter3
	beq :++
		dec g_counter3
		bne :+
			lda #$27
			sta $234+0
			sta $218+0
			lda #$2f
			sta $238+0
			sta $23c+0
			lda #$d0
			sta $234+3
			sta $238+3
			sta $23c+3
			sta $218+3
			lda #$00
			sta e3_dir
			sta e1_dir
:		jmp end_loop
:

	lda g_counter2
	beq :++
		inc $218+0
		lda $218+0
		cmp $23c+0
		bne :++
			lda $218+3
			cmp #$b0
			bcs :+
				inc game_misses
				jsr vball_miss_sound
				lda #$3c
				sta g_counter3
				jmp end_loop
:			jsr do_score
			jsr do_score
			jsr do_score
			jsr vball_score_sound
			lda #$3c
			sta g_counter3
			jmp end_loop
:

	lda g_counter1
	beq :+
		dec g_counter1
		bne :+
			lda $23c+3
			sta $218+3
			lda #$1f
			sta $218+0
			lda #$01
			sta g_counter2
:

	lda e5_hit
	beq :++
		dec $218+0
		lda $218+0
		cmp #$1f
		bne :++
			lda #$f0
			sta $218+0
			ldx #$ff
:			inx
			lda seed
			cmp vball_offset, x
			bcc :-
				lda vball_top_pos_y, x
				sta $23c+0
				lda vball_top_pos_x, x
				sta $23c+3
				lda #$00
				sta e5_hit
				lda #$32
				sta g_counter1
:

	lda e6_hit
	beq :++
		dec $218+0
		lda $218+0
		cmp #$1f
		bne :++
			lda #$f0
			sta $218+0
			ldx #$ff
:			inx
			lda seed
			cmp vball_offset, x
			bcc :-
				lda vball_p_left_y, x
				sta $23c+0
				lda vball_p_left_x, x
				sta $23c+3
				lda #$00
				sta e6_hit
				lda #$32
				sta g_counter1
:

	lda $220+0
	cmp $23c+0
	bne :+
		lda $220+3
		cmp $23c+3
		bne :+
			lda #$e8
			sta $21c+1
			lda #$e9
			sta $220+1
			bne :++
:	lda #$e6
	sta $21c+1
	lda #$e7
	sta $220+1
:

	lda $228+0
	cmp $23c+0
	bne :+
		lda $228+3
		cmp $23c+3
		bne :+
			lda #$e8
			sta $224+1
			lda #$e9
			sta $228+1
			bne :++
:	lda #$e6
	sta $224+1
	lda #$e7
	sta $228+1
:

	lda $238+0
	cmp $23c+0
	bne :+
		lda $238+3
		cmp $23c+3
		bne :+
			lda #$e8
			sta $234+1
			lda #$e9
			sta $238+1
			bne :+++
:
	lda e3_dir
	cmp #$20
	bne :+
		lda #$ff
		sta e3_dir
	jsr vball_move_top
:	inc e3_dir
	lda #$e6
	sta $234+1
	lda #$e7
	sta $238+1
:
	lda $230+0
	cmp $23c+0
	bne :+
		lda $230+3
		cmp $23c+3
		bne :+
			lda #$e8
			sta $22c+1
			lda #$e9
			sta $230+1
			bne :+++
:	lda e4_dir
	cmp #$40
	bne :+
		lda #$ff
		sta e4_dir
	jsr vball_move_bot
:	inc e4_dir
	lda #$e6
	sta $22c+1
	lda #$e7
	sta $230+1
:

	lda $218+0
	clc
	adc #$04
	sta s_top
	clc
	adc #$03
	sta s_bot
	lda $218+3
	clc
	adc #$04
	sta s_left
	clc
	adc #$02
	sta s_right

	ldx #$00
	ldy #$00
:	lda $21c+0, y
	clc
	adc #$06
	sta e1_top, x
	clc
	adc #$02
	sta e1_bot, x
	lda $21c+3, y
	clc
	adc #$04
	sta e1_left, x
	clc
	adc #$02
	sta e1_right, x
	tya
	clc
	adc #$08
	tay
	inx
	cpx #$04
	bne :-

	ldx #$00
	ldy #$00
@hit_tests:
	lda $220+0, y
	cmp $23c+0
	bne @no_coll
	lda $220+3, y
	cmp $23c+3
	bne @no_coll
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
			cpx #$02
			bcs :+
				jsr vball_hit_sound
				lda #$00
				sta g_counter2
				lda #$01
				sta e5_hit
				bne @done_hit_tests
:
			jsr vball_hit_sound
			lda #$00
			sta g_counter2
			lda #$01
			sta e6_hit
			bne @done_hit_tests
@no_coll:
	tya
	clc
	adc #$08
	tay
	inx
	cpx #$04
	bne @hit_tests
@done_hit_tests:

	lda e6_dir
	cmp #$08
	bne :+
		lda #$00
		sta e6_dir
		jmp :+++
:	cmp #$04
	bcc :+
		lda #$2a
		sta pal_address+17
		inc e6_dir
		jmp :++
:	lda #$25
	sta pal_address+17
	inc e6_dir
:

	lda control_pad
	and #b_punch
	bne :+
		jmp @no_b
:		ldx #$00
:		lda vball_p_left_ctrl, x
		sta $240, x
		inx
		cpx #$10
		bne :-
		jsr do_random_set
		lda control_pad
		and #up_punch
		beq @no_b_up
			jsr do_random_set
			lda #$37
			sta $21c+0
			lda #$3f
			sta $220+0
			lda #$90
			sta $21c+3
			sta $220+3
			jmp @no_a
@no_b_up:
		lda control_pad
		and #down_punch
		beq @no_b_down
			jsr do_random_set
			lda #$46
			sta $21c+0
			lda #$4e
			sta $220+0
			lda #$90
			sta $21c+3
			sta $220+3
			jmp @no_a
@no_b_down:
		lda control_pad
		and #left_punch
		beq @no_b_left
			jsr do_random_set
			lda #$3f
			sta $21c+0
			lda #$47
			sta $220+0
			lda #$88
			sta $21c+3
			sta $220+3
			jmp @no_a
@no_b_left:
		lda control_pad
		and #right_punch
		beq @no_b
			jsr do_random_set
			lda #$3f
			sta $21c+0
			lda #$47
			sta $220+0
			lda #$98
			sta $21c+3
			sta $220+3
			jmp @no_a
@no_b:
	lda control_pad
	and #a_punch
	bne :+
		jmp @no_a
:		ldx #$00
:		lda vball_p_right_ctrl, x
		sta $240, x
		inx
		cpx #$10
		bne :-
		jsr do_random_set
		lda control_pad
		and #up_punch
		beq @no_a_up
			jsr do_random_set
			lda #$20
			sta $224+0
			lda #$28
			sta $228+0
			lda #$98
			sta $224+3
			sta $228+3
			jmp @no_a
@no_a_up:
		lda control_pad
		and #down_punch
		beq @no_a_down
			jsr do_random_set
			lda #$2f
			sta $224+0
			lda #$37
			sta $228+0
			lda #$98
			sta $224+3
			sta $228+3
			jmp @no_a
@no_a_down:
		lda control_pad
		and #left_punch
		beq @no_a_left
			jsr do_random_set
			lda #$27
			sta $224+0
			lda #$2f
			sta $228+0
			lda #$90
			sta $224+3
			sta $228+3
			jmp @no_a
@no_a_left:
		lda control_pad
		and #right_punch
		beq @no_a
			jsr do_random_set
			lda #$27
			sta $224+0
			lda #$2f
			sta $228+0
			lda #$a0
			sta $224+3
			sta $228+3
@no_a:
	lda control_pad
	and #$0f
	bne :++
		ldx #$00
		lda #$f0
:		sta $240, x
		inx
		cpx #$10
		bne :-
:
	jsr pause_routine
	jmp end_loop

vball_hit_sound:
	ldx #$3b
	jmp return_sfx_routine
vball_hit:
	rts
vball_score_sound:
	ldx #$3c
	jmp return_sfx_routine
vball_beep:
	rts
vball_miss_sound:
	ldx #$3d
	jmp return_sfx_routine
vball_miss:
	rts
vball_p_left_ctrl:
	.byte $47,$98,$00,$88 ; 240
	.byte $4e,$98,$00,$90 ; 244
	.byte $47,$98,$00,$98 ; 248
	.byte $3f,$98,$00,$90 ; 24c
vball_p_right_ctrl:
	.byte $2f,$98,$00,$a0 ; 240
	.byte $37,$98,$00,$98 ; 244
	.byte $2f,$98,$00,$90 ; 248
	.byte $28,$98,$00,$98 ; 24c

vball_offset:
	.byte 224,192,160,128,96,64,32,0

vball_p_left_y:
	.byte $47,$4e,$47,$3f
vball_p_right_y:
	.byte $2f,$37,$2f,$28
vball_p_left_x:
	.byte $88,$90,$98,$90
vball_p_right_x:
	.byte $a0,$98,$90,$98

vball_top_pos_y:
	.byte $2f,$37,$2f,$28
vball_bp_pos_y:
	.byte $47,$4f,$47,$3f
vball_top_pos_x:
	.byte $d0,$c8,$c0,$c8
vball_bp_pos_x:
	.byte $b8,$c0,$c8,$c0
vball_move_top:
	ldx e1_dir
	lda vball_top_pos_y, x
	sta $238+0
	sec
	sbc #$08
	sta $234+0
	lda vball_top_pos_x, x
	sta $238+3
	sta $234+3
	inx
	cpx #$04
	bne :+
		ldx #$00
:	stx e1_dir
	rts
vball_move_bot:
	ldx e2_dir
	lda vball_bp_pos_y, x
	sta $230+0
	sec
	sbc #$08
	sta $22c+0
	lda vball_bp_pos_x, x
	sta $230+3
	sta $22c+3
	inx
	cpx #$04
	bne :+
		ldx #$00
:	stx e2_dir
	rts
game_nmi27: ; vball
	jsr game_write_stats
	jmp end_nmi







mbros_turtle_move:
;	lda e5_right, x
	asl a
	tay
	lda mbros_turtle_table+1, y
	pha
	lda mbros_turtle_table+0, y
	pha
	ldy e4_top
	rts
mbros_turtle_lo:
	.byte <mbros_turtle1_list,<mbros_turtle2_list
mbros_turtle_hi:
	.byte >mbros_turtle1_list,>mbros_turtle2_list
mbros_turtle1_list:
	.byte $01,$01,$01,$01,$02,$02,$01,$01,$01,$01,$01,$02,$02,$01,$01
	.byte $01,$01,$01,$01,$02,$02,$01,$01,$01,$01,$01,$01,$01
mbros_turtle2_list:
	.byte $00,$00,$00,$00,$02,$02,$00,$00,$00,$00,$00,$02,$02,$00,$00
	.byte $00,$00,$00,$00,$02,$02,$00,$00,$00,$00,$00,$00,$00
mbros_turtle_table:
	.addr mbros_turtle_left-1,mbros_turtle_right-1,mbros_turtle_down-1
mbros_turtle_left:
	lda $21c+3, y
	cmp #$80
	bne :+
		lda $21c+0, y
		cmp #$3f
		bne :+
			lda #$d8
			sta $21c+3, y
:
	lda e2_spd_lo, x
	sec
	sbc #<dkjr_vine
	sta e2_spd_lo, x
	lda $21c+3, y
	sbc #>dkjr_vine
	sta $21c+3, y
	lda e2_hit, x
	cmp #$06
	beq :+
		lda #$04
		sta e2_hit, x
:	rts
mbros_turtle_right:
	lda $21c+3, y
	cmp #$d8
	bne :+
		lda $21c+0, y
		cmp #$3f
		bne :+
			lda #$80
			sta $21c+3, y
:	lda e2_spd_lo, x
	clc
	adc #<dkjr_vine
	sta e2_spd_lo, x
	lda $21c+3, y
	adc #>dkjr_vine
	sta $21c+3, y
	lda e2_hit, x
	cmp #$06
	beq :+
		lda #$05
		sta e2_hit, x
:	rts
mbros_turtle_down:
	lda e2_spd_lo, x
	clc
	adc #<dkjr_vine
	sta e2_spd_lo, x
	lda $21c+0, y
	adc #>dkjr_vine
	sta $21c+0, y
	rts
turtle_switch:
	lda e2_hit, x
	cmp #$06
	beq :+
		
	lda #$db
	sta $21c+1, y
:	lda #$1f
	sta $21c+0, y
	lda e4_bot, x
	bne :+
		lda #$62
		sta $21c+2, y
		lda #$d8
		sta $21c+3, y
		lda #$01
		sta e4_bot, x
		rts
:	lda #$22
	sta $21c+2, y
	lda #$80
	sta $21c+3, y
	lda #$00
	sta e4_bot, x
	rts
test_which:
	cpx #$01
	bne @its_zero
		lda e4_bot
		cmp #$01
		bne :++
:			lda #$00
			sta e4_bot, x
			rts
:		lda #$01
		sta e4_bot, x
		rts
@its_zero:
	lda e5_bot
	cmp #$01
	beq :--
	bne :-
mbros_spr_mirror:
	.byte $4f,$d9,$01,$90
	.byte $1f,$db,$22,$80
	.byte $1f,$db,$62,$d8
	.byte $f0,$de,$03,$80
game_loop17: ; m bros
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

	lda e4_spd_lo
	bne @done_inits
		lda #$06		; mario y pos
		sta e5_spd_lo	;
		lda #$02		; mario x pos
		sta e6_spd_lo	;
		lda #$01		; anims
		sta e1_hit		;
		lda #$05		;
		sta e2_hit		;
		lda #$04		;
		sta e3_hit		;
		lda #$01		; mario direction
		sta e1_dir		; 
		lda #$00
		sta e4_bot
		lda #$01
		sta e5_bot
		sta e4_spd_lo	; don't do inits anymore
@done_inits:

	lda g_counter3
	beq @not_waiting
		dec g_counter3
		bne :++
			ldx #$00
:			lda mbros_spr_mirror, x
			sta $218+0, x
			inx
			cpx #$10
			bne :-
			lda #$00
			sta e4_spd_lo
			sta e4_right
			sta e5_right
			sta e4_left
			sta e5_left
			sta g_counter1
			sta g_counter2
:		jmp end_loop
@not_waiting:

	ldx #$00
	lda #$fc					; sprite offset ready
	sta e4_top					;
@start_turtle_movement:			;
	lda e4_top
	clc
	adc #$04
	sta e4_top
	lda e4_right, x				; counter before changing movement direction
	cmp #$20					;
	bne @dont_reset				;
		inc e4_left, x			; offset for movement table
		lda e4_left, x
		cmp #28
		bne :+
			lda #$00
			sta e4_left, x
			ldy e4_top
			jsr turtle_switch	;
:		lda #$00				; reset counter
		sta e4_right, x			;
@dont_reset:					;
	inc e4_right, x				;
	ldy e4_left, x				;
	txa
	pha
	lda e4_bot, x
	tax
	lda mbros_turtle_lo, x		; get proper table
	sta temp_16bit_2+0			;
	lda mbros_turtle_hi, x		;
	sta temp_16bit_2+1			;
	pla
	tax
	lda (temp_16bit_2), y		;
	jsr mbros_turtle_move		;
	inx							;
	cpx #$02					;
	bne @start_turtle_movement	;

	lda $218+0
	clc
	adc #$02
	sta e1_top
	clc
	adc #$05
	sta e1_bot
	lda $218+3
	clc
	adc #$02
	sta e1_left
	clc
	adc #$05
	sta e1_right
	lda $224+0
	clc
	adc #$02
	sta s_top
	clc
	adc #$05
	sta s_bot
	lda $224+3
	clc
	adc #$02
	sta s_left
	clc
	adc #$05
	sta s_right
	ldy #$00
	ldx #$00
:	lda $21c+0, y
	clc
	adc #$02
	sta e2_top, x
	clc
	adc #$05
	sta e2_bot, x
	lda $21c+3, y
	clc
	adc #$02
	sta e2_left, x
	clc
	adc #$05
	sta e2_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$02
	bne :-

	ldx #$00
mbros_body_test:
	lda e2_left, x
	cmp e1_right
		bcs mbros_no_touch
	lda e2_right, x
	cmp e1_left
		bcc mbros_no_touch
	lda e2_top, x
	cmp e1_bot
		bcs mbros_no_touch
	lda e2_bot, x
	cmp e1_top
		bcc mbros_no_touch
			lda e2_hit, x
			cmp #$06
			bne mbros_got_hit
				cpx #$01
				bne :+
					ldy #$04
					bne :++
:				ldy #$00
:				lda #$00
				sta e4_right, x
				sta e4_left, x
				jsr test_which
				lda e4_bot, x
				cmp #$01
				bne :+
					lda #$d8
					sta $21c+3, y
					lda #$05
					sta e2_hit, x
					jmp :++
:				lda #$80
				sta $21c+3, y
				lda #$04
				sta e2_hit, x
:				lda #$1f
				sta $21c+0, y
				jsr do_score
				ldx #$26
				jmp return_sfx_routine
mbros_beep:
				jmp mbros_done_touch
mbros_got_hit:
			lda #$72
			sta g_counter3
			inc game_misses
			ldx #$27
			jmp return_sfx_routine
mbros_hit:
			jmp end_loop
mbros_no_touch:
	inx
	cpx #$02
	bne mbros_body_test
mbros_done_touch:
	
	ldx #$00
@block_hit:
	lda e2_left, x
	cmp s_right
		bcs @no_coll
	lda e2_right, x
	cmp s_left
		bcc @no_coll
	lda e2_top, x
	cmp s_bot
		bcs @no_coll
	lda e2_bot, x
	cmp s_top
		bcc @no_coll
			lda #$06
			sta e2_hit, x
@no_coll:
	inx
	cpx #$02
	bne @block_hit

	inc e4_dir			; animations
	lda e4_dir
	cmp #$10
	bne :+
		lda #$00
		sta e4_dir
:	ldx #$00
:	jsr mbros_anim
	inx
	cpx #$03
	bne :-

	lda e1_hit
	cmp #$02
	bcs @no_fall_test
		lda g_counter2
		cmp #$11
		bne @no_fall_test
			ldx e5_spd_lo
			inx
			lda mbros_coll_lo, x
			sta temp_16bit_1+0
			lda mbros_coll_hi, x
			sta temp_16bit_1+1
			ldy e6_spd_lo
			lda (temp_16bit_1), y
			bne @no_fall_test
				inc e5_spd_lo
				inc e5_spd_lo
				lda #$21
				sta g_counter2
				lda #$06
				sta g_counter1
@no_fall_test:

	jsr mbros_movement
	lda g_counter1
	beq :+
		jmp @no_control
:
@do_controls:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		jsr do_random_set
		ldx #$ff
:		inx
		cpx #$10
		bne :+
			jmp @no_control
:		lda mbros_jump_x, x
		cmp e6_spd_lo
		bne :--
			lda mbros_jump_y, x
			cmp e5_spd_lo
			bne :--
				lda mbros_jump_how, x
				beq :++
					cmp #$01
					beq :+
						lda #$05
						sta g_counter1
						lda #$00
						sta e6_bot
						dec e5_spd_lo
						dec e5_spd_lo
						inc e6_spd_lo
						lda #$03
						sta e1_hit
						jmp set_other_jump_counter
:					lda #$04
					sta g_counter1
					lda #$00
					sta e6_bot
					dec e5_spd_lo
					dec e5_spd_lo
					dec e6_spd_lo
					lda #$02
					sta e1_hit
					jmp set_other_jump_counter
:				lda $218+0
				sec
				sbc #$08
				sta $224+0
				lda $218+3
				sta $224+3
				lda #$03
				sta g_counter1
				jmp set_reg_jump_counter
@no_a:
	lda control_pad
	and #left_punch
	beq @no_left
		jsr do_random_set
		lda $218+3
		cmp #$80
		bne :+
			jmp @no_control
:		ldx e5_spd_lo
		lda mbros_coll_lo, x
		sec
		sbc #$01
		sta temp_16bit_1+0
		lda mbros_coll_hi, x
		sta temp_16bit_1+1
		ldy e6_spd_lo
		lda (temp_16bit_1), y
		cmp #$02
		beq @no_control
			lda #$01
			sta g_counter1
			lda #$00
			sta e1_hit
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
			jmp @no_control
:		ldx e5_spd_lo
		lda mbros_coll_lo, x
		sta temp_16bit_1+0
		lda mbros_coll_hi, x
		sta temp_16bit_1+1
		ldy e6_spd_lo
		iny
		lda (temp_16bit_1), y
		cmp #$02
		beq @no_control
			lda #$02
			sta g_counter1
			lda #$01
			sta e1_hit
			sta e1_dir
@no_right:
@set_counter:
	lda #17
	sta g_counter2
@no_control:
	jsr pause_routine
	jmp end_loop
set_reg_jump_counter:
	lda #$21
	sta g_counter2
	jsr pause_routine
	jmp :+
set_other_jump_counter:
	lda #$41
	sta g_counter2
:	ldx #$25
	jmp return_sfx_routine
mbros_jump:
	jsr pause_routine
	jmp end_loop

mbros_movement:
	lda g_counter1
	asl a
	tay
	lda mbros_movement_table+1, y
	pha
	lda mbros_movement_table+0, y
	pha
	rts
mbros_movement_table:
	.addr mbros_still-1,mbros_do_left-1,mbros_do_right-1,mbros_do_block-1,mbros_j_left-1
	.addr mbros_j_right-1,mbros_fall-1
mbros_still_jump:
	lda e1_dir
	beq :+
		lda #$da
		sta $218+1
		lda #$01
		sta $218+2
		rts
:	lda #$da
	sta $218+1
	lda #$41
	sta $218+2
	rts
mbros_still:
	lda e1_dir
	beq :+
		lda #$d9
		sta $218+1
		lda #$01
		sta $218+2
		rts
:	lda #$d9
	sta $218+1
	lda #$41
	sta $218+2
	rts
mbros_fall:
	jsr mbros_still_jump
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		rts
:	lda e1_spd_lo
	clc
	adc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+0
	adc #>dkjr_chomp
	sta $218+0
	rts
mbros_do_block:
	jsr mbros_still_jump
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		rts
:	lda g_counter2
	cmp #$11
	bcs :+
		lda e1_spd_lo
		clc
		adc #<dkjr_vine
		sta e1_spd_lo
		lda $218+0
		adc #>dkjr_vine
		sta $218+0
		sec
		sbc #$08
		sta $224+0
		rts
:	lda e1_spd_lo
	sec
	sbc #<dkjr_vine
	sta e1_spd_lo
	lda $218+0
	sbc #>dkjr_vine
	sta $218+0
	sec
	sbc #$08
	sta $224+0
	rts
mbros_j_left:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		sta e1_dir
		rts
:	ldx e6_bot
	lda e1_spd_lo
	sec
	sbc mbros_left_y_lo, x
	sta e1_spd_lo
	lda $218+0
	sbc mbros_left_y_hi, x
	sta $218+0
	lda e1_spd_lo
	sec
	sbc mbros_left_x_lo, x
	sta e1_spd_lo
	lda $218+3
	sbc #$00
	sta $218+3
	inx
	stx e6_bot
	rts
mbros_j_right:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		lda #$01
		sta e1_dir
		rts
:	ldx e6_bot
	lda e1_spd_lo
	sec
	sbc mbros_left_y_lo, x
	sta e1_spd_lo
	lda $218+0
	sbc mbros_left_y_hi, x
	sta $218+0
	lda e1_spd_lo
	clc
	adc mbros_left_x_lo, x
	sta e1_spd_lo
	lda $218+3
	adc #$00
	sta $218+3
	inx
	stx e6_bot
	rts
mbros_do_left:			
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		dec e6_spd_lo
		rts
:	lda e1_spd_lo
	sec
	sbc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+3
	sbc #>dkjr_chomp
	sta $218+3
	rts
mbros_do_right:
	dec g_counter2
	bne :+
		lda #$00
		sta g_counter1
		inc e6_spd_lo
		rts
:	lda e1_spd_lo
	clc
	adc #<dkjr_chomp
	sta e1_spd_lo
	lda $218+3
	adc #>dkjr_chomp
	sta $218+3
	rts


mbros_left_y_lo:
	.byte $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
	.byte $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
	.byte $00,$00,$00,$80,$00,$00,$00,$80,$00,$00,$00,$80,$00,$00,$00,$80
	.byte $00,$00,$00,$80,$00,$00,$00,$80,$00,$00,$00,$80,$00,$00,$00,$80
mbros_left_y_hi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$ff,$00,$00,$00,$ff,$00,$00,$00,$ff,$00,$00,$00,$ff
mbros_left_x_lo:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $80,$00,$80,$00,$80,$00,$80,$00,$80,$00,$80,$00,$80,$00,$80,$00
	.byte $80,$00,$80,$00,$80,$00,$80,$00,$80,$00,$80,$00,$80,$00,$80,$00

mbros_right_y_hi:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$01,$00,$00,$00,$01,$00,$00,$00,$01,$00,$00,$00,$01
mbros_jump_x:
	.byte $01,$02,$03,$04,$07,$08,$09,$0a, $02,$03,$08,$09, $03,$04,$07,$08
mbros_jump_y:
	.byte $06,$06,$06,$06,$06,$06,$06,$06, $04,$04,$04,$04, $02,$02,$02,$02
mbros_jump_how:
	.byte $00,$00,$00,$01,$02,$00,$00,$00, $02,$00,$00,$01, $00,$01,$02,$00
mbros_coll_lo:
	.byte <mbros_coll0,<mbros_coll1,<mbros_coll2,<mbros_coll3
	.byte <mbros_coll4,<mbros_coll5,<mbros_coll6,<mbros_coll7
mbros_coll_hi:
	.byte >mbros_coll0,>mbros_coll1,>mbros_coll2,>mbros_coll3
	.byte >mbros_coll4,>mbros_coll5,>mbros_coll6,>mbros_coll7
mbros_coll0:
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
mbros_coll1:
	.byte $01,$01,$01,$01,$00,$00,$00,$00,$01,$01,$01,$01
mbros_coll2:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
mbros_coll3:
	.byte $00,$00,$00,$01,$01,$01,$01,$01,$01,$00,$00,$00
mbros_coll4:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
mbros_coll5:
	.byte $01,$01,$01,$01,$00,$00,$00,$00,$01,$01,$01,$01
mbros_coll6:
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
mbros_coll7:
	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
mbros_anim:
	lda e1_hit, x
	asl a
	tay
	lda mbros_anim_table+1, y
	pha
	lda mbros_anim_table+0, y
	pha
	ldy mbros_spr_select, x
	rts
mbros_spr_select:
	.byte $00,$04,$08
mbros_anim_table:
	.addr mbros_left-1, mbros_right-1, mbros_jumpl-1, mbros_jumpr-1, mbros_duckl-1
	.addr mbros_duckr-1, mbros_duckcoin-1
mbros_left:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$d9
		sta $218+1, y
		lda #$41
		sta $218+2, y
		rts
:	lda #$da
	sta $218+1, y
	lda #$41
	sta $218+2, y
	rts
mbros_right:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$d9
		sta $218+1, y
		lda #$01
		sta $218+2, y
		rts
:	lda #$da
	sta $218+1, y
	lda #$01
	sta $218+2, y
	rts
mbros_jumpl:
	lda #$d9
	sta $218+1, y
	lda #$41
	sta $218+2, y
	rts
mbros_jumpr:
	lda #$d9
	sta $218+1, y
	lda #$01
	sta $218+2, y
	rts
mbros_duckl:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$dc
		sta $218+1, y
		lda #$62
		sta $218+2, y
		rts
:	lda #$db
	sta $218+1, y
	lda #$62
	sta $218+2, y
	rts
mbros_duckr:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$dc
		sta $218+1, y
		lda #$22
		sta $218+2, y
		rts
:	lda #$db
	sta $218+1, y
	lda #$22
	sta $218+2, y
	rts
mbros_duckcoin:
	lda #$dd
	sta $218+1, y
	lda #$22
	sta $218+2, y
	rts
game_nmi17: ; m bros
	jsr game_write_stats
	jmp end_nmi








game_loop00: ; 10 yard

	lda g_counter2
	beq :++
		dec g_counter2
		bne :+
			jmp :++
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

	lda e4_spd_lo
	bne :+
		lda #$03
		sta e2_hit
		sta e3_hit
		sta e4_spd_lo
:


	inc g_counter1
	lda g_counter1
	beq :+
		cmp #$10
		bne @done_markers
			lda #$ff
			sta g_counter1
			bne @done_markers
:	ldy #$00
@markers_start:
	lda $230+0, y
	cmp #$57
	bne @down_marker
		lda #$1f
		sta $230+0, y
		jmp @inc_markers
@down_marker:
	clc
	adc #$08
	sta $230+0, y
@inc_markers:
	iny
	iny
	iny
	iny
	cpy #16
	bne @markers_start
@done_markers:

	ldy #$00
	ldx #$00
:	lda $21c+0, y
	sta e1_top, x
	clc
	adc #$07
	sta e1_bot, x
	lda $21c+3, y
	sta e1_left, x
	clc
	adc #$07
	sta e1_right, x
	tya
	clc
	adc #$08
	tay
	inx
	cpx #$03
	bne :-

	ldx #$00
yard_body_test:
	lda e2_left, x
	cmp e1_right
		bcs yard_no_touch
	lda e2_right, x
	cmp e1_left
		bcc yard_no_touch
	lda e2_top, x
	cmp e1_bot
		bcs yard_no_touch
	lda e2_bot, x
	cmp e1_top
		bcc yard_no_touch
			lda #$72
			sta g_counter2
			inc game_misses
			jmp yard_done_touch
yard_no_touch:
	inx
	cpx #$02
	bne yard_body_test
yard_done_touch:

	ldy #$00
@place_e:
	lda $220+0, y
	cmp #$f0
	bne :++
		ldx #$ff
:		inx
		lda seed
		cmp yard_offset, x
		bcc :-
			lda yard_x, x
			sta $220+3, y
			sta $224+3, y
			lda #$1f
			sta $220+0, y
			clc
			adc #$08
			sta $224+0, y
:	tya
	clc
	adc #$08
	tay
	cpy #$10
	bne @place_e
@done_place:

	ldy #$00
:	lda $220+0, y
	cmp #$4f
	bne :+
		ldx #$01
		jmp return_sfx_routine
yard_beep:
		jsr do_score
		lda #$f0
		sta $220+0, y
		sta $224+0, y
:	tya
	clc
	adc #$08
	tay
	cpy #$10
	bne :--

	ldx #$00
:	jsr yard_movement
	inx
	cpx #$02
	bne :-

	ldy #$00
	ldx #$00
:	lda $224+3, y
	clc
	adc #$06
	cmp $218+3
	bcc :+
		lda $224+3, y
		sec
		sbc #$06
		cmp $218+3
		bcs :++
			lda #$03
			sta e2_hit, x
			lda #$00
			sta e5_hit, x
			jmp :+++
:	lda #$05
	sta e2_hit, x
	lda #$02
	sta e5_hit, x
	jmp :++
:	lda #$04
	sta e2_hit, x
	lda #$01
	sta e5_hit, x
:	iny
	iny
	iny
	iny
	inx
	cpx #$02
	bne :----

	inc e4_dir
	lda e4_dir
	cmp #$10
	bne :+
		lda #$00
		sta e4_dir
:	ldx #$00
:	jsr yard_anim
	inx
	cpx #$03
	bne :-

	lda control_pad
	and #left_punch
	beq @no_left
		lda $218+3
		cmp #$80
		beq @no_right
			jsr do_random_set
			lda e1_spd_lo
			sec
			sbc #<dkjr_chomp
			sta e1_spd_lo
			lda $218+3
			sbc #>dkjr_chomp
			sta $218+3
			sta $21c+3
			lda #$01
			sta e1_hit
			bne @no_right
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda $218+3
		cmp #$d8
		beq @no_right
			jsr do_random_set
			lda e1_spd_lo
			clc
			adc #<dkjr_chomp
			sta e1_spd_lo
			lda $218+3
			adc #>dkjr_chomp
			sta $218+3
			sta $21c+3
			lda #$02
			sta e1_hit
@no_right:
	lda control_pad
	and #%11000000
	bne :+
		lda #$00
		sta e1_hit
:
	jsr pause_routine
	jmp end_loop
yard_x:
	.byte $80,$88,$90,$98,$a0,$a8,$b0,$b8,$c0,$c8,$d0,$d8
yard_offset:
	.byte 231,210,189,168,147,126,105,84,63,42,21,0
yard_movement:
	lda e5_hit, x
	asl a
	tay
	lda yard_move_table+1, y
	pha
	lda yard_move_table+0, y
	pha
	ldy yard_spr_e_select, x
	rts
yard_move_table:
	.addr yard_down-1, yard_downleft-1, yard_downright-1
yard_spr_e_select:
	.byte $00,$08
yard_down:
	lda e2_spd_lo, x
	clc
	adc #<dkjr_chomp
	sta e2_spd_lo, x
	lda $220+0, y
	adc #>dkjr_chomp
	sta $220+0, y
	clc
	adc #$08
	sta $224+0, y
	rts
yard_downleft:
	lda e2_spd_lo, x
	clc
	adc #<dkjr_chomp
	sta e2_spd_lo, x
	lda $220+0, y
	adc #>dkjr_chomp
	sta $220+0, y
	clc
	adc #$08
	sta $224+0, y

	lda e5_spd_lo, x
	sec
	sbc #<dkjr_vine
	sta e5_spd_lo, x
	lda $220+3, y
	sbc #>dkjr_vine
	sta $220+3, y
	sta $224+3, y
	rts
yard_downright:
	lda e2_spd_lo, x
	clc
	adc #<dkjr_chomp
	sta e2_spd_lo, x
	lda $220+0, y
	adc #>dkjr_chomp
	sta $220+0, y
	clc
	adc #$08
	sta $224+0, y

	lda e5_spd_lo, x
	clc
	adc #<dkjr_vine
	sta e5_spd_lo, x
	lda $220+3, y
	adc #>dkjr_vine
	sta $220+3, y
	sta $224+3, y
	rts
yard_anim:
	lda e1_hit, x
	asl a
	tay
	lda yard_anim_table+1, y
	pha
	lda yard_anim_table+0, y
	pha
	ldy yard_spr_select, x
	rts
yard_spr_select:
	.byte $00,$00,$08
yard_anim_table:
	.addr yard_still-1, yard_left-1, yard_right-1, yard_e_still-1, yard_e_left-1
	.addr yard_e_right-1
yard_still:
	lda #$e3
	sta $218+1, y
	lda #$e4
	sta $21c+1, y
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$41
		sta $218+2, y
		lda #$43
		sta $21c+2, y
		rts
:	lda #$01
	sta $218+2, y
	lda #$03
	sta $21c+2, y
	rts
yard_left:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$e5
		sta $218+1, y
		lda #$e6
		sta $21c+1, y
		lda #$01
		sta $218+2, y
		lda #$03
		sta $21c+2, y
		rts
:	lda #$e7
	sta $218+1, y
	lda #$e8
	sta $21c+1, y
	lda #$01
	sta $218+2, y
	lda #$03
	sta $21c+2, y
	rts
yard_right:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$e5
		sta $218+1, y
		lda #$e6
		sta $21c+1, y
		lda #$41
		sta $218+2, y
		lda #$43
		sta $21c+2, y
		rts
:	lda #$e7
	sta $218+1, y
	lda #$e8
	sta $21c+1, y
	lda #$41
	sta $218+2, y
	lda #$43
	sta $21c+2, y
	rts
yard_e_still:
	lda #$e9
	sta $220+1, y
	lda #$ea
	sta $224+1, y
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$42
		sta $220+2, y
		lda #$43
		sta $224+2, y
		rts
:	lda #$02
	sta $220+2, y
	lda #$03
	sta $224+2, y
	rts
yard_e_left:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$eb
		sta $220+1, y
		lda #$ec
		sta $224+1, y
		lda #$02
		sta $220+2, y
		lda #$03
		sta $224+2, y
		rts
:	lda #$ed
	sta $220+1, y
	lda #$ee
	sta $224+1, y
	lda #$02
	sta $220+2, y
	lda #$03
	sta $224+2, y
	rts
yard_e_right:
	lda e4_dir
	cmp #$08
	bcc :+
		lda #$eb
		sta $220+1, y
		lda #$ec
		sta $224+1, y
		lda #$42
		sta $220+2, y
		lda #$43
		sta $224+2, y
		rts
:	lda #$ed
	sta $220+1, y
	lda #$ee
	sta $224+1, y
	lda #$42
	sta $220+2, y
	lda #$43
	sta $224+2, y
	rts

game_nmi00: ; 10 yard
	jsr game_write_stats
	jmp end_nmi







uchamp_score_sound:
	ldx #$39
	jmp return_sfx_routine
uchamp_beep:
	rts
uchamp_hit_sound:
	ldx #$3a
	jmp return_sfx_routine
uchamp_hit:
	rts
game_loop26: ; u champ
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
	beq @skip_this
		dec e6_spd_lo
		beq :+
		lda e6_spd_lo
		cmp #$78
		bcs :++++
			jsr uchamp_e_sewer
			jmp end_loop
:			lda #$00
			sta e1_dir
			sta e2_dir
			sta e4_spd_lo
			sta g_counter1
			sta g_counter2
			ldx #$00
:			lda uchamp_spr_mirror, x
			sta $218+0, x
			inx
			cpx #60
			bne :-
			ldy #$00
:			jsr do_score
			iny
			cpy #$05
			bne :-
			jsr uchamp_score_sound
:		jmp end_loop
@skip_this:

	lda g_counter3
	beq @skip_em
		dec g_counter3
		beq :+
		lda g_counter3
		cmp #$78
		bcs :+++
			jsr uchamp_sewer
			jmp end_loop
:			lda #$00
			sta e1_dir
			sta e2_dir
			sta e4_spd_lo
			sta g_counter1
			sta g_counter2
			ldx #$00
:			lda uchamp_spr_mirror, x
			sta $218+0, x
			inx
			cpx #60
			bne :-
			inc game_misses
:		jmp end_loop
@skip_em:

	lda $234+3
	cmp #$d2
	bcc :+
		lda #$09
		sta e2_dir
		jsr uchamp_e_hurt
		lda #$b4
		sta e6_spd_lo
		jmp end_loop
:	lda $218+3
	cmp #$86
	bcs :+
		lda #$03
		sta e1_dir
		jsr uchamp_hurt
		lda #$b4
		sta g_counter3
		jmp end_loop
:
	lda e4_spd_lo
	bne :+
		lda #$05
		sta e2_dir
		lda #$78
		sta e5_spd_lo
		sta e4_spd_lo
:
	lda e5_spd_lo
	beq :+
		dec e5_spd_lo
:
	lda $24c+3
	sec
	sbc #$07
	cmp $21c+3
	bcs :+
		lda #$03
		sta e1_dir
		lda #$00
		sta g_counter1
		jsr uchamp_hit_sound
:
	lda e1_dir
	cmp #$03
	bne :+
		lda e1_spd_lo
		sec
		sbc #$40
		sta e1_spd_lo
		lda $218+3
		sbc #$00
		sta $218+3
		lda #$78
		sta e5_spd_lo
:
	lda e2_dir
	cmp #$08
	beq :+
		cmp #$07
		beq :+
		lda $248+3
		clc
		adc #$03
		cmp $230+3
		bcc :+
			lda #$08
			sta e2_dir
			lda #$00
			sta g_counter2
			jsr uchamp_hit_sound
:
	lda e2_dir
	cmp #$08
	bcc @not_injured
		bne :+
			lda e2_spd_lo
			clc
			adc #$40
			sta e2_spd_lo
			lda $230+3
			adc #$00
			sta $230+3
:
		jmp @no_move	
@not_injured:
	lda e2_dir
	cmp #$07
	beq @no_move
	lda $230+3
	sec
	sbc #$0c
	cmp $21c+3
	bcc @not_walking
		lda e2_spd_lo
		sec
		sbc #<dkjr_vine
		sta e2_spd_lo
		lda $230+3
		sbc #>dkjr_vine
		sta $230+3
		lda #$06
		sta e2_dir
		jmp @no_move
@not_walking:
	lda e5_spd_lo
	bne @dont_punch
		lda e2_dir
		cmp #$07
		beq @no_move
			lda #$07
			sta e2_dir
			lda #$00
			sta g_counter2
			jmp @no_move
@dont_punch:
	lda #$05
	sta e2_dir
@no_move:


;	lda e2_left
;	cmp s_right
;		bcs @no_coll
;	lda e2_right
;	cmp s_left
;		bcc @no_coll
;	lda e2_top
;	cmp s_bot
;		bcs @no_coll
;	lda e2_bot
;	cmp s_top
;		bcc @no_coll
;			
;@no_coll:



	ldx #$00
:	lda g_counter1, x
	cmp #$20
	bne :+
		lda #$00
		sta g_counter1, x
:	jsr uchamp_anim
	inc g_counter1, x
	inx
	cpx #$02
	bne :--


	lda e1_dir
	cmp #$02
	bcc :+
		jmp @no_control
:	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda #$02
		sta e1_dir
		lda #$00
		sta g_counter1
		jmp @no_control
@no_a:
	lda control_pad
	and #left_punch
	beq @no_left
		lda #$01
		sta e1_dir
		lda e1_spd_lo
		sec
		sbc #<dkjr_vine
		sta e1_spd_lo
		lda $218+3
		sbc #>dkjr_vine
		sta $218+3
		jmp @no_right
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda $21c+3
		clc
		adc #$0c
		cmp $230+3
		bcc :+
			jmp @no_control
:		lda #$01
		sta e1_dir
		lda e1_spd_lo
		clc
		adc #<dkjr_vine
		sta e1_spd_lo
		lda $218+3
		adc #>dkjr_vine
		sta $218+3
@no_right:
	lda control_pad
	and #%11000000
	bne :+
		lda #$00
		sta e1_dir
:
@no_control:
	jsr uchamp_lock_sprites

	jsr pause_routine
	jmp end_loop
uchamp_e_hit_lo:
	.byte $80,$80,$80,$80,$80,$80,$80,$80
uchamp_anim:
	lda e1_dir, x
	asl a
	tay
	lda uchamp_anim_table+1, y
	pha
	lda uchamp_anim_table+0, y
	pha
;	ldy uchamp_spr_select, x
	rts
uchamp_anim_table:
	.addr uchamp_still-1, uchamp_walk-1, uchamp_punch-1, uchamp_hurt-1, uchamp_sewer-1
	.addr uchamp_e_still-1, uchamp_e_walk-1, uchamp_e_punch-1, uchamp_e_hurt-1, uchamp_e_sewer-1
uchamp_still:
	lda #$f0
	sta $248+0
	lda #$00
	sta $248+3
	lda #$f9
	sta $218+1
	lda #$fa
	sta $21c+1
	lda #$fb
	sta $220+1
	lda #$fc
	sta $224+1
	lda #$ff
	sta $228+1
	lda #$e0
	sta $22c+1
	rts
uchamp_walk:
	lda #$f0
	sta $248+0
	lda #$00
	sta $248+3
	lda #$f9
	sta $218+1
	lda #$fa
	sta $21c+1
	lda #$fb
	sta $220+1
	lda #$fc
	sta $224+1
	lda g_counter1
	cmp #$10
	bcc :+
		lda #$ff
		sta $228+1
		lda #$e0
		sta $22c+1
		rts
:	lda #$fd
	sta $228+1
	lda #$fe
	sta $22c+1
	rts
uchamp_punch:
	lda g_counter1
	cmp #$1f
	bcc :+
		lda #$f0
		sta $248+0
		lda #$00
		sta $248+3
		sta e1_dir
		rts
:	cmp #$0c
	bcc :+
		lda #$00
		sta $218+1
		lda #$e7
		sta $21c+1
		lda #$00
		sta $220+1
		lda #$e9
		sta $224+1
		lda #$ea
		sta $228+1
		lda #$eb
		sta $22c+1
		lda $21c+3
		clc
		adc #$08
		sta $248+3
		lda $21c+0
		sta $248+0
		rts
:	lda #$e1
	sta $218+1
	lda #$e2
	sta $21c+1
	lda #$e3
	sta $220+1
	lda #$e4
	sta $224+1
	lda #$e5
	sta $228+1
	lda #$e6
	sta $22c+1
	rts
uchamp_hurt:
	lda #$f0
	sta $248+0
	lda #$00
	sta $248+3
	lda g_counter1
	cmp #$18
	bcc :+
		lda #$00
		sta g_counter1
		sta e1_dir
		rts
:	lda #$00
	sta $218+1
	lda #$ec
	sta $21c+1
	lda #$ed
	sta $220+1
	lda #$ee
	sta $224+1
	lda #$ef
	sta $228+1
	lda #$d0
	sta $22c+1
	rts
uchamp_sewer:
	lda #$f0
	sta $248+0
	lda #$00
	sta $248+3
	lda #$00
	sta $218+1
	lda #$ec
	sta $21c+1
	lda #$00
	sta $220+1
	lda #$00
	sta $224+1
	lda #$00
	sta $228+1
	lda #$00
	sta $22c+1
	lda #$f0
	sta $248+0
	lda #$55
	sta $21c+0
	lda #$83
	sta $21c+3
	rts
uchamp_e_still:
	lda #$f0
	sta $24c+0
	sta $24c+3
	lda #$fa
	sta $230+1
	lda #$f9
	sta $234+1
	lda #$fc
	sta $238+1
	lda #$fb
	sta $23c+1
	lda #$d3
	sta $240+1
	lda #$d4
	sta $244+1
	rts
uchamp_e_walk:
	lda #$f0
	sta $24c+0
	sta $24c+3
	lda #$fa
	sta $230+1
	lda #$f9
	sta $234+1
	lda #$fc
	sta $238+1
	lda #$fb
	sta $23c+1
	lda g_counter2
	cmp #$10
	bcc :+
		lda #$d3
		sta $240+1
		lda #$d4
		sta $244+1
		rts
:	lda #$d5
	sta $240+1
	lda #$d6
	sta $244+1
	rts
uchamp_e_punch:
	lda g_counter2
	cmp #$1f
	bcc :+
		lda #$f0
		sta $24c+0
		sta $24c+3
		lda #$78
		sta e5_spd_lo
		lda #$05
		sta e2_dir
		rts
:	cmp #$0c
	bcc :+
		lda #$e7
		sta $230+1
		lda #$00
		sta $234+1
		lda #$e9
		sta $238+1
		lda #$00
		sta $23c+1
		lda #$9b
		sta $240+1
		lda #$9c
		sta $244+1
		lda $230+3
		sec
		sbc #$08
		sta $24c+3
		lda $230+0
		sta $24c+0
		rts
:	lda #$e2
	sta $230+1
	lda #$e1
	sta $234+1
	lda #$e4
	sta $238+1
	lda #$e3
	sta $23c+1
	lda #$99
	sta $240+1
	lda #$9a
	sta $244+1
	rts
uchamp_e_hurt:
	lda #$f0
	sta $24c+0
	sta $24c+3
	lda g_counter2
	cmp #$1f
	bne :+
		lda #$05
		sta e2_dir
		rts
:	lda #$ec
	sta $230+1
	lda #$00
	sta $234+1
	lda #$ee
	sta $238+1
	lda #$ed
	sta $23c+1
	lda #$d1
	sta $240+1
	lda #$d2
	sta $244+1
	rts
uchamp_e_sewer:
	lda #$f0
	sta $24c+0
	sta $24c+3
	lda #$ec
	sta $230+1
	lda #$00
	sta $234+1
	lda #$00
	sta $238+1
	lda #$00
	sta $23c+1
	lda #$00
	sta $240+1
	lda #$00
	sta $244+1
	lda #$55
	sta $230+0
	lda #$d5
	sta $230+3
	rts

uchamp_move:
	lda e4_dir, x
	asl a
	tay
	lda uchamp_move_table+1, y
	pha
	lda uchamp_move_table+0, y
	pha
;	ldy uchamp_spr_select, x
	rts
uchamp_move_table:
uchamp_lock_sprites:
	lda $218+0
	sta $21c+0
	clc
	adc #$08
	sta $220+0
	sta $224+0
	clc
	adc #$08
	sta $228+0
	sta $22c+0
	lda $218+3
	sta $220+3
	sta $228+3
	clc
	adc #$08
	sta $21c+3
	sta $224+3
	sta $22c+3
	lda $230+0
	sta $234+0
	clc
	adc #$08
	sta $238+0
	sta $23c+0
	clc
	adc #$08
	sta $240+0
	sta $244+0
	lda $230+3
	sta $238+3
	sta $240+3
	clc
	adc #$08
	sta $234+3
	sta $23c+3
	sta $244+3
	rts
uchamp_spr_mirror:
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
	
	.byte $f0,$e8,$02,$00 ; 248 player fist
	.byte $f0,$e8,$43,$f0 ; 24c enemy fist
	.byte $1f,$d7,$01,$ac
game_nmi26: ; u champ
	jsr game_write_stats
	jmp end_nmi




