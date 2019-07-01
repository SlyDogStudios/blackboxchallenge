
	ldy temp_8bit_1
	lda (temp_16bit_1), y
	tay
	lda outdoors_tile32a, y
	tax
		lda outdoors_tile16a, x
		sta store_meta16+0
		lda outdoors_tile16b, x
		sta store_meta16+1
		lda outdoors_tile16c, x
		sta store_meta16+4
		lda outdoors_tile16d, x
		sta store_meta16+5
		lda outdoors_tile16e, x
		sta store_coll0+0
	lda outdoors_tile32b, y
	tax
		lda outdoors_tile16a, x
		sta store_meta16+2
		lda outdoors_tile16b, x
		sta store_meta16+3
		lda outdoors_tile16c, x
		sta store_meta16+6
		lda outdoors_tile16d, x
		sta store_meta16+7
		lda outdoors_tile16e, x
		sta store_coll0+1
	lda outdoors_tile32c, y
	tax
		lda outdoors_tile16a, x
		sta store_meta16+8
		lda outdoors_tile16b, x
		sta store_meta16+9
		lda outdoors_tile16c, x
		sta store_meta16+12
		lda outdoors_tile16d, x
		sta store_meta16+13
		lda outdoors_tile16e, x
		sta store_coll0+2
	lda outdoors_tile32d, y
	tax
		lda outdoors_tile16a, x
		sta store_meta16+10
		lda outdoors_tile16b, x
		sta store_meta16+11
		lda outdoors_tile16c, x
		sta store_meta16+14
		lda outdoors_tile16d, x
		sta store_meta16+15
		lda outdoors_tile16e, x
		sta store_coll0+3
	lda outdoors_tile32e, y
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


	.byte <pal_res1,<pal_sewer,<pal_bball,<pal_sewer,<pal_track,<pal_res3,<pal_res2,<pal_stad
	.byte <pal_stad,<pal_last,<pal_park,<pal_dark,<pal_mist,<pal_kinl

	.byte >pal_res1,>pal_sewer,>pal_bball,>pal_sewer,>pal_track,>pal_res3,>pal_res2,>pal_stad
	.byte >pal_stad,>pal_last,>pal_park,>pal_dark,>pal_mist,>pal_kinl

pal_res1:
.byte $0f,$30,$19,$2a, $0f,$07,$17,$16, $0f,$30,$10,$27, $0f,$33,$00,$3c
.byte $0f,$37,$11,$17, $0f,$37,$0f,$07, $0f,$36,$11,$16, $0f,$17,$1c,$0f	; pal1=logiudice ;pal2=huff
pal_sewer:
.byte $0f,$30,$19,$2a, $0f,$30,$1c,$2c, $0f,$30,$00,$00, $0f,$07,$17,$10
.byte $0f,$37,$11,$17, $0f,$37,$03,$07, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_bball:
.byte $0f,$30,$19,$2a, $0f,$30,$1c,$2c, $0f,$30,$19,$27, $0f,$33,$00,$3c
.byte $0f,$37,$11,$17, $0f,$37,$03,$07, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_track:
.byte $0f,$30,$19,$16, $0f,$30,$1c,$2c, $0f,$30,$19,$07, $0f,$10,$00,$3c
.byte $0f,$37,$11,$17, $0f,$37,$01,$27, $0f,$36,$17,$27, $0f,$17,$1c,$0f	; pal1=skorp,pal2=door
pal_res3:
.byte $0f,$30,$19,$16, $0f,$07,$17,$12, $0f,$30,$10,$27, $0f,$33,$00,$3c
.byte $0f,$37,$11,$17, $0f,$37,$25,$0f, $0f,$36,$17,$27, $0f,$17,$1c,$0f	; pal1=jill
pal_res2:
.byte $0f,$30,$19,$27, $0f,$07,$17,$26, $0f,$30,$10,$27, $0f,$33,$00,$3c
.byte $0f,$37,$11,$17, $0f,$37,$25,$0f, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_stad:
.byte $0f,$30,$19,$27, $0f,$10,$00,$16, $0f,$10,$06,$00, $0f,$33,$00,$3c
.byte $0f,$37,$11,$17, $0f,$37,$25,$0f, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_last:
.byte $0f,$30,$21,$31, $0f,$03,$23,$30, $0f,$03,$23,$27, $0f,$03,$23,$16
.byte $0f,$37,$11,$17, $0f,$37,$0f,$19, $0f,$36,$17,$27, $0f,$17,$1c,$0f
pal_park:
.byte $0f,$30,$19,$2a, $0f,$07,$17,$16, $0f,$30,$10,$27, $0f,$33,$00,$3c
.byte $0f,$37,$11,$17, $0f,$37,$0f,$07, $0f,$36,$11,$16, $0f,$37,$0f,$30
pal_dark:
.byte $0f,$30,$19,$2a, $0f,$07,$17,$16, $0f,$30,$10,$27, $0f,$33,$00,$3c
.byte $0f,$37,$11,$17, $0f,$37,$0f,$07, $0f,$36,$11,$16, $0f,$38,$0f,$30
pal_mist:
.byte $0f,$30,$19,$2a, $0f,$07,$17,$16, $0f,$30,$10,$27, $0f,$33,$00,$3c
.byte $0f,$37,$11,$17, $0f,$37,$0f,$07, $0f,$36,$11,$16, $0f,$37,$16,$07
pal_kinl:
.byte $0f,$30,$19,$16, $0f,$07,$17,$12, $0f,$30,$10,$27, $0f,$33,$00,$3c
.byte $0f,$37,$11,$17, $0f,$37,$25,$0f, $0f,$36,$17,$27, $0f,$37,$20,$0f	; pal1=jill

outdoors_tile16a:
	.byte $00,$01,$02,$02,$04,$00,$04,$00,$00,$0E,$0F,$10,$13,$11,$E0,$F8
	.byte $FC,$FF,$ED,$0E,$0E,$FB,$E4,$E5,$E5,$E5,$E9,$D9,$DB,$0E,$D8,$17
	.byte $19,$0E,$15,$20,$20,$CC,$DD,$8D,$0F,$8E,$A7,$0F,$C0,$F0,$1D,$1D
	.byte $10,$6C,$C2,$C6,$10,$7E,$8C,$CA,$10,$BB,$6A,$68,$88,$A8,$8A,$62
	.byte $0E,$DB,$D9,$D9,$0E,$82,$10,$B1,$64,$84,$66,$86,$60,$60,$60,$60
	.byte $60,$60,$80,$0F,$AA,$F4,$60,$60,$60,$60,$60,$60,$60,$60,$B7
outdoors_tile16b:
	.byte $00,$02,$02,$03,$00,$05,$00,$00,$05,$0E,$0F,$10,$14,$12,$E1,$F8
	.byte $FD,$FE,$EE,$0E,$0E,$FB,$E5,$E5,$E6,$E5,$EA,$DA,$DB,$D7,$0E,$18
	.byte $1A,$0E,$20,$20,$16,$CD,$DD,$0F,$0F,$8F,$b4,$BD,$C0,$F1,$1E,$1E
	.byte $10,$6D,$C3,$C7,$00,$7F,$9C,$CB,$10,$BB,$6B,$69,$89,$A9,$8B,$63
	.byte $0E,$DB,$0E,$0E,$0E,$83,$10,$10,$65,$85,$67,$87,$61,$61,$61,$61
	.byte $61,$61,$81,$BA,$AB,$F5,$61,$61,$61,$61,$61,$61,$61,$61,$0f
outdoors_tile16c:
	.byte $00,$04,$00,$00,$04,$00,$06,$07,$07,$0E,$0F,$10,$23,$21,$E2,$F9
	.byte $FD,$FE,$EB,$EF,$FA,$0E,$E4,$E5,$E5,$E7,$E5,$D9,$DC,$0E,$D8,$27
	.byte $0E,$2B,$25,$20,$20,$CE,$DD,$8D,$9D,$9E,$B5,$0F,$C1,$F2,$2D,$2D
	.byte $6E,$7C,$C4,$C8,$10,$10,$AC,$1F,$10,$BB,$7A,$78,$98,$B8,$9A,$72
	.byte $DC,$0E,$D9,$0E,$D9,$92,$B0,$B1,$74,$94,$92,$96,$70,$6A,$7A,$76
	.byte $A2,$B2,$00,$BA,$BA,$F6,$70,$70,$70,$70,$70,$70,$90,$91,$B7
outdoors_tile16d:
	.byte $00,$00,$00,$05,$00,$05,$07,$07,$08,$0E,$0F,$10,$24,$22,$E3,$F9
	.byte $FC,$FF,$EC,$EF,$FA,$0E,$E5,$E5,$E6,$E8,$E5,$DA,$DC,$D7,$0E,$28
	.byte $2A,$2C,$20,$20,$26,$CF,$DD,$0F,$9D,$9F,$B6,$0F,$C1,$F3,$2E,$2E
	.byte $6F,$7D,$C5,$C9,$00,$10,$BC,$2F,$10,$BB,$7B,$79,$99,$B9,$9B,$73
	.byte $DC,$0E,$0E,$0E,$0E,$93,$B0,$10,$75,$95,$93,$97,$71,$6B,$7B,$77
	.byte $A3,$B3,$00,$0F,$0F,$F7,$A4,$A5,$A6,$A7,$B4,$B5,$71,$71,$0f
