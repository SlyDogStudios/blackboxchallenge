
	ldy temp_8bit_1
	lda (temp_16bit_1), y
	tay
	lda overworld_tile32a, y
	tax
		lda overworld_tile16a, x
		sta store_meta16+0
		lda overworld_tile16b, x
		sta store_meta16+1
		lda overworld_tile16c, x
		sta store_meta16+4
		lda overworld_tile16d, x
		sta store_meta16+5
		lda overworld_tile16e, x
		sta store_coll0+0
	lda overworld_tile32b, y
	tax
		lda overworld_tile16a, x
		sta store_meta16+2
		lda overworld_tile16b, x
		sta store_meta16+3
		lda overworld_tile16c, x
		sta store_meta16+6
		lda overworld_tile16d, x
		sta store_meta16+7
		lda overworld_tile16e, x
		sta store_coll0+1
	lda overworld_tile32c, y
	tax
		lda overworld_tile16a, x
		sta store_meta16+8
		lda overworld_tile16b, x
		sta store_meta16+9
		lda overworld_tile16c, x
		sta store_meta16+12
		lda overworld_tile16d, x
		sta store_meta16+13
		lda overworld_tile16e, x
		sta store_coll0+2
	lda overworld_tile32d, y
	tax
		lda overworld_tile16a, x
		sta store_meta16+10
		lda overworld_tile16b, x
		sta store_meta16+11
		lda overworld_tile16c, x
		sta store_meta16+14
		lda overworld_tile16d, x
		sta store_meta16+15
		lda overworld_tile16e, x
		sta store_coll0+3
	lda overworld_tile32e, y
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


	.byte <pal_trees,<pal_sand,<pal_isle,<pal_lift,<pal_carn,<pal_ship,<pal_hide,<pal_bish
	.byte <pal_sand,<pal_sand,<pal_sand,<pal_sand,<pal_sand,<pal_sand

	.byte >pal_trees,>pal_sand,>pal_isle,>pal_lift,>pal_carn,>pal_ship,>pal_hide,>pal_bish
	.byte >pal_sand,>pal_sand,>pal_sand,>pal_sand,>pal_sand,>pal_sand

pal_trees:
.byte $0f,$30,$19,$10, $0f,$07,$19,$2a, $0f,$16,$19,$27, $0f,$11,$31,$2c
.byte $0f,$37,$11,$17, $0f,$37,$11,$27, $0f,$36,$00,$17, $0f,$17,$30,$07	; pal1=xavier, pal2=smyl, pal3=boulder
pal_sand:
.byte $0f,$30,$19,$10, $0f,$07,$19,$2a, $0f,$29,$28,$27, $0f,$11,$31,$2c
.byte $0f,$37,$11,$17, $0f,$37,$30,$16, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_isle:
.byte $0f,$30,$19,$10, $0f,$07,$19,$2a, $0f,$29,$28,$27, $0f,$11,$31,$2c
.byte $0f,$37,$11,$17, $0f,$00,$10,$0f, $0f,$36,$17,$27, $0f,$17,$1c,$0f	; pal1=elecdoor
pal_lift:
.byte $0f,$30,$19,$10, $0f,$07,$17,$2a, $0f,$16,$19,$27, $0f,$11,$31,$0f
.byte $0f,$37,$11,$17, $0f,$37,$11,$27, $0f,$36,$00,$17, $0f,$17,$30,$07
pal_carn:
.byte $0f,$30,$19,$10, $0f,$19,$06,$28, $0f,$17,$16,$27, $0f,$17,$07,$03
.byte $0f,$37,$11,$17, $0f,$37,$11,$27, $0f,$36,$00,$17, $0f,$17,$30,$07
pal_ship:
.byte $0f,$30,$19,$10, $0f,$07,$19,$2a, $0f,$16,$19,$27, $0f,$11,$31,$03
.byte $0f,$37,$11,$17, $0f,$37,$11,$27, $0f,$36,$00,$17, $0f,$17,$30,$07
pal_bish:
.byte $0f,$30,$19,$10, $0f,$07,$19,$2a, $0f,$29,$28,$27, $0f,$11,$31,$2c
.byte $0f,$37,$11,$17, $0f,$37,$30,$16, $0f,$36,$17,$27, $0f,$37,$30,$16	; pal3=bishop
pal_hide:
.byte $0f,$30,$19,$10, $0f,$07,$19,$2a, $0f,$29,$28,$27, $0f,$11,$31,$2c
.byte $0f,$37,$11,$17, $0f,$37,$16,$30, $0f,$37,$16,$30, $0f,$17,$1c,$0f

overworld_tile16a:
	.byte $00,$01,$02,$02,$04,$00,$04,$00,$00,$13,$11,$0E,$22,$E0,$f0,$E4
	.byte $E6,$E8,$20,$0F,$15,$10,$0F,$15,$0F,$0E,$0F,$EA,$EA,$0F,$0E,$18
	.byte $10,$29,$10,$10,$16,$10,$1A,$10,$16,$10,$18,$FC,$60,$0E,$63,$0E
	.byte $0F,$0E,$65,$67,$77,$EE,$63,$0F,$6B,$6D,$80,$82,$A8,$84,$A0,$0F
	.byte $C0,$A2,$C2,$A4,$A6,$C4,$C6,$C8,$87,$96,$10,$89,$8B,$8D,$8F,$9F
	.byte $1A,$8F,$9F,$16,$AC,$AE,$8F,$8F,$CC,$00,$00,$CD,$CD,$CE,$AA,$AA
	.byte $84,$AB,$6F,$87,$00,$0E,$13
overworld_tile16b:
	.byte $00,$02,$02,$03,$00,$05,$00,$00,$05,$14,$12,$0E,$22,$E1,$E3,$E5
	.byte $E7,$E9,$0F,$21,$0F,$10,$25,$0F,$1F,$1E,$0F,$EB,$EB,$0F,$0E,$10
	.byte $19,$10,$19,$10,$16,$10,$16,$10,$1B,$28,$10,$FD,$61,$0E,$0F,$0E
	.byte $73,$0E,$66,$68,$78,$EF,$0F,$73,$6C,$6E,$81,$83,$A9,$85,$A1,$0F
	.byte $C1,$A3,$C3,$A5,$A7,$C5,$C7,$C9,$87,$96,$10,$8A,$8C,$8E,$8F,$9F
	.byte $16,$8F,$9F,$16,$AD,$AF,$8F,$8F,$00,$CF,$CD,$CD,$00,$CE,$AA,$AA
	.byte $85,$BB,$8F,$88,$00,$0E,$7A
overworld_tile16c:
	.byte $00,$04,$00,$00,$04,$00,$06,$07,$07,$23,$0E,$0E,$22,$F0,$F2,$F4
	.byte $F6,$F8,$0F,$21,$25,$10,$25,$0F,$0F,$0E,$0F,$FA,$FA,$2C,$2D,$18
	.byte $10,$10,$17,$17,$10,$10,$18,$27,$10,$10,$1C,$FC,$70,$62,$64,$0E
	.byte $0F,$EC,$75,$77,$69,$FE,$63,$0F,$7B,$7D,$90,$92,$B8,$94,$B0,$20
	.byte $D0,$B2,$D2,$B4,$B6,$D4,$D6,$D8,$87,$96,$10,$99,$9B,$9D,$8F,$9F
	.byte $1C,$8F,$9F,$17,$BC,$BE,$8F,$CD,$DC,$DE,$79,$7F,$7F,$CE,$BA,$00
	.byte $94,$7D,$8F,$79,$00,$0E,$23
overworld_tile16d:
	.byte $00,$00,$00,$05,$00,$05,$07,$07,$08,$24,$0E,$0E,$22,$F0,$F3,$F5
	.byte $F7,$F9,$20,$0F,$0F,$10,$0F,$15,$0F,$0E,$0F,$FB,$FB,$0F,$0E,$10
	.byte $19,$10,$1D,$17,$10,$26,$10,$10,$19,$10,$17,$FD,$71,$0E,$0F,$72
	.byte $74,$ED,$76,$78,$6A,$FF,$0F,$73,$7C,$7E,$91,$93,$B9,$95,$B1,$21
	.byte $D1,$B3,$D3,$B5,$B7,$D5,$D7,$D9,$87,$96,$10,$9A,$9C,$9E,$8F,$9F
	.byte $17,$8F,$9F,$17,$BD,$BF,$8F,$CD,$DD,$DF,$7F,$7F,$79,$CE,$00,$BA
	.byte $95,$7E,$8F,$79,$00,$2E,$F1
overworld_tile16e:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$03,$00,$00,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$01,$00,$09,$00
	.byte $08,$00,$00,$00,$00,$01,$09,$08,$01,$00,$00,$00,$0b,$0a,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$01,$00,$01,$01,$00,$00,$00,$01,$05,$07
	.byte $01,$04,$06,$01,$01,$01,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $0c,$01,$00,$01,$01,$00,$01

