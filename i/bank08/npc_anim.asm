
do_npc_stuffs:
	ldx #$00
	lda npc1+0
	beq :+
		and #$80
		bne :+
		jsr npc1_anim
:	inx
	lda npc1, x
	beq :+
		and #$80
		bne :+
		jsr npc2_anim
:	inx
	lda npc1, x
	beq :+
		and #$80
		bne :+
		jsr npc3_anim
:

	lda npc1+0
	and #$80
	bne :+++
	lda npc1+0
	beq :+
		and #$80
		bne :+
			lda npc1+0
			cmp #$46
			beq :+
		jsr npc1_move
:	lda npc1+1
	beq :+
		and #$80
		bne :+
		jsr npc2_move
:	lda npc1+2
	beq :+
		and #$80
		bne :+
		jsr npc3_move
:

	jsr npc_tie_sprites
	jmp done_npc_stuffs


npc_face_lo:
.byte <npc_face_up1, <npc_face_dn1, <npc_face_lt1, <npc_face_rt1
npc_face_hi:
.byte >npc_face_up1, >npc_face_dn1, >npc_face_lt1, >npc_face_rt1

npc1_anim:
	lda npc_anim_state, x
	bmi @skip_init
		tay
		lda npc_face_lo, y
		sta npc1_anim_addy+0
		lda npc_face_hi, y
		sta npc1_anim_addy+1
		lda npc_anim_state, x
		eor #$80
		sta npc_anim_state, x
@skip_init:
	jsr npc1_anim_load

	dec npc_anim_count, x
	rts

npc1_anim_load:
	inx
	stx temp_8bit_1			; <---- number of npc +1 to use for palette #
	dex						;  (because player is always first spr palette)
	lda npc_which, x
	and #$f0
	sta temp_8bit_2			; <---- hi num to add to npc animation
	txa
	asl
	asl
	asl
	tax
	stx temp_8bit_3			; <---- number after multiplying by 4
	ldy #$00
	lda (npc1_anim_addy), y
	clc
	adc temp_8bit_2
	sta npc_topleft+1, x
	iny
	lda (npc1_anim_addy), y
	clc
	adc temp_8bit_2
	sta npc_topright+1, x

	iny
	lda (npc1_anim_addy), y
	clc
	adc temp_8bit_1
	sta npc_topleft+2, x
	iny
	lda (npc1_anim_addy), y
	clc
	adc temp_8bit_1
	sta npc_topright+2, x

	ldx temp_8bit_1
	dex
	lda npc_anim_count, x
	bne :+
		iny
		lda (npc1_anim_addy), y
		sta npc_anim_count, x
		iny
		lda (npc1_anim_addy), y
		sta temp_addy2+0
		iny
		lda (npc1_anim_addy), y
		sta temp_addy2+1

		lda temp_addy2+0
		sta npc1_anim_addy+0
		lda temp_addy2+1
		sta npc1_anim_addy+1
:	rts

npc2_anim:
	lda npc_anim_state, x
	bmi @skip_init
		tay
		lda npc_face_lo, y
		sta npc2_anim_addy+0
		lda npc_face_hi, y
		sta npc2_anim_addy+1
		lda npc_anim_state, x
		eor #$80
		sta npc_anim_state, x
@skip_init:
	jsr npc2_anim_load
	dec npc_anim_count, x
	rts

npc2_anim_load:
	inx
	stx temp_8bit_1			; <---- number of npc +1 to use for palette #
	dex						;  (because player is always first spr palette)
	lda npc_which, x
	and #$f0
	sta temp_8bit_2			; <---- hi num to add to npc animation
	txa
	asl
	asl
	asl
	tax
	stx temp_8bit_3			; <---- number after multiplying by 4
	ldy #$00
	lda (npc2_anim_addy), y
	clc
	adc temp_8bit_2
	sta npc_topleft+1, x
	iny
	lda (npc2_anim_addy), y
	clc
	adc temp_8bit_2
	sta npc_topright+1, x
	iny
	lda (npc2_anim_addy), y
	clc
	adc temp_8bit_1
	sta npc_topleft+2, x
	iny
	lda (npc2_anim_addy), y
	clc
	adc temp_8bit_1
	sta npc_topright+2, x

	ldx temp_8bit_1
	dex
	lda npc_anim_count, x
	bne :+
		iny
		lda (npc2_anim_addy), y
		sta npc_anim_count, x
		iny
		lda (npc2_anim_addy), y
		sta temp_addy2+0
		iny
		lda (npc2_anim_addy), y
		sta temp_addy2+1

		lda temp_addy2+0
		sta npc2_anim_addy+0
		lda temp_addy2+1
		sta npc2_anim_addy+1
