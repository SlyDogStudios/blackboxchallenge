.segment "BANK24"
combat_chr:
.incbin "i\bank24\00combat_spr.chr"
dude_chr:
.incbin "i\bank24\01player_spr_final.chr"	;battles_dude_blueshirt1.chr";battles_spr.chr"
karn_chr:
.incbin "i\bank24\02karnov_spr_final.chr"

enemies0:
.incbin "i\bank24\03casual_tuber_cosplayer.chr"
enemies1:
.incbin "i\bank24\04devver_hoarder_flea.chr"
enemies2:
.incbin "i\bank24\05pirate_brewer_ghost.chr"
enemies3:
.incbin "i\bank24\06seller_troll_collector.chr"
enemies4:
.incbin "i\bank24\07sniper_admin_historian.chr"
enemies5:
.incbin "i\bank24\08rob_dog_block_genie2.chr"
enemies6:
.incbin "i\bank24\09strong_octo.chr"
enemies7:
.incbin "i\bank24\10shadow.chr"

enemy_chr_lo:
.byte <enemies0,<enemies1,<enemies2,<enemies3,<enemies4,<enemies5,<enemies6,<enemies7
enemy_chr_hi:
.byte >enemies0,>enemies1,>enemies2,>enemies3,>enemies4,>enemies5,>enemies6,>enemies7

enemy_chr_pull:
.byte $00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$03,$03,$03
.byte $03,$03,$03,$03,$03,$03
.byte $02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$01,$01,$01
.byte $01,$01,$01,$01,$01,$01
.byte $04,$04,$04,$04,$04,$04
.byte $04,$04,$04,$05,$05,$05
.byte $05,$07,$06,$06


battle_nam:
.incbin "i\bank24\battle1.nam"


battle_load:


;		jsr p_battle_anim
		jsr nmi_wait
	lda #$00
	sta $2000
	sta save2000
	sta $2001
	sta save2001

	lda #<combat_chr			;  CHRs are in banks 7, 8 and 9. Only bank
	sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
	lda #>combat_chr			;  correct address for them all
	sta temp_16bit_1+1			;
 	lda #$01					; Get Y ready while also setting up where
	sta $2006					;  to begin storage of the CHR in its RAM
	ldy #$00
	sty $2006					;
	ldx #$02					; Need to loop 32 times
:								;
	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne :-			;
		inc temp_16bit_1+1		;
		dex						;
		bne :-					;


	lda games+31
	and #$c0
	bne :+
		lda #<dude_chr				;  CHRs are in banks 7, 8 and 9. Only bank
		sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
		lda #>dude_chr				;  correct address for them all
		sta temp_16bit_1+1			;
		jmp :++
:	lda #<karn_chr
	sta temp_16bit_1+0
	lda #>karn_chr
	sta temp_16bit_1+1
:
 	lda #$06					; Get Y ready while also setting up where
	sta $2006					;  to begin storage of the CHR in its RAM
	ldy #$00
	sty $2006					;
	ldx #$05					; Need to loop 32 times
@keep_loading:					;
	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne @keep_loading			;
		inc temp_16bit_1+1		;
		dex						;
		bne @keep_loading		;

	ldy enemy_choice
	lda (cluster_addy), y
	tax
	stx enemy_choice			; SWITCHES FROM THE 0-4 SELECTION OF A CLUSTER TO THE ENEMY NUMBER OUT OF ALL

	lda boss_switch
	beq :+
		tax
		stx enemy_choice
:

	lda enemy_chr_pull, x
	tax
	lda enemy_chr_lo, x			;  CHRs are in banks 7, 8 and 9. Only bank
	sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
	lda enemy_chr_hi, x			;  correct address for them all
	sta temp_16bit_1+1			;
 	lda #$0b					; Get Y ready while also setting up where
	sta $2006					;  to begin storage of the CHR in its RAM
	ldy #$00
	sty $2006					;
	ldx #$05					; Need to loop 32 times
:								;
	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne :-						;
		inc temp_16bit_1+1		;
		dex						;
		bne :-					;

	lda enemy_choice
	cmp #cospla
	bne not_cosplayer
		ldx #$00
		lda #$0d
		sta $2006
		lda #$10
		sta $2006
:		lda cospla_xtra_gfx, x
		sta $2007
		inx
		cpx #48
		bne :-
