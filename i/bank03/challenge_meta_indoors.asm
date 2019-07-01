
	ldy temp_8bit_1
	lda (temp_16bit_1), y
	tay
	lda indoors_tile32a, y
	tax
		lda indoors_tile16a, x
		sta store_meta16+0
		lda indoors_tile16b, x
		sta store_meta16+1
		lda indoors_tile16c, x
		sta store_meta16+4
		lda indoors_tile16d, x
		sta store_meta16+5
		lda indoors_tile16e, x
		sta store_coll0+0
	lda indoors_tile32b, y
	tax
		lda indoors_tile16a, x
		sta store_meta16+2
		lda indoors_tile16b, x
		sta store_meta16+3
		lda indoors_tile16c, x
		sta store_meta16+6
		lda indoors_tile16d, x
		sta store_meta16+7
		lda indoors_tile16e, x
		sta store_coll0+1
	lda indoors_tile32c, y
	tax
		lda indoors_tile16a, x
		sta store_meta16+8
		lda indoors_tile16b, x
		sta store_meta16+9
		lda indoors_tile16c, x
		sta store_meta16+12
		lda indoors_tile16d, x
		sta store_meta16+13
		lda indoors_tile16e, x
		sta store_coll0+2
	lda indoors_tile32d, y
	tax
		lda indoors_tile16a, x
		sta store_meta16+10
		lda indoors_tile16b, x
		sta store_meta16+11
		lda indoors_tile16c, x
		sta store_meta16+14
		lda indoors_tile16d, x
		sta store_meta16+15
		lda indoors_tile16e, x
		sta store_coll0+3
	lda indoors_tile32e, y
	sta store_meta16+16

		lda dialog_type
		bne :+
	ldx temp_8bit_2
	lda store_coll0+0
	sta bg_ram, x
	inx
	lda store_coll0+1
	sta bg_ram, x
	lda temp_8bit_2
	clc
	adc #16
	tax
	lda store_coll0+2
	sta bg_ram, x
	inx
	lda store_coll0+3
	sta bg_ram, x
	lda temp_8bit_2
	clc
	adc #$02
	sta temp_8bit_2
	and #$10
	beq :+
		lda temp_8bit_2
		clc
		adc #$10
		sta temp_8bit_2
:
	jmp return_unpack

spr_palettes_lo:
	.byte <pal_home,<pal_prim_homes,<pal_richmond,<pal_arcade,<pal_cave,<pal_pol,<pal_trem,<pal_mine
	.byte <pal_univ,<pal_clik,<pal_quad,<pal_kinc,<pal_slum,<pal_hekl
spr_palettes_hi:
	.byte >pal_home,>pal_prim_homes,>pal_richmond,>pal_arcade,>pal_cave,>pal_pol,>pal_trem,>pal_mine
	.byte >pal_univ,>pal_clik,>pal_quad,>pal_kinc,>pal_slum,>pal_hekl
pal_home:
.byte $0f,$30,$00,$10, $0f,$2b,$19,$27, $0f,$07,$17,$2b, $0f,$00,$19,$10
.byte $0f,$37,$11,$17, $0f,$37,$21,$07, $0f,$17,$07,$0f, $0f,$17,$1c,$0f
pal_prim_homes:
.byte $0f,$30,$00,$10, $0f,$3c,$16,$27, $0f,$07,$17,$3c, $0f,$00,$16,$10
.byte $0f,$37,$11,$17, $0f,$37,$27,$17, $0f,$17,$07,$0f, $0f,$17,$1c,$0f
pal_richmond:
.byte $0f,$30,$00,$10, $0f,$39,$18,$27, $0f,$07,$17,$39, $0f,$00,$18,$10
.byte $0f,$37,$11,$17, $0f,$37,$03,$17, $0f,$36,$17,$27, $0f,$30,$27,$16
pal_arcade:
.byte $0f,$30,$00,$10, $0f,$0f,$13,$27, $0f,$07,$17,$0f, $0f,$31,$27,$16
.byte $0f,$37,$11,$17, $0f,$37,$11,$17, $0f,$36,$10,$17, $0f,$17,$1c,$26	; pal1=upton
pal_cave:
.byte $0F,$30,$07,$17, $0F,$2B,$18,$18, $0F,$07,$06,$06, $0F,$0F,$00,$10
.byte $0f,$37,$11,$17, $0f,$37,$03,$07, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_pol:
.byte $0f,$30,$00,$10, $0f,$09,$0c,$27, $0f,$07,$17,$09, $0f,$00,$0c,$10
.byte $0f,$37,$11,$17, $0f,$28,$11,$0f, $0f,$36,$17,$27, $0f,$17,$1c,$0f	; pal1=issa
pal_trem:
.byte $0f,$30,$07,$17, $0f,$31,$17,$27, $0f,$07,$16,$0f, $0f,$31,$27,$16
.byte $0f,$37,$11,$17, $0f,$37,$27,$17, $0f,$36,$17,$27, $0f,$17,$1c,$0f	; pal1=tremblay
pal_mine:
.byte $0F,$30,$07,$13, $0F,$2B,$00,$10, $0F,$03,$13,$2B, $0F,$03,$13,$27
.byte $0f,$37,$11,$17, $0f,$00,$10,$0f, $0f,$36,$17,$27, $0f,$36,$17,$27
pal_univ:
.byte $0f,$30,$00,$10, $0f,$05,$00,$27, $0f,$17,$07,$17, $0f,$07,$17,$05
.byte $0f,$37,$11,$17, $0f,$37,$03,$07, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_clik:
.byte $0f,$30,$00,$10, $0f,$39,$18,$27, $0f,$07,$17,$39, $0f,$00,$18,$10
.byte $0f,$37,$11,$17, $0f,$37,$21,$07, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_quad:
.byte $0f,$30,$00,$10, $0f,$16,$00,$27, $0f,$17,$07,$17, $0f,$07,$17,$16
.byte $0f,$37,$11,$17, $0f,$37,$21,$07, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_kinc:
.byte $0f,$30,$07,$17, $0f,$31,$17,$27, $0f,$07,$16,$0f, $0f,$31,$27,$16
.byte $0f,$37,$11,$17, $0f,$37,$27,$17, $0f,$36,$17,$27, $0f,$37,$20,$0f	; pal1=tremblay
pal_slum:
.byte $0F,$30,$07,$17, $0F,$2B,$18,$18, $0F,$07,$16,$06, $0F,$0F,$00,$10
.byte $0f,$37,$11,$17, $0f,$37,$03,$07, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_hekl:
.byte $0F,$30,$00,$10, $0F,$0C,$00,$30, $0F,$17,$07,$17, $0F,$27,$0F,$1A
.byte $0f,$37,$11,$17, $0f,$37,$03,$07, $0f,$27,$09,$1a, $0f,$01,$11,$36

indoors_tile16a:
	.byte $00,$01,$02,$02,$04,$00,$04,$00,$00,$FC,$F0,$F4,$D8,$0E,$0E,$10
	.byte $F8,$E0,$E4,$E8,$EC,$D0,$D4,$C1,$C3,$0E,$D8,$C5,$C9,$CB,$0E,$10
	.byte $CF,$B3,$B7,$BB,$CF,$9C,$DA,$9E,$A0,$A2,$98,$9A,$90,$90,$96,$94
	.byte $8E,$00,$00,$8C,$8A,$8B,$89,$6E,$00,$6B,$6C,$79,$0E,$86,$86,$87
	.byte $67,$66,$84,$62,$64,$80,$60,$8C,$22,$00,$8E,$EA,$EA,$4E,$50,$57
	.byte $52,$00,$00,$00,$00,$00,$00,$46,$4E,$43,$55,$00,$35,$30,$34,$30
	.byte $31,$30,$31,$30,$33,$30,$32,$30,$31,$30,$00,$30,$31,$30,$00,$30
	.byte $00,$30,$32,$30,$48,$50,$52,$50,$41,$50,$57,$52,$50,$44,$14,$24
	.byte $1C,$26,$00,$00,$00,$26,$26,$00,$25,$15,$15,$26,$9C,$16,$0F,$15
	.byte $01,$02,$02,$02,$03,$05,$00,$96,$90,$94,$94
indoors_tile16b:
	.byte $00,$02,$02,$03,$00,$05,$00,$00,$05,$FD,$F1,$F5,$0E,$0E,$D9,$10
	.byte $F9,$E1,$E5,$E9,$ED,$D1,$D5,$C2,$C4,$0E,$D9,$C6,$CA,$CC,$D9,$10
	.byte $B0,$B4,$B8,$BC,$B0,$9D,$DC,$9F,$A1,$A3,$99,$9B,$90,$90,$97,$95
	.byte $00,$8F,$00,$8C,$8A,$8B,$89,$6F,$00,$6B,$6D,$7A,$0E,$86,$86,$87
	.byte $68,$66,$85,$63,$65,$81,$61,$21,$8C,$8F,$00,$EB,$EB,$3D,$4F,$45
	.byte $00,$40,$31,$32,$33,$34,$35,$55,$00,$4C,$42,$00,$30,$05,$30,$05
	.byte $30,$05,$30,$05,$30,$05,$30,$05,$30,$05,$37,$05,$30,$05,$35,$05
	.byte $35,$05,$30,$05,$59,$45,$00,$4C,$59,$4F,$45,$00,$41,$00,$14,$24
	.byte $1D,$26,$00,$00,$00,$00,$26,$26,$25,$27,$15,$27,$9D,$16,$27,$15
	.byte $02,$02,$02,$02,$00,$00,$04,$2B,$90,$2A,$19
indoors_tile16c:
	.byte $00,$04,$00,$00,$04,$00,$06,$07,$07,$FE,$F2,$F6,$DA,$DB,$DB,$10
	.byte $FA,$E2,$E6,$EA,$EE,$D2,$D6,$DD,$DE,$DF,$DA,$C7,$0E,$CD,$DB,$10
	.byte $B1,$B5,$B9,$BD,$B1,$AC,$9C,$11,$A4,$1a,$A8,$AA,$90,$92,$A6,$A6
	.byte $8E,$00,$8D,$00,$8A,$8B,$89,$7E,$00,$7B,$7C,$79,$69,$A4,$1a,$88
	.byte $77,$76,$84,$72,$74,$82,$70,$00,$8E,$8D,$23,$2E,$EA,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$24
	.byte $1E,$1B,$00,$C4,$26,$26,$00,$26,$00,$25,$25,$26,$9C,$00,$25,$0F
	.byte $04,$41,$55,$4C,$05,$08,$00,$A6,$90,$A6,$A6
indoors_tile16d:
	.byte $00,$00,$00,$05,$00,$05,$07,$07,$08,$FF,$F3,$F7,$DB,$DB,$DC,$10
	.byte $FB,$E3,$E7,$EB,$EF,$D3,$D7,$00,$DE,$C0,$DC,$C8,$0E,$CE,$DC,$10
	.byte $B2,$B6,$BA,$13,$B2,$AD,$9D,$12,$1a,$A5,$A9,$AB,$90,$93,$A7,$A7
	.byte $00,$8F,$8D,$00,$8A,$8B,$89,$7F,$00,$7B,$7D,$7A,$6A,$1a,$A5,$88
	.byte $78,$76,$85,$73,$75,$83,$71,$8F,$00,$20,$8D,$2F,$EB,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$05,$00,$05
	.byte $00,$05,$00,$05,$00,$05,$00,$05,$00,$05,$00,$05,$00,$05,$00,$05
	.byte $00,$05,$00,$05,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$24
	.byte $1F,$00,$17,$C4,$00,$00,$26,$25,$00,$27,$25,$27,$9D,$00,$27,$27
	.byte $4D,$4E,$41,$53,$00,$00,$06,$A7,$90,$A7,$29
indoors_tile16e:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$01,$01,$01,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$01
	.byte $00,$01,$01,$00,$01,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$00,$00,$00,$0d,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $01,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$00,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$0f,$01,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$00,$01,$01