:	rts

npc3_anim:
	lda npc_anim_state, x
	bmi @skip_init
		tay
		lda npc_face_lo, y
		sta npc3_anim_addy+0
		lda npc_face_hi, y
		sta npc3_anim_addy+1
		lda npc_anim_state, x
		eor #$80
		sta npc_anim_state, x
@skip_init:
	jsr npc3_anim_load
	dec npc_anim_count, x
	rts

npc3_anim_load:
	inx
	stx temp_8bit_1			; <---- number of npc +1 to use for palette #
	dex						;  (because player is always first spr palette)
	lda npc_which, x
	and #$f0
	sta temp_8bit_2			; <---- hi num to add to npc animation
	txa
	asl
	asl
	asl
	tax
	stx temp_8bit_3			; <---- number after multiplying by 4
	ldy #$00
	lda (npc3_anim_addy), y
	clc
	adc temp_8bit_2
	sta npc_topleft+1, x
	iny
	lda (npc3_anim_addy), y
	clc
	adc temp_8bit_2
	sta npc_topright+1, x
	iny
	lda (npc3_anim_addy), y
	clc
	adc temp_8bit_1
	sta npc_topleft+2, x
	iny
	lda (npc3_anim_addy), y
	clc
	adc temp_8bit_1
	sta npc_topright+2, x

	ldx temp_8bit_1
	dex
	lda npc_anim_count, x
	bne :+
		iny
		lda (npc3_anim_addy), y
		sta npc_anim_count, x
		iny
		lda (npc3_anim_addy), y
		sta temp_addy2+0
		iny
		lda (npc3_anim_addy), y
		sta temp_addy2+1

		lda temp_addy2+0
		sta npc3_anim_addy+0
		lda temp_addy2+1
		sta npc3_anim_addy+1
:	rts

npc_face_up1:
.byte $05,$07
.byte $00,$00
.byte $10
.byte <npc_face_up2,>npc_face_up2
npc_face_up2:
.byte $07,$05
.byte $40,$40
.byte $10
.byte <npc_face_up1,>npc_face_up1

npc_face_dn1:
.byte $01,$03
.byte $00,$00
.byte $10
.byte <npc_face_dn2,>npc_face_dn2
npc_face_dn2:
.byte $03,$01
.byte $40,$40
.byte $10
.byte <npc_face_dn1,>npc_face_dn1

npc_face_lt1:
.byte $0b,$09
.byte $40,$40
.byte $10
.byte <npc_face_lt2,>npc_face_lt2
npc_face_lt2:
.byte $0f,$0d
.byte $40,$40
.byte $10
.byte <npc_face_lt1,>npc_face_lt1

npc_face_rt1:
.byte $09,$0b
.byte $00,$00
.byte $10
.byte <npc_face_rt2,>npc_face_rt2
npc_face_rt2:
.byte $0d,$0f
.byte $00,$00
.byte $10
.byte <npc_face_rt1,>npc_face_rt1



npc_new_move:
.byte 192,128,64,0

npc1_move:
	lda npc_do_move+0
	beq :+
		lda npc1+0
		cmp #$05
		bcc :+
			jsr npc1_move_dir
		rts
:	dec npc_move_counter+0
	bne @no_move
		ldx #$ff
:		inx
		lda seed2
		cmp npc_new_move, x
		bcc :-
			stx temp_8bit_1
			lda npc_anim_state+0
			and #$0f
			cmp temp_8bit_1
			beq :+
				txa
				sta npc_anim_state+0
			lda npc1+0
			cmp #$05
			bcc :+
				jsr npc1_dir_test
:			lda #$ef
			sta npc_move_counter+0
@no_move:
	rts