overworld_tile32a:
	.byte $00,$01,$02,$02,$04,$00,$00,$09,$09,$0B,$09,$0B,$0A,$0B,$0C,$0B
	.byte $0E,$0B,$0A,$0A,$12,$0B,$0B,$0A,$0B,$0B,$0B,$09,$0B,$0C,$09,$0C
	.byte $0B,$17,$1A,$0B,$0A,$0A,$1A,$0B,$1F,$21,$26,$24,$24,$1F,$24,$15
	.byte $1F,$26,$26,$24,$26,$1F,$15,$15,$15,$21,$21,$1F,$24,$15,$0B,$2C
	.byte $2C,$2D,$0B,$09,$0B,$0B,$24,$1B,$09,$31,$33,$0C,$0A,$17,$36,$0B
	.byte $0B,$38,$38,$3A,$38,$3A,$3A,$3A,$38,$38,$3A,$0B,$3B,$0B,$0B,$0B
	.byte $0B,$0B,$0A,$15,$39,$26,$0B,$0B,$42,$0B,$2C,$15,$46,$46,$15,$15
	.byte $15,$46,$15,$15,$15,$15,$2C,$0B,$48,$48,$56,$48,$49,$48,$4A,$48
	.byte $56,$48,$49,$56,$56,$49,$48,$4D,$56,$48,$0B,$28,$15,$15,$26,$50
	.byte $24,$53,$24,$26,$3D,$3A,$2A,$24,$15,$15,$0A,$2C,$3A,$38,$15,$0B
	.byte $0B,$5D,$5D,$0B,$5D,$5D,$5D,$5B,$5B,$5C,$5D,$00,$5D,$00,$0B,$5D
	.byte $00,$00,$5D,$5D,$58,$00,$00,$58,$56,$00,$00,$00,$00,$00,$00,$56
	.byte $56,$56,$00,$57,$56,$0B,$5D,$00,$5D,$5D,$00,$5D,$12,$09,$15,$0B
	.byte $60,$56,$48,$61,$56,$48,$64,$56,$49,$33,$64,$48,$62,$0A,$0B,$0B
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
overworld_tile32b:
	.byte $00,$02,$02,$03,$00,$00,$05,$09,$09,$0B,$0B,$09,$0B,$0A,$0C,$0B
	.byte $0B,$0B,$0A,$0A,$13,$0B,$0B,$09,$15,$0B,$0B,$0B,$09,$0C,$0B,$0B
	.byte $0C,$17,$18,$19,$0A,$0A,$1A,$0B,$20,$20,$24,$24,$28,$29,$28,$20
	.byte $15,$24,$24,$28,$28,$20,$15,$29,$15,$15,$29,$15,$24,$29,$2B,$2C
	.byte $2C,$0B,$2F,$0A,$09,$11,$24,$0B,$1C,$0B,$24,$0B,$0B,$37,$17,$0B
	.byte $0B,$38,$3A,$3A,$3A,$3A,$38,$3A,$38,$38,$3A,$15,$0B,$0B,$3F,$40
	.byte $0B,$09,$0A,$15,$15,$28,$3F,$0B,$0B,$3F,$2C,$20,$46,$15,$46,$15
	.byte $15,$15,$46,$15,$15,$45,$0B,$3C,$48,$56,$48,$48,$49,$56,$20,$48
	.byte $56,$49,$56,$4C,$4B,$48,$48,$56,$48,$48,$44,$4E,$23,$20,$28,$24
	.byte $20,$24,$24,$24,$3A,$3A,$15,$15,$22,$28,$09,$2C,$2C,$32,$15,$0B
	.byte $5D,$5D,$0B,$0B,$5D,$5D,$5A,$5B,$5B,$5D,$00,$5D,$00,$5D,$5D,$0B
	.byte $00,$00,$5D,$5D,$00,$00,$00,$00,$56,$59,$00,$00,$59,$00,$56,$00
	.byte $56,$56,$57,$00,$56,$5D,$0B,$5D,$00,$5D,$00,$5D,$13,$09,$15,$0B
	.byte $38,$56,$48,$49,$56,$63,$64,$56,$54,$64,$48,$48,$56,$0A,$19,$09
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
overworld_tile32c:
	.byte $00,$04,$00,$00,$06,$07,$07,$09,$0A,$09,$09,$0B,$0B,$0B,$0C,$0B
	.byte $0B,$10,$0F,$0B,$12,$14,$0B,$0B,$0B,$09,$0B,$0A,$0B,$11,$09,$0C
	.byte $0B,$16,$1A,$0B,$1B,$0B,$1D,$1E,$1F,$23,$1F,$23,$27,$2A,$15,$23
	.byte $2A,$1F,$2A,$23,$1F,$2A,$15,$15,$27,$27,$15,$1F,$27,$15,$0B,$2C
	.byte $2C,$2E,$14,$09,$09,$0B,$15,$0B,$0A,$0B,$34,$0B,$35,$16,$2E,$0B
	.byte $2D,$38,$38,$3A,$3A,$38,$3A,$38,$3A,$38,$14,$14,$0B,$0B,$0B,$0B
	.byte $0B,$09,$14,$23,$1F,$2A,$14,$0B,$14,$0B,$0B,$15,$46,$46,$15,$15
	.byte $46,$15,$15,$15,$46,$46,$2C,$0B,$49,$48,$56,$48,$56,$56,$56,$48
	.byte $48,$48,$56,$56,$56,$56,$49,$56,$48,$49,$0B,$15,$22,$2A,$15,$4F
	.byte $23,$52,$23,$15,$38,$38,$4F,$23,$20,$23,$0D,$0B,$2C,$38,$15,$0B
	.byte $5D,$5D,$5D,$5D,$5D,$00,$00,$54,$00,$48,$5D,$00,$5D,$5D,$0B,$5D
	.byte $5D,$00,$00,$5D,$00,$00,$58,$58,$56,$00,$59,$00,$00,$56,$56,$56
	.byte $57,$56,$00,$00,$57,$0B,$0B,$00,$00,$0B,$5D,$5D,$5E,$09,$2A,$0B
	.byte $3A,$56,$49,$56,$56,$49,$64,$48,$56,$34,$64,$49,$56,$1E,$2D,$66
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
overworld_tile32d:
	.byte $00,$00,$00,$05,$07,$07,$08,$09,$0A,$09,$0B,$09,$0B,$0B,$0C,$0D
	.byte $0B,$0B,$0B,$0B,$13,$14,$0B,$09,$15,$0B,$09,$0B,$0A,$0C,$09,$0B
	.byte $0C,$16,$1A,$0B,$0B,$1C,$1A,$0B,$20,$22,$25,$23,$20,$23,$20,$22
	.byte $23,$15,$23,$22,$20,$22,$15,$25,$25,$15,$15,$15,$15,$15,$0B,$2C
	.byte $32,$14,$30,$0B,$09,$0B,$15,$0B,$0B,$0B,$23,$0B,$09,$30,$16,$2F
	.byte $0B,$38,$38,$3A,$3A,$3A,$3A,$38,$3A,$43,$14,$14,$0B,$3E,$3F,$3F
	.byte $3F,$0A,$14,$23,$15,$22,$14,$41,$0B,$1A,$47,$20,$46,$15,$46,$15
	.byte $46,$15,$15,$46,$15,$46,$3D,$0B,$49,$56,$48,$48,$56,$56,$56,$49
	.byte $48,$56,$56,$56,$56,$48,$48,$56,$48,$56,$0D,$24,$51,$22,$20,$1F
	.byte $22,$2A,$22,$15,$38,$3C,$1F,$23,$52,$22,$09,$0B,$2C,$38,$3C,$5D
	.byte $5D,$5D,$5D,$0B,$00,$5D,$48,$00,$54,$00,$00,$5D,$5D,$5D,$5D,$0B
	.byte $00,$5D,$5D,$00,$00,$58,$00,$00,$56,$00,$00,$59,$59,$56,$56,$56
	.byte $56,$57,$00,$00,$57,$0B,$0B,$00,$00,$0B,$5D,$5D,$5F,$10,$23,$60
	.byte $3A,$56,$61,$56,$62,$54,$64,$63,$56,$64,$48,$00,$1C,$0B,$65,$0A
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
overworld_tile32e:
	.byte $00,$00,$00,$00,$00,$00,$00,$55,$55,$55,$55,$55,$55,$55,$55,$00
	.byte $02,$00,$05,$55,$00,$00,$00,$55,$55,$55,$55,$55,$55,$45,$55,$55
	.byte $55,$00,$00,$00,$65,$95,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$55,$55
	.byte $55,$00,$00,$55,$55,$AA,$FF,$AA,$59,$AA,$CC,$55,$65,$00,$00,$00
	.byte $00,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$0A,$05,$00,$AA,$00,$00
	.byte $00,$55,$05,$FF,$FC,$FF,$00,$AA,$00,$00,$15,$FF,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$11,$0C,$55,$55,$55,$55,$55,$55,$5F,$55
	.byte $55,$55,$55,$51,$51,$55,$55,$55,$55,$55,$04,$F7,$7F,$FF,$FF,$DF
	.byte $FF,$DF,$FF,$FF,$AA,$EA,$DF,$FF,$7F,$FF,$45,$55,$56,$AA,$C0,$80
	.byte $68,$5A,$92,$20,$16,$49,$C9,$3A,$CA,$36,$22,$88,$92,$68,$48,$12
	.byte $20,$80,$49,$16,$00,$00,$00,$00,$FF,$00,$00,$00,$00,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$04,$01,$04,$01,$05,$A0,$9A,$A0,$15,$FF,$00
	.byte $AA,$55,$95,$56,$55,$D5,$55,$55,$5D,$00,$44,$55,$95,$45,$00,$55
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

carniva1:
	.byte $16,$9F,$A0,$A1,$A1,$A2,$A3,$16
	.byte $9F,$A4,$A6,$A7,$A8,$A9,$A5,$A3
	.byte $A0,$B5,$B4,$BD,$BD,$B9,$BA,$A2
	.byte $AA,$B6,$BE,$B8,$B8,$BF,$BB,$AB
	.byte $AA,$B7,$C0,$B8,$B8,$C1,$BC,$AB
	.byte $AC,$B5,$C2,$C4,$C4,$C3,$BA,$AD
	.byte $AE,$B0,$B4,$00,$00,$B9,$B1,$AF
	.byte $16,$B2,$AC,$00,$00,$AD,$B3,$16
	.byte $20,$49,$00		; NPC number
	.byte $37,$8a,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $b1,$c2,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$00				; sprite palette

carniva0:
	.byte $16,$C5,$AA,$00,$00,$AB,$C6,$16
	.byte $9F,$A1,$C8,$00,$00,$C7,$A1,$A3
	.byte $A0,$00,$BA,$00,$00,$B5,$00,$A2
	.byte $AA,$B8,$BC,$00,$00,$B7,$B8,$AB
	.byte $AA,$C4,$BC,$00,$00,$B7,$C4,$AB
	.byte $A1,$CA,$00,$00,$00,$00,$CA,$A1
	.byte $16,$C9,$A1,$CB,$AB,$A1,$C9,$16
	.byte $16,$16,$16,$C5,$C5,$16,$16,$16
	.byte $3d,$00,$44		; NPC number
	.byte $72,$00,$7d		; NPC position (lo nybble Y, hi nybble X)
	.byte $a3,$00,$a2		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d8,$05,$84,$00,$57, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$00				; sprite palette