indoors_tile32a:
	.byte $00,$01,$02,$02,$04,$00,$00,$09,$09,$09,$09,$09,$09,$0F,$0F,$18
	.byte $09,$09,$09,$0F,$0F,$11,$10,$10,$09,$09,$0F,$09,$13,$09,$0E,$0C
	.byte $0D,$0B,$1A,$09,$0A,$09,$09,$1A,$0F,$09,$1C,$1E,$09,$09,$09,$09
	.byte $09,$1E,$0F,$00,$09,$0F,$0F,$09,$0F,$0C,$27,$25,$26,$00,$0F,$2B
	.byte $2B,$2B,$00,$2C,$2C,$2D,$2F,$2E,$2C,$30,$33,$36,$2E,$36,$37,$35
	.byte $30,$2F,$36,$2C,$2F,$33,$38,$38,$33,$38,$38,$33,$09,$0F,$3A,$0F
	.byte $09,$00,$0F,$09,$09,$00,$1E,$00,$3A,$09,$40,$41,$41,$31,$31,$41
	.byte $41,$41,$41,$31,$09,$01,$02,$02,$02,$04,$4E,$50,$53,$04,$58,$5A
	.byte $53,$02,$00,$00,$02,$5E,$62,$00,$02,$55,$55,$02,$66,$6A,$04,$58
	.byte $5A,$02,$56,$04,$7A,$7C,$02,$6E,$72,$40,$40,$0F,$25,$40,$25,$0F
	.byte $0F,$0F,$09,$09,$0F,$24,$0F,$00,$84,$00,$86,$0F,$80,$88,$7E,$7E
	.byte $36,$7E,$38,$7E,$7F,$7F,$7E,$7E,$36,$8A,$8A,$8A,$38,$8A,$8A,$8A
	.byte $38,$2A,$3A,$80,$2B,$36,$36,$36,$7F,$36,$36,$11,$36,$36,$36,$24
	.byte $80,$10,$36,$2F,$94,$90,$92,$96,$07,$95,$00,$97,$2F,$98,$38,$2D
	.byte $99,$2F,$2D,$38,$7F,$00,$00,$00,$27,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
indoors_tile32b:
	.byte $00,$02,$02,$03,$00,$00,$05,$09,$09,$09,$09,$09,$11,$0F,$17,$0F
	.byte $0F,$0F,$0F,$0F,$0F,$09,$10,$09,$09,$09,$09,$15,$09,$0D,$0F,$0D
	.byte $0E,$0F,$0F,$0F,$0F,$0B,$09,$09,$09,$09,$09,$1E,$1D,$09,$09,$0A
	.byte $1E,$09,$0F,$09,$21,$0F,$0F,$09,$0F,$0E,$27,$1E,$1E,$09,$0F,$00
	.byte $00,$00,$00,$2C,$2C,$2D,$2F,$2E,$2E,$31,$33,$36,$2E,$36,$36,$35
	.byte $31,$2C,$2F,$36,$36,$34,$38,$38,$33,$34,$34,$34,$09,$3B,$0F,$0F
	.byte $09,$00,$0F,$00,$00,$00,$00,$00,$3A,$09,$2E,$41,$44,$42,$42,$43
	.byte $41,$41,$46,$45,$4B,$02,$02,$02,$02,$4D,$4F,$51,$00,$57,$59,$51
	.byte $00,$02,$5B,$5B,$03,$5F,$63,$4C,$02,$00,$00,$03,$67,$6B,$57,$59
	.byte $51,$02,$00,$79,$7B,$7D,$03,$6F,$73,$40,$0F,$40,$40,$25,$0F,$25
	.byte $0F,$0F,$09,$0F,$09,$0F,$0F,$00,$00,$00,$00,$8B,$88,$80,$7E,$7E
	.byte $7F,$7E,$8C,$8C,$7F,$7F,$7E,$7E,$36,$8A,$8A,$8E,$8B,$8F,$8A,$8E
	.byte $8B,$8A,$27,$24,$09,$36,$36,$80,$36,$2A,$13,$1B,$16,$36,$36,$24
	.byte $80,$11,$2C,$2C,$00,$91,$93,$07,$07,$00,$05,$2E,$2F,$2C,$7F,$2D
	.byte $2F,$9A,$2D,$7F,$38,$00,$00,$00,$27,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
indoors_tile32c:
	.byte $00,$04,$00,$00,$06,$07,$07,$09,$0D,$0D,$0D,$0E,$09,$0F,$0F,$0F
	.byte $09,$09,$09,$09,$09,$12,$0F,$0F,$16,$0D,$0F,$09,$14,$09,$0F,$0F
	.byte $0F,$0F,$0F,$0E,$0F,$09,$09,$0F,$09,$1B,$1E,$1E,$09,$1F,$09,$09
	.byte $09,$1E,$23,$0F,$09,$20,$0F,$0E,$00,$0F,$27,$1E,$1E,$00,$28,$00
	.byte $00,$00,$2A,$2C,$2D,$2F,$2E,$2E,$2C,$30,$32,$36,$36,$2C,$36,$30
	.byte $2C,$2E,$36,$2D,$2E,$32,$38,$32,$38,$38,$32,$38,$3C,$0F,$0F,$39
	.byte $0D,$3F,$3D,$09,$09,$1E,$1E,$1E,$00,$09,$36,$33,$47,$31,$49,$47
	.byte $33,$48,$33,$00,$0E,$04,$4E,$50,$52,$04,$58,$5A,$52,$06,$07,$07
	.byte $07,$00,$00,$07,$5C,$60,$07,$00,$54,$54,$07,$64,$68,$07,$04,$75
	.byte $77,$56,$00,$06,$07,$07,$6C,$70,$07,$0F,$0F,$0F,$0F,$0F,$0F,$0F
	.byte $0F,$2A,$40,$40,$25,$24,$24,$00,$85,$83,$87,$8B,$36,$36,$7F,$7F
	.byte $36,$7E,$38,$7F,$36,$38,$7F,$7E,$7E,$8D,$8D,$8D,$38,$8D,$8D,$8D
	.byte $38,$8D,$87,$3D,$36,$87,$15,$36,$7E,$36,$36,$12,$36,$81,$36,$36
	.byte $36,$28,$36,$2E,$95,$06,$07,$00,$00,$00,$00,$36,$97,$2C,$38,$99
	.byte $2E,$2E,$2F,$38,$38,$00,$00,$00,$27,$3f,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
indoors_tile32d:
	.byte $00,$00,$00,$05,$07,$07,$08,$0D,$16,$19,$0E,$09,$12,$0F,$0F,$0F
	.byte $0F,$10,$09,$0F,$09,$09,$0F,$09,$0D,$0D,$09,$0F,$09,$0F,$0F,$0F
	.byte $0F,$0F,$0F,$0F,$0F,$0F,$09,$09,$09,$09,$09,$1E,$09,$1F,$1F,$1E
	.byte $1E,$09,$09,$0F,$22,$0F,$24,$23,$09,$0F,$27,$1E,$1E,$09,$29,$00
	.byte $00,$00,$00,$2C,$2D,$2F,$2E,$2E,$2E,$31,$32,$36,$36,$2C,$36,$31
	.byte $2C,$2D,$2E,$36,$36,$34,$38,$32,$38,$34,$34,$34,$1E,$0F,$0F,$0F
	.byte $1A,$3F,$3E,$00,$3F,$1E,$00,$00,$00,$2A,$36,$33,$42,$42,$42,$42
	.byte $47,$33,$33,$33,$1E,$4D,$4F,$51,$00,$57,$59,$51,$00,$07,$07,$07
	.byte $07,$5B,$5B,$07,$5D,$61,$08,$4C,$00,$00,$07,$65,$69,$08,$74,$76
	.byte $78,$00,$00,$07,$07,$07,$6D,$71,$08,$0F,$0F,$0F,$0F,$0F,$0F,$0F
	.byte $2A,$0F,$40,$25,$40,$0F,$0F,$81,$82,$83,$8A,$89,$36,$36,$7F,$7E
	.byte $36,$7E,$8C,$8C,$36,$38,$7F,$7E,$7E,$8C,$8D,$8D,$8B,$8B,$8D,$8D
	.byte $8B,$8D,$2B,$3E,$36,$2C,$80,$36,$36,$36,$14,$36,$1D,$36,$36,$36
	.byte $36,$29,$2C,$2C,$00,$07,$07,$00,$00,$00,$05,$36,$2E,$2C,$38,$2F
	.byte $2E,$2E,$9A,$38,$38,$00,$00,$00,$27,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
indoors_tile32e:
	.byte $00,$00,$00,$00,$00,$00,$00,$40,$50,$D0,$50,$10,$88,$55,$5D,$57
	.byte $44,$84,$04,$45,$05,$22,$5A,$12,$50,$50,$11,$40,$00,$44,$55,$55
	.byte $55,$56,$55,$54,$56,$48,$00,$11,$01,$00,$00,$00,$08,$A0,$80,$00
	.byte $00,$00,$25,$50,$88,$65,$95,$90,$05,$55,$55,$00,$00,$00,$A5,$FF
	.byte $00,$55,$00,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$A8,$A5
	.byte $AA,$AA,$AA,$AA,$AA,$66,$00,$A0,$0A,$44,$64,$46,$50,$55,$56,$65
	.byte $10,$00,$A5,$00,$00,$00,$00,$00,$AA,$00,$AB,$A0,$20,$22,$22,$20
	.byte $A0,$A0,$A0,$82,$14,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$FF,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$5A,$56,$59,$58,$52,$54,$51
	.byte $15,$45,$A0,$24,$81,$77,$75,$55,$55,$55,$55,$54,$A5,$A5,$FF,$FF
	.byte $AE,$FF,$00,$33,$AF,$0A,$A5,$55,$5A,$3F,$FF,$FF,$FF,$FF,$55,$55
	.byte $55,$FC,$1E,$A9,$01,$F0,$80,$08,$12,$0C,$00,$26,$40,$10,$00,$00
	.byte $09,$A4,$AA,$AA,$00,$00,$00,$00,$00,$00,$00,$AA,$AA,$AA,$AA,$FF
	.byte $FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$FF,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

oworld65:
	.byte $43,$E2,$45,$45,$E2,$49,$43,$E8
	.byte $43,$4C,$4C,$4C,$4C,$49,$43,$E8
	.byte $43,$4B,$4B,$4B,$4B,$49,$44,$E8
	.byte $43,$4B,$4B,$4B,$4B,$49,$46,$E8
	.byte $43,$4B,$4B,$4B,$4B,$4F,$4D,$E8
	.byte $43,$4B,$4B,$4B,$4B,$49,$43,$E8
	.byte $43,$4B,$4B,$4B,$4D,$44,$44,$E8
	.byte $43,$43,$43,$43,$43,$46,$46,$E8
	.byte $00,$5e,$5d		; NPC number
	.byte $00,$97,$44		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$63,$92		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $8d,$05,$8a,$00,$a9, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0d,$02				; sprite palette

junkyrd0:
	.byte $B8,$AF,$AA,$AB,$26,$47,$47,$2C
	.byte $0C,$74,$AC,$AD,$63,$C3,$C1,$31
	.byte $30,$36,$B1,$C6,$C5,$C2,$CB,$C4
	.byte $C3,$A2,$CE,$CE,$CE,$CE,$CE,$CE
	.byte $C4,$CE,$CE,$CE,$CE,$CE,$CE,$CE
	.byte $B6,$CE,$CE,$CE,$CE,$CE,$CE,$CE
	.byte $C2,$CD,$CE,$CE,$CE,$CA,$CE,$CE
	.byte $1F,$C4,$B4,$C3,$26,$C8,$3A,$CB
	.byte $92,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $91,$06,$89,$81,$54, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

junkyrd1:
	.byte $08,$0E,$0F,$C3,$B3,$4A,$29,$C7
	.byte $3A,$1B,$69,$CE,$C2,$99,$2A,$A2
	.byte $68,$C4,$CE,$CE,$CE,$CE,$CE,$C4
	.byte $CE,$CE,$CE,$CE,$CE,$CE,$CC,$44
	.byte $CE,$CE,$CE,$CC,$CB,$C8,$CE,$46
	.byte $CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE
	.byte $CE,$CE,$CE,$C2,$C5,$CE,$CE,$26
	.byte $26,$B5,$45,$C2,$51,$C4,$CB,$C3
	.byte $92,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