not_cosplayer:

	jsr load_pg_mayhaps


	ldy #$00
	ldx #$04
	lda #<battle_nam
	sta temp_16bit_1+0
	lda #>battle_nam
	sta temp_16bit_1+1
	lda #$20
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

	jsr load_uf_mayhaps
	jsr load_pp_mayhaps

	lda ls_have
	beq :+
		jsr load_scope_mayhaps
:


	ldx #$00
	stx temp_8bit_1

	lda games+31
	and #$c0
	bne :++
:	lda pal_battle, x
	sta pal_address+0, x
	inx
	cpx #24
	bne :-
	beq :++
:
	lda pal_battle_karn, x
	sta pal_address+0, x
	inx
	cpx #24
	bne :-
:

@begin_again:
	ldx temp_8bit_1
	ldy battle_games_offset, x
	lda games, y
	and #$c0
	beq @dont_have
		lda battle_words_lo, x
		sta temp_16bit_1+0
		lda battle_words_hi, x
		sta temp_16bit_1+1
		ldy #$00
		lda battle_ppu_hi, x
		sta $2006
		lda battle_ppu_lo, x
		sta $2006
:		lda (temp_16bit_1), y
		sta $2007
		iny
		cpy #$03
		bne :-
@dont_have:
	inx
	stx temp_8bit_1
	cpx #$05
	bne @begin_again

	ldx #$30
	lda #$ef
:	sta off_tl, x
	inx
	bne :-

	ldx #$00
:	lda battle_sprites, x
	sta off_tl, x
	inx
	cpx #48
	bne :-

	ldx #$00
:	lda clu_sprites, x
	sta clu1, x
	inx
	cpx #16
	bne :-


	 ldx #$00
	 lda #$00
	 sta $2006
	 lda #$f0
	 sta $2006
:	 lda select_last_tile, x
	 sta $2007
	 inx
	 cpx #$10
	 bne :-

	ldx #$00
	lda #$01
	sta $2006
	txa
	sta $2006
	sta $2007
	sta $2007
			lda ls_have
			cmp #$81
			bne :+
				lda #$00
				sta pal_address+2
				beq :++
:
			lda #$26
			sta pal_address+2
:

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
		ldy #$00
	jmp rtn_battle_load

select_last_tile:
.byte $00,$00,$c0,$80,$80,$80,$80,$00,$00,$e0,$30,$70,$70,$70,$70,$e0

pal_battle:
.byte $0f,$30,$00,$0c, $0f,$16,$06,$2c, $0f,$10,$16,$11, $0f,$30,$0f,$0f
.byte $0f,$37,$17,$11, $0f,$27,$16,$29
pal_battle_karn:
.byte $0f,$30,$00,$0c, $0f,$16,$06,$2c, $0f,$10,$16,$11, $0f,$30,$0f,$0f
.byte $0f,$37,$17,$16, $0f,$27,$16,$29


battle_words_lo:
.byte <word_pick,<word_mull,<word_qdrw,<word_adva,<word_awes,<word_jump,<word_blck,<word_cntr,<word_juke
battle_words_hi:
.byte >word_pick,>word_mull,>word_qdrw,>word_adva,>word_awes,>word_jump,>word_blck,>word_cntr,>word_juke
battle_ppu_lo:
.byte $ba,       $da,       $fa,       $1a,       $3a,       $aa,       $e7,       $ed,       $2a
battle_ppu_hi:
.byte $22,       $22,       $22,       $23,       $23,       $22,       $22,       $22,       $23
battle_games_offset:
.byte 11,         10,        28,        25,        31,        4,         18,        15,        0


word_pick:
.byte "PIK"	; games+11 "CLU" ; games+3	*
word_mull:
.byte "MUL" ; games+10	*
word_qdrw:
.byte "QDR" ; games+28	*
word_adva:
.byte "ADV" ; games+25	*
word_awes:
.byte "AWE" ; games+31	*



battle_sprites:
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

clu_sprites:
.byte $ef,$22,$01,$78
.byte $ef,$23,$01,$80
.byte $ef,$20,$01,$78
.byte $ef,$21,$01,$80

load_pp_mayhaps:
	lda pp_have
	beq done_load_pp
	lda #$22
	sta $2006
	lda #$28
	sta $2006
	lda #$24
	sta $2007
	lda #$25
	sta $2007
	lda #$26
	sta $2007
	lda #$27
	sta $2007
	lda #$28
	sta $2007
done_load_pp:
	rts