ski_lift:
	.byte $6C,$6C,$6C,$6C,$6C,$6C,$6C,$6C
	.byte $6C,$73,$70,$70,$74,$6F,$31,$46
	.byte $6C,$6E,$6C,$6C,$6D,$6F,$30,$63
	.byte $6C,$6E,$7B,$78,$79,$78,$78,$7B
	.byte $6C,$6E,$7B,$B7,$79,$B7,$BC,$7B
	.byte $70,$6F,$7B,$B7,$82,$B7,$BC,$7B
	.byte $6C,$6F,$7B,$80,$80,$80,$80,$7B
	.byte $6C,$6C,$7C,$7C,$7C,$7C,$7C,$7C
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $a1,$06,$82,$81,$2c, $97,$02,<item015,>item015,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $03,$05				; sprite palette

golf_000:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $09,$16,$16,$16,$16,$34,$16,$16
	.byte $07,$16,$16,$16,$16,$28,$16,$16
	.byte $07,$16,$53,$53,$32,$2F,$95,$16
	.byte $07,$52,$57,$54,$16,$16,$58,$51
	.byte $07,$53,$53,$16,$16,$67,$16,$16
	.byte $07,$16,$16,$16,$53,$16,$16,$51
	.byte $07,$16,$16,$16,$16,$16,$16,$51
	.byte $94,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $21,$07,$85,$09,$b8, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

golf_001:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $16,$16,$49,$53,$53,$53,$16,$16
	.byte $16,$16,$16,$51,$51,$51,$51,$51
	.byte $16,$51,$16,$52,$55,$53,$56,$51
	.byte $51,$51,$57,$58,$16,$65,$16,$51
	.byte $16,$16,$16,$16,$67,$16,$16,$51
	.byte $51,$16,$16,$16,$16,$16,$16,$51
	.byte $51,$16,$16,$16,$16,$16,$16,$51
	.byte $94,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $24,$14,$01,$03,$c8, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

golf_002:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $16,$16,$53,$D0,$94,$16,$77,$07
	.byte $51,$52,$57,$51,$51,$16,$16,$07
	.byte $51,$16,$52,$16,$31,$2E,$16,$07
	.byte $51,$16,$67,$16,$3B,$6B,$16,$07
	.byte $51,$16,$16,$16,$30,$2F,$16,$07
	.byte $51,$16,$16,$16,$16,$16,$16,$07
	.byte $51,$16,$16,$16,$16,$16,$16,$07
	.byte $94,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

golf_003:
	.byte $07,$16,$16,$16,$16,$16,$16,$51
	.byte $07,$16,$16,$16,$16,$16,$16,$16
	.byte $07,$16,$67,$16,$57,$51,$51,$51
	.byte $07,$16,$57,$58,$16,$16,$16,$16
	.byte $07,$16,$52,$53,$53,$08,$53,$16
	.byte $07,$16,$16,$51,$53,$53,$16,$16
	.byte $07,$16,$16,$51,$16,$16,$16,$51
	.byte $07,$16,$16,$51,$16,$16,$16,$51
	.byte $94,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

golf_004:
	.byte $51,$16,$53,$16,$16,$53,$16,$51
	.byte $16,$16,$16,$16,$53,$57,$53,$51
	.byte $51,$58,$52,$51,$58,$16,$58,$51
	.byte $16,$16,$16,$54,$16,$16,$16,$16
	.byte $16,$16,$34,$67,$52,$57,$58,$51
	.byte $16,$57,$30,$33,$16,$54,$56,$16
	.byte $51,$52,$16,$16,$16,$16,$16,$16
	.byte $51,$51,$16,$16,$16,$16,$16,$16
	.byte $94,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

golf_005:
	.byte $51,$16,$16,$16,$16,$16,$16,$07
	.byte $51,$16,$16,$16,$16,$16,$16,$07
	.byte $51,$52,$53,$16,$65,$16,$16,$07
	.byte $16,$16,$52,$53,$16,$53,$16,$07
	.byte $51,$53,$53,$58,$34,$16,$16,$07
	.byte $16,$16,$67,$16,$28,$16,$16,$07
	.byte $16,$16,$16,$16,$28,$16,$16,$07
	.byte $16,$16,$16,$16,$28,$16,$16,$07
	.byte $94,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

golf_006:
	.byte $07,$16,$16,$51,$16,$16,$16,$51
	.byte $07,$16,$56,$52,$16,$16,$51,$16
	.byte $07,$16,$16,$51,$16,$51,$16,$16
	.byte $07,$16,$53,$16,$16,$51,$16,$16
	.byte $07,$16,$16,$67,$16,$16,$53,$16
	.byte $07,$1E,$16,$16,$53,$53,$1B,$16
	.byte $07,$07,$09,$09,$09,$09,$09,$09
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $94,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

golf_007:
	.byte $51,$51,$53,$16,$16,$16,$16,$16
	.byte $16,$16,$51,$53,$16,$53,$16,$16
	.byte $16,$16,$51,$31,$8B,$93,$46,$46
	.byte $16,$53,$16,$3B,$36,$36,$36,$36
	.byte $16,$53,$16,$3B,$36,$36,$63,$36
	.byte $16,$16,$53,$3B,$8C,$8D,$67,$30
	.byte $09,$09,$09,$35,$09,$09,$09,$09
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $94,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

golf_008:
	.byte $16,$16,$16,$16,$28,$16,$16,$07
	.byte $16,$16,$57,$55,$28,$53,$16,$07
	.byte $46,$46,$46,$46,$6B,$53,$53,$07
	.byte $36,$36,$36,$36,$6B,$67,$53,$07
	.byte $36,$36,$36,$36,$6B,$53,$53,$07
	.byte $63,$63,$63,$63,$2F,$54,$56,$07
	.byte $09,$09,$09,$09,$09,$09,$09,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $94,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld00:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$08,$08,$08,$08,$08,$07,$07
	.byte $07,$1E,$16,$16,$16,$5C,$08,$07
	.byte $07,$13,$16,$07,$07,$07,$07,$07
	.byte $07,$16,$1B,$07,$2A,$2B,$2B,$2B
	.byte $07,$16,$1C,$07,$28,$07,$08,$07
	.byte $07,$16,$16,$07,$28,$43,$09,$07
	.byte $07,$16,$16,$07,$28,$0A,$07,$07
	.byte $90,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $4a,$04,$0a,$84,$c7, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld01:
	.byte $07,$07,$07,$14,$3B,$36,$36,$36
	.byte $07,$07,$07,$CC,$3B,$36,$36,$36
	.byte $07,$08,$08,$14,$3B,$63,$63,$36
	.byte $07,$16,$16,$14,$35,$5F,$07,$3B
	.byte $2B,$2B,$33,$14,$15,$66,$43,$30
	.byte $07,$1E,$19,$14,$CD,$61,$4C,$16
	.byte $07,$07,$07,$14,$66,$07,$07,$07
	.byte $07,$07,$07,$14,$16,$07,$07,$07
	.byte $90,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $6b,$07,$08,$83,$c2, $b9,$04,$07,$85,$c9
	.byte $ac,$01,<item013,>item013,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld02:
	.byte $36,$36,$36,$36,$6B,$07,$07,$07
	.byte $36,$36,$36,$36,$36,$46,$2B,$2B
	.byte $36,$36,$36,$36,$36,$6B,$1B,$16
	.byte $36,$36,$36,$36,$36,$6B,$1C,$07
	.byte $63,$63,$36,$63,$63,$2F,$19,$07
	.byte $16,$16,$28,$07,$19,$1C,$0C,$07
	.byte $07,$0A,$28,$07,$0A,$07,$07,$07
	.byte $07,$0A,$28,$07,$0A,$07,$07,$07
	.byte $90,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld03:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $2B,$2B,$33,$07,$08,$13,$13,$13
	.byte $16,$1A,$5D,$07,$09,$1C,$44,$07
	.byte $07,$08,$08,$08,$13,$16,$07,$07
	.byte $07,$09,$1C,$07,$08,$07,$17,$07
	.byte $07,$07,$1B,$13,$1B,$08,$0B,$07
	.byte $07,$13,$1C,$1C,$08,$1C,$0D,$07
	.byte $07,$16,$16,$16,$16,$16,$16,$07
	.byte $90,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $55,$07,$09,$01,$92, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld04:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $13,$13,$13,$13,$13,$13,$13,$07
	.byte $07,$1E,$31,$46,$2B,$2C,$1B,$07
	.byte $07,$08,$3B,$2F,$49,$28,$16,$07
	.byte $07,$48,$28,$47,$1B,$28,$16,$07
	.byte $07,$1C,$2D,$2B,$2B,$29,$1C,$07
	.byte $07,$09,$09,$09,$09,$09,$09,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $68,$14,$04,$82,$86, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld05:
	.byte $6C,$6C,$6C,$6C,$6C,$6C,$6C,$6C
	.byte $6C,$73,$70,$70,$70,$70,$70,$70
	.byte $6C,$70,$70,$70,$70,$70,$70,$70
	.byte $6C,$73,$70,$70,$70,$70,$70,$70
	.byte $6C,$70,$70,$70,$70,$70,$70,$70
	.byte $6C,$73,$70,$70,$70,$70,$70,$70
	.byte $6C,$70,$70,$70,$70,$70,$70,$70
	.byte $6C,$6C,$6C,$6C,$6C,$6C,$6C,$6C
	.byte $8b,$00,$04		; NPC number
	.byte $00,$00,$c6		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$60		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld06:
	.byte $6C,$6C,$6C,$6C,$6C,$6C,$6C,$6C
	.byte $70,$70,$70,$70,$70,$70,$70,$70
	.byte $70,$70,$70,$70,$70,$70,$70,$70
	.byte $70,$70,$70,$70,$70,$70,$70,$70
	.byte $70,$70,$70,$70,$70,$70,$70,$70
	.byte $70,$70,$70,$70,$70,$70,$70,$70
	.byte $70,$70,$70,$70,$70,$70,$70,$70
	.byte $6C,$6C,$6C,$6C,$6C,$6C,$6C,$6C
	.byte $8b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld07:
	.byte $6C,$6C,$6C,$6C,$6C,$6C,$6C,$6C
	.byte $70,$70,$70,$70,$70,$74,$75,$6C
	.byte $70,$70,$70,$70,$74,$6D,$9E,$6C
	.byte $70,$70,$70,$70,$70,$6C,$70,$6C
	.byte $70,$70,$70,$70,$70,$70,$74,$6C
	.byte $70,$70,$70,$70,$70,$70,$70,$6C
	.byte $70,$70,$70,$70,$70,$70,$74,$6C
	.byte $6C,$6C,$6C,$6C,$6C,$6C,$71,$6C
	.byte $8b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $2d,$07,$02,$01,$a2, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld08:
	.byte $07,$16,$16,$07,$28,$0A,$07,$07
	.byte $07,$16,$16,$17,$28,$0A,$13,$07
	.byte $07,$16,$16,$0B,$28,$0A,$77,$07
	.byte $07,$31,$8B,$93,$6B,$0A,$16,$07
	.byte $07,$3B,$36,$36,$2F,$0A,$16,$13
	.byte $07,$30,$8C,$8D,$16,$0C,$08,$16
	.byte $07,$16,$16,$16,$16,$16,$1A,$09
	.byte $07,$16,$16,$16,$16,$16,$0B,$07
	.byte $88,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