junkyrd2:
	.byte $D0,$C4,$34,$B6,$B4,$B1,$CC,$26
	.byte $A4,$C5,$C6,$CE,$CE,$CB,$CE,$C5
	.byte $CF,$CE,$CE,$CE,$CE,$B6,$AD,$B3
	.byte $44,$B7,$4D,$69,$AF,$CF,$CE,$2A
	.byte $46,$CE,$CE,$CE,$CE,$CE,$CE,$CE
	.byte $CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE
	.byte $0A,$62,$C3,$C4,$C5,$C6,$07,$AC
	.byte $CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE
	.byte $92,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

junkyrd3:
	.byte $C3,$5C,$C2,$29,$45,$45,$CC,$69
	.byte $C6,$CE,$CE,$CE,$D0,$C8,$2B,$1C
	.byte $B6,$C4,$B1,$CF,$C5,$CD,$C3,$99
	.byte $26,$CE,$CE,$CE,$C9,$B6,$C2,$3E
	.byte $CE,$CE,$CE,$CE,$CE,$CE,$CB,$B4
	.byte $CE,$CE,$CE,$C5,$C6,$A2,$C8,$CE
	.byte $B1,$B5,$CB,$CE,$CE,$CE,$CE,$CE
	.byte $CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE
	.byte $92,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

junkyrd4:
	.byte $C5,$D1,$26,$44,$45,$45,$5C,$62
	.byte $69,$CE,$CE,$51,$47,$47,$CE,$B7
	.byte $C6,$CE,$CE,$CE,$D0,$CE,$CE,$B6
	.byte $AC,$C3,$C7,$CE,$CE,$CE,$CE,$19
	.byte $C2,$CE,$CE,$CE,$CE,$CE,$CE,$CB
	.byte $B3,$AD,$C5,$CE,$CE,$CE,$CE,$C8
	.byte $B6,$B5,$C2,$C3,$45,$B6,$CA,$69
	.byte $C2,$B1,$3A,$C4,$26,$B7,$C9,$08
	.byte $92,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

junkyrd5:
	.byte $C3,$C6,$A3,$29,$AB,$43,$64,$26
	.byte $CE,$CE,$C2,$CC,$C8,$CB,$C3,$3A
	.byte $CE,$CE,$CE,$C4,$C9,$CE,$CE,$C5
	.byte $45,$45,$CE,$CE,$CE,$CE,$CE,$69
	.byte $47,$47,$CE,$CE,$CE,$CE,$CE,$A2
	.byte $47,$26,$C5,$CB,$C6,$C2,$D1,$B6
	.byte $CF,$CE,$D0,$CE,$C4,$CE,$CC,$B7
	.byte $B7,$B4,$CB,$26,$D0,$D1,$C7,$B4
	.byte $92,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

junkyrd6:
	.byte $64,$B3,$A2,$A4,$43,$BF,$C5,$0B
	.byte $B7,$B7,$C6,$CF,$CB,$C4,$CE,$CE
	.byte $CE,$CE,$C5,$CE,$CE,$CE,$CE,$CE
	.byte $C2,$69,$C3,$CE,$CE,$CE,$CE,$45
	.byte $CE,$CE,$C4,$CE,$29,$B6,$B4,$26
	.byte $26,$1C,$D0,$C5,$2A,$CE,$29,$C2
	.byte $1B,$AA,$C1,$CA,$AE,$CE,$C9,$C4
	.byte $B9,$B4,$69,$68,$C1,$AB,$48,$C7
	.byte $92,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

junkyrd7:
	.byte $BB,$CC,$C8,$44,$44,$07,$CD,$26
	.byte $C7,$B6,$CE,$46,$46,$CC,$B7,$B7
	.byte $B1,$B1,$CE,$CE,$CA,$C2,$CE,$CE
	.byte $1C,$CD,$CE,$CC,$D1,$CE,$C5,$B6
	.byte $CB,$C5,$CE,$CE,$C7,$C4,$CE,$CE
	.byte $46,$46,$D0,$C2,$CE,$CE,$C6,$30
	.byte $AA,$AB,$68,$37,$CB,$CF,$C1,$AE
	.byte $AC,$AD,$2C,$29,$26,$43,$43,$B3
	.byte $92,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $15,$04,$89,$00,$45, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

constru0:
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $56,$56,$56,$56,$B5,$B5,$56,$56
	.byte $56,$B5,$B5,$56,$56,$56,$56,$56
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $B1,$AE,$B7,$AE,$AE,$B6,$B7,$AE
	.byte $B4,$4B,$B7,$4B,$B8,$4B,$B6,$4B
	.byte $B1,$4B,$B4,$4B,$B7,$4B,$4B,$4B
	.byte $AE,$AE,$AE,$B7,$B7,$AE,$B7,$AE
	.byte $1a,$00,$00		; NPC number
	.byte $c6,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $f1,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $b1,$06,$8b,$84,$a3, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

constru1:
	.byte $56,$56,$56,$B2,$B1,$56,$56,$56
	.byte $56,$56,$56,$B2,$B1,$56,$56,$56
	.byte $56,$56,$56,$B2,$B1,$56,$56,$56
	.byte $56,$56,$56,$B2,$B1,$56,$56,$56
	.byte $AE,$AE,$AE,$B3,$B1,$A7,$A8,$A9
	.byte $4B,$4B,$4B,$4B,$B1,$4B,$AA,$AB
	.byte $4B,$4B,$4B,$4B,$B1,$4B,$AC,$AD
	.byte $AE,$AE,$AE,$AE,$AE,$4B,$4B,$4B
	.byte $97,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

constru2:
	.byte $B5,$B5,$B5,$B5,$B5,$BC,$E3,$56
	.byte $BE,$BE,$BA,$BA,$BA,$BD,$E3,$56
	.byte $B5,$B5,$B5,$B5,$B5,$BC,$E3,$56
	.byte $BA,$BA,$BA,$BA,$BA,$BA,$BD,$56
	.byte $BA,$BA,$BE,$BE,$BE,$BE,$BD,$56
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$BC,$56
	.byte $E4,$BA,$BA,$B9,$BA,$BA,$BB,$56
	.byte $56,$56,$56,$B2,$56,$56,$56,$56
	.byte $97,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

constru3:
	.byte $56,$BC,$E3,$C0,$E3,$B5,$B5,$B5
	.byte $56,$BA,$BD,$BF,$BC,$BA,$BA,$BE
	.byte $56,$B5,$BC,$E3,$BC,$E3,$B5,$B5
	.byte $56,$B5,$BC,$E3,$BC,$56,$BE,$BB
	.byte $56,$B5,$BC,$E3,$BC,$56,$BE,$BB
	.byte $56,$B5,$BC,$E3,$BC,$E3,$B5,$B5
	.byte $56,$BB,$BA,$BE,$BF,$E3,$B5,$B5
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $97,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

constru4:
	.byte $56,$B5,$B5,$BC,$E3,$B5,$B5,$B5
	.byte $56,$B5,$B5,$BC,$E3,$B5,$B5,$B5
	.byte $56,$B5,$B5,$BC,$E3,$B5,$C0,$BE
	.byte $56,$BD,$E3,$BC,$E3,$B5,$BC,$E3
	.byte $56,$BA,$BA,$B9,$BA,$BA,$BB,$E3
	.byte $56,$B5,$B5,$B2,$E3,$B5,$B5,$B5
	.byte $56,$BC,$E3,$B2,$E3,$B5,$B5,$B5
	.byte $56,$BC,$56,$C0,$56,$56,$56,$56
	.byte $97,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

constru5:
	.byte $B5,$B5,$B5,$B5,$BC,$E3,$C0,$56
	.byte $B5,$B5,$E4,$BE,$B9,$E3,$B2,$56
	.byte $BE,$BD,$E3,$B5,$B2,$E3,$B2,$56
	.byte $B5,$C0,$E3,$BC,$BA,$BA,$BB,$56
	.byte $B5,$BC,$E3,$BC,$E3,$B5,$B5,$56
	.byte $E4,$BB,$BA,$BF,$E3,$B5,$B5,$56
	.byte $B5,$B5,$B5,$B5,$B5,$BC,$E3,$56
	.byte $56,$56,$56,$56,$56,$BC,$56,$56
	.byte $97,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

constru6:
	.byte $B5,$BC,$E3,$C0,$E3,$B5,$B2,$56
	.byte $B5,$B2,$E3,$B2,$E3,$B5,$B2,$56
	.byte $B5,$B2,$E3,$BC,$BA,$BA,$B9,$56
	.byte $BE,$BF,$E3,$BC,$E3,$B5,$B2,$56
	.byte $B5,$B5,$B5,$BC,$E3,$B5,$B2,$56
	.byte $B5,$E4,$BA,$BB,$E3,$B5,$BC,$56
	.byte $B5,$B5,$B5,$B5,$BC,$E3,$C0,$56
	.byte $56,$56,$56,$56,$BC,$56,$C0,$56
	.byte $97,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

constru7:
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $E4,$B9,$BA,$BA,$BA,$BA,$BD,$56
	.byte $B5,$B2,$E3,$B5,$B5,$B5,$BC,$56
	.byte $B5,$B2,$E3,$B5,$B5,$B5,$BC,$56
	.byte $B5,$B2,$E3,$C0,$BE,$BE,$BF,$56
	.byte $B5,$B2,$E3,$C0,$E3,$E4,$BD,$56
	.byte $B5,$C0,$E3,$C0,$E3,$E4,$B9,$56
	.byte $56,$C0,$56,$C0,$56,$56,$B2,$56
	.byte $97,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

constru8:
	.byte $56,$B2,$E3,$B2,$E3,$B2,$E3,$B5
	.byte $56,$C0,$E3,$BC,$E3,$BC,$E3,$B5
	.byte $56,$BC,$E3,$BC,$E3,$BC,$E3,$B5
	.byte $56,$BC,$E3,$BC,$E3,$BC,$BA,$BE
	.byte $56,$BF,$BE,$BE,$BA,$BA,$E3,$B5
	.byte $56,$BC,$E3,$C0,$E3,$BC,$E3,$B5
	.byte $56,$BF,$BE,$BC,$BE,$BB,$E3,$B5
	.byte $56,$56,$56,$BC,$56,$56,$56,$56
	.byte $97,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

constru9:
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $BE,$BA,$BA,$BA,$BA,$BA,$BD,$E3
	.byte $56,$BC,$E3,$B5,$B5,$B5,$BC,$E3
	.byte $56,$C0,$E3,$B5,$B5,$B5,$BC,$E3
	.byte $56,$BC,$E3,$B5,$B5,$B5,$C0,$E3
	.byte $56,$BC,$BA,$BA,$BA,$BA,$BB,$E3
	.byte $56,$B9,$56,$B9,$56,$B9,$E3,$B5
	.byte $56,$B2,$56,$B2,$56,$B2,$56,$56
	.byte $97,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

construA:
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $56,$C1,$B9,$BA,$BA,$BA,$BA,$BE
	.byte $56,$56,$B2,$56,$56,$56,$56,$56
	.byte $56,$56,$B2,$56,$56,$56,$56,$56
	.byte $56,$56,$B2,$56,$56,$56,$56,$56
	.byte $56,$56,$B2,$56,$56,$56,$56,$56
	.byte $56,$56,$B2,$56,$56,$56,$56,$56
	.byte $56,$56,$B2,$56,$56,$56,$56,$56
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d5,$05,$01,$04,$a6, $23,$02,<item020,>item020,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