outdoors_tile16e:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$00,$01
	.byte $01,$01,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$01,$00,$0d,$0e
	.byte $01,$00,$01,$01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01
	.byte $00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01

outdoors_tile32a:
	.byte $00,$01,$02,$02,$04,$00,$00,$0C,$0C,$09,$09,$0F,$0F,$12,$12,$09
	.byte $12,$09,$15,$09,$12,$09,$10,$10,$0C,$11,$11,$0C,$17,$1A,$0C,$09
	.byte $1B,$1C,$09,$1E,$09,$09,$09,$09,$09,$09,$0C,$12,$12,$12,$09,$17
	.byte $09,$09,$0D,$09,$1E,$11,$18,$11,$16,$0D,$12,$12,$0C,$09,$12,$11
	.byte $11,$16,$17,$18,$09,$0D,$09,$09,$0D,$09,$25,$26,$26,$28,$28,$28
	.byte $29,$27,$2A,$2B,$0A,$0A,$0A,$25,$26,$09,$09,$09,$0A,$0A,$2C,$12
	.byte $26,$12,$25,$12,$25,$25,$12,$23,$26,$12,$10,$11,$38,$30,$38,$38
	.byte $38,$38,$38,$38,$31,$39,$09,$25,$0C,$30,$3D,$38,$38,$3C,$38,$38
	.byte $12,$0C,$13,$13,$12,$16,$19,$16,$17,$16,$18,$0B,$11,$0B,$0B,$1E
	.byte $25,$25,$0B,$22,$12,$23,$23,$09,$26,$0A,$18,$09,$09,$0A,$26,$09
	.byte $25,$25,$17,$09,$16,$0D,$0A,$0A,$09,$42,$44,$42,$43,$09,$5E,$5E
	.byte $26,$25,$47,$47,$45,$25,$25,$45,$45,$26,$45,$45,$45,$25,$46,$46
	.byte $25,$16,$0C,$48,$45,$45,$3F,$25,$53,$54,$4C,$25,$25,$25,$54,$4C
	.byte $53,$53,$53,$53,$54,$25,$25,$58,$25,$58,$58,$54,$25,$25,$25,$25
	.byte $54,$54,$25,$25,$54,$54,$54,$25,$25,$25,$25,$25,$25,$25,$25,$25
	.byte $4C,$4C,$25,$25,$25,$25,$52,$53,$25,$50,$4D,$51,$00,$25,$45,$2f
outdoors_tile32b:
	.byte $00,$02,$02,$03,$00,$00,$05,$0C,$0C,$09,$09,$0F,$12,$12,$12,$09
	.byte $12,$09,$15,$09,$09,$09,$10,$0C,$11,$11,$11,$16,$0E,$18,$09,$09
	.byte $09,$1C,$1D,$09,$09,$15,$09,$12,$12,$0F,$12,$12,$09,$12,$16,$0E
	.byte $12,$09,$0D,$1D,$09,$0C,$0C,$11,$0E,$0D,$09,$0F,$09,$09,$12,$11
	.byte $0C,$17,$17,$09,$1F,$0D,$09,$09,$0D,$09,$0A,$0A,$26,$28,$28,$2A
	.byte $28,$0A,$0A,$0A,$0A,$2A,$0A,$25,$26,$09,$09,$09,$09,$09,$2C,$12
	.byte $26,$12,$25,$2D,$26,$2E,$2F,$26,$26,$12,$10,$11,$30,$38,$32,$34
	.byte $33,$30,$37,$3E,$12,$39,$39,$09,$0C,$38,$38,$38,$34,$38,$38,$36
	.byte $12,$0C,$13,$13,$12,$17,$18,$19,$18,$17,$25,$0B,$25,$0B,$0B,$09
	.byte $0B,$09,$25,$23,$24,$24,$23,$25,$26,$0A,$09,$09,$09,$25,$09,$26
	.byte $25,$25,$17,$0C,$17,$0D,$0A,$0A,$09,$09,$09,$09,$09,$09,$0A,$0A
	.byte $45,$45,$45,$45,$45,$25,$25,$45,$45,$09,$47,$47,$45,$09,$46,$45
	.byte $0E,$17,$0D,$4A,$45,$45,$26,$25,$53,$54,$4C,$25,$25,$25,$4C,$54
	.byte $53,$53,$53,$53,$4C,$25,$25,$4C,$25,$5C,$5D,$54,$25,$25,$25,$25
	.byte $25,$54,$52,$54,$54,$54,$4D,$25,$25,$25,$25,$25,$25,$25,$25,$25
	.byte $4D,$4E,$25,$25,$25,$25,$53,$52,$25,$51,$4F,$4C,$25,$3F,$55,$25
outdoors_tile32c:
	.byte $00,$04,$00,$00,$06,$07,$07,$0C,$0D,$09,$0C,$12,$12,$12,$0F,$12
	.byte $0C,$14,$13,$10,$10,$10,$10,$10,$0C,$17,$19,$0C,$09,$09,$0C,$09
	.byte $1B,$1E,$09,$1E,$09,$13,$09,$0C,$09,$09,$0C,$12,$12,$09,$09,$12
	.byte $09,$13,$0C,$1C,$09,$18,$0C,$16,$12,$0D,$12,$12,$0F,$0F,$0C,$11
	.byte $11,$16,$17,$18,$09,$22,$22,$23,$23,$20,$25,$0A,$0C,$25,$0A,$25
	.byte $0A,$27,$27,$0A,$0A,$0A,$0C,$25,$09,$09,$0A,$0A,$0A,$0A,$25,$12
	.byte $12,$25,$26,$12,$25,$25,$12,$12,$12,$10,$11,$14,$38,$35,$0E,$38
	.byte $38,$38,$0E,$38,$10,$39,$09,$09,$39,$35,$38,$38,$38,$38,$38,$0E
	.byte $12,$12,$22,$23,$25,$16,$1A,$16,$0E,$16,$18,$0B,$11,$22,$25,$1E
	.byte $25,$25,$0B,$12,$12,$12,$12,$09,$0A,$09,$18,$11,$11,$0A,$09,$09
	.byte $25,$26,$09,$09,$0D,$09,$0A,$41,$40,$41,$41,$42,$09,$41,$5E,$41
	.byte $45,$25,$47,$45,$47,$25,$26,$46,$45,$00,$45,$45,$45,$25,$45,$45
	.byte $25,$16,$0C,$49,$22,$45,$45,$26,$53,$53,$54,$4C,$4C,$25,$53,$54
	.byte $53,$53,$52,$25,$53,$56,$57,$54,$59,$54,$54,$25,$4E,$4F,$50,$51
	.byte $25,$2D,$25,$25,$53,$53,$53,$4C,$4F,$4C,$51,$4C,$4C,$4C,$50,$4C
	.byte $54,$54,$4F,$4C,$51,$25,$53,$53,$4D,$54,$54,$54,$12,$26,$46,$46
outdoors_tile32d:
	.byte $00,$00,$00,$05,$07,$07,$08,$0C,$0D,$09,$0C,$12,$12,$0F,$0F,$12
	.byte $0C,$14,$13,$10,$10,$0C,$10,$0C,$16,$17,$18,$09,$12,$09,$09,$0C
	.byte $14,$09,$1D,$09,$1D,$13,$09,$12,$12,$12,$12,$09,$09,$09,$12,$12
	.byte $09,$13,$0C,$1C,$09,$0C,$0C,$17,$12,$0D,$12,$12,$0F,$0F,$0C,$11
	.byte $0C,$17,$00,$09,$09,$23,$23,$24,$24,$21,$0A,$0A,$0C,$25,$0A,$25
	.byte $0A,$0A,$0A,$0A,$0A,$0A,$0C,$25,$09,$0A,$0A,$09,$0A,$09,$25,$12
	.byte $12,$25,$26,$12,$12,$12,$12,$12,$1F,$10,$11,$14,$35,$38,$38,$34
	.byte $0E,$35,$38,$0E,$10,$39,$39,$09,$39,$38,$0E,$38,$34,$0E,$38,$38
	.byte $3B,$12,$23,$24,$0E,$0E,$18,$1A,$18,$0E,$25,$0B,$25,$23,$25,$24
	.byte $0B,$0B,$25,$12,$12,$12,$12,$25,$0A,$09,$09,$11,$09,$25,$09,$09
	.byte $26,$25,$09,$0C,$0D,$09,$0A,$41,$40,$41,$41,$09,$09,$41,$0A,$41
	.byte $45,$45,$45,$45,$45,$25,$26,$46,$46,$09,$47,$45,$47,$09,$45,$45
	.byte $25,$00,$0D,$4B,$23,$45,$45,$25,$53,$53,$54,$4C,$25,$4C,$54,$53
	.byte $2D,$55,$53,$25,$2D,$4C,$4C,$54,$4C,$54,$54,$25,$51,$4D,$4E,$4E
	.byte $25,$53,$53,$53,$55,$52,$2D,$4E,$4C,$50,$4C,$4D,$4E,$4F,$4C,$51
	.byte $54,$54,$4C,$50,$4C,$50,$53,$53,$4F,$54,$54,$54,$26,$12,$46,$25