;	.byte $07,$07,$07,$14,$16,$07,$07,$07
;	.byte $07,$13,$17,$14,$16,$13,$07,$07
;	.byte $07,$8a,$0B,$14,$27,$1B,$08,$08
;	.byte $07,$16,$0B,$26,$21,$21,$21,$21
;	.byte $13,$16,$43,$07,$16,$1A,$16,$07
;	.byte $16,$16,$0C,$07,$08,$0D,$16,$07
;	.byte $09,$09,$44,$07,$07,$09,$44,$07
;	.byte $07,$07,$07,$07,$07,$07,$07,$07
oworld09:
	.byte $07,$07,$07,$14,$27,$08,$07,$07
	.byte $07,$13,$17,$26,$21,$22,$07,$07
	.byte $07,$8a,$0B,$53,$DE,$14,$DD,$08
	.byte $07,$16,$0B,$51,$4E,$21,$21,$21
	.byte $13,$16,$43,$07,$16,$1A,$16,$07
	.byte $16,$16,$0C,$07,$08,$0D,$16,$07
	.byte $09,$09,$44,$07,$07,$09,$44,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $88,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $53,$07,$04,$86,$d2, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld10:
	.byte $07,$0A,$28,$07,$0A,$07,$07,$07
	.byte $07,$0C,$28,$13,$0C,$13,$13,$13
	.byte $08,$4F,$28,$50,$16,$08,$09,$16
	.byte $21,$4D,$28,$4E,$21,$22,$17,$16
	.byte $07,$16,$28,$16,$23,$14,$0D,$07
	.byte $07,$1E,$28,$1C,$08,$14,$1B,$07
	.byte $07,$07,$28,$07,$07,$14,$16,$13
	.byte $07,$07,$28,$07,$07,$14,$16,$16
	.byte $90,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld11:
	.byte $07,$16,$16,$16,$16,$16,$16,$07
	.byte $13,$08,$09,$0A,$08,$1C,$0B,$07
	.byte $16,$1A,$13,$0C,$09,$1B,$44,$07
	.byte $16,$1C,$19,$1C,$13,$1C,$07,$07
	.byte $07,$16,$17,$19,$1C,$1B,$17,$07
	.byte $07,$1C,$43,$17,$1B,$1B,$0D,$07
	.byte $13,$1B,$0C,$1C,$16,$16,$1B,$07
	.byte $16,$16,$16,$16,$16,$16,$16,$07
	.byte $90,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld12:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$07,$13,$13,$13,$13,$8F,$2B
	.byte $07,$43,$16,$45,$16,$31,$90,$07
	.byte $07,$0C,$44,$1E,$16,$28,$16,$07
	.byte $07,$16,$17,$07,$1A,$28,$0B,$07
	.byte $07,$16,$0D,$13,$1C,$28,$07,$07
	.byte $07,$16,$16,$16,$16,$28,$07,$07
	.byte $07,$16,$16,$16,$16,$28,$07,$07
	.byte $85,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $47,$04,$04,$00,$c8, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld13:
	.byte $6C,$6C,$6C,$6C,$6C,$6C,$6C,$6C
	.byte $2B,$2B,$92,$91,$46,$46,$2E,$6C
	.byte $07,$6F,$71,$6F,$30,$36,$6B,$6C
	.byte $07,$16,$6C,$72,$6E,$3B,$6B,$6C
	.byte $07,$16,$6C,$6D,$6F,$30,$2F,$6C
	.byte $07,$6F,$6C,$6F,$6F,$6F,$6F,$6F
	.byte $07,$6F,$6C,$6F,$70,$70,$6C,$6C
	.byte $07,$6F,$6C,$6F,$6C,$6C,$6C,$6C
	.byte $8b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld14:
	.byte $6C,$6C,$6C,$6C,$6C,$6C,$6C,$6C
	.byte $6C,$6F,$71,$74,$72,$73,$6F,$6C
	.byte $6C,$6F,$6C,$6C,$6C,$6D,$6E,$6C
	.byte $6C,$6D,$6C,$6C,$6E,$72,$74,$6C
	.byte $6C,$6F,$6C,$6C,$6C,$6D,$72,$6C
	.byte $6F,$6F,$6C,$6C,$6C,$6F,$6F,$6F
	.byte $6C,$6F,$6C,$70,$6F,$70,$6C,$6C
	.byte $6C,$6C,$6C,$6C,$6F,$6C,$6C,$6C
	.byte $8b,$00,$0f		; NPC number
	.byte $00,$00,$6d		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$70		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld15:
	.byte $6C,$6C,$6C,$6C,$6C,$6C,$6D,$6C
	.byte $6C,$6F,$74,$71,$74,$6C,$6D,$6C
	.byte $6C,$6F,$6C,$6C,$73,$6C,$6D,$6C
	.byte $6C,$73,$6C,$6C,$70,$6F,$6D,$6C
	.byte $6C,$70,$70,$6F,$6C,$6F,$6D,$6C
	.byte $6F,$6F,$6C,$6F,$6C,$6F,$6D,$6C
	.byte $6C,$6F,$6C,$6F,$6C,$6F,$6D,$6C
	.byte $6C,$6F,$6C,$6F,$6C,$6F,$6D,$6C
	.byte $8b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld16:
	.byte $07,$16,$16,$16,$16,$16,$0B,$07
	.byte $07,$31,$2B,$2B,$8B,$8E,$0D,$13
	.byte $07,$28,$16,$3E,$3B,$36,$2E,$16
	.byte $07,$28,$16,$32,$36,$36,$36,$2B
	.byte $07,$28,$16,$16,$3B,$36,$2F,$16
	.byte $07,$30,$33,$16,$3B,$2F,$16,$16
	.byte $07,$07,$07,$16,$28,$07,$0B,$07
	.byte $07,$07,$07,$16,$28,$07,$0B,$07
	.byte $88,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $47,$04,$02,$83,$c8, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld17:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $13,$17,$13,$13,$13,$07,$13,$13
	.byte $16,$0D,$0B,$1E,$1C,$13,$16,$16
	.byte $2B,$2B,$2B,$2B,$2B,$2B,$2B,$2B
	.byte $16,$1C,$16,$16,$19,$16,$1C,$16
	.byte $16,$16,$08,$16,$0C,$1B,$16,$16
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $88,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld18:
	.byte $07,$07,$28,$07,$07,$14,$19,$16
	.byte $13,$25,$28,$24,$07,$14,$08,$16
	.byte $16,$2A,$29,$16,$07,$14,$27,$16
	.byte $2B,$29,$16,$1A,$07,$26,$21,$21
	.byte $16,$16,$16,$08,$08,$08,$08,$08
	.byte $16,$1C,$16,$16,$16,$16,$16,$16
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $87,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld19:
	.byte $16,$16,$16,$16,$16,$16,$16,$07
	.byte $16,$1C,$19,$08,$07,$1E,$0B,$07
	.byte $16,$16,$0C,$16,$13,$17,$07,$07
	.byte $21,$21,$21,$21,$22,$0D,$17,$07
	.byte $08,$08,$07,$23,$14,$16,$0D,$07
	.byte $16,$16,$13,$07,$14,$16,$1C,$07
	.byte $07,$16,$07,$07,$14,$07,$08,$07
	.byte $07,$16,$07,$07,$14,$07,$07,$07
	.byte $87,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld20:
	.byte $07,$16,$16,$16,$16,$28,$07,$07
	.byte $07,$16,$1A,$16,$16,$28,$07,$07
	.byte $07,$1E,$0D,$1A,$1B,$28,$07,$07
	.byte $07,$07,$0A,$0D,$1B,$28,$07,$07
	.byte $07,$17,$0C,$1E,$1C,$28,$07,$07
	.byte $07,$0D,$16,$13,$16,$28,$07,$07
	.byte $07,$07,$07,$07,$19,$28,$07,$07
	.byte $07,$07,$07,$07,$0A,$28,$07,$07
	.byte $85,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld21:
	.byte $07,$6F,$6C,$6F,$6C,$6C,$6C,$6C
	.byte $6C,$6F,$6C,$6F,$6F,$6F,$70,$6C
	.byte $6C,$6F,$6C,$6F,$6C,$6C,$6C,$6C
	.byte $6C,$6D,$6C,$6C,$71,$70,$6E,$6C
	.byte $07,$6F,$6C,$6D,$74,$6C,$6F,$6C
	.byte $07,$16,$6F,$6F,$6F,$6F,$6F,$6F
	.byte $07,$09,$07,$70,$6C,$6C,$6C,$6C
	.byte $07,$07,$07,$07,$07,$6C,$07,$6C
	.byte $8b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld22:
	.byte $6C,$6C,$6C,$6C,$6F,$6C,$6C,$6C
	.byte $6C,$6D,$6F,$74,$73,$71,$70,$6C
	.byte $6C,$6F,$71,$73,$74,$73,$6C,$07
	.byte $6C,$6D,$74,$72,$6E,$6F,$0B,$07
	.byte $6C,$6F,$1A,$0A,$6F,$0B,$0D,$07
	.byte $6F,$6F,$0D,$0C,$16,$08,$16,$07
	.byte $6C,$09,$09,$09,$09,$09,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $8b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld23:
	.byte $6C,$6F,$6C,$6F,$6C,$6F,$6D,$6C
	.byte $6C,$6F,$6E,$71,$6E,$6D,$6D,$6C
	.byte $07,$6F,$6D,$6C,$73,$6D,$6F,$6C
	.byte $07,$1C,$6E,$6C,$70,$0B,$6D,$6C
	.byte $07,$09,$09,$6F,$6C,$0D,$6D,$6C
	.byte $07,$13,$08,$16,$08,$1A,$07,$07
	.byte $07,$09,$09,$09,$09,$44,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $8b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld24:
	.byte $3F,$07,$07,$16,$28,$07,$0B,$07
	.byte $3F,$13,$17,$0A,$28,$08,$0D,$07
	.byte $3F,$16,$0D,$0C,$28,$1B,$16,$13
	.byte $3F,$16,$08,$08,$28,$16,$16,$16
	.byte $40,$15,$15,$42,$28,$41,$15,$15
	.byte $3F,$16,$16,$16,$28,$16,$16,$07
	.byte $3F,$3F,$07,$3F,$28,$1E,$07,$07
	.byte $3F,$3F,$3F,$3F,$28,$07,$07,$07
	.byte $8f,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $91,$07,$08,$03,$92, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld25:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $13,$13,$13,$13,$13,$13,$13,$13
	.byte $16,$16,$16,$16,$08,$16,$16,$16
	.byte $15,$15,$15,$15,$15,$15,$15,$15
	.byte $07,$16,$16,$16,$16,$16,$16,$16
	.byte $07,$16,$0E,$0E,$16,$0E,$0E,$16
	.byte $07,$16,$0E,$0E,$16,$0E,$0E,$16
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld26:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$07,$07,$13,$12,$13,$17,$07
	.byte $13,$13,$07,$1E,$16,$16,$0D,$07
	.byte $16,$16,$13,$13,$08,$16,$16,$13
	.byte $15,$15,$15,$15,$15,$15,$15,$15
	.byte $16,$16,$16,$18,$16,$16,$16,$07
	.byte $16,$0E,$0E,$18,$20,$0E,$1F,$07
	.byte $16,$0E,$0E,$18,$20,$0E,$1F,$07
	.byte $81,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $38,$04,$02,$8a,$c4, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld27:
	.byte $07,$16,$07,$07,$14,$07,$07,$07
	.byte $07,$16,$13,$13,$14,$13,$13,$13
	.byte $07,$16,$16,$16,$14,$11,$16,$08
	.byte $13,$16,$16,$16,$14,$15,$15,$15
	.byte $15,$15,$15,$15,$14,$16,$16,$07
	.byte $07,$16,$10,$16,$14,$0F,$16,$17
	.byte $07,$16,$16,$16,$14,$16,$16,$0B
	.byte $07,$07,$07,$16,$14,$07,$07,$07
	.byte $80,$0e,$00		; NPC number
	.byte $00,$45,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$a1,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $5a,$06,$81,$8a,$7d, $a4,$07,$0b,$04,$b2
	.byte $bb,$07,$83,$87,$62, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld28:
	.byte $07,$07,$07,$07,$0A,$28,$07,$07
	.byte $13,$13,$13,$13,$0C,$28,$07,$07
	.byte $08,$08,$08,$08,$08,$28,$08,$08
	.byte $15,$15,$15,$15,$42,$28,$41,$15
	.byte $07,$07,$07,$19,$07,$28,$07,$07
	.byte $07,$13,$13,$0C,$07,$28,$07,$07
	.byte $07,$0B,$07,$07,$07,$28,$07,$07
	.byte $07,$0B,$07,$07,$07,$28,$07,$07
	.byte $84,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld29:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $08,$08,$08,$07,$07,$07,$13,$13
	.byte $15,$15,$15,$62,$62,$62,$15,$15
	.byte $07,$1A,$16,$1C,$09,$61,$19,$16
	.byte $07,$07,$1E,$16,$13,$0C,$0A,$16
	.byte $07,$07,$07,$07,$1E,$16,$07,$07
	.byte $07,$07,$07,$07,$07,$16,$07,$07
	.byte $89,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld30:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $13,$08,$07,$07,$43,$13,$07,$13
	.byte $15,$15,$62,$62,$0C,$0B,$13,$16
	.byte $16,$1A,$08,$5E,$61,$44,$07,$16
	.byte $16,$0B,$07,$5E,$17,$07,$13,$16
	.byte $07,$0D,$13,$5E,$0D,$07,$07,$07
	.byte $07,$16,$16,$5E,$16,$07,$07,$07
	.byte $89,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