univers0:
	.byte $26,$A2,$A2,$A2,$A2,$A2,$A2,$26
	.byte $26,$0D,$14,$14,$14,$14,$14,$26
	.byte $26,$0D,$99,$99,$99,$99,$99,$26
	.byte $26,$A3,$A2,$19,$A2,$19,$A2,$1F
	.byte $26,$0D,$A0,$A6,$A0,$A6,$0D,$0D
	.byte $26,$0D,$A0,$A6,$A0,$A6,$0D,$0D
	.byte $26,$0D,$0D,$0D,$0D,$0D,$0D,$14
	.byte $26,$0D,$0D,$0D,$0D,$0D,$0D,$26
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $24,$00,<sear020,>sear020,$00, $2c,$00,<sear021,>sear021,$00
	.byte $5d,$00,<sear022,>sear022,$00, $56,$00,<sear023,>sear023,$00	; searchable areas
	.byte $89,$00,<sear024,>sear024,$00
	.byte $08,$00				; sprite palette

univers1:
	.byte $26,$19,$19,$19,$19,$19,$19,$26
	.byte $26,$99,$99,$99,$99,$99,$99,$26
	.byte $26,$14,$14,$14,$14,$13,$14,$26
	.byte $20,$99,$99,$99,$99,$9D,$99,$1F
	.byte $0D,$A0,$0D,$62,$62,$0D,$A1,$0D
	.byte $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
	.byte $14,$14,$14,$13,$14,$14,$14,$14
	.byte $26,$26,$26,$10,$26,$26,$26,$26
	.byte $47,$00,$00		; NPC number
	.byte $b4,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $a3,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d7,$05,$00,$01,$27, $33,$00,<sear016,>sear016,$00
	.byte $3a,$00,<sear017,>sear017,$00, $75,$00,<sear018,>sear018,$00	; searchable areas
	.byte $7d,$00,<sear019,>sear019,$00
	.byte $08,$00				; sprite palette

univers2:
	.byte $26,$A2,$A2,$A2,$A2,$A2,$A2,$26
	.byte $26,$99,$9D,$99,$99,$99,$99,$26
	.byte $26,$A2,$A2,$A2,$A4,$A2,$A2,$26
	.byte $20,$0D,$0D,$0D,$14,$14,$14,$26
	.byte $0D,$0D,$07,$0A,$27,$99,$99,$26
	.byte $0D,$0D,$0D,$62,$1A,$A2,$A4,$26
	.byte $14,$0D,$0D,$0D,$1A,$0D,$0D,$26
	.byte $26,$0D,$0D,$0D,$1A,$0D,$0D,$26
	.byte $00,$00,$48		; NPC number
	.byte $00,$00,$3c		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$80		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $25,$00,<sear025,>sear025,$00, $62,$00,<sear026,>sear026,$00
	.byte $6c,$00,<sear027,>sear027,$00, $9d,$00,<sear028,>sear028,$00	; searchable areas
	.byte $ca,$00,<sear029,>sear029,$00
	.byte $08,$00				; sprite palette

univers3:
	.byte $26,$0D,$0D,$0D,$0D,$0D,$0D,$26
	.byte $26,$A2,$A2,$A2,$10,$1A,$A2,$26
	.byte $26,$13,$14,$14,$10,$1A,$13,$26
	.byte $26,$9D,$99,$99,$9A,$9B,$9D,$26
	.byte $26,$0D,$0D,$14,$14,$14,$14,$26
	.byte $26,$19,$23,$39,$99,$99,$99,$26
	.byte $26,$62,$0D,$A5,$A5,$A5,$A5,$26
	.byte $26,$26,$26,$26,$26,$26,$26,$26
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $46,$00,<item811,>item811,$00, $4c,$00,<sear030,>sear030,$00
	.byte $75,$00,<sear031,>sear031,$00, $bd,$00,<sear032,>sear032,$00	; searchable areas
	.byte $bb,$00,<sear033,>sear033,$00
	.byte $08,$00				; sprite palette

univers5:
	.byte $26,$0D,$0D,$0D,$1A,$0D,$0D,$26
	.byte $26,$14,$14,$0D,$1A,$0D,$0D,$26
	.byte $26,$99,$99,$0D,$A2,$A2,$A4,$26
	.byte $26,$0D,$0D,$0D,$0D,$0D,$0D,$26
	.byte $26,$19,$23,$07,$A2,$19,$A2,$26
	.byte $26,$62,$0D,$22,$A6,$A6,$A6,$26
	.byte $26,$0D,$0D,$A5,$A5,$A5,$A5,$26
	.byte $26,$26,$26,$26,$26,$26,$26,$26
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $52,$00,<sear034,>sear034,$00, $53,$00,<sear035,>sear035,$00
	.byte $69,$00,<sear036,>sear036,$00, $a8,$00,<sear037,>sear037,$00	; searchable areas
	.byte $ac,$00,<sear038,>sear038,$00
	.byte $08,$00				; sprite palette

plumbers:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$60,$5C,$29,$5C,$29,$00
	.byte $00,$10,$62,$00,$2A,$00,$29,$00
	.byte $00,$10,$00,$00,$29,$00,$29,$00
	.byte $00,$07,$23,$00,$2A,$00,$29,$00
	.byte $00,$10,$00,$19,$19,$00,$29,$00
	.byte $00,$2C,$14,$14,$32,$14,$26,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $28,$57,$00		; NPC number
	.byte $45,$5b,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $f2,$d0,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d8,$15,$84,$01,$49, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

pndcabin:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$18,$08,$19,$18,$29,$00
	.byte $00,$0C,$2B,$2B,$2B,$2B,$1C,$00
	.byte $00,$30,$2B,$2B,$2B,$2B,$31,$00
	.byte $00,$2C,$26,$31,$26,$26,$26,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $27,$00,$00		; NPC number
	.byte $4b,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $e3,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $96,$15,$84,$02,$78, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $06,$00				; sprite palette

glfcabin:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $07,$18,$18,$18,$18,$07,$19,$0B
	.byte $10,$62,$62,$62,$0D,$1B,$0D,$1C
	.byte $34,$36,$36,$36,$36,$22,$10,$1C
	.byte $10,$36,$36,$36,$36,$0D,$10,$1C
	.byte $34,$36,$36,$36,$36,$0D,$22,$28
	.byte $12,$14,$14,$14,$32,$28,$26,$26
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $1c,$5f,$00		; NPC number
	.byte $42,$7d,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $a3,$c1,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d8,$15,$81,$83,$34, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$00				; sprite palette

islcabin:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$09,$08,$07,$18,$0B,$00
	.byte $00,$10,$0E,$0F,$10,$16,$15,$00
	.byte $00,$11,$0D,$36,$10,$0D,$1A,$00
	.byte $00,$12,$13,$0D,$22,$14,$28,$00
	.byte $00,$00,$10,$0D,$1A,$00,$00,$00
	.byte $00,$00,$2C,$32,$28,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$5a,$00		; NPC number
	.byte $45,$6a,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $31,$b1,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d6,$15,$82,$00,$74, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

store001:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$75,$76,$77,$88,$02,$03,$00
	.byte $00,$79,$7A,$7B,$89,$00,$DA,$00
	.byte $00,$7D,$7E,$7F,$8A,$05,$06,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$D5,$D6,$D4,$63,$62,$3D,$00
	.byte $00,$00,$00,$00,$12,$13,$28,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $08,$00,$00		; NPC number
	.byte $ab,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $d1,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $db,$15,$81,$01,$43, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

store002:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$75,$76,$77,$91,$02,$03,$00
	.byte $00,$8E,$8F,$90,$92,$00,$DA,$00
	.byte $00,$93,$94,$95,$05,$05,$06,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$D5,$D6,$D4,$63,$62,$3D,$00
	.byte $00,$00,$00,$00,$12,$13,$28,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $08,$00,$00		; NPC number
	.byte $ab,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $81,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $db,$15,$02,$82,$4b, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

trakhome:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$07,$26,$0B,$00,$00
	.byte $00,$00,$00,$10,$39,$17,$00,$00
	.byte $00,$00,$00,$2C,$13,$28,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $7a,$00,<item016,>item016,$00, $99,$15,$83,$82,$cb
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$00				; sprite palette

store000:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$75,$76,$77,$78,$02,$03,$00
	.byte $00,$79,$7A,$7B,$7C,$00,$DA,$00
	.byte $00,$7D,$7E,$7F,$80,$05,$06,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$D5,$D6,$D4,$10,$62,$1A,$00
	.byte $00,$00,$00,$00,$12,$13,$28,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $08,$00,$00		; NPC number
	.byte $ab,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $71,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $db,$15,$00,$81,$4b, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

cowboycu:
	.byte $00,$00,$00,$87,$00,$00,$00,$00
	.byte $00,$07,$19,$74,$19,$19,$0B,$00
	.byte $00,$30,$2B,$2B,$2B,$2B,$31,$00
	.byte $00,$34,$2B,$2B,$31,$2B,$31,$00
	.byte $00,$30,$2B,$2B,$31,$2B,$29,$00
	.byte $00,$30,$2B,$2B,$1C,$2B,$2A,$00
	.byte $00,$2C,$26,$31,$26,$26,$26,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $53,$10,$00		; NPC number
	.byte $84,$43,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $f3,$f1,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d6,$15,$88,$05,$83, $27,$07,$01,$00,$62
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0b,$00				; sprite palette

mines000:
	.byte $44,$44,$44,$44,$44,$44,$44,$44
	.byte $46,$46,$E0,$46,$46,$E0,$46,$46
	.byte $4A,$4A,$4A,$4A,$4A,$4A,$4A,$4A
	.byte $6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B
	.byte $43,$45,$45,$DF,$45,$45,$DF,$45
	.byte $43,$DB,$4C,$4C,$4C,$DB,$4C,$4C
	.byte $43,$58,$58,$58,$58,$58,$58,$58
	.byte $43,$00,$00,$00,$00,$00,$00,$00
	.byte $99,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $61,$05,$81,$00,$37, $b2,$00,<sear083,>sear083,$00
	.byte $ba,$00,<sear084,>sear084,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$03				; sprite palette

mines001:
	.byte $44,$44,$44,$6D,$49,$44,$44,$44
	.byte $46,$E0,$46,$6D,$49,$DC,$E0,$46
	.byte $4A,$4A,$4A,$6E,$49,$4B,$4B,$4B
	.byte $6B,$6B,$6B,$6C,$6B,$6B,$6B,$6B
	.byte $45,$45,$DF,$6D,$56,$DF,$45,$43
	.byte $4C,$4C,$4C,$4B,$4B,$4C,$DB,$43
	.byte $58,$58,$58,$58,$5B,$58,$58,$43
	.byte $56,$56,$56,$56,$59,$56,$56,$43
	.byte $99,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $4a,$00,<sear085,>sear085,$00, $bc,$00,<sear086,>sear086,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$03				; sprite palette

mines002:
	.byte $56,$56,$56,$56,$59,$56,$56,$43
	.byte $56,$56,$56,$56,$59,$56,$56,$43
	.byte $43,$DF,$45,$57,$5A,$57,$57,$DC
	.byte $43,$4C,$DB,$4B,$4B,$4B,$4B,$4B
	.byte $44,$4B,$DF,$4B,$4B,$DF,$45,$44
	.byte $47,$4B,$4C,$4B,$4B,$4C,$DB,$47
	.byte $58,$58,$58,$58,$58,$58,$58,$58
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $99,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $bc,$00,<sear087,>sear087,$00, $74,$00,<sear088,>sear088,$00
	.byte $6e,$00,<sear089,>sear089,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$03				; sprite palette

mines003:
	.byte $43,$43,$43,$5A,$57,$57,$57,$43
	.byte $44,$43,$43,$4B,$4B,$4B,$4B,$43
	.byte $46,$DF,$43,$4A,$4A,$55,$4A,$43
	.byte $4B,$4C,$43,$4D,$4D,$4D,$4B,$43
	.byte $44,$4B,$DF,$45,$45,$DF,$4B,$43
	.byte $46,$4B,$4C,$DB,$4C,$4C,$4B,$46
	.byte $58,$58,$58,$58,$58,$58,$58,$58
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $99,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $b6,$00,<sear090,>sear090,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$03				; sprite palette