outdoors_tile32e:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$A0,$A8,$2A,$0A,$A0
	.byte $0A,$AA,$AA,$F0,$F2,$30,$FF,$33,$4C,$5F,$5F,$04,$85,$05,$00,$00
	.byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$88,$88,$80,$88,$2A,$22,$0A,$84,$A5
	.byte $08,$AA,$00,$AA,$AA,$13,$01,$5F,$A5,$00,$A2,$A2,$00,$00,$0A,$FF
	.byte $33,$55,$55,$11,$00,$00,$00,$00,$00,$AA,$99,$A9,$05,$5A,$AA,$5A
	.byte $AA,$AA,$AA,$AA,$AA,$AA,$0A,$55,$05,$80,$A0,$20,$AA,$AA,$5F,$AA
	.byte $A5,$5A,$55,$AA,$95,$95,$A6,$A5,$A5,$FA,$FF,$AF,$FF,$FF,$DB,$FF
	.byte $48,$00,$DB,$48,$FA,$55,$44,$01,$50,$55,$56,$55,$55,$7E,$AA,$75
	.byte $6A,$A0,$0A,$0A,$5A,$AA,$AA,$AA,$AA,$80,$44,$55,$77,$55,$55,$6A
	.byte $55,$51,$55,$FF,$FF,$FF,$FF,$44,$A5,$0A,$00,$F0,$30,$66,$01,$04
	.byte $55,$55,$05,$00,$05,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $56,$66,$55,$55,$55,$AA,$AA,$55,$55,$22,$55,$55,$55,$22,$55,$55
	.byte $AE,$40,$00,$55,$55,$55,$59,$AA,$00,$00,$05,$55,$55,$55,$04,$01
	.byte $00,$00,$00,$50,$04,$55,$55,$05,$55,$05,$05,$50,$A5,$D5,$65,$D5
	.byte $54,$00,$11,$11,$00,$00,$04,$55,$95,$55,$95,$A5,$A5,$A5,$A5,$A5
	.byte $0F,$0F,$B5,$F5,$B5,$95,$00,$00,$D5,$0A,$0F,$0F,$66,$99,$55,$9B

final000:
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$CB
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$C9
	.byte $57,$CB,$CB,$CB,$CB,$CB,$CC,$57
	.byte $57,$C9,$C9,$C9,$C9,$C9,$E6,$57
	.byte $57,$CB,$CB,$CB,$CB,$CB,$CB,$CB
	.byte $CA,$C9,$C9,$C9,$C9,$C9,$C9,$C9
	.byte $57,$D3,$D3,$D3,$D3,$D3,$D3,$D3
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $b1,$06,$85,$08,$78, $7d,$04,$00,$82,$6d
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final001:
	.byte $CB,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $C9,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $CB,$CB,$D5,$DC,$DD,$DE,$CB,$CB
	.byte $C9,$C9,$C9,$C9,$C9,$C9,$C9,$C9
	.byte $D3,$D3,$D3,$D3,$D3,$D3,$D3,$D3
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final002:
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$F3,$CB,$C8,$C8,$C8,$C8,$57
	.byte $57,$C9,$C9,$C8,$C8,$C8,$C8,$57
	.byte $57,$D0,$C8,$C8,$C8,$C8,$C8,$57
	.byte $CB,$CB,$EC,$CB,$CB,$CB,$CC,$57
	.byte $C9,$C9,$C9,$C9,$C9,$C9,$E6,$CC
	.byte $D3,$D3,$D0,$D3,$D3,$D3,$D3,$E0
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d5,$07,$00,$82,$d6, $bd,$05,$00,$82,$cd
	.byte $73,$07,$00,$82,$74, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final003:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$CB,$CB,$D6,$DF,$F8,$CB,$57
	.byte $57,$C9,$C9,$C9,$C9,$C9,$C9,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $9a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final004:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$CB,$F2,$CB,$EE,$CB,$CA,$CA
	.byte $57,$C9,$E1,$C9,$E1,$C9,$C8,$57
	.byte $57,$CB,$CB,$EA,$CB,$E9,$CB,$57
	.byte $57,$C9,$C9,$E1,$C9,$C9,$C9,$57
	.byte $57,$C8,$C8,$C8,$C8,$D0,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $9a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $bb,$07,$00,$82,$bc, $96,$04,$00,$82,$87
	.byte $54,$04,$00,$82,$45, $58,$07,$00,$82,$5a	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final005:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $CA,$F1,$CA,$CA,$CA,$EB,$CA,$57
	.byte $57,$D0,$C8,$C8,$C8,$C9,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$D0,$C8,$57
	.byte $57,$CB,$E8,$CB,$CB,$CB,$CB,$57
	.byte $57,$C9,$E1,$C9,$C9,$C9,$C9,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $9a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $b4,$07,$00,$82,$b6, $7b,$07,$00,$82,$7c
	.byte $53,$07,$00,$82,$54, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final006:
	.byte $57,$C8,$57,$57,$57,$EB,$CB,$57
	.byte $57,$C8,$57,$CB,$CA,$E5,$C9,$57
	.byte $57,$C8,$F1,$C9,$D3,$F2,$EC,$57
	.byte $57,$57,$E2,$C8,$57,$E1,$E4,$57
	.byte $57,$57,$57,$C8,$F0,$CB,$CB,$57
	.byte $57,$57,$57,$D3,$C8,$C9,$DB,$57
	.byte $57,$57,$57,$57,$E2,$C8,$CA,$CA
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $3b,$25,$00,$02,$3b, $65,$25,$00,$02,$65
	.byte $c9,$25,$00,$02,$c9, $7a,$07,$00,$82,$7c	; searchable areas
	.byte $7d,$06,$00,$02,$7c
	.byte $09,$00				; sprite palette

final007:
	.byte $57,$C8,$57,$57,$57,$57,$57,$57
	.byte $57,$C8,$CB,$CA,$CA,$CA,$CB,$57
	.byte $57,$D3,$DB,$D3,$57,$D3,$C9,$57
	.byte $57,$CA,$CA,$CA,$CA,$CA,$C8,$57
	.byte $57,$C8,$CB,$CB,$CB,$CB,$CB,$57
	.byte $57,$D3,$DB,$DB,$DB,$DB,$C9,$57
	.byte $CA,$CA,$CA,$CA,$CA,$CA,$C8,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final008:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$EF,$CB,$CB,$CB,$CB,$CB,$57
	.byte $57,$C9,$C9,$C9,$C9,$C9,$C9,$57
	.byte $57,$D1,$C8,$C8,$57,$F4,$ED,$57
	.byte $57,$C8,$E7,$CB,$57,$C9,$C9,$57
	.byte $57,$C8,$C9,$C9,$57,$D2,$D1,$57
	.byte $57,$C8,$D1,$C8,$57,$C8,$C8,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d5,$04,$00,$02,$c5, $bd,$05,$00,$02,$cd
	.byte $73,$06,$00,$02,$72, $ba,$25,$00,$02,$b9	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final009:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$EC,$CB,$CB,$E9,$CB,$CB,$CB
	.byte $57,$E5,$C9,$C9,$E5,$C9,$C9,$C9
	.byte $57,$CB,$E7,$CB,$CB,$EE,$CB,$CB
	.byte $57,$C9,$E5,$C9,$DB,$C9,$C9,$C9
	.byte $57,$C8,$D3,$57,$57,$D2,$F3,$57
	.byte $57,$C8,$57,$57,$57,$D3,$E5,$57
	.byte $57,$C8,$57,$57,$57,$57,$57,$57
	.byte $9b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $53,$25,$00,$02,$53, $59,$25,$00,$02,$59
	.byte $95,$25,$00,$02,$95, $ba,$25,$00,$02,$ba	; searchable areas
	.byte $dd,$25,$00,$02,$dd
	.byte $09,$00				; sprite palette

