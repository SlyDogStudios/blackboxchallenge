p_battle_anim_lo:
.byte <btl_stand
.byte <btl_punch,<btl_zap,<btl_fire,<btl_stomp,<btl_jump
.byte <btl_juke,<btl_blck,<btl_cntr,<btl_strg,<btl_adrn
.byte <btl_esca,<btl_pick,<btl_dead
p_battle_anim_hi:
.byte >btl_stand
.byte >btl_punch,>btl_zap,>btl_fire,>btl_stomp,>btl_jump
.byte >btl_juke,>btl_blck,>btl_cntr,>btl_strg,>btl_adrn
.byte >btl_esca,>btl_pick,>btl_dead

p_battle_anim:
	lda p_anim_state
	tax
	lda p_battle_anim_lo, x
	sta p_anim_addy+0
	lda p_battle_anim_hi, x
	sta p_anim_addy+1
	jsr battle_anim_load

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


;p_battle_anim:
;	lda p_anim_state
;		tax
;		lda p_battle_anim_lo, x
;		sta p_anim_addy+0
;		lda p_battle_anim_hi, x
;		sta p_anim_addy+1
;@skip_init:
;	lda p_anim_count
;	bne :+
;
;	jsr battle_anim_load
;:	lda p_anim_count
;	bne :+
;		lda #$00
;		sta p_anim_state
;		lda #$60
;		sta p_com_tly
;		lda #$40
;		sta p_com_tlx
;		lda #$ef
;		sta cursor+4
;:
;	rts

btl_stand:
.byte $00,$61,$00
.byte $70,$71,$72
.byte $80,$81,$82
.byte $90,$91,$92
.byte $a0,$a1,$a2
.byte $00,$ef,$ef		; 
.byte $60,$40			; y pos start, x pos start
.byte $01
.byte $00				; stamina cost
.byte $00,$00			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $00				; damage
btl_punch:
.byte $00,$61,$85
.byte $70,$7d,$95
.byte $80,$8d,$83
.byte $90,$91,$92
.byte $a0,$a1,$a2
.byte $00,$ef,$ef
.byte $60,$40
.byte $3c
.byte $01				; stamina cost
.byte $90,$01			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $01				; damage
btl_cntr:
.byte $00,$64,$00
.byte $73,$74,$75
.byte $96,$6d,$83
.byte $a6,$a9,$92
.byte $00,$00,$a2
.byte $00,$00,$ef
.byte $50,$20
.byte $1e
.byte $01				; stamina cost
.byte $00,$00			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $00				; damage
btl_zap:
.byte $00,$64,$00
.byte $73,$62,$63
.byte $65,$6d,$83
.byte $90,$91,$92
.byte $a0,$a1,$a2
.byte $6e,$68,$58
.byte $60,$40
.byte $3c
.byte $04				; stamina cost
.byte $a0,$02			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $04				; damage
btl_fire:
.byte $00,$64,$00
.byte $73,$74,$75
.byte $65,$6d,$83
.byte $90,$91,$92
.byte $a0,$a1,$a2
.byte $60,$64,$59
.byte $60,$40
.byte $3c
.byte $03				; stamina cost
.byte $a0,$02			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $03				; damage
btl_stomp:
.byte $76,$77,$78
.byte $86,$87,$88
.byte $96,$97,$98
.byte $a6,$a7,$a8
.byte $00,$00,$00
.byte $00,$ef,$ef
.byte $40,$40
.byte $3c
.byte $02				; stamina cost
.byte $a8,$01			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $02				; damage
btl_jump:
.byte $00,$61,$00
.byte $70,$71,$72
.byte $80,$81,$82
.byte $9d,$9e,$9f
.byte $7e,$7f,$6f
.byte $00,$ef,$ef
.byte $50,$40
.byte $1e
.byte $01				; stamina cost
.byte $00,$00			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $00				; damage
btl_juke:
.byte $69,$00,$00
.byte $79,$7a,$00
.byte $89,$8a,$8b
.byte $99,$9a,$9b
.byte $a0,$00,$00
.byte $00,$ef,$ef
.byte $60,$40
.byte $1e
.byte $01				; stamina cost
.byte $00,$00			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $00				; damage
btl_blck:
.byte $00,$84,$85
.byte $93,$94,$95
.byte $a3,$a4,$a5
.byte $90,$91,$92
.byte $a0,$a1,$a2
.byte $00,$ef,$ef
.byte $60,$40
.byte $1e
.byte $01				; stamina cost
.byte $00,$00			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $00				; damage
btl_strg:
.byte $76,$77,$78
.byte $86,$87,$88
.byte $65,$6d,$83
.byte $68,$6b,$6c
.byte $6a,$7b,$7c
.byte $00,$ef,$ef
.byte $60,$40
.byte $3c
.byte $03				; stamina cost
.byte $00,$00			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $00				; damage
btl_adrn:
.byte $aa,$77,$85
.byte $8e,$87,$95
.byte $65,$6d,$83
.byte $68,$6b,$6c
.byte $6a,$7b,$7c
.byte $00,$ef,$ef
.byte $60,$40
.byte $3c
.byte $03				; stamina cost
.byte $00,$00			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $00				; damage
btl_esca:
.byte $00,$67,$00
.byte $70,$7d,$8c
.byte $80,$8f,$9c
.byte $68,$6b,$6c
.byte $6a,$7b,$7c
.byte $00,$ef,$ef
.byte $60,$40
.byte $1e
.byte $03				; stamina cost
.byte $20,$01			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $00				; damage
btl_pick:			; actually CLUE now
.byte $00,$61,$85
.byte $70,$7d,$95
.byte $80,$8d,$83
.byte $9d,$9e,$9f
.byte $7e,$7f,$6f
.byte $00,$ef,$ef
.byte $2d,$60
.byte $1e
.byte $02				; stamina cost
.byte $60,$01			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $00				; damage
btl_dead:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $ab,$ac,$66
.byte $ad,$ae,$af
.byte $00,$ef,$ef		; 
.byte $60,$40			; y pos start, x pos start
.byte $78
.byte $00				; stamina cost
.byte $00,$00			; x pos next, which moves (0=nothing, 1=body, 2=projectile)
.byte $00				; damage


