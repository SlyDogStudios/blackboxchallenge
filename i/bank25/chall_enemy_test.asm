boss_map_y:
	.byte $00,    $09,    $08,    $08,    $0b,    $0b,    $0b,    $00
boss_map_x:
	.byte $00,    $08,    $04,    $0c,    $0d,    $08,    $0c,    $0e
boss_posit:
	.byte $00,    $b8,    $89,    $98,    $28,    $5b,    $a5,    $75
boss_enemy:
	.byte $00,    strong, ddoggy, rrobby, lblock, ggenie, octops, shadow
boss_clust:
	.byte $00,    $06,    $05,    $05,    $05,    $05,    $06,    $07




test_for_battle:

	ldx #$00
test_boss:
	lda boss_map_y, x
	cmp map_y
	bne not_boss
		lda boss_map_x, x
		cmp map_x
		bne not_boss
			lda boss_posit, x
			cmp p_pos
			bne not_boss
				lda bosses
				and boss_hexnum, x
				beq :+
					bne not_boss
:				stx boss_offset
				lda boss_clust, x
				sta enemy_choice
				lda boss_enemy, x
				sta boss_switch
				beq :+
					lda #$01
					sta p_qdr_used
:
				jmp jump_to_for_boss
not_boss:
	inx
	cpx #$08
	bne test_boss

	lda p_anim_state
	and #$0f
	cmp #$04
	bcc :+
		jmp not_battle
:
	lda the_steps
	beq get_battle
		bne not_battle
get_battle:
	lda npc1+0
	and #$80
	cmp #$80
	bne not_battle
		lda p_anim_state
		and #$0f
		sta p_anim_state_save

		lda npc1+0
		and #$7f
		tax
		stx enemy_cluster
		lda e_set_lo, x
		sta cluster_addy+0
		lda e_set_hi, x
		sta cluster_addy+1

		lda db_have
		cmp #$81
		beq jump_to_for_boss

		ldx battle_incrementer
		lda five_percent, x
		beq not_battle
jump_to_for_boss:
		lda db_have
		cmp #$81
		bne :+
			jsr whistle_for_them
			jmp :++
:		jsr battle_intro_tune

:			lda db_have
			beq :+
				lda #$01
				sta db_have
:

			lda #$78
			sta temp_8bit_1
			lda #<wait_battle
			sta loop_pointer+0
			lda #>wait_battle
			sta loop_pointer+1
			jmp wait_battle
not_battle:
	jmp done_test_battle


wait_battle:
	jsr p_tie_sprites
	dec temp_8bit_1
	bne @still_waiting
		lda #$ef
		sta p_topleft+0
		sta p_topright+0
		ldx #$00
		lda #$0f
:		sta pal_address+0, x
		inx
		cpx #$20
		bne :-

		lda boss_switch
		bne :++

		ldy #$ff
:		iny
		lda nmi_num
		cmp which_of_five, y
		bcc :-
			sty enemy_choice
:
		lda #$ef
;		sta $220
;		sta $224
		sta $228
		sta $22c
		lda #<set_battle
		sta loop_pointer+0
		lda #>set_battle
		sta loop_pointer+1
		jmp end_loop
@still_waiting:
	jmp end_loop

which_of_five:
	.byte 205, 154, 103, 52, 0


zero_percent:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

five_percent:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$01,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$01,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$01,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$01,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

twenty_percent:
.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01
.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01
.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01
.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01
.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01
.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01
.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01
.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01
.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01
.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01