final010:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $CB,$CB,$ED,$57,$F3,$E7,$CB,$57
	.byte $C9,$C9,$E4,$57,$E4,$C9,$C9,$57
	.byte $CB,$CB,$57,$EF,$57,$C8,$CB,$57
	.byte $C9,$C9,$CA,$E4,$57,$C8,$C9,$57
	.byte $57,$C8,$57,$57,$57,$D1,$C8,$57
	.byte $57,$C8,$57,$57,$57,$D3,$D3,$57
	.byte $57,$C8,$57,$57,$57,$57,$57,$57
	.byte $9b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $55,$06,$00,$02,$53, $59,$06,$00,$02,$57
	.byte $97,$06,$00,$02,$95, $bb,$06,$00,$02,$ba	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final011:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$F0,$CA,$CA,$57,$EB,$57,$57
	.byte $57,$D1,$C8,$C8,$57,$C9,$DA,$CB
	.byte $57,$CB,$E9,$C8,$57,$D1,$C8,$C9
	.byte $57,$C9,$C9,$D3,$CB,$CB,$CB,$57
	.byte $57,$C8,$D1,$CA,$C9,$C9,$C9,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $b5,$06,$00,$02,$b3, $7b,$06,$00,$02,$7a
	.byte $53,$06,$00,$02,$52, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final012:
	.byte $57,$CB,$CB,$CB,$CB,$57,$57,$57
	.byte $57,$C9,$DB,$DB,$C9,$CA,$CA,$CA
	.byte $57,$C8,$CA,$CA,$57,$EF,$CB,$57
	.byte $57,$CB,$CB,$C8,$57,$E4,$C9,$57
	.byte $57,$C9,$C9,$C8,$57,$57,$C8,$57
	.byte $57,$C8,$CB,$CB,$CB,$CB,$C8,$57
	.byte $57,$C8,$C9,$C9,$DB,$DB,$C8,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $7b,$04,$00,$02,$6a, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final013:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $CA,$CA,$CA,$CA,$CA,$CA,$CA,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$CA
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final014:
	.byte $57,$CB,$CB,$57,$CB,$57,$57,$57
	.byte $57,$C9,$C9,$CB,$C9,$57,$EE,$57
	.byte $57,$C8,$C8,$C9,$C8,$57,$E1,$57
	.byte $57,$EA,$C8,$57,$C8,$CB,$C8,$57
	.byte $57,$E1,$C8,$57,$C8,$C9,$C8,$57
	.byte $57,$D3,$D3,$57,$C8,$57,$D3,$57
	.byte $CA,$CA,$CA,$CA,$C8,$CA,$CA,$CA
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $92,$04,$00,$81,$83, $5c,$04,$00,$81,$4d
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final015:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$CB,$CB,$CB,$ED,$57,$F1,$57
	.byte $57,$C9,$C9,$C9,$E5,$CA,$D0,$57
	.byte $57,$C8,$C8,$F3,$57,$57,$C8,$57
	.byte $57,$E8,$C8,$C9,$CB,$F0,$C8,$57
	.byte $57,$C9,$C8,$F7,$DB,$D0,$C8,$57
	.byte $CA,$F6,$C8,$57,$57,$57,$57,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $a7,$25,$00,$02,$a7, $59,$25,$00,$02,$69
	.byte $c2,$25,$00,$02,$c1, $bb,$07,$00,$81,$bc	; searchable areas
	.byte $5d,$06,$00,$81,$4d
	.byte $09,$00				; sprite palette

final016:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$57,$CA,$CA,$CA,$CA,$57,$57
	.byte $CB,$CA,$C8,$C8,$D3,$C8,$CA,$57
	.byte $C9,$C8,$D3,$57,$CA,$C8,$57,$57
	.byte $57,$57,$CA,$D9,$C8,$57,$57,$57
	.byte $57,$57,$C8,$CB,$CB,$CA,$CA,$57
	.byte $57,$CA,$C8,$C9,$C9,$C8,$C8,$57
	.byte $57,$57,$57,$57,$57,$57,$C8,$57
	.byte $9b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final017:
	.byte $57,$57,$57,$57,$57,$57,$C8,$57
	.byte $57,$CA,$D7,$F9,$FA,$FB,$C8,$57
	.byte $57,$C8,$CB,$CB,$CB,$CB,$F3,$57
	.byte $57,$C8,$C9,$C9,$C9,$C9,$C9,$57
	.byte $F5,$CB,$57,$CB,$CB,$CB,$C8,$57
	.byte $E3,$C9,$CA,$C9,$C9,$C9,$C8,$57
	.byte $E2,$C8,$57,$C8,$C8,$C8,$D1,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9b,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $c1,$26,$00,$02,$c0, $dd,$06,$00,$02,$dc
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final018:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$57,$57,$57,$CB,$57,$57,$57
	.byte $57,$57,$57,$CA,$C9,$CA,$57,$57
	.byte $57,$57,$CA,$C8,$57,$C8,$CA,$57
	.byte $57,$57,$C8,$57,$57,$57,$C8,$57
	.byte $57,$57,$C8,$57,$57,$57,$C8,$57
	.byte $9a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final019:
	.byte $57,$57,$C8,$57,$57,$57,$C8,$57
	.byte $57,$57,$C8,$CA,$57,$57,$C8,$57
	.byte $57,$57,$57,$C8,$CA,$CA,$C8,$57
	.byte $57,$57,$57,$57,$C8,$57,$57,$57
	.byte $57,$57,$57,$57,$C8,$CB,$EC,$57
	.byte $CD,$CB,$57,$57,$C8,$C9,$C9,$57
	.byte $E3,$C9,$57,$57,$57,$D3,$D0,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9a,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $dd,$04,$00,$82,$cd, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final020:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$E7,$57,$CA,$57,$57,$EB,$57
	.byte $57,$C9,$57,$C8,$CA,$CA,$E4,$57
	.byte $57,$C8,$57,$C8,$CB,$CB,$CB,$CB
	.byte $57,$D1,$57,$D3,$DB,$C9,$DB,$DB
	.byte $57,$CB,$CB,$CA,$CA,$C8,$CA,$57
	.byte $57,$DB,$DB,$C8,$C8,$C8,$C8,$CA
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $93,$05,$00,$01,$a2, $5d,$05,$00,$01,$6c
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final021:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$CB,$EC,$CB,$CB,$CB,$EF,$57
	.byte $57,$C9,$C9,$C9,$C9,$C9,$E4,$57
	.byte $CB,$C8,$F7,$C8,$57,$E7,$F2,$57
	.byte $DB,$D3,$57,$57,$57,$C9,$E1,$57
	.byte $57,$F0,$CB,$57,$CA,$D1,$C8,$57
	.byte $CA,$F7,$C9,$57,$57,$57,$57,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $c3,$25,$00,$01,$c2, $65,$25,$00,$01,$65
	.byte $bb,$06,$00,$01,$ba, $5d,$06,$00,$01,$5c	; searchable areas
	.byte $9c,$06,$00,$81,$8d
	.byte $09,$00				; sprite palette

final022:
	.byte $57,$E7,$CB,$CC,$CD,$CB,$CB,$CB
	.byte $57,$C9,$DB,$CE,$CF,$DB,$C9,$C9
	.byte $57,$C8,$CB,$CB,$CB,$57,$CB,$CB
	.byte $57,$F7,$C9,$C9,$C9,$57,$C9,$C9
	.byte $57,$C8,$EA,$57,$C8,$57,$C8,$57
	.byte $57,$C8,$C9,$57,$C8,$CB,$C8,$57
	.byte $57,$C8,$F6,$57,$D3,$DB,$D3,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $63,$25,$00,$01,$63, $c4,$25,$00,$01,$c4
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final023:
	.byte $CB,$CB,$CB,$CB,$CB,$F4,$CB,$57
	.byte $C9,$C9,$C9,$C9,$C9,$E1,$C9,$57
	.byte $CB,$CB,$CB,$CB,$CB,$D3,$ED,$57
	.byte $C9,$C9,$C9,$C9,$C9,$57,$C9,$57
	.byte $57,$CB,$F4,$57,$C8,$57,$D1,$57
	.byte $57,$C9,$C9,$57,$C8,$CB,$C8,$57
	.byte $57,$C8,$F6,$57,$C8,$C9,$C8,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $9d,$06,$00,$01,$9b, $c4,$25,$00,$01,$c3
	.byte $3a,$07,$00,$81,$3c, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final024:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$57,$57,$CC,$CA,$CA,$57,$57
	.byte $CA,$CA,$CA,$CE,$C8,$C8,$CA,$CA
	.byte $57,$57,$57,$57,$C8,$C8,$57,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $46,$00,$00		; NPC number
	.byte $76,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $d3,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $09,$00				; sprite palette

final025:
	.byte $57,$EF,$57,$57,$57,$ED,$57,$57
	.byte $57,$E5,$EB,$EC,$EE,$E4,$CA,$57
	.byte $57,$C8,$C9,$C9,$C9,$C8,$C8,$57
	.byte $CA,$C8,$C8,$F7,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$C8,$C8,$C8,$57
	.byte $57,$C8,$C8,$C8,$F6,$C8,$C8,$57
	.byte $57,$C8,$F7,$C8,$C8,$C8,$C8,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $9d,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $3b,$06,$00,$01,$39, $33,$25,$00,$01,$33
	.byte $67,$25,$00,$01,$67, $a8,$25,$00,$01,$a8	; searchable areas
	.byte $c5,$25,$00,$01,$c4
	.byte $09,$00				; sprite palette

power_00:
	.byte $07,$07,$C4,$C4,$C4,$C4,$C4,$C4
	.byte $0A,$0A,$C5,$C7,$C3,$C3,$C3,$C3
	.byte $07,$07,$B1,$C6,$C5,$C5,$B5,$C5
	.byte $07,$07,$B5,$B6,$B6,$C5,$B6,$C3
	.byte $07,$07,$B5,$C5,$C5,$C5,$C5,$C5
	.byte $07,$07,$B6,$C3,$C3,$C3,$C3,$C3
	.byte $0A,$0A,$C4,$C4,$C4,$C4,$C4,$C4
	.byte $07,$07,$C4,$C4,$C4,$C4,$C4,$C4
	.byte $95,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $c1,$05,$88,$03,$6a, $21,$05,$88,$03,$6a
	.byte $45,$03,<item005,>item005,$00, $56,$00,<item005,>item005,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

power_01:
	.byte $C4,$C4,$C4,$C4,$C4,$C4,$C4,$C4
	.byte $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
	.byte $C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5
	.byte $C3,$C3,$B6,$C5,$B5,$B5,$C5,$B6
	.byte $C5,$C5,$C5,$C5,$B6,$B6,$C5,$C5
	.byte $C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3
	.byte $C4,$C4,$C4,$C4,$C4,$C4,$C4,$C4
	.byte $C4,$C4,$C4,$C4,$C4,$C4,$C4,$C4
	.byte $95,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