btl_str_lo:
.byte <p_com_tlt
.byte <p_com_tmt,<p_com_trt,<p_com_lm1t,<p_com_mm1t,<p_com_rm1t
.byte <p_com_lm2t,<p_com_mm2t,<p_com_rm2t,<p_com_lm3t,<p_com_mm3t
.byte <p_com_rm3t,<p_com_blt,<p_com_bmt,<p_com_brt,<p_att1t
btl_str_hi:
.byte >p_com_tlt
.byte >p_com_tmt,>p_com_trt,>p_com_lm1t,>p_com_mm1t,>p_com_rm1t
.byte >p_com_lm2t,>p_com_mm2t,>p_com_rm2t,>p_com_lm3t,>p_com_mm3t
.byte >p_com_rm3t,>p_com_blt,>p_com_bmt,>p_com_brt,>p_att1t
battle_anim_load:
	ldy #$00
	sty temp_8bit_2
:	ldy temp_8bit_2
	lda btl_str_lo, y
	sta temp_16bit_1+0
	lda btl_str_hi, y
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
	iny
	lda (p_anim_addy), y
	sta p_anim_count
	sta p_anim_count_other
	iny
	lda (p_anim_addy), y
	sta p_stam_cost
	iny
	lda (p_anim_addy), y
	sta p_next_x
	iny
	lda (p_anim_addy), y
	sta p_next_which
	iny
	lda (p_anim_addy), y
	sta p_damage_done

;	lda p_anim_state
;	cmp #$01
;	bcs :+
;		jmp finish_str
;:	cmp #$05
;	bcc :+
;		jmp finish_str
;:	lda p_str_used
;	beq finish_str
;		inc p_damage_done
;finish_str:

	lda p_anim_state
	cmp #$01
	bcs :+
		jmp finish_adr