npc1_dir_test:
	lda npc_anim_state
	and #$0f
	bne @npc1_dn
		lda npc_pos
		and #$f0
		cmp #$10
		bne :+
			jmp @not_moving
:		lda npc_pos
		sec
		sbc #$10
		tax
		stx temp_8bit_1
		lda bg_ram, x
		beq :+
			jmp @not_moving
:		lda p_pos
		cmp temp_8bit_1
		beq @not_moving
			bne @moving
@npc1_dn:
	cmp #$01
	bne @npc1_lt
		lda npc_pos
		and #$f0
		cmp #$d0
		bne :+
			jmp @not_moving
:		lda npc_pos
		clc
		adc #$10
		tax
		stx temp_8bit_1
		lda bg_ram, x
		bne @not_moving
			lda p_pos
			cmp temp_8bit_1
			beq @not_moving
				bne @moving
@npc1_lt:
	cmp #$02
	bne @npc1_rt
		lda npc_pos
		and #$0f
		cmp #$01
		bne :+
			jmp @not_moving
:		ldx npc_pos
		dex
		stx temp_8bit_1
		lda bg_ram, x
		bne @not_moving
			lda p_pos
			cmp temp_8bit_1
			beq @not_moving
				bne @moving
@npc1_rt:
	lda npc_pos
	and #$0f
	cmp #$0e
	bne :+
		jmp @not_moving
:	ldx npc_pos
	inx
	stx temp_8bit_1
	lda bg_ram, x
	bne @not_moving
			lda p_pos
			cmp temp_8bit_1
			beq @not_moving
				bne @moving
@moving:
		ldx npc_pos
		lda #$00
		sta bg_ram, x
		ldx temp_8bit_1
		stx npc_pos
		lda npc1
		clc
		adc #$80
		sta bg_ram, x
		lda #$10
		sta npc_do_move
@not_moving:
	rts

npc1_move_dir:
	lda npc_anim_state+0
	and #$0f
	bne :+
		dec npc_topleft+0
		jmp @done_move
:	cmp #$01
	bne :+
		inc npc_topleft+0
		jmp @done_move
:	cmp #$02
	bne :+
		dec npc_topleft+3
		jmp @done_move
:	inc npc_topleft+3
@done_move:	
	dec npc_do_move
	rts








npc2_move:
	lda npc_do_move+1
	beq :+
		lda npc1+1
		cmp #$05
		bcc :+
			jsr npc2_move_dir
		rts
:	dec npc_move_counter+1
	bne @no_move
		ldx #$ff
:		inx
		lda seed3
		cmp npc_new_move, x
		bcc :-
			stx temp_8bit_1
			lda npc_anim_state+1
			and #$0f
			cmp temp_8bit_1
			beq :+
				txa
				sta npc_anim_state+1
			lda npc1+1
			cmp #$05
			bcc :+
				jsr npc2_dir_test
:			lda #$ef
			sta npc_move_counter+1
@no_move:
	rts

npc2_dir_test:
	lda npc_anim_state+1
	and #$0f
	bne @npc2_dn
		lda npc_pos+1
		and #$f0
		cmp #$10
		bne :+
			jmp @not_moving
:		lda npc_pos+1
		sec
		sbc #$10
		tax
		stx temp_8bit_1
		lda bg_ram, x
		beq :+
			jmp @not_moving
:		lda p_pos
		cmp temp_8bit_1
		beq @not_moving
			bne @moving
@npc2_dn:
	cmp #$01
	bne @npc2_lt
		lda npc_pos+1
		and #$f0
		cmp #$d0
		bne :+
			jmp @not_moving
:		lda npc_pos+1
		clc
		adc #$10
		tax
		stx temp_8bit_1
		lda bg_ram, x
		bne @not_moving
			lda p_pos
			cmp temp_8bit_1
			beq @not_moving
				bne @moving
@npc2_lt:
	cmp #$02
	bne @npc2_rt
		lda npc_pos+1
		and #$0f
		cmp #$01
		bne :+
			jmp @not_moving
:		ldx npc_pos+1
		dex
		stx temp_8bit_1
		lda bg_ram, x
		bne @not_moving
			lda p_pos
			cmp temp_8bit_1
			beq @not_moving
				bne @moving