power_02:
	.byte $C4,$C4,$C4,$C4,$C4,$C4,$C4,$07
	.byte $C3,$C3,$C3,$C3,$C3,$C3,$B6,$07
	.byte $C5,$B5,$C5,$C5,$C5,$C5,$C5,$07
	.byte $C3,$B6,$C5,$B6,$C3,$B5,$C5,$07
	.byte $C5,$C5,$C5,$C5,$C5,$B5,$C5,$07
	.byte $C3,$C3,$C3,$C3,$C3,$B6,$C5,$07
	.byte $C4,$C4,$C4,$C4,$C4,$C4,$C4,$07
	.byte $C4,$C4,$C4,$C4,$C4,$C4,$C4,$07
	.byte $95,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

univers4:
	.byte $62,$62,$62,$90,$57,$62,$62,$62
	.byte $07,$09,$09,$9E,$60,$0F,$09,$07
	.byte $07,$2B,$2D,$5F,$2C,$09,$09,$07
	.byte $07,$09,$09,$28,$2C,$07,$09,$07
	.byte $07,$09,$39,$28,$2C,$39,$09,$07
	.byte $07,$09,$07,$28,$2C,$09,$09,$07
	.byte $07,$09,$09,$28,$3A,$0F,$09,$07
	.byte $07,$07,$07,$2A,$07,$07,$07,$07
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d7,$05,$8a,$04,$5a, $17,$04,$00,$81,$c7
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

shopp_3a:
	.byte $07,$3F,$3F,$3F,$3F,$3F,$3F,$07
	.byte $07,$6C,$6D,$7D,$6F,$70,$7E,$07
	.byte $07,$5F,$5F,$5F,$5F,$5F,$5F,$07
	.byte $07,$39,$39,$39,$2A,$C2,$39,$07
	.byte $07,$39,$39,$39,$2A,$C2,$39,$07
	.byte $07,$09,$09,$09,$28,$09,$09,$07
	.byte $07,$07,$07,$07,$2A,$07,$07,$07
	.byte $07,$07,$07,$07,$2A,$07,$07,$07
	.byte $4b,$00,$00		; NPC number
	.byte $56,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $92,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $37,$14,$85,$02,$c6, $3b,$14,$82,$02,$cb
	.byte $d9,$05,$87,$05,$c9, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$00				; sprite palette

stadiumd:
	.byte $AA,$A9,$AA,$A9,$AA,$A9,$AA,$A9
	.byte $C8,$C8,$B1,$B5,$C8,$C8,$C8,$B1
	.byte $C6,$C6,$B1,$B6,$C6,$C6,$C6,$B1
	.byte $B7,$B7,$B1,$C5,$B8,$B7,$B7,$B1
	.byte $B7,$B7,$B1,$C5,$B8,$B7,$B7,$B1
	.byte $B7,$B7,$B1,$C5,$B8,$FF,$FE,$B1
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $45,$14,$03,$83,$b7, $5c,$00,<item000,>item000,$00
	.byte $ad,$04,$03,$83,$3d, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi000:
	.byte $B5,$BA,$BA,$BA,$BA,$BD,$09,$A8
	.byte $B5,$BA,$BA,$BA,$BA,$BD,$09,$A6
	.byte $B5,$BA,$BA,$B5,$B5,$BD,$09,$A6
	.byte $B5,$BA,$BA,$B5,$B5,$B9,$09,$A6
	.byte $B5,$BA,$BA,$B5,$B5,$BD,$09,$A6
	.byte $B5,$BA,$BA,$B6,$B6,$BD,$09,$A6
	.byte $B5,$BA,$BC,$BA,$BA,$BD,$09,$A7
	.byte $B5,$BA,$BA,$BA,$BA,$BD,$09,$09
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $7a,$05,$86,$0e,$bc, $00,$00,$00,$00,$00;$7a,$05,$07,$81,$bc,
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi001:
	.byte $A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8
	.byte $A6,$AB,$AC,$AB,$AC,$AB,$AC,$AB
	.byte $A6,$AB,$09,$AB,$09,$AB,$09,$AB
	.byte $A6,$AB,$09,$AB,$09,$AB,$09,$AB
	.byte $A6,$AB,$09,$AB,$09,$AB,$09,$AB
	.byte $A6,$AB,$09,$AB,$09,$AB,$09,$AB
	.byte $A7,$A9,$AA,$A9,$AA,$A9,$AA,$A9
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi002:
	.byte $A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8
	.byte $AC,$AB,$AC,$AB,$AC,$AB,$AC,$AB
	.byte $09,$AB,$09,$AB,$09,$AB,$09,$AB
	.byte $09,$AB,$09,$AB,$09,$AB,$09,$AB
	.byte $09,$AB,$09,$AB,$09,$AB,$09,$AB
	.byte $09,$AB,$09,$AB,$09,$AB,$09,$AB
	.byte $AA,$A9,$AA,$A9,$AA,$A9,$AA,$A9
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi003:
	.byte $A8,$A8,$A8,$A8,$A8,$A8,$A8,$09
	.byte $AC,$AB,$AC,$AB,$AC,$AE,$A6,$09
	.byte $09,$AB,$09,$AB,$09,$AE,$A6,$09
	.byte $09,$AB,$09,$AB,$09,$AE,$A6,$09
	.byte $09,$AB,$09,$AB,$09,$AE,$A6,$09
	.byte $09,$AB,$09,$AB,$09,$AE,$A6,$09
	.byte $AA,$A9,$AA,$A9,$AA,$AF,$A7,$09
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi004:
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $09,$09,$B0,$B3,$B3,$B3,$B3,$B5
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi005:
	.byte $B6,$B6,$B6,$B6,$B6,$B6,$B6,$B5
	.byte $B7,$B7,$B7,$B7,$B7,$B7,$B4,$B5
	.byte $B7,$B7,$B7,$B7,$B7,$B4,$B2,$B5
	.byte $B7,$B7,$B7,$B7,$B4,$B2,$B2,$B5
	.byte $B7,$B7,$B7,$B4,$B2,$B2,$B2,$B5
	.byte $B6,$B6,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi006:
	.byte $B6,$B6,$B5,$B6,$B6,$B6,$B6,$B6
	.byte $B7,$B7,$B6,$B8,$B7,$B7,$B7,$B7
	.byte $B7,$B7,$B7,$B7,$B7,$B6,$B7,$B7
	.byte $B7,$B7,$B7,$B7,$B7,$B7,$B7,$B7
	.byte $B7,$B7,$B7,$B7,$B7,$B7,$B7,$B7
	.byte $B6,$B6,$B6,$B6,$B6,$B6,$B6,$B6
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi007:
	.byte $B6,$B6,$B6,$B6,$B6,$B6,$B6,$B6
	.byte $B7,$B7,$B7,$B7,$B7,$B8,$B7,$B7
	.byte $B7,$B7,$B7,$B7,$B5,$B7,$B7,$B7
	.byte $B7,$B7,$B7,$B7,$B6,$B7,$B7,$B7
	.byte $B7,$B7,$B7,$B7,$B7,$B7,$B7,$B7
	.byte $B6,$B6,$B6,$B6,$B6,$B6,$B6,$B6
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi008:
	.byte $B6,$B5,$B6,$B6,$B6,$B6,$B6,$B6
	.byte $B7,$B5,$B8,$B7,$B7,$B7,$B7,$B7
	.byte $B7,$B6,$B7,$B7,$B7,$B7,$B8,$B7
	.byte $B7,$B7,$B7,$B7,$B7,$B7,$B7,$B7
	.byte $B7,$B7,$B7,$B5,$B7,$B7,$B7,$B7
	.byte $B6,$B6,$B6,$B6,$B6,$B6,$B6,$B6
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi009:
	.byte $B5,$B6,$B6,$B6,$B6,$B6,$B6,$B6
	.byte $B5,$B8,$B7,$B8,$B7,$B7,$B7,$B7
	.byte $B5,$BA,$B8,$B7,$B7,$B7,$B8,$B7
	.byte $B5,$BA,$BA,$B5,$B8,$B7,$B7,$B7
	.byte $B5,$BA,$BA,$B6,$B8,$B7,$B7,$B7
	.byte $B5,$BA,$BA,$BA,$BA,$B5,$B6,$B6
	.byte $B5,$BA,$BA,$BA,$BA,$B5,$09,$09
	.byte $B5,$BA,$BA,$BA,$BA,$B5,$09,$09
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi010:
	.byte $B5,$BA,$BA,$BA,$BA,$BD,$09,$09
	.byte $B5,$BA,$BA,$BA,$BA,$BD,$09,$09
	.byte $B5,$BA,$B6,$BA,$BA,$B5,$B5,$B5
	.byte $B5,$BA,$BB,$BA,$BB,$BE,$BE,$BE
	.byte $B5,$BA,$BA,$BB,$B6,$BF,$BE,$BE
	.byte $B5,$BA,$BB,$BE,$BE,$BE,$BE,$BE
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi011:
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $BE,$BE,$BE,$BE,$BE,$BE,$BE,$BE
	.byte $BE,$BE,$BE,$BE,$BE,$BE,$B5,$BE
	.byte $BE,$BE,$BE,$BE,$BF,$BE,$B5,$BE
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi012:
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$FE,$B5
	.byte $BE,$BE,$BE,$B6,$BE,$BE,$B6,$BE
	.byte $BE,$BE,$BF,$BE,$BE,$BE,$BE,$BE
	.byte $BE,$BE,$BE,$BE,$BE,$BE,$BE,$BE
	.byte $B5,$B5,$B5,$C0,$B5,$B5,$B5,$B5
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $c7,$15,$83,$03,$55, $4d,$06,$83,$03,$ac
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi013:
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $09,$09,$09,$09,$09,$09,$09,$09
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $BE,$BE,$BE,$BE,$B6,$BE,$BE,$BE
	.byte $BE,$BF,$B6,$BF,$BE,$BF,$BE,$BE
	.byte $BE,$BE,$BE,$BE,$BE,$BE,$BF,$BE
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