oworld31:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$07,$07,$07,$13,$13,$17,$07
	.byte $13,$07,$13,$08,$16,$16,$43,$07
	.byte $16,$13,$16,$07,$1C,$19,$0C,$07
	.byte $16,$0A,$44,$07,$1E,$0C,$07,$07
	.byte $16,$1B,$17,$13,$08,$1A,$43,$07
	.byte $07,$1E,$0D,$1B,$1C,$0D,$0A,$07
	.byte $07,$07,$16,$16,$16,$16,$16,$07
	.byte $91,$00,$08		; NPC number
	.byte $00,$00,$3b		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$83		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $ad,$07,$09,$00,$63, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

oworld32:
	.byte $3F,$3F,$3F,$3F,$28,$07,$07,$07
	.byte $3F,$3F,$3F,$3F,$28,$07,$07,$07
	.byte $3F,$3F,$3F,$3F,$3B,$2E,$13,$07
	.byte $3F,$3F,$3F,$31,$36,$6B,$16,$07
	.byte $3F,$32,$2B,$63,$8C,$8D,$16,$07
	.byte $3F,$3F,$3F,$3F,$16,$16,$16,$07
	.byte $3F,$3F,$3F,$3F,$3F,$16,$07,$07
	.byte $3F,$3F,$3F,$3F,$3F,$16,$07,$07
	.byte $96,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld33:
	.byte $07,$16,$16,$16,$16,$16,$16,$16
	.byte $07,$16,$0E,$0E,$16,$0E,$0E,$16
	.byte $07,$16,$0E,$0E,$16,$0E,$0E,$16
	.byte $07,$16,$16,$16,$16,$16,$19,$16
	.byte $07,$16,$16,$16,$1C,$16,$0C,$16
	.byte $07,$16,$0E,$0E,$16,$0E,$0E,$16
	.byte $07,$16,$0E,$0E,$16,$0E,$0E,$16
	.byte $07,$16,$16,$16,$16,$16,$16,$16
	.byte $81,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld34:
	.byte $16,$16,$16,$18,$16,$16,$16,$07
	.byte $16,$0E,$0E,$18,$20,$0E,$1F,$07
	.byte $16,$0E,$0E,$18,$20,$0E,$1F,$07
	.byte $16,$16,$19,$18,$16,$16,$1E,$07
	.byte $16,$16,$0C,$18,$16,$08,$13,$07
	.byte $16,$0E,$0E,$18,$20,$0E,$1F,$07
	.byte $16,$0E,$0E,$18,$20,$0E,$1F,$07
	.byte $16,$16,$16,$18,$16,$16,$16,$07
	.byte $81,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld35:
	.byte $07,$07,$07,$16,$14,$07,$07,$07
	.byte $07,$13,$17,$16,$14,$13,$08,$07
	.byte $07,$20,$0E,$1F,$14,$20,$1F,$07
	.byte $07,$20,$0E,$1F,$14,$20,$1F,$07
	.byte $07,$16,$16,$08,$14,$1C,$16,$07
	.byte $07,$20,$0E,$1F,$14,$20,$1F,$07
	.byte $07,$20,$0E,$1F,$14,$20,$1F,$07
	.byte $07,$16,$16,$16,$14,$16,$16,$07
	.byte $81,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld36:
	.byte $07,$0B,$07,$07,$07,$28,$07,$07
	.byte $07,$0D,$13,$17,$25,$28,$24,$13
	.byte $07,$19,$1B,$0D,$16,$28,$07,$07
	.byte $07,$0C,$1C,$16,$31,$2F,$07,$07
	.byte $07,$16,$2a,$4A,$2F,$16,$13,$13
	.byte $07,$0A,$28,$16,$16,$1B,$19,$16
	.byte $07,$07,$28,$07,$07,$07,$07,$07
	.byte $07,$07,$28,$07,$07,$07,$07,$07
	.byte $84,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld37:
	.byte $07,$07,$07,$07,$08,$16,$08,$07
	.byte $13,$13,$13,$13,$1B,$09,$19,$07
	.byte $07,$07,$08,$08,$1C,$17,$0C,$07
	.byte $07,$08,$1C,$08,$08,$07,$08,$07
	.byte $13,$07,$07,$07,$08,$17,$4B,$07
	.byte $16,$13,$13,$13,$0B,$0D,$1B,$07
	.byte $07,$08,$1B,$08,$08,$08,$08,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $84,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $8c,$06,$03,$03,$ad, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld38:
	.byte $07,$16,$16,$5E,$16,$07,$07,$07
	.byte $07,$16,$16,$5E,$0B,$07,$08,$08
	.byte $07,$07,$1E,$5E,$43,$13,$16,$16
	.byte $07,$13,$13,$5E,$17,$1C,$16,$16
	.byte $07,$07,$44,$5E,$61,$16,$55,$53
	.byte $07,$43,$43,$5E,$0C,$58,$54,$31
	.byte $07,$0C,$0C,$5E,$16,$53,$31,$36
	.byte $07,$16,$16,$5E,$16,$53,$3B,$36
	.byte $89,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$05				; sprite palette