:	cmp #$05
	bcc :+
		jmp finish_adr
:	lda p_adr_used
	beq finish_adr
		lda #$1e
		sta p_anim_count_other
		sta p_anim_count
finish_adr:

		lda p_adr_used
		beq :++
		lda games+31
		and #$c0
		beq :+
			lda #$1c
			sta pal_address+19
			bne :++
:		lda #$03
		sta pal_address+19
:
		lda p_str_used
		beq :++
		lda games+31
		and #$c0
		beq :+
			lda #$10
			sta pal_address+17
			bne :++
;			lda #$00
;			sta pal_address+18
;			beq :++
:		lda #$29
		sta pal_address+17
;		lda #$19
;		sta pal_address+18
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




p_anim_start_lo:
	.byte <p_up
	.byte <p_down, <p_left, <p_right, <p_float_lft, <p_float_rgt
	.byte <p_climb_lft, <p_climb_rgt, <p_ride_up, <p_ride_dn, <p_ride_lt
	.byte <p_ride_rt, <p_boat_up, <p_boat_dn, <p_boat_lt, <p_boat_rt
	.byte <p_jmp_lt, <p_jmp_rt, <p_hop_lt, <p_hop_rt
p_anim_start_hi:
	.byte >p_up
	.byte >p_down, >p_left, >p_right, >p_float_lft, >p_float_rgt
	.byte >p_climb_lft, >p_climb_rgt, >p_ride_up, >p_ride_dn, >p_ride_lt
	.byte >p_ride_rt, >p_boat_up, >p_boat_dn, >p_boat_lt, >p_boat_rt
	.byte >p_jmp_lt, >p_jmp_rt, >p_hop_lt, >p_hop_rt


p_anim:
	lda p_anim_state
	bmi @skip_init
		tax
		lda p_anim_start_lo, x
		sta p_anim_addy+0
		lda p_anim_start_hi, x
		sta p_anim_addy+1
		lda p_anim_state
		eor #$80
		sta p_anim_state
@skip_init:
	jsr p_anim_load
	dec p_anim_count
	rts

p_anim_load:
	ldy #$00
	lda (p_anim_addy), y
	sta p_topleft+1
	iny
	lda (p_anim_addy), y
	sta p_topright+1
	iny
	lda (p_anim_addy), y
	sta p_topleft+2
	iny
	lda (p_anim_addy), y
	sta p_topright+2

	lda p_anim_count
	bne :+
		iny
		lda (p_anim_addy), y
		sta p_anim_count
		iny
		lda (p_anim_addy), y
		sta temp_addy2+0
		iny
		lda (p_anim_addy), y
		sta temp_addy2+1

		lda temp_addy2+0
		sta p_anim_addy+0
		lda temp_addy2+1
		sta p_anim_addy+1
:	rts

p_hop_lt:
.byte $0b,$09
.byte $40,$40
.byte $01
.byte <p_hop_lt,>p_hop_lt
p_hop_rt:
.byte $09,$0b
.byte $00,$00
.byte $01
.byte <p_hop_rt,>p_hop_rt

p_jmp_lt:
.byte $13,$15
.byte $00,$00
.byte $01
.byte <p_jmp_lt,>p_jmp_lt
p_jmp_rt:
.byte $15,$13
.byte $40,$40
.byte $01
.byte <p_jmp_rt,>p_jmp_rt

p_ride_up:
.byte $27,$27
.byte $00,$40
.byte $01
.byte <p_ride_up,>p_ride_up
p_ride_dn:
.byte $25,$25
.byte $00,$40
.byte $01
.byte <p_ride_dn,>p_ride_dn
p_ride_lt:
.byte $23,$21
.byte $40,$40
.byte $01
.byte <p_ride_lt,>p_ride_lt
p_ride_rt:
.byte $21,$23
.byte $00,$00
.byte $01
.byte <p_ride_rt,>p_ride_rt