mines004:
	.byte $44,$44,$43,$56,$56,$56,$56,$56
	.byte $46,$DC,$44,$56,$56,$56,$56,$56
	.byte $4B,$4B,$E0,$57,$57,$57,$57,$57
	.byte $6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B
	.byte $43,$57,$45,$DF,$45,$45,$57,$43
	.byte $43,$4B,$DB,$4C,$4C,$DB,$4B,$46
	.byte $43,$43,$43,$5B,$58,$58,$58,$58
	.byte $43,$43,$43,$59,$56,$56,$56,$56
	.byte $99,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $ba,$00,<item010,>item010,$00, $42,$00,<sear091,>sear091,$00
	.byte $b4,$00,<sear092,>sear092,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$03				; sprite palette

mines005:
	.byte $43,$DF,$45,$DF,$45,$DF,$45,$43
	.byte $43,$4C,$DB,$4C,$4C,$4C,$DB,$43
	.byte $43,$4B,$71,$6F,$71,$70,$4B,$43
	.byte $43,$4B,$43,$6D,$49,$43,$4B,$43
	.byte $43,$4B,$43,$6D,$49,$43,$4B,$43
	.byte $43,$4B,$43,$6D,$49,$43,$4B,$43
	.byte $43,$43,$43,$6D,$49,$43,$DD,$43
	.byte $43,$43,$43,$6D,$49,$43,$43,$43
	.byte $00,$00,$00		; NPC number ; $99 enemy if I decide to fix it in secret area
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $cc,$06,$02,$01,$2a, $34,$00,<sear093,>sear093,$00
	.byte $3c,$00,<sear094,>sear094,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$03				; sprite palette

mines006:
	.byte $56,$56,$57,$57,$57,$57,$56,$56
	.byte $56,$56,$4B,$4B,$6B,$6B,$56,$56
	.byte $57,$57,$4A,$4A,$57,$57,$57,$57
	.byte $6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B
	.byte $44,$44,$44,$44,$44,$44,$44,$44
	.byte $46,$46,$46,$46,$46,$46,$46,$46
	.byte $58,$58,$58,$58,$58,$58,$58,$58
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $03,$02,$22		; NPC number
	.byte $28,$6b,$35		; NPC position (lo nybble Y, hi nybble X)
	.byte $40,$50,$80		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $2b,$04,$82,$81,$bc, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$03				; sprite palette

mines007:
	.byte $56,$57,$57,$57,$43,$56,$56,$56
	.byte $56,$6F,$71,$6C,$43,$56,$56,$56
	.byte $57,$6E,$43,$6D,$43,$57,$57,$57
	.byte $6B,$72,$43,$6D,$44,$6F,$71,$6B
	.byte $44,$44,$43,$6D,$E0,$6E,$44,$44
	.byte $46,$46,$46,$73,$6B,$72,$46,$46
	.byte $58,$58,$58,$56,$56,$56,$58,$58
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $99,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$03				; sprite palette

mines008:
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $57,$57,$43,$57,$57,$57,$57,$57
	.byte $6B,$6C,$44,$6F,$71,$6B,$6B,$6B
	.byte $44,$6D,$E0,$6E,$44,$56,$56,$56
	.byte $46,$73,$6B,$72,$46,$56,$56,$56
	.byte $58,$56,$56,$56,$58,$56,$56,$56
	.byte $56,$56,$56,$56,$56,$56,$56,$56
	.byte $99,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$03				; sprite palette

mines009:
	.byte $56,$43,$DF,$49,$DF,$45,$DF,$43
	.byte $56,$44,$4C,$49,$4C,$4C,$4C,$43
	.byte $57,$E0,$4B,$49,$4B,$43,$4B,$43
	.byte $6B,$70,$4B,$49,$4B,$43,$4B,$43
	.byte $56,$43,$4B,$49,$4B,$43,$4B,$44
	.byte $56,$43,$4B,$4F,$4B,$43,$4B,$46
	.byte $56,$43,$4D,$50,$4D,$43,$4D,$4D
	.byte $56,$43,$43,$43,$43,$43,$43,$43
	.byte $99,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $ce,$04,$88,$05,$3d, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$03				; sprite palette

slums002:
	.byte $07,$19,$0B,$00,$00,$00,$00,$00
	.byte $26,$21,$1A,$00,$00,$00,$00,$00
	.byte $26,$26,$1A,$00,$00,$00,$00,$00
	.byte $1D,$20,$1A,$00,$07,$19,$0A,$63
	.byte $12,$32,$28,$00,$10,$21,$13,$63
	.byte $00,$00,$00,$00,$07,$0A,$1E,$63
	.byte $00,$00,$00,$00,$26,$14,$32,$63
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $93,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $dc,$15,$85,$06,$ad, $92,$15,$85,$06,$64
	.byte $8a,$05,$01,$00,$99, $22,$05,$01,$00,$31	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0c,$00				; sprite palette

slums003:
	.byte $07,$19,$19,$18,$0B,$00,$00,$00
	.byte $10,$21,$16,$16,$1A,$00,$00,$00
	.byte $07,$19,$19,$0A,$1A,$00,$00,$00
	.byte $12,$32,$14,$14,$28,$07,$08,$0B
	.byte $00,$00,$00,$00,$00,$10,$21,$15
	.byte $00,$00,$00,$00,$00,$11,$0D,$1C
	.byte $00,$00,$00,$00,$00,$12,$32,$28
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $93,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $dc,$15,$85,$06,$cd, $72,$15,$85,$06,$73
	.byte $8c,$05,$01,$00,$9d, $22,$05,$01,$00,$33	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0c,$00				; sprite palette

slums004:
	.byte $26,$26,$26,$26,$00,$00,$00,$00
	.byte $2F,$2B,$2B,$26,$00,$00,$00,$00
	.byte $26,$26,$2B,$26,$00,$00,$00,$00
	.byte $00,$26,$2B,$26,$26,$26,$26,$63
	.byte $00,$26,$2B,$26,$2F,$2B,$26,$63
	.byte $00,$26,$2B,$2B,$2B,$2B,$26,$63
	.byte $00,$26,$26,$26,$26,$26,$26,$63
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $93,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $89,$07,$81,$00,$8b, $21,$07,$81,$00,$23
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0c,$00				; sprite palette

slums005:
	.byte $26,$26,$26,$26,$26,$26,$26,$00
	.byte $26,$2F,$26,$2B,$2B,$2B,$26,$00
	.byte $26,$2B,$26,$2B,$26,$2B,$26,$00
	.byte $26,$2B,$26,$2B,$26,$2B,$26,$29
	.byte $26,$2B,$26,$2B,$26,$2B,$2F,$2A
	.byte $26,$2B,$2B,$2B,$26,$2B,$2B,$26
	.byte $26,$26,$26,$26,$26,$26,$26,$26
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $93,$23,$00		; NPC number
	.byte $00,$52,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$c2,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $8d,$07,$81,$00,$8d, $23,$07,$81,$00,$23
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0c,$00				; sprite palette

upstairs:
	.byte $07,$08,$09,$0A,$07,$19,$18,$0B
	.byte $0C,$0D,$0E,$0F,$10,$16,$0D,$17
	.byte $10,$0D,$0D,$0D,$0C,$0D,$0D,$15
	.byte $11,$0D,$0D,$0D,$10,$0D,$0D,$1A
	.byte $12,$13,$14,$14,$19,$23,$07,$0B
	.byte $1D,$1E,$1F,$20,$21,$0D,$1B,$1C
	.byte $10,$0D,$0D,$0D,$0D,$0D,$22,$1A
	.byte $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A
	.byte $01,$00,$00		; NPC number
	.byte $25,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $31,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $a8,$05,$00,$01,$b8;	$a8,$05,$0e,$00,$73;<-to the end;	
	.byte $bd,$00,<item023,>item023,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

dnstairs:
	.byte $07,$19,$08,$0A,$07,$26,$26,$0B
	.byte $10,$0D,$0D,$16,$25,$26,$26,$17
	.byte $34,$0D,$35,$0D,$10,$1F,$20,$1A
	.byte $10,$0D,$0D,$0D,$11,$0D,$0D,$1A
	.byte $10,$0D,$14,$14,$19,$0A,$0D,$26
	.byte $10,$0D,$1F,$20,$24,$0D,$0D,$27
	.byte $12,$14,$32,$14,$14,$14,$14,$28
	.byte $0A,$0A,$33,$0A,$0A,$0A,$0A,$0A
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $a8,$05,$00,$81,$b8, $29,$05,$00,$01,$39
	.byte $d4,$15,$01,$03,$35, $3e,$00,<item008,>item008,$00	; searchable areas
	.byte $54,$35,$01,$06,$64
	.byte $00,$00				; sprite palette

basement:
	.byte $00,$00,$00,$00,$2E,$2D,$2D,$29
	.byte $00,$00,$00,$00,$2F,$2B,$2B,$2A
	.byte $00,$00,$00,$00,$30,$2B,$2B,$31
	.byte $00,$00,$00,$00,$2C,$26,$26,$26
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $29,$05,$00,$81,$39, $59,$01,<item026,>item026,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

t_pasthr:
	.byte $00,$00,$07,$37,$07,$0B,$00,$00
	.byte $00,$00,$10,$0D,$1B,$1A,$00,$00
	.byte $00,$00,$10,$0D,$22,$1C,$00,$00
	.byte $00,$00,$34,$36,$07,$0B,$00,$00
	.byte $00,$00,$10,$0D,$0C,$17,$00,$00
	.byte $00,$00,$11,$0D,$22,$1A,$00,$00
	.byte $00,$00,$12,$14,$38,$28,$00,$00
	.byte $00,$00,$26,$26,$33,$26,$00,$00
	.byte $00,$00,$1f		; NPC number
	.byte $00,$00,$aa		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$f2		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $17,$14,$00,$01,$b8, $d8,$05,$00,$02,$49
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

tinyhome:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$07,$08,$19,$29,$00,$00
	.byte $00,$00,$0C,$16,$0D,$1C,$00,$00
	.byte $00,$00,$2C,$14,$32,$28,$00,$00
	.byte $00,$00,$26,$26,$33,$26,$00,$00
	.byte $19,$00,$00		; NPC number
	.byte $b6,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $d1,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d8,$15,$00,$02,$3d, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

lftohome:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$19,$0B,$19,$19,$19,$0B
	.byte $00,$1B,$0D,$1C,$10,$13,$16,$15
	.byte $00,$11,$0D,$1D,$1E,$12,$14,$28
	.byte $00,$10,$0D,$22,$07,$29,$00,$00
	.byte $00,$34,$36,$0D,$22,$1A,$00,$00
	.byte $00,$12,$14,$32,$14,$28,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $34,$52,$00		; NPC number
	.byte $85,$5c,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $e3,$a2,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d6,$15,$82,$01,$3b, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

rgtohome:
	.byte $2E,$2D,$07,$18,$0B,$18,$18,$0B
	.byte $0C,$0D,$0C,$0D,$17,$0D,$16,$15
	.byte $11,$0D,$12,$13,$28,$0D,$29,$26
	.byte $12,$13,$07,$23,$26,$13,$1B,$1C
	.byte $26,$10,$22,$0D,$1F,$1E,$12,$1A
	.byte $1D,$1E,$34,$0D,$36,$0D,$39,$1A
	.byte $2C,$0D,$22,$0D,$36,$14,$32,$26
	.byte $26,$26,$26,$26,$26,$26,$00,$00
	.byte $2b,$2c,$00		; NPC number
	.byte $4b,$b2,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $72,$b3,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $dc,$15,$01,$02,$5b, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette


crnsiloa:
	.byte $26,$3D,$26,$26,$26,$26,$26,$26
	.byte $26,$2B,$26,$3B,$2B,$2B,$2B,$26
	.byte $26,$2B,$3A,$3A,$3A,$3A,$2B,$26
	.byte $26,$2B,$3A,$3A,$3A,$3A,$2B,$26
	.byte $26,$2B,$3A,$3A,$3A,$3A,$2B,$26
	.byte $26,$2B,$3A,$3A,$3A,$3A,$2B,$26
	.byte $26,$2B,$2B,$2B,$2B,$2B,$2B,$26
	.byte $26,$26,$26,$26,$26,$26,$26,$26
	.byte $82,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $12,$05,$01,$06,$c4, $26,$07,$00,$81,$36
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