oworld39:
	.byte $07,$07,$16,$16,$16,$16,$19,$07
	.byte $08,$13,$16,$09,$1E,$08,$1B,$07
	.byte $16,$16,$08,$13,$13,$53,$53,$07
	.byte $16,$16,$53,$53,$53,$54,$31,$46
	.byte $53,$53,$57,$31,$8B,$93,$36,$36
	.byte $46,$46,$46,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $91,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$05				; sprite palette

oworld40:
	.byte $3F,$3F,$3F,$3F,$3F,$16,$07,$07
	.byte $3F,$3F,$3F,$3F,$3F,$16,$3F,$07
	.byte $3F,$3F,$3F,$3F,$3F,$16,$3F,$3F
	.byte $3F,$3F,$3F,$3F,$3F,$16,$3F,$3F
	.byte $3F,$77,$3F,$3F,$16,$16,$3F,$07
	.byte $3F,$49,$CF,$76,$16,$3F,$3F,$07
	.byte $3F,$3F,$3F,$3F,$3F,$3F,$07,$07
	.byte $3F,$3F,$3F,$3F,$3F,$3F,$07,$07
	.byte $96,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $a2,$14,$09,$82,$c4, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld41:
	.byte $07,$16,$16,$16,$16,$16,$16,$16
	.byte $07,$16,$0E,$0E,$16,$0E,$0E,$16
	.byte $07,$16,$0E,$0E,$16,$0E,$0E,$16
	.byte $07,$16,$16,$16,$1C,$16,$16,$16
	.byte $07,$16,$0E,$0E,$16,$0E,$0E,$16
	.byte $07,$16,$1D,$0E,$16,$0E,$0E,$16
	.byte $07,$1E,$09,$09,$09,$09,$09,$09
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $81,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $b4,$05,$81,$86,$22, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld42:
	.byte $16,$16,$16,$18,$16,$16,$16,$07
	.byte $16,$0E,$0E,$18,$20,$0E,$1F,$07
	.byte $16,$0E,$0E,$18,$20,$0E,$1F,$07
	.byte $16,$16,$16,$18,$1B,$16,$1C,$07
	.byte $16,$0E,$0E,$18,$20,$0E,$1F,$07
	.byte $16,$0E,$0E,$18,$20,$0E,$1F,$13
	.byte $09,$09,$09,$18,$09,$09,$09,$07
	.byte $07,$07,$07,$18,$07,$07,$07,$07
	.byte $81,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld43:
	.byte $07,$16,$16,$16,$14,$16,$16,$07
	.byte $07,$20,$0E,$1F,$14,$1C,$19,$07
	.byte $07,$20,$0E,$1F,$14,$1C,$17,$07
	.byte $07,$20,$0E,$1F,$14,$27,$1B,$07
	.byte $07,$16,$0A,$16,$26,$21,$21,$21
	.byte $13,$16,$17,$16,$16,$1E,$0B,$07
	.byte $07,$09,$0D,$1E,$09,$13,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $81,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld44:
	.byte $07,$07,$28,$07,$07,$07,$07,$07
	.byte $07,$07,$28,$08,$08,$17,$43,$08
	.byte $07,$13,$30,$2E,$1C,$0D,$0C,$16
	.byte $07,$16,$4F,$28,$50,$16,$1B,$16
	.byte $21,$21,$4D,$28,$4E,$22,$1A,$16
	.byte $07,$16,$31,$2F,$23,$14,$0D,$16
	.byte $07,$16,$28,$08,$16,$14,$16,$16
	.byte $07,$16,$28,$16,$16,$14,$16,$16
	.byte $87,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld45:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $13,$13,$13,$13,$13,$08,$13,$13
	.byte $16,$16,$16,$16,$16,$16,$1B,$16
	.byte $16,$16,$0B,$0B,$16,$60,$15,$15
	.byte $16,$16,$0D,$0D,$16,$5E,$1B,$16
	.byte $16,$1C,$09,$09,$61,$5E,$16,$16
	.byte $16,$16,$13,$13,$0C,$5E,$16,$07
	.byte $16,$16,$16,$16,$16,$5E,$16,$07
	.byte $89,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

oworld46:
	.byte $07,$16,$16,$5E,$16,$53,$3B,$36
	.byte $13,$16,$44,$5E,$16,$53,$3B,$36
	.byte $16,$1C,$07,$5E,$77,$55,$3B,$36
	.byte $15,$15,$62,$66,$16,$53,$3B,$36
	.byte $16,$1A,$16,$16,$DF,$52,$3B,$36
	.byte $16,$0D,$1C,$61,$1E,$56,$3B,$36
	.byte $07,$08,$08,$0C,$13,$53,$3B,$36
	.byte $07,$16,$16,$16,$16,$53,$3B,$36
	.byte $89,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $99,$06,$0a,$00,$8c, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$05				; sprite palette

oworld47:
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$05				; sprite palette

oworld48:
	.byte $3F,$3F,$3F,$3F,$3F,$51,$51,$51
	.byte $3F,$3F,$3F,$53,$55,$53,$53,$53
	.byte $3F,$53,$57,$57,$58,$53,$53,$51
	.byte $3F,$53,$51,$53,$53,$51,$53,$53
	.byte $51,$53,$52,$53,$52,$53,$53,$53
	.byte $51,$56,$51,$53,$51,$52,$55,$53
	.byte $51,$53,$51,$53,$58,$51,$57,$51
	.byte $51,$53,$51,$53,$51,$51,$51,$51
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

oworld49:
	.byte $51,$51,$51,$51,$07,$07,$07,$07
	.byte $53,$58,$58,$53,$13,$13,$13,$07
	.byte $51,$51,$52,$58,$58,$53,$07,$13
	.byte $53,$56,$51,$53,$57,$51,$13,$16
	.byte $53,$53,$52,$53,$52,$53,$53,$16
	.byte $53,$51,$51,$53,$53,$52,$55,$53
	.byte $51,$51,$51,$53,$53,$51,$57,$57
	.byte $51,$51,$51,$53,$53,$51,$51,$07
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

oworld50:
	.byte $07,$07,$07,$18,$07,$07,$07,$07
	.byte $07,$08,$08,$18,$08,$08,$08,$08
	.byte $13,$16,$09,$18,$19,$07,$1B,$16
	.byte $16,$16,$08,$18,$0C,$07,$07,$16
	.byte $16,$16,$1B,$18,$16,$07,$43,$16
	.byte $16,$1C,$16,$18,$16,$08,$0C,$16
	.byte $09,$09,$09,$18,$09,$09,$09,$07
	.byte $07,$07,$07,$18,$07,$07,$07,$07
	.byte $8e,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

oworld51:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $08,$08,$08,$13,$07,$07,$08,$13
	.byte $16,$09,$1A,$07,$43,$17,$08,$16
	.byte $16,$13,$0D,$13,$0C,$07,$16,$16
	.byte $16,$08,$08,$1A,$44,$17,$16,$16
	.byte $16,$1C,$44,$61,$13,$43,$16,$16
	.byte $07,$09,$07,$07,$16,$0C,$16,$16
	.byte $07,$07,$07,$07,$16,$16,$16,$16
	.byte $8e,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld52:
	.byte $07,$16,$28,$16,$16,$14,$16,$16
	.byte $13,$16,$28,$0A,$16,$14,$1C,$16
	.byte $16,$16,$28,$07,$16,$14,$27,$16
	.byte $16,$16,$28,$07,$0A,$26,$21,$21
	.byte $16,$16,$28,$07,$1E,$16,$16,$16
	.byte $16,$16,$28,$07,$07,$1E,$16,$16
	.byte $16,$16,$28,$07,$07,$07,$1E,$09
	.byte $16,$16,$28,$07,$07,$07,$07,$07
	.byte $8d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld53:
	.byte $16,$16,$16,$16,$16,$5E,$16,$07
	.byte $16,$16,$08,$16,$44,$5E,$16,$07
	.byte $16,$16,$16,$19,$13,$5E,$16,$07
	.byte $21,$21,$22,$0C,$07,$5E,$15,$62
	.byte $16,$23,$14,$27,$08,$5E,$16,$16
	.byte $16,$1C,$26,$21,$21,$21,$15,$15
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $89,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

oworld54:
	.byte $07,$16,$16,$16,$53,$53,$3B,$36
	.byte $07,$16,$16,$53,$53,$31,$36,$36
	.byte $07,$16,$16,$53,$32,$63,$63,$63
	.byte $62,$15,$15,$5A,$5A,$5A,$5A,$5A
	.byte $16,$16,$16,$31,$2B,$2B,$2B,$46
	.byte $15,$15,$42,$28,$41,$15,$15,$3B
	.byte $09,$31,$46,$36,$46,$2E,$5E,$3B
	.byte $07,$3B,$36,$36,$36,$6B,$5E,$3B
	.byte $89,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$05				; sprite palette

oworld55:
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$8C,$CE,$36,$36
	.byte $63,$63,$63,$2F,$57,$56,$3B,$36
	.byte $5A,$5A,$5A,$5A,$5A,$5A,$64,$36
	.byte $46,$46,$46,$2E,$53,$53,$3B,$36
	.byte $36,$36,$36,$36,$46,$46,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $89,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $6c,$07,$03,$01,$93, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$05				; sprite palette

oworld56:
	.byte $51,$53,$51,$53,$51,$51,$51,$51
	.byte $51,$53,$51,$53,$51,$53,$53,$53
	.byte $51,$57,$57,$52,$57,$53,$56,$53
	.byte $51,$59,$5A,$55,$5A,$52,$5A,$5A
	.byte $51,$54,$53,$52,$53,$51,$52,$53
	.byte $51,$95,$52,$54,$D0,$94,$55,$53
	.byte $51,$51,$57,$57,$57,$51,$57,$57
	.byte $51,$51,$51,$51,$51,$51,$51,$51
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $73,$14,$08,$85,$c6, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