@npc2_rt:
	lda npc_pos+1
	and #$0f
	cmp #$0e
	bne :+
		jmp @not_moving
:	ldx npc_pos+1
	inx
	stx temp_8bit_1
	lda bg_ram, x
	bne @not_moving
			lda p_pos
			cmp temp_8bit_1
			beq @not_moving
				bne @moving
@moving:
		ldx npc_pos+1
		lda #$00
		sta bg_ram, x
		ldx temp_8bit_1
		stx npc_pos+1
		lda npc1+1
		clc
		adc #$80
		sta bg_ram, x
		lda #$10
		sta npc_do_move+1
@not_moving:
	rts

npc2_move_dir:
	lda npc_anim_state+1
	and #$0f
	bne :+
		dec npc2_topleft+0
		jmp @done_move
:	cmp #$01
	bne :+
		inc npc2_topleft+0
		jmp @done_move
:	cmp #$02
	bne :+
		dec npc2_topleft+3
		jmp @done_move
:	inc npc2_topleft+3
@done_move:	
	dec npc_do_move+1
	rts









npc3_move:
	lda npc_do_move+2
	beq :+
		lda npc1+2
		cmp #$05
		bcc :+
			jsr npc3_move_dir
		rts
:	dec npc_move_counter+2
	bne @no_move
		ldx #$ff
:		inx
		lda seed4
		cmp npc_new_move, x
		bcc :-
			stx temp_8bit_1
			lda npc_anim_state+2
			and #$0f
			cmp temp_8bit_1
			beq :+
				txa
				sta npc_anim_state+2
			lda npc1+2
			cmp #$05
			bcc :+
				jsr npc3_dir_test
:			lda #$ef
			sta npc_move_counter+2
@no_move:
	rts

npc3_dir_test:
	lda npc_anim_state+2
	and #$0f
	bne @npc3_dn
		lda npc_pos+2
		and #$f0
		cmp #$10
		bne :+
			jmp @not_moving
:		lda npc_pos+2
		sec
		sbc #$10
		tax
		stx temp_8bit_1
		lda bg_ram, x
		beq :+
			jmp @not_moving
:		lda p_pos
		cmp temp_8bit_1
		beq @not_moving
			bne @moving
@npc3_dn:
	cmp #$01
	bne @npc3_lt
		lda npc_pos+2
		and #$f0
		cmp #$d0
		bne :+
			jmp @not_moving
:		lda npc_pos+2
		clc
		adc #$10
		tax
		stx temp_8bit_1
		lda bg_ram, x
		bne @not_moving
			lda p_pos
			cmp temp_8bit_1
			beq @not_moving
				bne @moving
@npc3_lt:
	cmp #$02
	bne @npc3_rt
		lda npc_pos+2
		and #$0f
		cmp #$01
		bne :+
			jmp @not_moving
:		ldx npc_pos+2
		dex
		stx temp_8bit_1
		lda bg_ram, x
		bne @not_moving
			lda p_pos
			cmp temp_8bit_1
			beq @not_moving
				bne @moving
@npc3_rt:
	lda npc_pos+2
	and #$0f
	cmp #$0e
	bne :+
		jmp @not_moving
:	ldx npc_pos+2
	inx
	stx temp_8bit_1
	lda bg_ram, x
	bne @not_moving
			lda p_pos
			cmp temp_8bit_1
			beq @not_moving
				bne @moving
@moving:
		ldx npc_pos+2
		lda #$00
		sta bg_ram, x
		ldx temp_8bit_1
		stx npc_pos+2
		lda npc1+2
		clc
		adc #$80
		sta bg_ram, x
		lda #$10
		sta npc_do_move+2
@not_moving:
	rts

npc3_move_dir:
	lda npc_anim_state+2
	and #$0f
	bne :+
		dec npc3_topleft+0
		jmp @done_move
:	cmp #$01
	bne :+
		inc npc3_topleft+0
		jmp @done_move
:	cmp #$02
	bne :+
		dec npc3_topleft+3
		jmp @done_move
:	inc npc3_topleft+3
@done_move:	
	dec npc_do_move+2
	rts