crnsilob:
	.byte $26,$26,$26,$26,$26,$26,$26,$26
	.byte $26,$26,$26,$3C,$2B,$2B,$26,$26
	.byte $26,$3B,$3A,$3A,$3A,$2B,$2B,$26
	.byte $26,$2B,$3A,$3A,$3A,$3A,$2B,$26
	.byte $26,$2B,$3A,$3A,$3A,$3A,$2B,$26
	.byte $26,$2B,$2B,$3A,$3A,$2B,$2B,$26
	.byte $26,$26,$2B,$2B,$2B,$2B,$26,$26
	.byte $26,$26,$26,$26,$26,$26,$26,$26
	.byte $82,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $42,$05,$01,$00,$43, $26,$07,$00,$01,$36
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

crnsiloc:
	.byte $26,$26,$26,$26,$26,$26,$26,$26
	.byte $26,$26,$26,$3A,$3A,$26,$69,$26
	.byte $26,$3C,$3A,$3A,$3A,$3A,$30,$26
	.byte $26,$2B,$2B,$2B,$2B,$2B,$2B,$26
	.byte $26,$26,$3A,$3A,$3A,$3A,$26,$26
	.byte $26,$26,$26,$3A,$3A,$26,$26,$26
	.byte $26,$26,$26,$26,$26,$26,$26,$26
	.byte $26,$26,$26,$26,$26,$26,$26,$26
	.byte $82,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $42,$05,$81,$00,$43, $4d,$00,<item011,>item011,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

richmond:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$18,$19,$18,$19,$0B,$00
	.byte $00,$10,$0D,$3E,$36,$0D,$17,$00
	.byte $00,$2C,$14,$14,$32,$14,$28,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $17,$55,$60		; NPC number
	.byte $67,$73,$7c		; NPC position (lo nybble Y, hi nybble X)
	.byte $f1,$f3,$d2		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $98,$15,$81,$81,$44, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$00				; sprite palette

arcade_1:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$19,$19,$19,$19,$0B,$00
	.byte $00,$10,$68,$3F,$41,$40,$1A,$00
	.byte $00,$10,$42,$41,$40,$3F,$1A,$00
	.byte $00,$12,$32,$14,$14,$14,$28,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $18,$0a,$39		; NPC number
	.byte $63,$7a,$57		; NPC position (lo nybble Y, hi nybble X)
	.byte $a3,$80,$82		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $94,$15,$00,$01,$46, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette


caves_00:
	.byte $43,$44,$43,$4B,$43,$44,$44,$44
	.byte $43,$E1,$D3,$4B,$43,$46,$E1,$46
	.byte $43,$4B,$D2,$4E,$43,$4B,$4B,$4B
	.byte $45,$4B,$43,$43,$43,$4B,$4B,$4B
	.byte $4C,$4B,$45,$E2,$45,$4B,$4B,$4B
	.byte $43,$4B,$6A,$6A,$6A,$4B,$4B,$4B
	.byte $43,$4D,$4D,$4D,$4D,$4D,$4D,$4D
	.byte $43,$43,$43,$43,$43,$43,$43,$43
	.byte $98,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $91,$07,$88,$83,$92, $b4,$00,<sear000,>sear000,$00
	.byte $b6,$00,<sear001,>sear001,$00, $b8,$00,<sear002,>sear002,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$02				; sprite palette

caves_01:
	.byte $44,$44,$43,$44,$44,$43,$4B,$43
	.byte $46,$46,$43,$E1,$46,$43,$4B,$43
	.byte $4B,$4B,$43,$4B,$49,$43,$4B,$43
	.byte $4B,$4B,$43,$4B,$49,$51,$53,$43
	.byte $4B,$4B,$44,$4B,$4F,$52,$54,$43
	.byte $4B,$4B,$E1,$4B,$49,$4B,$4B,$43
	.byte $4D,$4D,$4D,$4D,$50,$4D,$4D,$43
	.byte $43,$43,$43,$43,$43,$43,$43,$43
	.byte $98,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$02				; sprite palette

caves_02:
	.byte $44,$44,$44,$44,$44,$44,$44,$43
	.byte $46,$E1,$46,$E1,$46,$E1,$46,$43
	.byte $4D,$4D,$4D,$4D,$4D,$4D,$4B,$43
	.byte $43,$45,$E2,$45,$E2,$45,$4B,$43
	.byte $43,$6A,$6A,$6A,$6A,$6A,$4B,$43
	.byte $43,$55,$4A,$4A,$4A,$4A,$4A,$43
	.byte $43,$4D,$4D,$4D,$4D,$4D,$4B,$43
	.byte $43,$43,$43,$43,$43,$43,$4B,$43
	.byte $98,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $92,$00,<sear003,>sear003,$00, $94,$00,<sear004,>sear004,$00
	.byte $96,$00,<sear005,>sear005,$00, $98,$00,<sear006,>sear006,$00	; searchable areas
	.byte $9a,$00,<sear007,>sear007,$00
	.byte $04,$02				; sprite palette

caves_03:
	.byte $43,$4B,$43,$4B,$43,$43,$44,$44
	.byte $43,$4B,$43,$4B,$43,$43,$E1,$46
	.byte $43,$4B,$43,$4B,$E2,$43,$4B,$4D
	.byte $43,$4B,$43,$4B,$6A,$51,$53,$43
	.byte $43,$4B,$44,$44,$4D,$52,$54,$43
	.byte $43,$4B,$E1,$46,$43,$4B,$4B,$43
	.byte $43,$4D,$4D,$4B,$43,$43,$43,$43
	.byte $43,$43,$43,$4B,$43,$43,$43,$43
	.byte $98,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $78,$00,<sear008,>sear008,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$02				; sprite palette

caves_04:
	.byte $43,$4B,$43,$43,$43,$4B,$44,$44
	.byte $43,$4B,$43,$43,$43,$4B,$E1,$46
	.byte $43,$4B,$43,$44,$44,$4D,$4D,$4D
	.byte $43,$4B,$43,$E1,$46,$45,$43,$43
	.byte $43,$4B,$43,$4B,$49,$6A,$44,$45
	.byte $43,$4B,$43,$4B,$4F,$4B,$E1,$4C
	.byte $43,$4B,$43,$4B,$50,$4D,$4D,$4D
	.byte $43,$4B,$43,$4B,$43,$43,$43,$43
	.byte $98,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $9a,$00,<sear009,>sear009,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$02				; sprite palette

caves_05:
	.byte $43,$E2,$45,$45,$E2,$45,$44,$43
	.byte $46,$4C,$6A,$4C,$6A,$4C,$46,$43
	.byte $4D,$4D,$4D,$44,$53,$4D,$4D,$43
	.byte $43,$43,$43,$46,$54,$E2,$45,$43
	.byte $45,$E2,$44,$4B,$4B,$4C,$6A,$43
	.byte $4C,$4C,$46,$4A,$4A,$55,$4A,$43
	.byte $4D,$4D,$4D,$4D,$4D,$4D,$4D,$43
	.byte $43,$43,$43,$43,$43,$43,$43,$43
	.byte $98,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $9c,$00,<sear010,>sear010,$00, $34,$00,<sear011,>sear011,$00
	.byte $38,$00,<sear012,>sear012,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$02				; sprite palette

caves_06:
	.byte $43,$E2,$45,$E2,$45,$E2,$45,$43
	.byte $43,$4C,$4C,$6a,$6a,$6a,$6a,$43
	.byte $43,$4B,$43,$58,$58,$5B,$58,$43
	.byte $43,$4B,$43,$56,$56,$59,$56,$43
	.byte $43,$4B,$43,$56,$56,$59,$56,$43
	.byte $43,$4B,$43,$57,$57,$5A,$57,$43
	.byte $43,$4B,$43,$4D,$4D,$4B,$4D,$43
	.byte $43,$4B,$43,$43,$43,$4B,$43,$43
	.byte $98,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $38,$00,<item006,>item006,$00, $36,$00,<sear013,>sear013,$00
	.byte $3a,$00,<sear014,>sear014,$00, $3c,$00,<sear015,>sear015,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$02				; sprite palette

the_gym0:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $26,$26,$26,$26,$26,$26,$26,$26
	.byte $26,$19,$19,$60,$19,$19,$5C,$26
	.byte $26,$5E,$5D,$0D,$0D,$5E,$0D,$26
	.byte $26,$5F,$0D,$0D,$0D,$0D,$5D,$26
	.byte $26,$26,$26,$32,$26,$26,$26,$26
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $45,$4e,$00		; NPC number
	.byte $9c,$84,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $b2,$e3,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d6,$15,$02,$06,$4a, $8c,$00,<sear096,>sear096,$00
	.byte $87,$00,<sear095,>sear095,$00, $a2,$01,<sear097,>sear097,$00	; searchable areas
	.byte $b3,$02,<sear097,>sear097,$00
	.byte $00,$00				; sprite palette

policest:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$19,$19,$07,$18,$0B,$00
	.byte $00,$63,$00,$00,$10,$62,$1A,$00
	.byte $00,$64,$E9,$61,$10,$0D,$1A,$00
	.byte $00,$10,$0D,$0D,$0D,$62,$1A,$00
	.byte $00,$12,$14,$32,$14,$14,$28,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $05,$58,$00		; NPC number
	.byte $8a,$64,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $c1,$e2,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d6,$15,$05,$82,$47, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$00				; sprite palette

the_dojo:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $1A,$19,$19,$18,$19,$08,$0A,$10
	.byte $1A,$68,$5E,$65,$65,$65,$67,$10
	.byte $1A,$62,$00,$2B,$2B,$2B,$66,$10
	.byte $1A,$00,$00,$2B,$2B,$2B,$66,$10
	.byte $1A,$32,$14,$14,$14,$14,$14,$10
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $14,$3b,$16		; NPC number
	.byte $72,$68,$8d		; NPC position (lo nybble Y, hi nybble X)
	.byte $83,$81,$82		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d2,$15,$83,$84,$4d, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

underbal:
	.byte $00,$00,$00,$00,$00,$26,$0A,$26
	.byte $00,$26,$19,$29,$29,$26,$3B,$26
	.byte $00,$2C,$2B,$2A,$2A,$2C,$2B,$26
	.byte $00,$26,$2B,$2B,$2B,$0A,$2B,$26
	.byte $00,$2C,$2B,$2B,$0A,$2B,$2B,$26
	.byte $00,$26,$26,$2B,$2B,$2B,$26,$26
	.byte $00,$00,$26,$26,$26,$26,$26,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $12,$00,$00		; NPC number
	.byte $56,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $81,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $2c,$05,$81,$81,$3d, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$00				; sprite palette

tremhome:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$08,$19,$19,$19,$29,$00
	.byte $00,$0C,$2B,$2B,$2B,$2B,$2A,$00
	.byte $00,$07,$0A,$2B,$2B,$30,$1C,$00
	.byte $00,$30,$2B,$2B,$2B,$30,$31,$00
	.byte $00,$30,$2B,$34,$2B,$26,$26,$00
	.byte $00,$26,$31,$26,$26,$26,$26,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $0b,$00,$00		; NPC number
	.byte $58,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $81,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d4,$17,$89,$02,$a3, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $06,$00				; sprite palette

housegrg:
	.byte $07,$19,$19,$19,$09,$19,$07,$0B
	.byte $34,$36,$0D,$0D,$0E,$0F,$1B,$1C
	.byte $10,$0D,$0D,$0D,$0D,$14,$14,$28
	.byte $30,$2D,$2D,$29,$0D,$07,$19,$0B
	.byte $30,$2B,$2B,$2A,$0D,$22,$16,$15
	.byte $30,$2B,$2B,$31,$14,$14,$32,$28
	.byte $26,$26,$3D,$26,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$00,$56		; NPC number
	.byte $29,$00,$9d		; NPC position (lo nybble Y, hi nybble X)
	.byte $31,$00,$d1		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $c4,$05,$00,$01,$45, $bc,$15,$00,$01,$3b
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