load_uf_mayhaps:
	lda uf_have
	beq done_load_uf
	lda #$21
	sta $2006
	lda #$e7
	sta $2006
	lda #$2e
	sta $2007
	lda #$22
	sta $2006
	lda #$07
	sta $2006
	lda #$2d
	sta $2007
	lda #$22
	sta $2006
	lda #$25
	sta $2006
	lda #$2a
	sta $2007
	lda #$2b
	sta $2007
	lda #$2c
	sta $2007
done_load_uf:
	rts

scope_line0:
.byte $04,$53,$43,$4f,$50,$45,$00,$00,$05
scope_line1:
.byte $04,$3a,$3b,$29,$0f,$00,$00,$00,$05
scope_line2:
.byte $06,$07,$07,$07,$07,$07,$07,$07,$08
load_scope_mayhaps:
	lda #$23
	sta $2006
	lda #$0f
	sta $2006
	ldx #$00
:	lda scope_line0, x
	sta $2007
	inx
	cpx #$09
	bne :-
	lda #$23
	sta $2006
	lda #$2f
	sta $2006
	ldx #$00
:	lda scope_line1, x
	sta $2007
	inx
	cpx #$09
	bne :-
	lda #$23
	sta $2006
	lda #$4f
	sta $2006
	ldx #$00
:	lda scope_line2, x
	sta $2007
	inx
	cpx #$09
	bne :-
	rts

load_pg_mayhaps:
	lda pg_have
	beq done_load_pg
	ldx #$00
load_pg:
	lda games+31
	and #$c0
	beq :+
		lda karn_pgt_lo, x
		sta temp_16bit_1+0
		lda karn_pgt_hi, x
		sta temp_16bit_1+1
		jmp :++
:	lda dude_pgt_lo, x
	sta temp_16bit_1+0
	lda dude_pgt_hi, x
	sta temp_16bit_1+1
:
	ldy #$00
	lda dude_pgp_hi, x
	sta $2006
	lda dude_pgp_lo, x
	sta $2006
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #$10
	bne :-
		inx
		cpx #14
		bne load_pg
done_load_pg:
	rts

dude_pgt_lo:
	.byte <d_pg_zap,<d_pg_fr1,<d_pg_fr2,<d_pg_sp1,<d_pg_rg1,<d_pg_rg2,<d_pg_bk1,<d_pg_sp2,<d_pg_juk
	.byte <d_pg_jmp,<d_pg_clu,<d_pg_bk2,<d_pg_adr,<d_pg_ded
dude_pgt_hi:
	.byte >d_pg_zap,>d_pg_fr1,>d_pg_fr2,>d_pg_sp1,>d_pg_rg1,>d_pg_rg2,>d_pg_bk1,>d_pg_sp2,>d_pg_juk
	.byte >d_pg_jmp,>d_pg_clu,>d_pg_bk2,>d_pg_adr,>d_pg_ded
dude_pgp_lo:
	.byte $20,      $30,      $40,      $60,      $00,      $10,      $40,      $60,      $90
	.byte $d0,      $f0,      $40,      $a0,      $d0
dude_pgp_hi:
	.byte $06,      $07,      $07,      $07,      $08,      $08,      $08,      $08,      $08
	.byte $08,      $08,      $09,      $0a,      $0a

d_pg_zap:
	.byte $00,$0c,$1c,$3f, $01,$1f,$1f,$3f, $80,$32,$63,$80, $c0,$dd,$df,$3f
d_pg_fr1:
	.byte $00,$00,$00,$0c, $38,$73,$f2,$78, $00,$00,$0e,$3d, $4b,$0f,$0f,$07
d_pg_fr2:
	.byte $38,$30,$18,$1e, $0f,$0f,$1f,$7f, $c6,$0e,$06,$d0, $ee,$e8,$9c,$7f
d_pg_sp1:
	.byte $00,$00,$00,$00, $00,$00,$00,$00, $00,$00,$00,$00, $00,$0e,$3f,$7f
d_pg_rg1:
	.byte $79,$70,$76,$26, $00,$00,$00,$00, $01,$0e,$0f,$1f, $07,$01,$00,$00
d_pg_rg2:
	.byte $ff,$1f,$0f,$0f, $0f,$0f,$1f,$00, $f8,$1c,$ef,$ef, $ef,$ef,$1f,$9e
d_pg_bk1:
	.byte $00,$00,$00,$10, $3a,$20,$60,$60, $00,$00,$7e,$ee, $c4,$c0,$8e,$8f
d_pg_sp2:
	.byte $c0,$f0,$ff,$7f, $1f,$07,$01,$01, $3e,$00,$0f,$1f, $7f,$1f,$07,$01