oworld57:
	.byte $51,$51,$51,$53,$53,$51,$07,$07
	.byte $53,$51,$58,$53,$51,$53,$13,$07
	.byte $53,$51,$52,$56,$58,$53,$56,$13
	.byte $5A,$5A,$51,$5A,$57,$51,$5A,$5A
	.byte $53,$53,$52,$53,$52,$53,$53,$53
	.byte $53,$51,$52,$53,$53,$52,$55,$16
	.byte $57,$51,$57,$57,$57,$51,$09,$09
	.byte $51,$51,$51,$51,$51,$51,$07,$07
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

oworld58:
	.byte $07,$07,$07,$18,$07,$07,$07,$07
	.byte $07,$08,$08,$18,$08,$07,$08,$08
	.byte $08,$16,$16,$18,$16,$07,$1E,$16
	.byte $15,$15,$15,$5B,$15,$07,$07,$15
	.byte $16,$16,$44,$16,$19,$17,$07,$16
	.byte $16,$1C,$13,$19,$08,$0D,$13,$16
	.byte $09,$09,$09,$07,$09,$09,$09,$09
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $8d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$00				; sprite palette

oworld59:
	.byte $07,$07,$07,$07,$16,$16,$16,$16
	.byte $08,$08,$17,$07,$07,$16,$16,$16
	.byte $16,$16,$0D,$61,$08,$08,$08,$16
	.byte $15,$15,$16,$08,$31,$46,$2E,$16
	.byte $16,$5E,$16,$16,$3B,$63,$63,$2B
	.byte $16,$69,$15,$42,$28,$41,$68,$07
	.byte $09,$09,$09,$09,$35,$09,$09,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $8d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $ac,$07,$06,$8e,$7b, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld60:
	.byte $16,$16,$28,$07,$07,$07,$07,$07
	.byte $16,$16,$28,$13,$13,$13,$13,$13
	.byte $16,$16,$3B,$46,$2E,$16,$53,$16
	.byte $16,$16,$96,$36,$98,$16,$54,$16
	.byte $2B,$2B,$97,$63,$99,$16,$16,$16
	.byte $07,$0A,$57,$67,$16,$56,$16,$16
	.byte $07,$1E,$09,$09,$09,$09,$09,$09
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $8d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $b7,$07,$05,$89,$22, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$05				; sprite palette

oworld61:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $13,$13,$13,$13,$07,$13,$13,$07
	.byte $16,$16,$60,$15,$9A,$60,$11,$07
	.byte $16,$16,$5E,$07,$07,$5E,$16,$13
	.byte $16,$16,$5E,$07,$07,$5E,$16,$07
	.byte $16,$16,$69,$62,$62,$66,$77,$07
	.byte $09,$09,$09,$09,$09,$09,$44,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $8d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $5c,$07,$82,$89,$72, $58,$07,$82,$8b,$62
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

oworld62:
	.byte $07,$3B,$36,$36,$36,$6B,$5E,$30
	.byte $07,$3B,$36,$36,$63,$2F,$5E,$16
	.byte $07,$3B,$63,$2F,$60,$15,$66,$31
	.byte $13,$28,$41,$15,$66,$31,$46,$36
	.byte $07,$3B,$46,$2E,$14,$3B,$36,$36
	.byte $07,$3b,$36,$6B,$CC,$3B,$36,$36
	.byte $07,$3b,$36,$6B,$14,$3B,$36,$36
	.byte $07,$3b,$36,$6B,$14,$3B,$36,$36
	.byte $8d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$05				; sprite palette

oworld63:
	.byte $63,$36,$36,$63,$63,$63,$63,$36
	.byte $16,$3B,$2F,$53,$53,$57,$53,$3B
	.byte $46,$2F,$53,$9C,$3F,$3F,$9D,$3B
	.byte $6B,$53,$49,$9B,$6A,$3F,$53,$3B
	.byte $6B,$53,$54,$3F,$3F,$54,$56,$3B
	.byte $36,$2E,$53,$53,$58,$53,$31,$36
	.byte $36,$36,$46,$46,$46,$46,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $03,$00,$00		; NPC number
	.byte $76,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $40,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $4d,$06,$08,$85,$cd, $64,$14,$02,$00,$c6
	.byte $79,$07,$05,$88,$b2, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$05				; sprite palette

oworld_beaten:
	.byte $63,$63,$63,$63,$63,$63,$63,$36
	.byte $16,$16,$16,$53,$53,$57,$53,$3B
	.byte $46,$33,$53,$9C,$3F,$3F,$9D,$3B
	.byte $6B,$53,$49,$9B,$6A,$3F,$53,$3B
	.byte $6B,$53,$54,$3F,$3F,$54,$56,$3B
	.byte $36,$2E,$53,$53,$58,$53,$31,$36
	.byte $36,$36,$46,$46,$46,$46,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $03,$00,$00		; NPC number
	.byte $76,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $40,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $4d,$06,$08,$85,$cd, $64,$14,$02,$00,$c6
	.byte $79,$07,$05,$88,$b2, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$05				; sprite palette

oworld64:
	.byte $51,$51,$51,$51,$51,$51,$51,$51
	.byte $51,$51,$54,$53,$53,$56,$51,$51
	.byte $51,$51,$53,$58,$55,$53,$56,$51
	.byte $52,$57,$53,$53,$53,$53,$53,$51
	.byte $51,$51,$55,$53,$53,$53,$53,$51
	.byte $46,$46,$46,$46,$46,$46,$46,$46
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $36,$36,$36,$36,$36,$36,$36,$36
	.byte $5b,$5c,$00		; NPC number
	.byte $77,$89,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $e0,$d1,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $62,$05,$89,$00,$bd, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $06,$05				; sprite palette

ship0000:
	.byte $6B,$79,$78,$D2,$78,$D5,$78,$7B
	.byte $6B,$79,$D1,$D1,$D1,$D4,$D1,$7B
	.byte $6B,$7B,$7B,$7B,$7B,$7B,$7A,$7B
	.byte $6B,$81,$D3,$7C,$7C,$7C,$7A,$7B
	.byte $7E,$82,$D1,$D1,$D4,$D1,$7A,$7B
	.byte $6B,$7B,$7B,$7B,$7B,$7B,$7B,$7B
	.byte $6B,$78,$78,$78,$78,$78,$78,$78
	.byte $36,$46,$46,$46,$46,$46,$46,$46
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $92,$06,$83,$81,$6b, $74,$00,<sear040,>sear040,$00
	.byte $27,$00,<sear041,>sear041,$00, $2b,$00,<sear039,>sear039,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0001:
	.byte $6B,$79,$78,$7B,$7B,$78,$78,$78
	.byte $6B,$79,$D1,$7B,$D5,$D4,$D1,$80
	.byte $6B,$79,$D4,$D3,$D1,$D1,$D4,$7B
	.byte $6B,$7B,$D5,$78,$7B,$7B,$78,$78
	.byte $6B,$81,$D1,$D4,$81,$D3,$D1,$80
	.byte $6B,$79,$7B,$D1,$79,$D1,$D4,$7B
	.byte $6B,$79,$7B,$D1,$82,$D4,$D1,$7B
	.byte $6B,$79,$7B,$7B,$7B,$7B,$7B,$7B
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $85,$00,<sear042,>sear042,$00, $49,$00,<sear043,>sear043,$00
	.byte $9a,$00,<sear060,>sear060,$00, $56,$00,<sear062,>sear062,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0002:
	.byte $6B,$79,$D1,$D1,$7B,$D1,$7B,$7B
	.byte $6B,$79,$D5,$D4,$78,$D1,$78,$7B
	.byte $6B,$7B,$D1,$80,$D4,$D7,$D1,$7B
	.byte $6B,$81,$D4,$D3,$D1,$D8,$D1,$7B
	.byte $6B,$7F,$78,$D1,$78,$D4,$D2,$7B
	.byte $6B,$79,$D4,$D1,$D4,$D1,$D1,$7B
	.byte $6B,$79,$80,$80,$80,$80,$80,$7B
	.byte $6B,$79,$7B,$7B,$7B,$7B,$7B,$7B
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $7b,$00,<sear044,>sear044,$00, $45,$00,<sear045,>sear045,$00
	.byte $ad,$00,<sear063,>sear063,$00, $76,$00,<sear064,>sear064,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0003:
	.byte $36,$36,$36,$36,$36,$2F,$7B,$7B
	.byte $36,$36,$36,$36,$2F,$7B,$87,$D1
	.byte $36,$36,$36,$2F,$7B,$D1,$D4,$D1
	.byte $36,$36,$2F,$7B,$D4,$D1,$83,$7B
	.byte $36,$2F,$7B,$D1,$D1,$D4,$D1,$7B
	.byte $6B,$7B,$D1,$D4,$80,$D7,$80,$7B
	.byte $6B,$79,$D4,$D1,$7B,$D8,$7B,$7B
	.byte $6B,$79,$D1,$D1,$7B,$D1,$7B,$7B
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $6d,$06,$02,$81,$6c, $db,$00,<sear046,>sear046,$00
	.byte $3c,$00,<sear059,>sear059,$00, $2d,$02,<sear059,>sear059,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0004:
	.byte $7B,$7B,$30,$36,$36,$36,$36,$36
	.byte $D1,$D4,$7B,$30,$36,$36,$36,$36
	.byte $D1,$D1,$D1,$7B,$30,$36,$36,$36
	.byte $7B,$D1,$D4,$D1,$7B,$30,$36,$36
	.byte $7B,$D5,$78,$D4,$D1,$7B,$30,$36
	.byte $7B,$80,$D1,$80,$D5,$78,$7B,$3B
	.byte $7B,$D3,$D4,$7C,$D1,$D4,$85,$3B
	.byte $7B,$D1,$D1,$D1,$D1,$D1,$7A,$3B
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $a3,$00,<sear047,>sear047,$00, $c9,$00,<sear048,>sear048,$00
	.byte $d2,$00,<sear065,>sear065,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0005:
	.byte $7B,$D1,$D1,$D1,$D1,$D1,$7A,$3B
	.byte $7B,$78,$D4,$D1,$D1,$D4,$7A,$3B
	.byte $7B,$D1,$78,$78,$D2,$78,$7A,$3B
	.byte $7B,$80,$D4,$80,$80,$D7,$88,$3B
	.byte $7B,$7C,$D1,$7B,$7C,$D8,$85,$3B
	.byte $7B,$D4,$D1,$D2,$D1,$D1,$7A,$3B
	.byte $7B,$80,$80,$80,$D1,$D4,$7A,$3B
	.byte $7B,$7B,$7B,$7B,$D1,$D1,$7A,$3B
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $9b,$00,<sear049,>sear049,$00, $69,$00,<sear066,>sear066,$00
	.byte $c7,$00,<sear067,>sear067,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0006:
	.byte $78,$78,$78,$7B,$D1,$D1,$7A,$3B
	.byte $80,$D4,$83,$7B,$D1,$D4,$7A,$3B
	.byte $7B,$80,$80,$7B,$D2,$78,$7A,$3B
	.byte $78,$7C,$7C,$7B,$D1,$D4,$7A,$3B
	.byte $80,$D1,$83,$7B,$D1,$D5,$86,$3B
	.byte $7B,$D2,$78,$78,$D4,$D1,$7A,$3B
	.byte $7B,$80,$80,$D4,$80,$80,$7B,$3B
	.byte $7B,$7B,$7B,$D1,$7B,$7B,$7B,$3B
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $25,$06,$02,$00,$24, $85,$06,$02,$00,$84
	.byte $ab,$00,<sear050,>sear050,$00, $69,$00,<sear068,>sear068,$00	; searchable areas
	.byte $c3,$00,<sear069,>sear069,$00
	.byte $05,$01				; sprite palette