housedbl:
	.byte $07,$19,$0B,$3D,$07,$19,$07,$0B
	.byte $34,$0D,$17,$3D,$1E,$16,$1B,$1C
	.byte $10,$0D,$15,$3D,$0D,$0D,$22,$1A
	.byte $2C,$32,$28,$3D,$34,$36,$07,$0B
	.byte $00,$00,$00,$3D,$1E,$0D,$22,$17
	.byte $00,$00,$00,$3D,$14,$14,$32,$28
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $09,$0d,$00		; NPC number
	.byte $23,$4d,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $81,$81,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $72,$15,$00,$01,$35, $bc,$15,$00,$01,$5d
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$00				; sprite palette

houselst:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$19,$18,$0B,$08,$5C,$63
	.byte $00,$11,$0D,$0D,$15,$0C,$16,$63
	.byte $00,$10,$0D,$07,$19,$19,$23,$63
	.byte $00,$34,$36,$22,$16,$16,$0D,$63
	.byte $00,$12,$14,$14,$32,$14,$14,$63
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $26,$00,$00		; NPC number
	.byte $9b,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $d2,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $b8,$15,$81,$00,$5b, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$00				; sprite palette

homesave:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$0B,$09,$18,$19,$29,$00
	.byte $00,$10,$15,$0E,$0F,$16,$1A,$00
	.byte $00,$10,$26,$07,$07,$0A,$1A,$00
	.byte $00,$10,$1F,$1E,$34,$36,$1A,$00
	.byte $00,$11,$0D,$0D,$22,$0D,$1A,$00
	.byte $00,$2C,$14,$32,$14,$14,$28,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$00,$00		; NPC number
	.byte $47,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $31,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d6,$15,$00,$01,$97, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$00				; sprite palette

homesmal:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$07,$18,$19,$07,$0B,$00
	.byte $00,$00,$0C,$0D,$16,$22,$1C,$00
	.byte $00,$00,$2C,$32,$14,$14,$28,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$2a		; NPC number
	.byte $00,$00,$99		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$e2		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $b6,$15,$81,$81,$33, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$00				; sprite palette

homefinl:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$07,$18,$26,$26,$19,$0B,$00
	.byte $00,$1B,$1C,$1D,$20,$16,$15,$00
	.byte $00,$10,$07,$34,$36,$14,$1A,$00
	.byte $00,$10,$22,$22,$0D,$26,$0B,$00
	.byte $00,$10,$0D,$07,$23,$1F,$17,$00
	.byte $00,$12,$32,$12,$14,$14,$28,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $1b,$00,$00		; NPC number
	.byte $58,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $81,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d4,$15,$81,$81,$55, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$00				; sprite palette

healthy_words:
.byte "EXTEND HEALTH "
staminy_words:
.byte "EXTEND STAMINA"
hyperplayy_words:
.byte "HYPERPLAY MAG "
powerpady_words:
.byte "     ???      "
sold_words:
.byte " SOLD OUT!!!  "

stores_lo:
.byte <store1_offset,<store2_offset,<store3_offset
stores_hi:
.byte >store1_offset,>store2_offset,>store3_offset

stores_wordy_lo:
.byte <healthy_words,<healthy_words,<staminy_words,<staminy_words
.byte <healthy_words,<healthy_words,<staminy_words,<staminy_words
.byte <healthy_words,<staminy_words,<hyperplayy_words,<powerpady_words
stores_wordy_hi:
.byte >healthy_words,>healthy_words,>staminy_words,>staminy_words
.byte >healthy_words,>healthy_words,>staminy_words,>staminy_words
.byte >healthy_words,>staminy_words,>hyperplayy_words,>powerpady_words

store1_offset:
.byte $00,$01,$02,$03
store2_offset:
.byte $04,$05,$06,$07
store3_offset:
.byte $08,$09,$0a,$0b

stores_cursor_y:
.byte $30,$40,$50,$60
stores_cursor_x:
.byte $28,$28,$28,$28

haggle_prices:
	.byte $84, $83, $48, $48
	.byte $82, $81, $48, $45
	.byte $49, $44, $43, $81
stores_prices:
	.byte $85, $84, $81, $81
	.byte $83, $82, $81, $47
	.byte $81, $45, $45, $82
stores_table:
	.addr add_to_health-1, add_to_health-1, add_to_stamina-1, add_to_stamina-1
	.addr add_to_health-1, add_to_health-1, add_to_stamina-1, add_to_stamina-1
	.addr add_to_health-1, add_to_stamina-1, get_hyperplay-1, get_powerpad-1

add_to_health:
	ldx #$00
more_health:
	lda h0, x
	bne health_again
		dex
		lda h0, x
		cmp #$09
		bne :+
			lda #$0a
			bne :++
:		lda #$09
:		inx
		sta h0, x
		inc p_health_max
		ldy temp_8bit_3
		lda #$01
		sta store_items, y
		rts
health_again:
	inx
	cpx #10
	bne more_health
	rts

add_to_stamina:
	ldx #$00
more_stamina:
	lda m0, x
	bne stamina_again
		lda #$0d
		sta m0, x
		inc p_stam_max
		ldy temp_8bit_3
		lda #$01
		sta store_items, y
		rts
stamina_again:
	inx
	cpx #8
	bne more_stamina
	rts

get_hyperplay:

		ldy temp_8bit_3
		lda #$01
		sta store_items, y
		sta npc_dialogs+29
	rts

get_powerpad:
	lda #$01
	sta pp_have
		ldy temp_8bit_3
		lda #$01
		sta store_items, y
	rts

loop_store:

	lda #$87
	sta cur_behind0+0
	lda cur_behind0+3
	clc
	adc #$08
	sta cur_behind0+3
	lda #$02
	sta cur_behind0+2
	lda #$1d
	sta cur_behind0+1
	lda #$0f
	sta pal_address+26

	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq no_b_str
		lda #$ef
		sta cursor+0
		sta cur_behind0+0
		lda p_pos
		clc
		adc #$10
		sta p_pos
		lda #$00
		sta temp_8bit_1
		sta temp_8bit_2
		sta temp_8bit_3
		sta temp_8bit_4
		ldx #$00
		txa
:		sta btl_letters, x
		inx
		cpx #$10
		bne :-
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
		lda #<nmi_empty
		sta nmi_pointer+0
		lda #>nmi_empty
		sta nmi_pointer+1
		jmp return_from_store

no_b_str:
	ldx temp_8bit_2
	lda stores_lo, x
	sta temp_16bit_1+0
	lda stores_hi, x
	sta temp_16bit_1+1
	ldy temp_8bit_1
	lda (temp_16bit_1), y
	sta temp_8bit_3

	ldx temp_8bit_3
	lda store_items, x
	beq :+
		lda #<sold_words
		sta temp_16bit_2+0
		lda #>sold_words
		sta temp_16bit_2+1
		jmp :++
:	lda stores_wordy_lo, x
	sta temp_16bit_2+0
	lda stores_wordy_hi, x
	sta temp_16bit_2+1
:

	lda games+7
	and #$c0
	beq :+
		jsr haggle_price_list
		jmp :++
:	jsr store_price_list
:

;	lda #$28
;	sta cursor+3
	ldx temp_8bit_1
	lda stores_cursor_x, x
	sta cursor+3
	lda stores_cursor_y, x
	sta cursor+0
	lda #$1f
	sta cursor+1


	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq no_a_str
		ldy temp_8bit_3
		lda store_items, y
		bne no_a_str
			lda games+7
			and #$c0
			beq :+
				lda haggle_prices, y
				and #$80
				bne do_hun_str
				beq :++
:			lda stores_prices, y
			and #$80
			bne do_hun_str
:
			lda games+7
			and #$c0
			beq :+
				jsr haggling_prices_tens
				jmp looper
:			jsr regular_prices_tens
			jmp looper
do_hun_str:
			lda games+7
			and #$c0
			beq :+
				jsr haggling_prices_huns
				jmp looper
:			jsr regular_prices_huns
			jmp looper

no_a_str:

	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq no_up_str
		lda temp_8bit_1
		beq no_dn_str
			dec temp_8bit_1
			jsr store_beep
			jmp no_dn_str
no_up_str:
	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq no_dn_str
		lda temp_8bit_1
		cmp #$03
		beq no_dn_str
			inc temp_8bit_1
			jsr store_beep
no_dn_str:


	lda temp_8bit_1
	pha
	lda temp_8bit_2
	pha
	lda temp_8bit_3
	pha
	lda #$01
	sta npc_anim_state
	jsr store_owner
	pla
	sta temp_8bit_3
	pla
	sta temp_8bit_2
	pla
	sta temp_8bit_1

looper:
	jsr p_anim
	jsr p_tie_sprites
	jmp end_loop

nmi_store:
	lda #$22
	sta $2006
	lda #$2a
	sta $2006
	ldy #$00
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
	iny
	lda (temp_16bit_2), y
	sta $2007
			lda #<nmi_store2
			sta nmi_pointer+0
			lda #>nmi_store2
			sta nmi_pointer+1
	jmp end_nmi

nmi_store2:
	ldy #$00
	lda #$20
	sta $2006
	lda #$d6
	sta $2006
	lda (temp_16bit_1), y
	tax
	lda store_items, x
	beq :+
		lda #$00
		sta $2007
		sta $2007
		beq :++
:	lda #$2c
	sta $2007
	lda #$2d
	sta $2007
:
;	jsr got_or_not
	iny
	lda #$21
	sta $2006
	lda #$16
	sta $2006
	lda (temp_16bit_1), y
	tax
	lda store_items, x
	beq :+
		lda #$00
		sta $2007
		sta $2007
		beq :++
:	lda #$2c
	sta $2007
	lda #$2d
	sta $2007
:
;	jsr got_or_not
	iny
	lda #$21
	sta $2006
	lda #$56
	sta $2006
	lda (temp_16bit_1), y
	tax
	lda store_items, x
	beq :+
		lda #$00
		sta $2007
		sta $2007
		beq :++
:	lda #$2c
	sta $2007
	lda #$2d
	sta $2007
:
;	jsr got_or_not
	iny
	lda #$21
	sta $2006
	lda #$96
	sta $2006
	lda (temp_16bit_1), y
	tax
	lda store_items, x
	beq :+
		lda #$00
		sta $2007
		sta $2007
		beq :++
:	lda #$2c
	sta $2007
	lda #$2d
	sta $2007
:
;	jsr got_or_not

			lda #<nmi_store3
			sta nmi_pointer+0
			lda #>nmi_store3
			sta nmi_pointer+1
	jmp end_nmi
nmi_store3:

	lda #$22
	sta $2006
	lda #$c9
	sta $2006
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
;	lda man0+0
;	sta $2007
;	lda man0+1
;	sta $2007
;	lda man0+2
;	sta $2007
			lda #<nmi_store4
			sta nmi_pointer+0
			lda #>nmi_store4
			sta nmi_pointer+1
	jmp end_nmi
nmi_store4:
	lda #$20
	sta $2006
	lda #$d8
	sta $2006
	lda btl_letters+0
	sta $2007
	lda btl_letters+1
	sta $2007
	lda btl_letters+2
	sta $2007
	lda #$21
	sta $2006
	lda #$18
	sta $2006
	lda btl_letters+3
	sta $2007
	lda btl_letters+4
	sta $2007
	lda btl_letters+5
	sta $2007
	lda #$21
	sta $2006
	lda #$58
	sta $2006
	lda btl_letters+6
	sta $2007
	lda btl_letters+7
	sta $2007
	lda btl_letters+8
	sta $2007
	lda #$21
	sta $2006
	lda #$98
	sta $2006
	lda btl_letters+9
	sta $2007
	lda btl_letters+10
	sta $2007
	lda btl_letters+11
	sta $2007
			lda #<nmi_store5
			sta nmi_pointer+0
			lda #>nmi_store5
			sta nmi_pointer+1
	jmp end_nmi