d_pg_juk:
	.byte $67,$f7,$83,$03, $c3,$c1,$01,$00, $0f,$07,$77,$f7, $e7,$f3,$f3,$f1
d_pg_jmp:
	.byte $ff,$1f,$0f,$0f, $0f,$0f,$1f,$00, $ff,$1f,$ef,$ef, $ef,$ef,$1f,$9e
d_pg_clu:
	.byte $ff,$1f,$0f,$0f, $0f,$0f,$1f,$7e, $ff,$1f,$ec,$e8, $e8,$e8,$1f,$ff
d_pg_bk2:
	.byte $00,$23,$d3,$e0, $e4,$fe,$ff,$ff, $0f,$ef,$f7,$e7, $f3,$f1,$e0,$e0
d_pg_adr:
	.byte $00,$00,$00,$00, $00,$00,$00,$00, $00,$00,$70,$f0, $f0,$f0,$e0,$e0
d_pg_ded:
	.byte $11,$01,$00,$00, $00,$00,$00,$00, $61,$6f,$d1,$d0, $10,$08,$08,$07

karn_pgt_lo:
	.byte <k_pg_zap,<k_pg_fr1,<k_pg_fr2,<k_pg_sp1,<k_pg_rg1,<k_pg_rg2,<k_pg_bk1,<k_pg_sp2,<k_pg_juk
	.byte <k_pg_jmp,<k_pg_clu,<k_pg_bk2,<k_pg_adr,<k_pg_ded
karn_pgt_hi:
	.byte >k_pg_zap,>k_pg_fr1,>k_pg_fr2,>k_pg_sp1,>k_pg_rg1,>k_pg_rg2,>k_pg_bk1,>k_pg_sp2,>k_pg_juk
	.byte >k_pg_jmp,>k_pg_clu,>k_pg_bk2,>k_pg_adr,>k_pg_ded
k_pg_zap:
	.byte $00,$0c,$1c,$3f, $01,$3a,$ee,$23, $80,$32,$63,$80, $c0,$00,$00,$c0
k_pg_fr1:
	.byte $68,$dc,$c0,$c0, $f0,$f8,$7f,$3f, $1c,$3f,$3f,$37, $07,$00,$00,$00
k_pg_fr2:
	.byte $55,$30,$30,$5e, $62,$f7,$f7,$f7, $08,$41,$41,$21, $1d,$08,$08,$08
k_pg_sp1:
	.byte $00,$00,$00,$00, $00,$00,$00,$00, $00,$00,$00,$00, $00,$0e,$3f,$ff
k_pg_rg1:
	.byte $71,$60,$4c,$0c, $00,$00,$02,$03, $08,$1e,$3f,$3f, $1f,$01,$04,$04
k_pg_rg2:
	.byte $de,$21,$1f,$17, $0f,$1f,$3d,$1f, $21,$1e,$c0,$c8, $d0,$c0,$02,$e0
k_pg_bk1:
	.byte $00,$1e,$3f,$7f, $66,$b0,$70,$e0, $00,$00,$00,$00, $19,$40,$86,$0f
k_pg_sp2:
	.byte $00,$c0,$f3,$cf, $ff,$7f,$1f,$0f, $fe,$30,$0c,$30, $00,$00,$00,$10
k_pg_juk:
	.byte $ef,$ef,$d7,$08, $67,$67,$03,$05, $10,$10,$28,$f7, $f0,$f0,$f4,$76
k_pg_jmp:
	.byte $de,$21,$1f,$17, $0f,$1f,$3d,$1f, $21,$1e,$c0,$c8, $d0,$c0,$02,$e0
k_pg_clu:
	.byte $f7,$2c,$1b,$1b, $1b,$1b,$3c,$7e, $08,$13,$c4,$c4, $c4,$c4,$03,$81
k_pg_bk2:
	.byte $60,$30,$c6,$f6, $e0,$ec,$fe,$3e, $0f,$c7,$2f,$0f, $1f,$13,$01,$c1
k_pg_adr:
	.byte $00,$00,$00,$00, $00,$00,$00,$00, $00,$70,$f8,$f8, $f8,$f0,$e0,$f0
k_pg_ded:
	.byte $31,$01,$00,$00, $00,$00,$00,$00, $7b,$eb,$d1,$d0, $10,$08,$08,$07


cospla_xtra_gfx:
.incbin "i\bank24\cospla_gfx.chr"