stadi014:
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $B5,$B5,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $BE,$BE,$B6,$B3,$B2,$B2,$B2,$B5
	.byte $BE,$BE,$BE,$B6,$B3,$B2,$B2,$B5
	.byte $BE,$BE,$BE,$BE,$B5,$B3,$B2,$B5
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $8c,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette
stadi015:
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $09,$09,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $B5,$B5,$B1,$B2,$B2,$B2,$B2,$B5
	.byte $BE,$BE,$B6,$B3,$B2,$B2,$B2,$B5
	.byte $BE,$BE,$BE,$B6,$B3,$B2,$B2,$B5
	.byte $BE,$BE,$BE,$BE,$B5,$B3,$B2,$B5
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $07,$00				; sprite palette

towns_2a:
	.byte $07,$18,$19,$1A,$07,$6A,$6A,$6A
	.byte $07,$1B,$1C,$1D,$75,$37,$19,$1A
	.byte $07,$08,$28,$44,$09,$A4,$2F,$1D
	.byte $0A,$09,$28,$09,$09,$09,$2C,$09
	.byte $07,$09,$28,$0B,$0B,$0B,$3B,$0B
	.byte $07,$09,$39,$26,$11,$11,$11,$11
	.byte $07,$32,$39,$31,$12,$12,$12,$12
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $41,$00,$00		; NPC number
	.byte $68,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $90,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $25,$14,$00,$81,$62, $4d,$14,$00,$81,$ac
	.byte $61,$06,$02,$0b,$57, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $06,$00				; sprite palette

towns_2b:
	.byte $39,$37,$19,$35,$37,$19,$1A,$08
	.byte $39,$41,$42,$43,$A4,$1C,$1D,$75
	.byte $A5,$44,$28,$0F,$0F,$2B,$09,$75
	.byte $09,$09,$09,$09,$2A,$09,$09,$75
	.byte $0B,$0B,$0B,$0B,$0C,$0B,$0B,$0B
	.byte $11,$11,$11,$11,$11,$11,$11,$11
	.byte $12,$12,$12,$12,$12,$12,$12,$12
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $00,$00,$2f		; NPC number
	.byte $00,$00,$56		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$93		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $35,$04,$00,$81,$b4, $2b,$14,$00,$81,$ac
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $06,$00				; sprite palette

towns_2c:
	.byte $08,$08,$08,$07,$6A,$6A,$6A,$07
	.byte $75,$09,$1E,$78,$37,$19,$1A,$07
	.byte $75,$09,$1E,$75,$A4,$1C,$1D,$07
	.byte $75,$09,$1E,$09,$09,$28,$09,$07
	.byte $0B,$0B,$0B,$0B,$0B,$0C,$44,$07
	.byte $11,$11,$11,$11,$26,$1E,$54,$07
	.byte $12,$12,$12,$12,$31,$07,$0A,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $00,$25,$00		; NPC number
	.byte $00,$6c,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$c2,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $4b,$14,$01,$00,$a8, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $06,$00				; sprite palette


towns_3a:
	.byte $07,$07,$78,$78,$78,$78,$07,$07
	.byte $07,$1E,$09,$09,$09,$09,$1F,$07
	.byte $07,$09,$3F,$3F,$3F,$44,$09,$07
	.byte $07,$09,$37,$19,$1A,$09,$09,$07
	.byte $07,$09,$A4,$1C,$1D,$09,$39,$07
	.byte $07,$09,$09,$28,$09,$09,$09,$07
	.byte $0F,$0B,$0B,$0C,$0B,$0B,$0B,$0F
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $13,$00,$00		; NPC number
	.byte $26,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $93,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d1,$06,$84,$06,$63, $87,$14,$00,$81,$c6
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$00				; sprite palette

towns_3b:
	.byte $07,$37,$1A,$07,$07,$07,$07,$07
	.byte $07,$38,$1D,$07,$09,$26,$49,$07
	.byte $07,$2C,$09,$A3,$09,$31,$31,$07
	.byte $07,$2C,$78,$A3,$09,$09,$09,$07
	.byte $07,$2C,$75,$A3,$44,$44,$44,$07
	.byte $07,$2C,$32,$A3,$46,$09,$47,$07
	.byte $0F,$3B,$0B,$0B,$0F,$0F,$0F,$0F
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $00,$54,$43		; NPC number
	.byte $00,$9c,$49		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$92,$c1		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $23,$14,$01,$01,$a6, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$00				; sprite palette

towns_3c:
	.byte $07,$07,$3F,$3F,$3F,$07,$09,$07
	.byte $07,$5A,$37,$19,$1A,$39,$09,$07
	.byte $07,$99,$38,$A2,$1D,$09,$1E,$07
	.byte $07,$3D,$2C,$09,$0A,$09,$1E,$07
	.byte $07,$09,$2C,$09,$39,$09,$1E,$07
	.byte $07,$09,$2C,$09,$09,$09,$1E,$07
	.byte $0F,$0F,$3B,$0B,$0B,$0B,$0F,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $00,$2e,$1d		; NPC number
	.byte $00,$8a,$75		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$b2,$e0		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $45,$14,$01,$01,$c4, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0d,$00				; sprite palette

towns_3d:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $08,$08,$08,$08,$08,$08,$08,$07
	.byte $0A,$46,$09,$46,$47,$45,$48,$07
	.byte $07,$1E,$09,$09,$09,$09,$09,$07
	.byte $07,$39,$39,$39,$39,$39,$09,$07
	.byte $07,$09,$46,$46,$47,$46,$47,$07
	.byte $07,$0A,$0A,$0A,$0A,$0A,$09,$07
	.byte $07,$07,$07,$07,$07,$07,$09,$07
	.byte $83,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $05,$00				; sprite palette

towns_3e:
	.byte $07,$09,$07,$07,$07,$07,$07,$07
	.byte $07,$09,$07,$08,$08,$07,$08,$08
	.byte $07,$09,$1E,$3D,$09,$08,$09,$0A
	.byte $07,$09,$1E,$07,$09,$39,$09,$07
	.byte $07,$09,$1E,$07,$09,$39,$09,$07
	.byte $07,$09,$1E,$07,$09,$3C,$09,$07
	.byte $07,$0A,$0A,$07,$0A,$0A,$0A,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $83,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$00				; sprite palette

track_00:
	.byte $09,$09,$57,$57,$57,$57,$57,$57
	.byte $09,$57,$98,$98,$98,$98,$98,$98
	.byte $57,$98,$54,$54,$54,$54,$54,$54
	.byte $57,$54,$54,$54,$99,$99,$99,$99
	.byte $57,$54,$54,$99,$09,$9B,$9C,$09
	.byte $57,$54,$54,$09,$09,$C1,$9A,$09
	.byte $57,$54,$54,$09,$09,$09,$09,$09
	.byte $57,$54,$54,$09,$09,$09,$09,$09
	.byte $51,$02,$00		; NPC number
	.byte $53,$bb,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $e1,$50,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $bb,$04,$03,$02,$89, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$00				; sprite palette

track_01:
	.byte $57,$57,$57,$57,$57,$57,$09,$09
	.byte $98,$98,$98,$98,$98,$98,$57,$09
	.byte $54,$54,$54,$54,$54,$54,$98,$57
	.byte $99,$99,$99,$99,$54,$54,$54,$57
	.byte $09,$A0,$A1,$09,$99,$54,$54,$57
	.byte $09,$4A,$9D,$09,$09,$54,$54,$57
	.byte $09,$9E,$9F,$09,$09,$54,$54,$57
	.byte $09,$09,$09,$09,$09,$54,$54,$57
	.byte $4f,$00,$00		; NPC number
	.byte $57,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $e2,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$00				; sprite palette

track_02:
	.byte $57,$54,$54,$09,$09,$09,$09,$09
	.byte $57,$54,$54,$54,$09,$09,$09,$09
	.byte $57,$54,$54,$54,$54,$54,$54,$54
	.byte $58,$57,$54,$54,$54,$54,$54,$54
	.byte $07,$58,$57,$57,$57,$97,$57,$57
	.byte $07,$93,$96,$96,$93,$94,$96,$95
	.byte $07,$94,$96,$96,$93,$96,$96,$95
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$00				; sprite palette