nmi_store5:
	lda games+7
	and #$c0
	beq :+
	lda #$23
	sta $2006
	lda #$05
	sta $2006
	lda #$04
	sta $2007
	lda #$48
	sta $2007
	lda #$41
	sta $2007
	lda #$47
	sta $2007
	sta $2007
	lda #$4c
	sta $2007
	lda #$45
	sta $2007
	lda #$05
	sta $2007

	lda #$23
	sta $2006
	lda #$25
	sta $2006
	lda #$06
	sta $2007
	lda #$07
	sta $2007
	sta $2007
	sta $2007
	sta $2007
	sta $2007
	sta $2007
	lda #$08
	sta $2007
:
			lda #<nmi_store
			sta nmi_pointer+0
			lda #>nmi_store
			sta nmi_pointer+1
	jmp end_nmi


got_or_not:
	lda (temp_16bit_1), y
	tax
	lda store_items, x
	beq :+
		lda #$00
		sta $2007
		sta $2007
		beq :++
:	lda #$2c
	sta $2007
	lda #$2d
	sta $2007
:
	rts


store_jumper:
	lda temp_8bit_3
	asl a
	tay
	lda stores_table+1, y
	pha
	lda stores_table+0, y
	pha
	rts

store_price_list:
	lda temp_8bit_2
	beq :+
		jmp @store2
:		lda store_items+0
		bne :+
			lda #$35
			sta btl_letters+0
			lda #$30
			sta btl_letters+1
			lda #$30
			sta btl_letters+2
			bne :++
:		lda #$5e
		sta btl_letters+0
		sta btl_letters+1
		sta btl_letters+2
:		lda store_items+1
		bne :+
			lda #$34
			sta btl_letters+3
			lda #$30
			sta btl_letters+4
			lda #$30
			sta btl_letters+5
			bne :++
:		lda #$5e
		sta btl_letters+3
		sta btl_letters+4
		sta btl_letters+5
:		lda store_items+2
		bne :+
			lda #$31
			sta btl_letters+6
			lda #$30
			sta btl_letters+7
			lda #$30
			sta btl_letters+8
			bne :++
:		lda #$5e
		sta btl_letters+6
		sta btl_letters+7
		sta btl_letters+8
:		lda store_items+3
		bne :+
			lda #$31
			sta btl_letters+9
			lda #$30
			sta btl_letters+10
			lda #$30
			sta btl_letters+11
			bne :++
:		lda #$5e
		sta btl_letters+9
		sta btl_letters+10
		sta btl_letters+11
:		rts
@store2:
	cmp #$01
	beq :+
		jmp @store3
:		lda store_items+4
		bne :+
			lda #$33
			sta btl_letters+0
			lda #$30
			sta btl_letters+1
			lda #$30
			sta btl_letters+2
			bne :++
:		lda #$5e
		sta btl_letters+0
		sta btl_letters+1
		sta btl_letters+2
:		lda store_items+5
		bne :+
			lda #$32
			sta btl_letters+3
			lda #$30
			sta btl_letters+4
			lda #$30
			sta btl_letters+5
			bne :++
:		lda #$5e
		sta btl_letters+3
		sta btl_letters+4
		sta btl_letters+5
:		lda store_items+6
		bne :+
			lda #$31
			sta btl_letters+6
			lda #$30
			sta btl_letters+7
			lda #$30
			sta btl_letters+8
			bne :++
:		lda #$5e
		sta btl_letters+6
		sta btl_letters+7
		sta btl_letters+8
:		lda store_items+7
		bne :+
			lda #$00
			sta btl_letters+9
			lda #$37
			sta btl_letters+10
			lda #$30
			sta btl_letters+11
			bne :++
:		lda #$5e
		sta btl_letters+9
		sta btl_letters+10
		sta btl_letters+11
:		rts

@store3:
		lda store_items+8
		bne :+
			lda #$31
			sta btl_letters+0
			lda #$30
			sta btl_letters+1
			lda #$30
			sta btl_letters+2
			bne :++
:		lda #$5e
		sta btl_letters+0
		sta btl_letters+1
		sta btl_letters+2
:		lda store_items+9
		bne :+
			lda #$00
			sta btl_letters+3
			lda #$35
			sta btl_letters+4
			lda #$30
			sta btl_letters+5
			bne :++
:		lda #$5e
		sta btl_letters+3
		sta btl_letters+4
		sta btl_letters+5
:		lda store_items+10
		bne :+
			lda #$00
			sta btl_letters+6
			lda #$35
			sta btl_letters+7
			lda #$30
			sta btl_letters+8
			bne :++
:		lda #$5e
		sta btl_letters+6
		sta btl_letters+7
		sta btl_letters+8
:		lda store_items+11
		bne :+
			lda #$32
			sta btl_letters+9
			lda #$30
			sta btl_letters+10
			lda #$30
			sta btl_letters+11
			bne :++
:		lda #$5e
		sta btl_letters+9
		sta btl_letters+10
		sta btl_letters+11
:
	rts



haggle_price_list:
	lda temp_8bit_2
	beq :+
		jmp @store2
:		lda store_items+0
		bne :+
			lda #$34
			sta btl_letters+0
			lda #$30
			sta btl_letters+1
			lda #$30
			sta btl_letters+2
			bne :++
:		lda #$5e
		sta btl_letters+0
		sta btl_letters+1
		sta btl_letters+2
:		lda store_items+1
		bne :+
			lda #$33
			sta btl_letters+3
			lda #$30
			sta btl_letters+4
			lda #$30
			sta btl_letters+5
			bne :++
:		lda #$5e
		sta btl_letters+3
		sta btl_letters+4
		sta btl_letters+5
:		lda store_items+2
		bne :+
			lda #$00
			sta btl_letters+6
			lda #$38
			sta btl_letters+7
			lda #$30
			sta btl_letters+8
			bne :++
:		lda #$5e
		sta btl_letters+6
		sta btl_letters+7
		sta btl_letters+8
:		lda store_items+3
		bne :+
			lda #$00
			sta btl_letters+9
			lda #$38
			sta btl_letters+10
			lda #$30
			sta btl_letters+11
			bne :++
:		lda #$5e
		sta btl_letters+9
		sta btl_letters+10
		sta btl_letters+11
:		rts
@store2:
	cmp #$01
	beq :+
		jmp @store3
:		lda store_items+4
		bne :+
			lda #$32
			sta btl_letters+0
			lda #$30
			sta btl_letters+1
			lda #$30
			sta btl_letters+2
			bne :++
:		lda #$5e
		sta btl_letters+0
		sta btl_letters+1
		sta btl_letters+2
:		lda store_items+5
		bne :+
			lda #$31
			sta btl_letters+3
			lda #$30
			sta btl_letters+4
			lda #$30
			sta btl_letters+5
			bne :++
:		lda #$5e
		sta btl_letters+3
		sta btl_letters+4
		sta btl_letters+5
:		lda store_items+6
		bne :+
			lda #$00
			sta btl_letters+6
			lda #$38
			sta btl_letters+7
			lda #$30
			sta btl_letters+8
			bne :++
:		lda #$5e
		sta btl_letters+6
		sta btl_letters+7
		sta btl_letters+8
:		lda store_items+7
		bne :+
			lda #$00
			sta btl_letters+9
			lda #$35
			sta btl_letters+10
			lda #$30
			sta btl_letters+11
			bne :++
:		lda #$5e
		sta btl_letters+9
		sta btl_letters+10
		sta btl_letters+11
:		rts

@store3:
		lda store_items+8
		bne :+
			lda #$00
			sta btl_letters+0
			lda #$39
			sta btl_letters+1
			lda #$30
			sta btl_letters+2
			bne :++
:		lda #$5e
		sta btl_letters+0
		sta btl_letters+1
		sta btl_letters+2
:		lda store_items+9
		bne :+
			lda #$00
			sta btl_letters+3
			lda #$34
			sta btl_letters+4
			lda #$30
			sta btl_letters+5
			bne :++
:		lda #$5e
		sta btl_letters+3
		sta btl_letters+4
		sta btl_letters+5
:		lda store_items+10
		bne :+
			lda #$00
			sta btl_letters+6
			lda #$33
			sta btl_letters+7
			lda #$30
			sta btl_letters+8
			bne :++
:		lda #$5e
		sta btl_letters+6
		sta btl_letters+7
		sta btl_letters+8
:		lda store_items+11
		bne :+
			lda #$31
			sta btl_letters+9
			lda #$30
			sta btl_letters+10
			lda #$30
			sta btl_letters+11
			bne :++
:		lda #$5e
		sta btl_letters+9
		sta btl_letters+10
		sta btl_letters+11
:
	rts






regular_prices_tens:
				lda stores_prices, y
				and #$0f
				clc
				adc #$30
				sta temp_8bit_4
				lda man0+1
				cmp temp_8bit_4
				bcc @test_huns
@back_to_deduct:
					lda stores_prices, y
					and #$0f
					tax
:					lda man0+1
					cmp #$30
					bne :+
						lda #$3a
						sta man0+1
:					dec man0+1
					dex
					bne :--
					jsr store_jumper
					jsr store_get
					rts	;jmp looper
@test_huns:
				lda man0+0
				cmp #$30
				beq :+
					dec man0+0
					jmp @back_to_deduct
:					rts
haggling_prices_tens:
				lda haggle_prices, y
				and #$0f
				clc
				adc #$30
				sta temp_8bit_4
				lda man0+1
				cmp temp_8bit_4
				bcc @test_huns
@back_to_deduct:
					lda haggle_prices, y
					and #$0f
					tax
:					lda man0+1
					cmp #$30
					bne :+
						lda #$3a
						sta man0+1
:					dec man0+1
					dex
					bne :--
					jsr store_jumper
					jsr store_get
					rts	;jmp looper
@test_huns:
				lda man0+0
				cmp #$30
				beq :+
					dec man0+0
					jmp @back_to_deduct
:					rts
regular_prices_huns:
			lda stores_prices, y
			and #$0f
			clc
			adc #$30
			sta temp_8bit_4
			lda man0+0
			cmp temp_8bit_4
			bcc :+
				lda temp_8bit_4
				and #$0f
				sta temp_8bit_4
				lda man0+0
				sec
				sbc temp_8bit_4
				sta man0+0
				jsr store_jumper
				jsr store_get
:				rts;	jmp looper
haggling_prices_huns:
			lda haggle_prices, y
			and #$0f
			clc
			adc #$30
			sta temp_8bit_4
			lda man0+0
			cmp temp_8bit_4
			bcc :+
				lda temp_8bit_4
				and #$0f
				sta temp_8bit_4
				lda man0+0
				sec
				sbc temp_8bit_4
				sta man0+0
				jsr store_jumper
				jsr store_get
:				rts;	jmp looper


; ORIGINAL
;			lda stores_prices, y
;			and #$80
;			bne do_hun_str
;				lda stores_prices, y
;				and #$0f
;				clc
;				adc #$30
;				sta temp_8bit_4
;				lda man0+1
;				cmp temp_8bit_4
;				bcc test_huns
;back_to_deduct:
;					lda stores_prices, y
;					and #$0f
;					tax
;:					lda man0+1
;					cmp #$30
;					bne :+
;						lda #$3a
;						sta man0+1
;:					dec man0+1
;					dex
;					bne :--
;					jsr store_jumper
;					jsr store_get
;					jmp looper
;test_huns:
;				lda man0+0
;				cmp #$30
;				beq no_a_str
;					dec man0+0
;					jmp back_to_deduct

; ORIGINAL HUNS
;			lda stores_prices, y
;			and #$0f
;			clc
;			adc #$30
;			sta temp_8bit_4
;			lda man0+0
;			cmp temp_8bit_4
;			bcc no_a_str
;				lda temp_8bit_4
;				and #$0f
;				sta temp_8bit_4
;				lda man0+0
;				sec
;				sbc temp_8bit_4
;				sta man0+0
;				jsr store_jumper
;				jsr store_get
;					jmp looper