p_boat_up:
.byte $1b,$1b
.byte $00,$40
.byte $01
.byte <p_boat_up,>p_boat_up
p_boat_dn:
.byte $2d,$2d
.byte $00,$40
.byte $01
.byte <p_boat_dn,>p_boat_dn
p_boat_rt:
.byte $2d,$29
.byte $00,$00
.byte $01
.byte <p_boat_rt,>p_boat_rt
p_boat_lt:
.byte $29,$2d
.byte $40,$40
.byte $01
.byte <p_boat_lt,>p_boat_lt


p_climb_lft:
.byte $19,$2b
.byte $00,$00
.byte $01
.byte <p_climb_lft,>p_climb_lft
p_climb_rgt:
.byte $2b,$19
.byte $40,$40
.byte $01
.byte <p_climb_rgt,>p_climb_rgt

p_float_lft:
.byte $17,$17
.byte $00,$40
.byte $01
.byte <p_float_lft,>p_float_lft
p_float_rgt:
.byte $17,$17
.byte $00,$40
.byte $01
.byte <p_float_rgt,>p_float_rgt

p_ride_lft:
.byte $15,$13
.byte $40,$40
.byte $01
.byte <p_ride_lft,>p_ride_lft
p_ride_rgt:
.byte $13,$15
.byte $00,$00
.byte $01
.byte <p_ride_rgt,>p_ride_rgt


p_up:
.byte $05,$07
.byte $00,$00
.byte $10
.byte <p_up2,>p_up2
p_up2:
.byte $07,$05
.byte $40,$40
.byte $10
.byte <p_up,>p_up
p_down:
.byte $01,$03
.byte $00,$00
.byte $10
.byte <p_down2,>p_down2
p_down2:
.byte $03,$01
.byte $40,$40
.byte $10
.byte <p_down,>p_down
p_left:
.byte $0b,$09
.byte $40,$40
.byte $10
.byte <p_left2,>p_left2
p_left2:
.byte $0f,$0d
.byte $40,$40
.byte $10
.byte <p_left,>p_left
p_right:
.byte $09,$0b
.byte $00,$00
.byte $10
.byte <p_right2,>p_right2
p_right2:
.byte $0d,$0f
.byte $00,$00
.byte $10
.byte <p_right,>p_right

p_tie_sprites:
	lda p_topleft+0
	sta p_topright+0
	lda p_topleft+3
	clc
	adc #$08
	sta p_topright+3
	rts


bike_controls:
	lda p_move_count
	beq :+
		jmp do_bike_move
:	lda p_anim_state
	and #$0f
	cmp #$08
	bne @not_8
		lda p_pos
		and #$f0
		bne :+
			jmp :++
:		lda p_pos
		sec
		sbc #$10
		tax
		lda bg_ram, x
		beq :+
			jmp done_bike
:			jmp do_bike_move
@not_8:
	cmp #$09
	bne @not_9
		lda p_pos
		and #$f0
		cmp #$e0
		bne :+
			jmp :++
:		lda p_pos
		clc
		adc #$10
		tax
		lda bg_ram, x
		beq :+
			jmp done_bike
:			jmp do_bike_move
@not_9:
	cmp #$0a
	bne @not_10
		lda p_pos
		and #$0f
		bne :+
			jmp :+++
:		lda p_pos
		tax
		dex
		lda bg_ram, x
		cmp #$09
		bne :+
			lda games+21
			and #$c0
			beq :+
			jsr launch_beep
			lda #$11
			sta p_anim_state
			ldx #$00
			stx temp_8bit_1
			stx temp_8bit_2
			lda ramping_table, x
			sta temp_8bit_1
			lda #<loop_bike_leap
			sta loop_pointer+0
			lda #>loop_bike_leap
			sta loop_pointer+1
			rts
:
		lda bg_ram, x
		bne done_bike
:			jmp do_bike_move
@not_10:
	lda p_pos
	and #$0f
	cmp #$0f
	bne :+
		jmp :+++