track_03:
	.byte $09,$09,$09,$09,$09,$54,$54,$57
	.byte $09,$09,$09,$09,$54,$54,$54,$57
	.byte $54,$51,$54,$54,$54,$54,$54,$57
	.byte $54,$51,$54,$54,$54,$54,$57,$58
	.byte $57,$57,$57,$57,$57,$57,$58,$39
	.byte $93,$96,$96,$95,$93,$96,$95,$39
	.byte $93,$94,$96,$95,$93,$96,$95,$39
	.byte $07,$09,$07,$07,$07,$07,$07,$07
	.byte $0c,$00,$00		; NPC number
	.byte $37,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $b2,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $04,$00				; sprite palette


shopp_2a:
	.byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
	.byte $3F,$7B,$79,$7B,$7A,$7B,$79,$7C
	.byte $3F,$5F,$5F,$5F,$5F,$5F,$5F,$5F
	.byte $6B,$11,$11,$11,$11,$11,$11,$11
	.byte $16,$12,$12,$12,$12,$12,$12,$12
	.byte $16,$69,$69,$69,$69,$69,$69,$69
	.byte $6A,$6A,$6A,$6A,$6A,$6A,$6A,$6A
	.byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
	.byte $32,$59,$00		; NPC number
	.byte $87,$4c,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $63,$82,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $71,$06,$02,$09,$5b, $39,$14,$04,$81,$c8
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

shopp_2b:
	.byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
	.byte $71,$70,$71,$7E,$7B,$7F,$79,$3F
	.byte $5F,$5F,$5F,$5F,$5F,$5F,$80,$3F
	.byte $11,$11,$11,$11,$11,$11,$11,$6B
	.byte $12,$12,$12,$12,$12,$12,$12,$16
	.byte $69,$69,$69,$69,$69,$69,$69,$16
	.byte $6A,$6A,$6A,$6A,$6A,$6A,$6A,$6A
	.byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
	.byte $24,$00,$00		; NPC number
	.byte $68,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $a0,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $3a,$14,$82,$86,$c6, $33,$14,$01,$81,$cb
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

park_000:
	.byte $3F,$39,$39,$39,$39,$39,$39,$39
	.byte $3F,$09,$09,$09,$09,$09,$09,$09
	.byte $3F,$81,$81,$81,$81,$80,$07,$07
	.byte $6B,$11,$11,$11,$26,$26,$07,$07
	.byte $16,$12,$12,$12,$31,$31,$07,$07
	.byte $16,$10,$10,$10,$10,$10,$39,$07
	.byte $6A,$32,$32,$32,$32,$32,$32,$32
	.byte $16,$07,$07,$07,$07,$07,$07,$07
	.byte $00,$42,$00		; NPC number
	.byte $00,$67,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$93,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

park_001:
	.byte $39,$45,$48,$45,$48,$45,$19,$39
	.byte $09,$09,$44,$44,$44,$09,$1C,$39
	.byte $07,$09,$0F,$09,$09,$09,$5A,$39
	.byte $07,$09,$2D,$09,$09,$09,$56,$39
	.byte $07,$46,$47,$09,$09,$46,$47,$39
	.byte $07,$26,$49,$26,$26,$49,$26,$39
	.byte $07,$82,$83,$82,$83,$82,$83,$39
	.byte $07,$07,$07,$07,$07,$07,$07,$39
	.byte $1e,$00,$4a		; NPC number
	.byte $a6,$00,$48		; NPC position (lo nybble Y, hi nybble X)
	.byte $c3,$00,$f1		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $2d,$14,$01,$00,$cb, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0a,$00				; sprite palette

park_002:
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$57,$A0,$57,$00
	.byte $00,$00,$00,$00,$57,$FD,$57,$00
	.byte $00,$00,$00,$00,$57,$5F,$57,$00
	.byte $00,$00,$00,$00,$57,$FC,$57,$00
	.byte $00,$00,$00,$00,$57,$84,$57,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$02,$00		; NPC number
	.byte $00,$aa,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$51,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $db,$15,$81,$00,$3d, $7b,$00,<item01e,>item01e,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

garden00:
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$77,$0A,$0A,$1F,$0A,$39,$07
	.byte $07,$76,$78,$75,$75,$75,$09,$07
	.byte $07,$76,$75,$75,$78,$75,$09,$07
	.byte $07,$76,$78,$75,$75,$78,$09,$07
	.byte $07,$76,$78,$75,$75,$75,$09,$0A
	.byte $07,$32,$32,$32,$0A,$0A,$0A,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $07,$00,$00		; NPC number
	.byte $6c,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $82,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $ae,$05,$83,$83,$8d, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette


towns_1d:
	.byte $07,$08,$08,$08,$18,$19,$1A,$07
	.byte $07,$1E,$09,$09,$2E,$2F,$1D,$07
	.byte $07,$29,$0B,$0B,$0C,$0B,$0B,$0F
	.byte $0A,$28,$26,$26,$20,$11,$11,$11
	.byte $07,$28,$26,$26,$25,$12,$12,$12
	.byte $07,$28,$24,$21,$2B,$2D,$2D,$10
	.byte $07,$27,$22,$23,$2C,$1F,$0A,$07
	.byte $07,$2A,$22,$23,$2C,$07,$07,$07
	.byte $29,$4c,$50		; NPC number
	.byte $65,$bb,$93		; NPC position (lo nybble Y, hi nybble X)
	.byte $e3,$a3,$90		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $61,$06,$03,$07,$ba, $2b,$14,$02,$81,$c6
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

towns_1e:
	.byte $07,$18,$19,$1A,$08,$08,$07,$07
	.byte $07,$1B,$1C,$1D,$09,$09,$07,$07
	.byte $0F,$0B,$0C,$0B,$0B,$0B,$0F,$0F
	.byte $11,$11,$11,$11,$11,$11,$11,$11
	.byte $12,$12,$12,$12,$12,$12,$12,$12
	.byte $10,$0E,$0E,$0E,$0D,$0E,$0E,$10
	.byte $07,$0A,$0A,$13,$14,$15,$0A,$07
	.byte $07,$07,$07,$16,$16,$17,$07,$07
	.byte $00,$3c,$2d		; NPC number
	.byte $00,$a4,$7b		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$e2,$73		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $25,$14,$81,$83,$c4, $c8,$15,$00,$81,$27
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

towns_1f:
	.byte $07,$07,$07,$07,$07,$3F,$3F,$07
	.byte $07,$07,$08,$44,$09,$37,$1A,$07
	.byte $0F,$0F,$0B,$0B,$1E,$38,$1D,$07
	.byte $11,$11,$11,$11,$1E,$2C,$09,$07
	.byte $12,$12,$12,$12,$1E,$2C,$09,$07
	.byte $3E,$0E,$0E,$0D,$3C,$2C,$39,$07
	.byte $07,$09,$09,$3A,$0F,$2B,$2D,$07
	.byte $07,$09,$09,$09,$09,$09,$09,$07
	.byte $37,$00,$00		; NPC number
	.byte $28,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $c1,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $4b,$14,$81,$82,$cc, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

towns_1g:
	.byte $07,$2A,$22,$23,$2C,$39,$37,$35
	.byte $07,$27,$22,$23,$3A,$0F,$38,$36
	.byte $07,$27,$33,$34,$3B,$0B,$0B,$0B
	.byte $07,$28,$26,$26,$20,$11,$11,$11
	.byte $07,$28,$31,$31,$25,$12,$12,$12
	.byte $07,$30,$2D,$2D,$2D,$2D,$2D,$10
	.byte $07,$07,$07,$0A,$32,$32,$32,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $00,$38,$4d		; NPC number
	.byte $00,$93,$88		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$b3,$31		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $2d,$14,$00,$82,$c8, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0b,$00				; sprite palette

towns_1h:
	.byte $07,$07,$07,$3F,$3F,$40,$07,$07
	.byte $07,$07,$39,$41,$42,$43,$39,$07
	.byte $0B,$0B,$1E,$09,$09,$09,$39,$09
	.byte $11,$26,$3C,$3D,$09,$09,$1E,$09
	.byte $12,$31,$31,$31,$09,$09,$1E,$09
	.byte $3E,$3E,$2D,$2D,$09,$1F,$07,$0A
	.byte $07,$07,$07,$0A,$0A,$07,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $00,$35,$3e		; NPC number
	.byte $00,$85,$b7		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$82,$91		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $39,$04,$00,$82,$c8, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

towns_1i:
	.byte $07,$09,$09,$09,$09,$09,$09,$07
	.byte $07,$07,$45,$47,$09,$46,$48,$07
	.byte $09,$09,$09,$09,$09,$09,$39,$07
	.byte $09,$44,$44,$09,$46,$47,$39,$07
	.byte $09,$09,$09,$09,$49,$26,$39,$07
	.byte $0A,$09,$09,$31,$31,$31,$39,$07
	.byte $07,$07,$07,$0A,$0A,$07,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $3f,$33,$3a		; NPC number
	.byte $a3,$74,$ab		; NPC position (lo nybble Y, hi nybble X)
	.byte $c3,$c1,$63		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette


bball_1a:
	.byte $07,$57,$57,$57,$57,$57,$57,$57
	.byte $07,$58,$58,$58,$58,$58,$58,$58
	.byte $07,$09,$09,$09,$09,$09,$09,$09
	.byte $07,$09,$09,$09,$09,$09,$09,$09
	.byte $07,$09,$09,$09,$09,$09,$09,$09
	.byte $07,$09,$09,$09,$09,$09,$09,$09
	.byte $07,$09,$59,$5A,$5A,$5A,$5A,$5B
	.byte $07,$54,$54,$54,$54,$54,$54,$54
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$00				; sprite palette

bball_1b:
	.byte $57,$57,$57,$57,$09,$09,$09,$09
	.byte $58,$58,$58,$58,$57,$09,$09,$09
	.byte $09,$09,$09,$09,$58,$57,$09,$09
	.byte $09,$09,$09,$09,$09,$58,$57,$09
	.byte $09,$09,$09,$09,$09,$09,$58,$57
	.byte $09,$09,$09,$09,$09,$09,$09,$57
	.byte $5B,$09,$09,$09,$09,$09,$09,$57
	.byte $54,$09,$09,$09,$09,$09,$09,$57
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$00				; sprite palette

bball_1c:
	.byte $07,$54,$54,$54,$54,$54,$54,$54
	.byte $07,$4A,$52,$54,$54,$54,$55,$54
	.byte $07,$4A,$51,$54,$54,$54,$54,$54
	.byte $07,$4B,$51,$54,$53,$54,$54,$54
	.byte $07,$54,$51,$54,$54,$54,$54,$54
	.byte $07,$54,$50,$4E,$4E,$4D,$4F,$54
	.byte $07,$56,$56,$56,$56,$4C,$4C,$56
	.byte $07,$07,$07,$07,$07,$07,$07,$07
	.byte $00,$00,$11		; NPC number
	.byte $00,$00,$b5		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$63		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $2d,$05,$01,$01,$3c, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$00				; sprite palette

bball_1d:
	.byte $5C,$09,$09,$09,$09,$09,$09,$57
	.byte $54,$09,$09,$09,$09,$09,$09,$57
	.byte $54,$09,$09,$09,$09,$09,$09,$57
	.byte $54,$09,$09,$09,$09,$09,$09,$57
	.byte $54,$09,$09,$09,$09,$09,$09,$57
	.byte $5D,$09,$09,$09,$09,$09,$09,$57
	.byte $0A,$0A,$1F,$0A,$0A,$0A,$0A,$4C
	.byte $07,$07,$1F,$07,$07,$07,$07,$07
	.byte $00,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d4,$05,$82,$0a,$48, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $02,$00				; sprite palette

sewers00:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $57,$62,$60,$60,$60,$60,$60,$60
	.byte $57,$63,$5F,$5F,$5F,$5F,$5F,$5F
	.byte $62,$62,$57,$5F,$57,$62,$62,$62
	.byte $5E,$5E,$57,$5F,$57,$5E,$5E,$5E
	.byte $57,$60,$60,$5F,$60,$60,$60,$60
	.byte $57,$61,$61,$61,$61,$61,$61,$61
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $86,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $43,$04,$82,$86,$a3, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$04				; sprite palette

sewers01:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $60,$60,$60,$60,$60,$60,$60,$60
	.byte $5F,$5F,$5F,$5F,$5F,$5F,$5F,$5F
	.byte $62,$62,$62,$62,$62,$62,$62,$62
	.byte $5E,$5E,$5E,$5E,$5E,$5E,$5E,$5E
	.byte $60,$60,$60,$60,$60,$60,$60,$60
	.byte $61,$61,$61,$61,$61,$61,$61,$61
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $86,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$04				; sprite palette

sewers02:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $60,$60,$60,$64,$67,$57,$60,$60
	.byte $5F,$5F,$66,$65,$5F,$57,$5F,$5F
	.byte $62,$62,$62,$62,$62,$62,$62,$62
	.byte $5E,$5E,$5E,$5E,$5E,$5E,$5E,$5E
	.byte $60,$60,$60,$60,$60,$60,$60,$60
	.byte $61,$61,$61,$61,$61,$61,$61,$61
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $86,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $38,$00,<item004,>item004,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$04				; sprite palette

sewers03:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $60,$60,$60,$60,$60,$60,$60,$60
	.byte $5F,$5F,$5F,$5F,$5F,$5F,$5F,$5F
	.byte $62,$57,$5F,$57,$62,$62,$62,$62
	.byte $5E,$57,$5F,$57,$5E,$5E,$5E,$5E
	.byte $60,$60,$5F,$60,$60,$60,$60,$60
	.byte $61,$61,$61,$61,$61,$61,$61,$61
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $86,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$04				; sprite palette

sewers04:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $60,$57,$60,$60,$60,$57,$60,$60
	.byte $5F,$60,$5F,$57,$5F,$57,$5F,$57
	.byte $62,$62,$62,$57,$5F,$57,$5F,$57
	.byte $5E,$5E,$5E,$57,$5F,$57,$5F,$57
	.byte $60,$60,$62,$57,$5F,$60,$5F,$62
	.byte $61,$61,$61,$57,$57,$61,$61,$61
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $86,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$04				; sprite palette

sewers05:
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $60,$60,$62,$60,$60,$57,$68,$57
	.byte $57,$5F,$61,$61,$5F,$57,$5F,$57
	.byte $62,$62,$57,$60,$5F,$57,$5F,$57
	.byte $5E,$5E,$57,$5F,$62,$57,$5F,$57
	.byte $62,$60,$57,$5F,$5F,$60,$5F,$57
	.byte $61,$61,$57,$57,$57,$61,$61,$57
	.byte $57,$57,$57,$57,$57,$57,$57,$57
	.byte $86,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $3c,$03,<item017,>item017,$00, $4d,$00,<item017,>item017,$00
	.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $01,$04				; sprite palette

shopp_1a:
	.byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
	.byte $3F,$6D,$6D,$72,$6F,$71,$73,$71
	.byte $3F,$5F,$5F,$5F,$5F,$5F,$5F,$5F
	.byte $6B,$11,$11,$11,$11,$11,$11,$11
	.byte $16,$12,$12,$12,$12,$12,$12,$12
	.byte $16,$74,$69,$69,$69,$69,$69,$69
	.byte $6A,$6A,$6A,$6A,$6A,$6A,$6A,$6A
	.byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
	.byte $21,$31,$36		; NPC number
	.byte $43,$5c,$87		; NPC position (lo nybble Y, hi nybble X)
	.byte $b3,$62,$e0		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $71,$05,$02,$0a,$6a, $36,$14,$00,$81,$84
	.byte $3d,$14,$03,$04,$c2, $a2,$07,$02,$06,$53	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

shopp_1b:
	.byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
	.byte $6C,$6D,$6E,$6F,$71,$70,$71,$3F
	.byte $5F,$5F,$5F,$5F,$5F,$5F,$5F,$3F
	.byte $11,$11,$11,$11,$11,$11,$11,$6B
	.byte $12,$12,$12,$12,$12,$12,$12,$16
	.byte $69,$69,$69,$69,$69,$69,$69,$16
	.byte $6A,$6A,$6A,$6A,$6A,$6A,$6A,$6A
	.byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
	.byte $00,$06,$30		; NPC number
	.byte $00,$59,$84		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$73,$90		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $3b,$14,$00,$01,$cb, $34,$14,$01,$01,$88
	.byte $7e,$05,$01,$0a,$6a, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $0c,$00				; sprite palette

slums000:
	.byte $57,$09,$8B,$22,$23,$2C,$8B,$57
	.byte $64,$3F,$3F,$22,$23,$62,$62,$62
	.byte $91,$87,$88,$22,$57,$2B,$2D,$92
	.byte $90,$8B,$3A,$8E,$62,$8B,$3F,$8C
	.byte $A0,$62,$62,$62,$23,$2C,$89,$8A
	.byte $90,$8B,$28,$22,$23,$8B,$09,$92
	.byte $57,$8E,$8E,$8D,$8F,$8E,$8E,$57
	.byte $58,$58,$58,$22,$23,$58,$58,$58
	.byte $93,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $d8,$06,$82,$03,$46, $9d,$14,$05,$86,$cc
	.byte $54,$14,$05,$86,$82, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette

slums001:
	.byte $09,$8B,$8B,$22,$23,$8B,$8B,$8B
	.byte $A0,$62,$62,$8D,$8F,$62,$62,$A1
	.byte $90,$3F,$40,$22,$23,$2C,$8B,$92
	.byte $91,$38,$43,$22,$23,$62,$62,$A1
	.byte $90,$8B,$28,$22,$62,$8B,$3F,$8C
	.byte $A0,$62,$62,$62,$23,$2C,$89,$8A
	.byte $90,$8B,$30,$22,$23,$8B,$2D,$92
	.byte $57,$8B,$8B,$22,$09,$8B,$8B,$57
	.byte $93,$00,$00		; NPC number
	.byte $00,$00,$00		; NPC position (lo nybble Y, hi nybble X)
	.byte $00,$00,$00		; NPC anim data (lo nybble CHR offset, hi nybble initial anim state)
	.byte $38,$05,$82,$04,$46, $bd,$14,$05,$86,$cc
	.byte $63,$14,$05,$86,$62, $00,$00,$00,$00,$00	; searchable areas
	.byte $00,$00,$00,$00,$00
	.byte $00,$00				; sprite palette