ship0007:
	.byte $7B,$7B,$7B,$D1,$7B,$7B,$7B,$3B
	.byte $7B,$7C,$D3,$D4,$7C,$7C,$85,$3B
	.byte $7B,$D1,$D1,$7B,$D1,$D4,$7A,$3B
	.byte $7B,$80,$D4,$78,$D5,$78,$86,$3B
	.byte $7B,$D3,$D1,$D1,$D4,$83,$7A,$3B
	.byte $7B,$7B,$7B,$7B,$7B,$7B,$7B,$3B
	.byte $78,$78,$78,$78,$78,$78,$78,$3B
	.byte $46,$46,$46,$46,$46,$46,$46,$36
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $8b,$05,$02,$00,$8a, $89,$00,<sear051,>sear051,$00
	.byte $34,$00,<sear070,>sear070,$00, $92,$00,<sear071,>sear071,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0008:
	.byte $7B,$D1,$D2,$78,$78,$78,$86,$00
	.byte $7B,$D4,$80,$80,$D7,$80,$7A,$00
	.byte $7B,$D1,$7B,$7C,$D8,$7C,$7A,$00
	.byte $7B,$D1,$7B,$D4,$7B,$78,$86,$00
	.byte $7B,$7B,$7B,$D1,$7B,$84,$7A,$00
	.byte $7B,$7C,$D3,$D1,$7C,$D4,$7A,$00
	.byte $7B,$7B,$7B,$7B,$7B,$7B,$7B,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $8b,$06,$82,$00,$9b, $59,$00,<sear052,>sear052,$00
	.byte $b4,$00,<sear072,>sear072,$00, $25,$00,<sear073,>sear073,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0009:
	.byte $7B,$78,$78,$7B,$D1,$D1,$7A,$00
	.byte $7B,$D1,$84,$7B,$D1,$D4,$7A,$00
	.byte $7B,$D4,$80,$7B,$D6,$D9,$DA,$00
	.byte $7B,$D1,$D3,$7B,$D1,$D1,$7A,$00
	.byte $7B,$D1,$84,$7B,$D4,$D1,$7A,$00
	.byte $7B,$D5,$D5,$78,$D1,$D4,$7A,$00
	.byte $7B,$D1,$80,$80,$80,$80,$7B,$00
	.byte $7B,$D1,$7B,$7B,$7B,$7B,$7B,$00
	.byte $8a,$40,$00		; NPC number
	.byte $00,$8b,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$c2,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $25,$06,$82,$00,$24, $85,$06,$82,$00,$84
	.byte $c3,$00,<sear053,>sear053,$00, $c5,$00,<sear054,>sear054,$00	; searchable areas
	.byte $74,$00,<sear061,>sear061,$00
	.byte $05,$01				; sprite palette

ship0010:
	.byte $7B,$79,$7B,$7B,$7B,$7B,$7B,$00
	.byte $7B,$82,$81,$D3,$7C,$D3,$85,$00
	.byte $7B,$D4,$79,$7A,$7B,$D1,$7A,$00
	.byte $7B,$D1,$79,$7A,$7B,$D1,$7A,$00
	.byte $7B,$D1,$79,$7A,$7B,$D4,$7A,$00
	.byte $7B,$D4,$82,$7A,$D2,$D1,$86,$00
	.byte $7B,$80,$80,$7B,$D1,$D4,$7A,$00
	.byte $7B,$7B,$7B,$7B,$D1,$D1,$7A,$00
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $c9,$00,<sear074,>sear074,$00, $3a,$00,<sear075,>sear075,$00
	.byte $36,$00,<sear076,>sear076,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0011:
	.byte $7B,$7B,$00,$00,$00,$00,$00,$00
	.byte $D1,$D1,$7B,$00,$00,$00,$00,$00
	.byte $7B,$D4,$D1,$7B,$00,$00,$00,$00
	.byte $7B,$80,$80,$D1,$7B,$00,$00,$00
	.byte $7B,$7C,$D3,$D4,$D1,$7B,$00,$00
	.byte $7B,$D1,$D4,$D1,$D4,$D1,$7B,$00
	.byte $7B,$79,$80,$7B,$D1,$D4,$7A,$00
	.byte $7B,$79,$7B,$7B,$7B,$7B,$7B,$00
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $94,$00,<sear077,>sear077,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0012:
	.byte $00,$00,$00,$00,$00,$00,$7B,$7B
	.byte $00,$00,$00,$00,$00,$7B,$D1,$D1
	.byte $00,$00,$00,$00,$7B,$D1,$D4,$7B
	.byte $00,$00,$00,$7B,$D4,$D1,$D1,$7B
	.byte $00,$00,$7B,$D6,$D6,$D9,$D6,$7B
	.byte $00,$7B,$D6,$D6,$D6,$D9,$D6,$7B
	.byte $00,$79,$D4,$D1,$D1,$D4,$D1,$7B
	.byte $00,$79,$D1,$D1,$D1,$D1,$D1,$7B
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0013:
	.byte $00,$79,$D1,$D1,$D4,$D1,$D1,$7B
	.byte $00,$79,$D1,$7B,$DB,$78,$D5,$7B
	.byte $00,$79,$D4,$7B,$D1,$D1,$D4,$7B
	.byte $00,$79,$D1,$D2,$78,$7B,$D1,$7B
	.byte $00,$79,$D4,$D1,$D1,$7B,$D1,$7B
	.byte $00,$79,$D1,$D1,$D1,$7B,$D4,$7B
	.byte $00,$79,$D1,$D1,$D1,$7B,$D1,$7B
	.byte $00,$79,$D1,$D1,$D1,$7B,$D1,$7B
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $39,$04,$00,$82,$b6, $4d,$00,<sear057,>sear057,$00
	.byte $87,$00,<sear078,>sear078,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0014:
	.byte $00,$79,$D1,$D1,$D1,$7B,$D4,$7B
	.byte $00,$79,$D1,$D1,$D4,$7B,$D1,$7B
	.byte $00,$79,$D2,$78,$78,$7B,$D1,$7B
	.byte $00,$79,$D4,$D1,$D1,$7B,$D1,$7B
	.byte $00,$7F,$D5,$D2,$79,$7B,$D4,$7B
	.byte $00,$79,$D1,$D4,$82,$7B,$D1,$7B
	.byte $00,$79,$7B,$7B,$7B,$7B,$D1,$7B
	.byte $00,$79,$7B,$7B,$7B,$7B,$D1,$7B
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $a5,$00,<sear055,>sear055,$00, $65,$00,<sear079,>sear079,$00
	.byte $a7,$00,<sear080,>sear080,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0015:
	.byte $00,$79,$7B,$7B,$7B,$7B,$D1,$7B
	.byte $00,$79,$D3,$7C,$7C,$7B,$D1,$7B
	.byte $00,$7F,$78,$D4,$D5,$7B,$D4,$7B
	.byte $00,$79,$D6,$D9,$D6,$7B,$D1,$7B
	.byte $00,$79,$80,$D7,$80,$7B,$D1,$7B
	.byte $00,$79,$7C,$D8,$7C,$D3,$D4,$7B
	.byte $00,$7B,$7B,$7B,$7B,$7B,$7B,$7B
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $8a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $b7,$00,<sear056,>sear056,$00, $34,$00,<sear081,>sear081,$00
	.byte $ba,$00,<sear082,>sear082,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$01				; sprite palette

ship0016:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$7B,$78,$78,$78,$D5,$78,$7B
	.byte $00,$7B,$87,$D4,$DC,$D6,$84,$7B
	.byte $00,$7B,$79,$D5,$78,$7B,$7B,$7B
	.byte $00,$7B,$82,$D1,$D4,$7B,$7B,$7B
	.byte $00,$7B,$7B,$7A,$7B,$7B,$7B,$7B
	.byte $00,$7C,$85,$7A,$7C,$7C,$7C,$7C
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $c6,$05,$00,$02,$49, $74,$00,<item813,>item813,$00
	.byte $65,$02,<item813,>item813,$00, $6d,$06,$82,$01,$6c	; searchable areas
	.byte $a7,$00,<sear058,>sear058,$00
	.byte $05,$00				; sprite palette