:	lda p_pos
	tax
	inx
	lda bg_ram, x
	cmp #$08
	bne :+
			lda games+21
			and #$c0
			beq :+
			jsr launch_beep
			lda #$10
			sta p_anim_state
			ldx #$00
			stx temp_8bit_1
			stx temp_8bit_2
			lda ramping_table, x
			sta temp_8bit_1
			lda #<loop_bike_leap
			sta loop_pointer+0
			lda #>loop_bike_leap
			sta loop_pointer+1
			rts
:
	lda bg_ram, x
	bne done_bike
:			jmp do_bike_move
done_bike:
	lda #$00
	sta p_move_count
	sta set_move
	sta bike_move
	lda p_anim_state
	and #$0f
	sec
	sbc #$08
	sta p_anim_state
	jsr recolor_player
		jsr bikeno_beep
	rts

do_bike_move:
	inc p_move_count
	inc p_move_count
	lda set_move
	and #$f0
	cmp #$80
	bne :+
		inc p_topleft+3
		inc p_topleft+3
		bne @move_counter
:	cmp #$40
	bne :+
		dec p_topleft+3
		dec p_topleft+3
		bne @move_counter
:	cmp #$20
	bne :+
		inc p_topleft+0
		inc p_topleft+0
		bne @move_counter
:	cmp #$10
	bne :+
		dec p_topleft+0
		dec p_topleft+0
		bne @move_counter
:	
@move_counter:
	lda p_move_count
	cmp #$10
	beq :+
		jmp do_bike_move2
:	lda #$00
	sta p_move_count
	jsr get_pos

	lda set_move
	and #$0f
	cmp #$01
	bne :+
		lda #$08
		sta p_anim_state
		lda #$11
		sta set_move
		bne @done_change
:	cmp #$02
	bne :+
		lda #$09
		sta p_anim_state
		lda #$22
		sta set_move
		bne @done_change
:	cmp #$03
	bne :+
		lda #$0a
		sta p_anim_state
		lda #$43
		sta set_move
		bne @done_change
:	cmp #$04
	bne :+
		lda #$0b
		sta p_anim_state
		lda #$84
		sta set_move
		bne @done_change
:	cmp #$0f
	bne @done_change
		jmp done_bike
@done_change:

do_bike_move2:

	lda set_move
	and #$f0
	sta temp_8bit_1


;	lda p_topleft+0
;	cmp #$0f
;	bcs :+
;		rts
;:	lda p_topleft+0
;	cmp #$e1
;	bcc :+
;		rts
;:	lda p_topleft+3
;	cmp #$0f
;	bcs :+
;		rts
;:	lda p_topleft+3
;	cmp #$f1
;	bcc :+
;		rts
;:
	lda control_pad
	and #up_punch
	beq @no_up
		lda temp_8bit_1
		clc
		adc #$01
		sta set_move
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		lda temp_8bit_1
		clc
		adc #$02
		sta set_move
@no_down:
	lda control_pad
	and #left_punch
	beq @no_left
		lda temp_8bit_1
		clc
		adc #$03
		sta set_move
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda temp_8bit_1
		clc
		adc #$04
		sta set_move
@no_right:
	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq @no_b
		lda temp_8bit_1
		clc
		adc #$0f
		sta set_move
@no_b:

	rts


all_sprites_gone:
	ldx #$00
	lda #$ef
:	sta $200, x
	inx
	inx
	inx
	inx
	bne :-
	rts


; ORIGINAL WHERE YOU CAN'T PUSH A DIRECTION DURING BIKE MODE ON EDGES OF SCREEN
;	lda p_topleft+0
;	cmp #$20
;	bcs :+
;		rts
;:	lda p_topleft+0
;	cmp #$d0
;	bcc :+
;		rts
;:	lda p_topleft+3
;	cmp #$20
;	bcs :+
;		rts
;:	lda p_topleft+3
;	cmp #$e0
;	bcc :+
;		rts
;:




