menu_leave_setup:
	ldx #$00
	lda #$0f
:	sta pal_address+0, x
	inx
	cpx #$20
	bne :-
	ldx #$00
	lda #$ef
:	sta cursor+0, x
	inx
	inx
	inx
	inx
	cpx #$20
	bne :-
	lda temp_16bit_4+1
	sta pal_animation
	jmp menu_rtn_thingy
;	lda #<loop_load32s
;	sta loop_pointer+0
;	lda #>loop_load32s
;	sta loop_pointer+1
;	lda #<nmi_load32s
;	sta nmi_pointer+0
;	lda #>nmi_load32s
;	sta nmi_pointer+1
;	jmp loop_load32s

nmi_clear_for_menu:
	ldy #$00
	ldx temp_8bit_1
	lda menu_row_lo, x
	sta temp_16bit_1+0
	lda menu_row_hi, x
	sta temp_16bit_1+1
	lda menu_clear_lo, x
	sta ppu_addy+0
	lda menu_clear_hi, x
	sta ppu_addy+1
;	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	sta $2006
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #32
	bne :-
		inx
		stx temp_8bit_1
		cpx #30
		bne :+
			lda #<nmi_menu_attr_clear1
			sta nmi_pointer+0
			lda #>nmi_menu_attr_clear1
			sta nmi_pointer+1
:
	jmp end_nmi
nmi_menu_attr_clear1:
	lda #$23
	sta $2006
	lda #$c0
	sta $2006
	lda #$50
	sta $2007
	sta $2007
	sta $2007
	ldx #$00
	lda #$23
	sta $2006
	lda #$c3
	sta $2006
	lda #$00
:	sta $2007
	inx
	cpx #$1d
	bne :-
	lda #<nmi_menu_attr_clear2
	sta nmi_pointer+0
	lda #>nmi_menu_attr_clear2
	sta nmi_pointer+1
	jmp end_nmi
nmi_menu_attr_clear2:
	ldx #$00
	lda #$23
	sta $2006
	lda #$e0
	sta $2006
	lda #$00
:	sta $2007
	inx
	cpx #$20
	bne :-
	lda #$23
	sta $2006
	lda #$cc
	sta $2006
	lda #$aa
	sta $2007
	
	lda #$00
	sta temp_8bit_1
	lda #<nmi_menu_items_load
	sta nmi_pointer+0
	lda #>nmi_menu_items_load
	sta nmi_pointer+1
	jmp end_nmi
menu_clear_lo:
	.byte $00,$20,$40,$60,$80,$a0,$c0,$e0
	.byte $00,$20,$40,$60,$80,$a0,$c0,$e0
	.byte $00,$20,$40,$60,$80,$a0,$c0,$e0
	.byte $00,$20,$40,$60,$80,$a0
menu_clear_hi:
	.byte $20,$20,$20,$20,$20,$20,$20,$20
	.byte $21,$21,$21,$21,$21,$21,$21,$21
	.byte $22,$22,$22,$22,$22,$22,$22,$22
	.byte $23,$23,$23,$23,$23,$23

menu_row_lo:
	.byte <menu_row0
	.byte <menu_row1,<menu_row8,<menu_row0,<menu_row9,<menu_rowA
	.byte <menu_row2,<menu_row0,<menu_row3,<menu_row4,<menu_row0
	.byte <menu_row0,<menu_row0,<menu_row0,<menu_row0,<menu_row5
	.byte <menu_row6,<menu_row0,<menu_row0,<menu_row0,<menu_row0
	.byte <menu_row0,<menu_row0,<menu_row7,<menu_row0,<menu_row0
	.byte <menu_row0,<menu_row0,<menu_row0,<menu_row0
menu_row_hi:
	.byte >menu_row0
	.byte >menu_row1,>menu_row8,>menu_row0,>menu_row9,>menu_rowA
	.byte >menu_row2,>menu_row0,>menu_row3,>menu_row4,>menu_row0
	.byte >menu_row0,>menu_row0,>menu_row0,>menu_row0,>menu_row5
	.byte >menu_row6,>menu_row0,>menu_row0,>menu_row0,>menu_row0
	.byte >menu_row0,>menu_row0,>menu_row7,>menu_row0,>menu_row0
	.byte >menu_row0,>menu_row0,>menu_row0,>menu_row0
menu_row0:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
menu_row1:
	.byte $00,$00,"HEALTH",$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
menu_row2:
	.byte $00,$00,"MANUALS-",$00,$00,$00,$00,$00,$00,$be,$bf,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
menu_row3:
	.byte $00,$00,"OFFENSE",$00,$00,$00,"DEFENSE",$00,$00,"SPECIAL",$00,$00,$00,$00
menu_row4:
	.byte $00,$00,$02,$02,$02,$02,$02,$02,$02,$00,$00,$00,$02,$02,$02,$02
	.byte $02,$02,$02,$00,$00,$02,$02,$02,$02,$02,$02,$02,$00,$00,$00,$00
menu_row5:
	.byte $00,$00,"ABILITY",$00,$00,$00,"SOCIAL",$00,$00,$00,"COMBAT",$00,$00,$00,$00,$00
menu_row6:
	.byte $00,$00,$02,$02,$02,$02,$02,$02,$02,$00,$00,$00,$02,$02,$02,$02
	.byte $02,$02,$00,$00,$00,$02,$02,$02,$02,$02,$02,$00,$00,$00,$00,$00
menu_row7:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$58,$00
	.byte $00,$59,$00,$00,$00,"OTHER--",$00,$00,$00,$00
menu_row8:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte "PERI-",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
menu_row9:
	.byte $00,$00,"STAMINA",$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
menu_rowA:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $ae,$af,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

nmi_menu_items_load:
	ldx temp_8bit_1
	lda menu_games_offset, x
	tax
	cpx #$20
	bcc :+
		lda $00, x
		bne :++
			beq @no_load
:
	lda $00, x
	and #$c0
;	cmp #$40
	bne :+
		lda $00, x
		and #$21
		beq @no_load
			ldy #$00
			ldx temp_8bit_1
			lda menu_games_ppu_hi, x
			sta $2006
			lda menu_games_ppu_lo, x
			sta $2006
			lda #$3f
			sta $2007
			sta $2007
			sta $2007
			bne @no_load
:		ldx temp_8bit_1
		lda menu_games_names_lo, x
		sta temp_16bit_1+0
		lda menu_games_names_hi, x
		sta temp_16bit_1+1
		lda menu_games_ppu_hi, x
		sta $2006
		lda menu_games_ppu_lo, x
		sta $2006
		ldy #$00
:		lda (temp_16bit_1), y
		cmp #$ff
		beq @no_load
			sta $2007
			iny
			jmp :-
@no_load:
	ldx temp_8bit_1
	inx
	stx temp_8bit_1
	cpx #37
	bne :+
		lda #<nmi_menu_meters
		sta nmi_pointer+0
		lda #>nmi_menu_meters
		sta nmi_pointer+1
:
	jmp end_nmi

nmi_menu_meters:
	ldx #$00
	lda #$20
	sta $2006
	lda #$42
	sta $2006
:	lda <h0+0, x
	sta $2007
	inx
	cpx #10
	bne :-
	ldx #$00
	lda #$20
	sta $2006
	lda #$62
	sta $2006
:	lda <m0+0, x
	sta $2007
	inx
	cpx #8
	bne :-
	lda #$20
	sta $2006
	lda #$ca
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

	lda #$20
	sta nametable
	lda #<nmi_menu_turn_on
	sta nmi_pointer+0
	lda #>nmi_menu_turn_on
	sta nmi_pointer+1
	jmp end_nmi

; offense - jab stomp fireball zap                    
; outside - hammer climb slide float homer sail goal  
; defense - block jump juke sidestep                   
; inside - mingle hop haggle lockpick start net defuse
; special - escape clue strength adrenaline      
; combat - pickpocket mulligan quickdraw advantage awesome
; peri - powerglove u-force powerpad dogbone laserscope
menu_games_names_lo:
	.byte <menu_games_names1a,<menu_games_names11,<menu_games_names18,<menu_games_names0d
	.byte <menu_games_names06,<menu_games_names01,<menu_games_names09,<menu_games_names13,<menu_games_names1d,<menu_games_names15,<menu_games_names0e,<menu_games_names05
	.byte <menu_games_names12,<menu_games_names04,<menu_games_names0f,<menu_games_names00
	.byte <menu_games_names17,<menu_games_names02,<menu_games_names1b,<menu_games_names07,<menu_games_names0c,<menu_games_names16
	.byte <menu_games_names08,<menu_games_names03,<menu_games_names14,<menu_games_names10
	.byte <menu_games_names0b,<menu_games_names0a,<menu_games_names1c,<menu_games_names19,<menu_games_names1f
	.byte <menu_games_names1e
	.byte <menu_games_names20,<menu_games_names21,<menu_games_names22,<menu_games_names23,<menu_games_names24
menu_games_names_hi:
	.byte >menu_games_names1a,>menu_games_names11,>menu_games_names18,>menu_games_names0d
	.byte >menu_games_names06,>menu_games_names01,>menu_games_names09,>menu_games_names13,>menu_games_names1d,>menu_games_names15,>menu_games_names0e,>menu_games_names05
	.byte >menu_games_names12,>menu_games_names04,>menu_games_names0f,>menu_games_names00
	.byte >menu_games_names17,>menu_games_names02,>menu_games_names1b,>menu_games_names07,>menu_games_names0c,>menu_games_names16
	.byte >menu_games_names08,>menu_games_names03,>menu_games_names14,>menu_games_names10
	.byte >menu_games_names0b,>menu_games_names0a,>menu_games_names1c,>menu_games_names19,>menu_games_names1f
	.byte >menu_games_names1e
	.byte >menu_games_names20,>menu_games_names21,>menu_games_names22,>menu_games_names23,>menu_games_names24

; HOP menu_games_names06	$06,$01,$09,$13,$1d,$15,$0e,$05
; FLOAT menu_games_names01
; RIDE menu_games_names09
; SAIL menu_games_names13
; HAMMER menu_games_names1d
; TAKEOFF menu_games_names15
; CLIMB menu_games_names0e
; LOCKPICK menu_games_names05

; MINGLE menu_games_names17	$17,$02,$1b,$07,$0c,$16
; HOMER menu_games_names02
; NET menu_games_names1b
; HAGGLE menu_games_names07
; DEFUSE menu_games_names0c
; GOAL menu_games_names16

menu_games_ppu_lo:
	.byte $42,$62,$82,$a2
	.byte $22,$42,$62,$82,$a2,$c2,$e2,$02
	.byte $4c,$6c,$8c,$ac
	.byte $2c,$4c,$6c,$8c,$ac,$cc
	.byte $55,$75,$95,$b5
	.byte $35,$55,$75,$95,$b5
	.byte $19
	.byte $55,$75,$95,$b5,$d5
menu_games_ppu_hi:
	.byte $21,$21,$21,$21
	.byte $22,$22,$22,$22,$22,$22,$22,$23
	.byte $21,$21,$21,$21
	.byte $22,$22,$22,$22,$22,$22
	.byte $21,$21,$21,$21
	.byte $22,$22,$22,$22,$22
	.byte $23
	.byte $20,$20,$20,$20,$20
menu_games_offset:
	.byte $1a,$11,$18,$0d				; offense - jab stomp fireball zap
	.byte $06,$01,$09,$13,$1d,$15,$0e,$05	; ability - hop float ride sail hammer takeoff climb lockpick;hammer climb slide float homer sail goal
	.byte $12,$04,$0f,$00				; defense - block jump sidestep juke
	.byte $17,$02,$1b,$07,$0c,$16	; social - mingle homer net haggle defuse goal;mingle hop haggle lockpick start net defuse
	.byte $08,$03,$14,$10				; special - escape clue strength adrenaline 
	.byte $0b,$0a,$1c,$19,$1f			; combat - pickpocket mulligan quickdraw advantage awesome
	.byte $1e
	.byte $20,$21,$22,$23,$24

menu_games_names1a: ; u champ
	.byte "UPPERCUT",$ff
menu_games_names11: ; m bros
	.byte "STOMP",$ff
menu_games_names18: ; smb
	.byte "FIREBALL",$ff
menu_games_names0d: ; halley
	.byte "ZAP",$ff
menu_games_names04: ;dkong
	.byte "JUMP",$ff
menu_games_names00: ; 10 yard
	.byte "JUKE",$ff
menu_games_names12: ; pinball
	.byte "BLOCK",$ff
menu_games_names0f: ; kung fu
	.byte "SIDESTEP",$ff
menu_games_names08:	; dhunt
	.byte "ESCAPE",$ff
menu_games_names14: ; prowrestling
	.byte "ENDURANCE",$ff
menu_games_names10: ; mrider
	.byte "ADRENALINE",$ff
menu_games_names0b: ; gshoe
	.byte "PICKPOCKET",$ff
menu_games_names1d: ; w crew
	.byte "HAMMER",$ff
menu_games_names0e: ; iclimbr
	.byte "CLIMB",$ff
menu_games_names15:	; slalom
	.byte "TAKEOFF",$ff
menu_games_names01: ; bfight
	.byte "FLOAT",$ff
menu_games_names02: ; b ball
	.byte "HOMER",$ff
menu_games_names13: ; popeye
	.byte "SAIL",$ff
menu_games_names16: ; soccer
	.byte "GOAL",$ff
menu_games_names17:	; stackup
	.byte "MINGLE",$ff
menu_games_names06: ;dk3
	.byte "HOP",$ff
menu_games_names07: ; dk math
	.byte "HAGGLE",$ff
menu_games_names05:	; dk jr
	.byte "LOCKPICK",$ff
menu_games_names09: ; excitebike
	.byte "RIDE",$ff
menu_games_names1b: ; vball
	.byte "NET",$ff
menu_games_names0c: ; gmite
	.byte "DEFUSE",$ff
menu_games_names03: ;cc land
	.byte "CLUE",$ff
menu_games_names0a: ; golf
	.byte "MULLIGAN",$ff
menu_games_names1c: ; wgunman
	.byte "QUICKDRAW",$ff
menu_games_names19: ; tennis
	.byte "ADVANTAGE",$ff
menu_games_names1f:
	.byte "AWESOIME!",$ff
menu_games_names1e:
	.byte "CLEAN",$ff
menu_games_names20:
	.byte "POWERGLOVE",$ff
menu_games_names21:
	.byte "POWERPAD",$ff
menu_games_names22:
	.byte "U-FORCE",$ff
menu_games_names23:
	.byte "DOGBONE",$ff
menu_games_names24:
	.byte "LASERSCOPE",$ff


nmi_menu_turn_on:
	lda #$22
	sta $2006
	lda #$ef
	sta $2006
	lda menu_x_sign
	sta $2007
	lda menu_x_numb
	sta $2007

	lda #$22
	sta $2006
	lda #$f2
	sta $2006
	lda menu_y_sign
	sta $2007
	lda menu_y_numb
	sta $2007
	ldx #$00
:	lda pal_menu, x
	sta pal_address, x
	inx
	cpx #19
	bne :-
		lda #$00
		sta temp_8bit_1
		sta temp_8bit_2
		lda #$43
		sta temp_16bit_2+0
		lda #$23
		sta temp_16bit_2+1
		lda #<menu_loop
		sta loop_pointer+0
		lda #>menu_loop
		sta loop_pointer+1
		lda #<nmi_menu_words
		sta nmi_pointer+0
		lda #>nmi_menu_words
		sta nmi_pointer+1
	jmp end_nmi

menu_loop:
	ldx temp_8bit_1
	lda menu_spr_y, x
	sta cursor+0
	lda menu_spr_x, x
	sta cursor+3

	lda temp_16bit_2
	cmp #$4d
	bcc :+
		lda #$f0
		sta cursor+0
:
	ldx temp_8bit_2
	lda cur_behlo, x
	sta temp_16bit_1+0
	lda cur_behhi, x
	sta temp_16bit_1+1
	ldx #$00
	ldy #$00
:	lda (temp_16bit_1), y
	sta cur_behind0+0, x
	tya
	clc
	adc #$07
	tay
	lda (temp_16bit_1), y
	sta cur_behind0+3, x
	tya
	sec
	sbc #$07
	tay
	lda #$1d
	sta cur_behind0+1, x
	lda #$20
	sta cur_behind0+2, x
	inx
	inx
	inx
	inx
	iny
	cpy #$07
	bne :-

	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq @no_up
		jsr menu_moveup_jumper
		jsr store_beep
		jmp @no_start
@no_up:
	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq @no_down
		jsr menu_movedown_jumper
		jsr store_beep
		jmp @no_start
@no_down:
	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq @no_left
		ldx temp_8bit_2
		bne :+
			ldx #$08
			stx temp_8bit_2
:		dex
		stx temp_8bit_2
		lda menu_right, x
		sta temp_8bit_1
		jsr store_beep
		jmp @no_start
@no_left:
	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq @no_right
		ldx temp_8bit_2
		cpx #$07
		bne :+
			ldx #$ff
			stx temp_8bit_2
:		inx
		stx temp_8bit_2
		lda menu_right, x
		sta temp_8bit_1
		jsr store_beep
		jmp @no_start
@no_right:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq @no_start
;		jsr menu_get
		jmp menu_leave_setup
@no_start:

	lda goal_offset
	cmp #$f3
	bne :+
		lda #$07
		sta pal_animation
		jsr palette_animate
:

	jmp end_loop


menu_moveup_jumper:
	lda temp_8bit_2
	asl a
	tay
	lda menu_moveup_table+1, y
	pha
	lda menu_moveup_table+0, y
	pha
	rts
menu_moveup_table:
	.addr menuup_tl-1,menuup_mid-1,menuup_tr-1,menuup_bl-1,menuup_bmid-1,menuup_br-1
	.addr menuother-1,menuup_peri-1
menuup_peri:
	lda temp_8bit_1
	cmp #$20
	bne :+
		lda #$25
		sta temp_8bit_1
:	dec temp_8bit_1
	rts
menuup_tl:
	lda temp_8bit_1
	bne :+
		lda #$04
		sta temp_8bit_1
:	dec temp_8bit_1
	rts
menuup_mid:
	lda temp_8bit_1
	cmp #$0c
	bne :+
		lda #$10
		sta temp_8bit_1
:	dec temp_8bit_1
	rts
menuup_tr:
	lda temp_8bit_1
	cmp #$16
	bne :+
		lda #$1a
		sta temp_8bit_1
:	dec temp_8bit_1
	rts
menuup_bl:
	lda temp_8bit_1
	cmp #$04
	bne :+
		lda #$0c
		sta temp_8bit_1
:	dec temp_8bit_1
	rts
menuup_bmid:
	lda temp_8bit_1
	cmp #$10
	bne :+
		lda #$16
		sta temp_8bit_1
:	dec temp_8bit_1
	rts
menuup_br:
	lda temp_8bit_1
	cmp #$1a
	bne :+
		lda #$1f
		sta temp_8bit_1
:	dec temp_8bit_1
	rts


menu_movedown_jumper:
	lda temp_8bit_2
	asl a
	tay
	lda menu_movedown_table+1, y
	pha
	lda menu_movedown_table+0, y
	pha
	rts
menu_movedown_table:
	.addr menudown_tl-1,menudown_mid-1,menudown_tr-1,menudown_bl-1,menudown_bmid-1,menudown_br-1
	.addr menuother-1, menudown_peri-1
menudown_peri:
	lda temp_8bit_1
	cmp #$24
	bne :+
		lda #$1f
		sta temp_8bit_1
:	inc temp_8bit_1
	rts
menuother:
	rts
menudown_tl:
	lda temp_8bit_1
	cmp #$03
	bne :+
		lda #$ff
		sta temp_8bit_1
:	inc temp_8bit_1
	rts
menudown_mid:
	lda temp_8bit_1
	cmp #$0f
	bne :+
		lda #$0b
		sta temp_8bit_1
:	inc temp_8bit_1
	rts
menudown_tr:
	lda temp_8bit_1
	cmp #$19
	bne :+
		lda #$15
		sta temp_8bit_1
:	inc temp_8bit_1
	rts
menudown_bl:
	lda temp_8bit_1
	cmp #$0b
	bne :+
		lda #$03
		sta temp_8bit_1
:	inc temp_8bit_1
	rts
menudown_bmid:
	lda temp_8bit_1
	cmp #$15
	bne :+
		lda #$0f
		sta temp_8bit_1
:	inc temp_8bit_1
	rts
menudown_br:
	lda temp_8bit_1
	cmp #$1e
	bne :+
		lda #$19
		sta temp_8bit_1
:	inc temp_8bit_1
	rts

cur_behlo:
	.byte <cur_beh0,<cur_beh1,<cur_beh2,<cur_beh3,<cur_beh4,<cur_beh5,<cur_beh6,<cur_beh7
cur_behhi:
	.byte >cur_beh0,>cur_beh1,>cur_beh2,>cur_beh3,>cur_beh4,>cur_beh5,>cur_beh6,>cur_beh7
cur_beh0:
	.byte $3f,$3f,$3f,$3f,$3f,$3f,$3f
	.byte $10,$18,$20,$28,$30,$38,$40
cur_beh1:
	.byte $3f,$3f,$3f,$3f,$3f,$3f,$3f
	.byte $60,$68,$70,$78,$80,$88,$90
cur_beh2:
	.byte $3f,$3f,$3f,$3f,$3f,$3f,$3f
	.byte $a8,$b0,$b8,$c0,$c8,$d0,$d8
cur_beh3:
	.byte $77,$77,$77,$77,$77,$77,$77
	.byte $10,$18,$20,$28,$30,$38,$40
cur_beh4:
	.byte $77,$77,$77,$77,$77,$77,$f0
	.byte $60,$68,$70,$78,$80,$88,$f0
cur_beh5:
	.byte $77,$77,$77,$77,$77,$77,$f0
	.byte $a8,$b0,$b8,$c0,$c8,$d0,$f0
cur_beh6:
	.byte $b7,$b7,$b7,$b7,$b7,$b7,$b7
	.byte $a8,$b0,$b8,$c0,$c8,$d0,$d8
cur_beh7:
	.byte $0f,$0f,$0f,$0f,$0f,$f0,$f0
	.byte $78,$80,$88,$90,$98,$f0,$f0

menu_right:
	.byte $00,$0c,$16,$04,$10,$1a,$1f,$20
menu_spr_y:
	.byte $4f,$57,$5f,$67
	.byte $87,$8f,$97,$9f,$a7,$af,$b7,$bf
	.byte $4f,$57,$5f,$67
	.byte $87,$8f,$97,$9f,$a7,$af
	.byte $4f,$57,$5f,$67
	.byte $87,$8f,$97,$9f,$a7
	.byte $bf
	.byte $0f,$17,$1f,$27,$2f
menu_spr_x:
	.byte $08,$08,$08,$08
	.byte $08,$08,$08,$08,$08,$08,$08,$08
	.byte $58,$58,$58,$58
	.byte $58,$58,$58,$58,$58,$58
	.byte $a0,$a0,$a0,$a0
	.byte $a0,$a0,$a0,$a0,$a0
	.byte $c0
	.byte $a0,$a0,$a0,$a0,$a0

nmi_menu_words:
	ldx temp_8bit_1
	lda menu_games_offset, x
	tay
	cmp #$20
	bcc :+
		lda games, y
		beq :+
			jmp :++
:
	lda games, y
	and #$40
	cmp #$40
	beq :+
		lda games, y
		bmi :+
		lda #<game_learn_not_there
		sta temp_16bit_1+0
		lda #>game_learn_not_there
		sta temp_16bit_1+1
		jmp :++
:	lda menu_desc_lo, x
	sta temp_16bit_1+0
	lda menu_desc_hi, x
	sta temp_16bit_1+1
:	lda #$23
	sta $2006
	lda #$43
	sta $2006
	ldy #$00
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #26
	bne :-
	lda temp_16bit_2+1
	sta $2006
	lda temp_16bit_2+0
	cmp #$5d
	beq :+
		sta $2006
		bne :++
:	lda #$43
	sta temp_16bit_2+0
	sta $2006
:	lda #$00
	sta $2007
	inc temp_16bit_2+0
	jmp end_nmi

pal_menu:
	.byte $0f,$30,$0f,$0f, $0f,$26,$05,$3b, $0f,$0f,$0f,$0f, $0f,$0f,$0f,$0f
	.byte $0f,$30,$27





; offense - jab stomp fireball zap                    
; outside - hammer climb slide float homer sail goal  
; defense - block jump sidestep juke                   
; inside - mingle hop haggle lockpick start net defuse
; special - escape clue strength adrenaline     
; combat - pickpocket mulligan quickdraw advantage awesome  
menu_desc_lo:
	.byte <game_learn26,<game_learn17,<game_learn24,<game_learn13
	.byte <game_learn06,<game_learn01,<game_learn09,<game_learn19,<game_learn29,<game_learn21,<game_learn14,<game_learn05
	.byte <game_learn18,<game_learn04,<game_learn15,<game_learn00
	.byte <game_learn23,<game_learn02,<game_learn27,<game_learn07,<game_learn12,<game_learn22
	.byte <game_learn08,<game_learn03,<game_learn20,<game_learn16
	.byte <game_learn11,<game_learn10,<game_learn28,<game_learn25,<game_learn31
	.byte <game_learn30
	.byte <game_learn32,<game_learn33,<game_learn34,<game_learn35,<game_learn36
menu_desc_hi:
	.byte >game_learn26,>game_learn17,>game_learn24,>game_learn13
	.byte >game_learn06,>game_learn01,>game_learn09,>game_learn19,>game_learn29,>game_learn21,>game_learn14,>game_learn05
	.byte >game_learn18,>game_learn04,>game_learn15,>game_learn00
	.byte >game_learn23,>game_learn02,>game_learn27,>game_learn07,>game_learn12,>game_learn22
	.byte >game_learn08,>game_learn03,>game_learn20,>game_learn16
	.byte >game_learn11,>game_learn10,>game_learn28,>game_learn25,>game_learn31
	.byte >game_learn30
	.byte >game_learn32,>game_learn33,>game_learn34,>game_learn35,>game_learn36


; HOP game_learn06	$06,$01,$09,$13,$1d,$15,$0e,$05
; FLOAT game_learn01
; RIDE game_learn09
; SAIL game_learn19
; HAMMER game_learn29
; TAKEOFF game_learn21
; CLIMB game_learn14
; LOCKPICK game_learn05

; MINGLE game_learn23	$17,$02,$1b,$07,$0c,$16
; HOMER game_learn02
; NET game_learn27
; HAGGLE game_learn07
; DEFUSE game_learn12
; GOAL game_learn22


game_learn_not_there:
	.byte "                          ",$ff
game_learn00: ; 10 yard
	.byte " EVADE ATTACKS FROM ABOVE ",$ff
game_learn01: ; bfight
	.byte "BALLOON OVER WATER STRAITS",$ff
game_learn02: ; b ball
	.byte "HAVE TRANSIT GET YOU HOME ",$ff
game_learn03: ; ccland
	.byte "EXPOSE YOUR ENEMY'S STATS ",$ff
game_learn04: ; dkong
	.byte " LEAP ENEMY'S LOW ATTACKS ",$ff
game_learn05:	; dk jr
	.byte " UNLOCK WOODEN DOOR LOCKS ",$ff
game_learn06: ; dk3
	.byte "  VAULT WITH TRAMPOLINES  ",$ff
game_learn07: ; dk math
	.byte " GET ITEMS AT A DISCOUNT  ",$ff
game_learn08:	; dhunt
	.byte "     RUN FROM ENEMIES     ",$ff
game_learn09: ; excitebike
	.byte " DOUBLE SPEED WITH A BIKE ",$ff
game_learn10: ; golf
	.byte "GET ANOTHER LIFE IN BATTLE",$ff
game_learn11: ; gshoe
	.byte "EXTRA MANUALS UPON VICTORY",$ff
game_learn12: ; gmite
	.byte "APPLY FRIEND CODE TO PANEL",$ff
game_learn13: ; halley
	.byte "    SHOOT YOUR ENEMIES    ",$ff
game_learn14: ; iclimbr
	.byte " SCALE MOUNTAINS OR HILLS ",$ff
game_learn15: ; kung fu
	.byte " AVOID REAR ENEMY ATTACKS ",$ff
game_learn16: ; mrider
	.byte "INCREASE SPEED OF ATTACKS ",$ff
game_learn17: ; m bros
	.byte "     STOMP ON ENEMIES     ",$ff
game_learn18: ; pinball
	.byte "BLOCK FRONTAL BODY ATTACKS",$ff
game_learn19: ; popeye
	.byte "TRAVERSE RIVERS VIA A BOAT",$ff
game_learn20: ; prowrestling
	.byte "  RAISE STAMINA RECOVERY  ",$ff
game_learn21:	; slalom
	.byte "LAUNCH BIKE OVER ROAD GAPS",$ff
game_learn22: ; soccer
	.byte " LOCATE THE NEXT NES GAME ",$ff
game_learn23:	; stackup
	.byte "  SPEAK TO OTHER PEOPLE   ",$ff
game_learn24: ; smb
	.byte "SHOOT FIREBALLS IN COMBAT ",$ff
game_learn25: ; tennis
	.byte " BATTLE WEAKENED ENEMIES  ",$ff
game_learn26:	; u champ
	.byte "  PERFORM A BASIC ATTACK  ",$ff
game_learn27: ; vball
	.byte " SAVE AT OTHER COMPUTERS  ",$ff
game_learn28: ; wgunman
	.byte "GET CHANCE OF FIRST ATTACK",$ff
game_learn29: ; w crew
	.byte "CRUSH BOULDERS IN YOUR WAY",$ff
game_learn30:
	.byte "      PLAY YOUR NES!      ",$ff
game_learn31:
	.byte "  BE AWESOIME IN COMBAT!  ",$ff
game_learn32:
	.byte " +1 DAMAGE TO ALL ATTACKS ",$ff
game_learn33:
	.byte "INCREASE CHANCE OF ESCAPE ",$ff
game_learn34:
	.byte " BLOCKS LOW REAR ATTACKS  ",$ff
game_learn35:
	.byte "PUSH SELECT- ATTRACT ENEMY",$ff
game_learn36:
	.byte "  SEE THE ENEMY'S TARGET  ",$ff

goal_y:
.byte $04,$04,$04,$04,$04,$04,$05,$04, $02,$02,$01,$07,$01,$08,$02,$08
.byte $04,$01,$08,$08,$01,$01,$02,$03,$04, $06,$08,$08,$04,$08
goal_x:
.byte $04,$04,$04,$04,$04,$03,$06,$04, $05,$02,$05,$08,$01,$06,$02,$06
.byte $04,$08,$04,$06,$02,$02,$02,$01,$04, $01,$01,$05,$04,$06
goal_which:
.byte $17,$1a,$08,$12,$03,$02,$06,$04, $01,$0f,$16,$13,$11,$14,$09,$1b
.byte $1d,$15,$00,$18,$0d,$05,$10,$0b,$0e, $07,$1c,$0a,$19,$0c
;17=stackup,1a=uchamp,08=dhunt, 12=pinbal,03=ccland,02=bball, 06=dk3,04=dkong
;01=bfight, 0f=kungfu,16=soccer,13=popeye,11=m bros,14=wrestl,09=ebike,1b=vball
;1d=wcrew,  15=slalom,00=10yard,18=smb,   0d=halley,05=dkjr,10=mrider,0b=gshoe,0e=iclimbr
;07=dkmath,1c=wgunman,0a=golf,    19=tennis,0c=gmite



;1a=uchamp,08=dhunt, 12=pinbal,03=ccland
;02=bball, 06=dk3,04=dkong, 01=bfight
;0f=kungfu,16=soccer,13=popeye,11=m bros
;14=wrestl,09=ebike,1b=vball,1d=wcrew
;15=slalom,00=10yard,18=smb,   0d=halley
;05=dkjr,10=mrider,0b=gshoe,0e=iclimbr
;07=dkmath,1c=wgunman,0a=golf,    19=tennis
;0c=gmite, 30=nesvc








blank_goals:
	lda #$5e
	sta menu_x_sign
	sta menu_x_numb
	sta menu_y_sign
	sta menu_y_numb
	rts


goal_testing:
	lda games+22
	and #$c0
	bne :+
		rts
:
	lda map_y
	cmp #$08
	bcs :+
		jsr blank_goals
		jmp goal_done
:	cmp #$10
	bcc :+
		jsr blank_goals
		jmp goal_done
:	lda map_x
	cmp #$00
	bcs :+
		jsr blank_goals
		jmp goal_done
:	cmp #$08
	bcc :+
		jsr blank_goals
		jmp goal_done
:
	ldy #$00;goal_offset
start_goal:
	lda goal_which, y
	tax
	lda $00, x
	bne inc_it_more
;		sty goal_offset
		lda map_y
		sec
		sbc #$07
		sta temp_8bit_1
		lda goal_y, y
		cmp temp_8bit_1
		bcs other_y
			lda temp_8bit_1
			sec
			sbc goal_y, y
			clc
			adc #$30
			sta menu_y_numb
			lda #$5e
			sta menu_y_sign
			bne test_y_zero
other_y:
		lda goal_y, y
		sec
		sbc temp_8bit_1
		clc
		adc #$30
		sta menu_y_numb
		lda #$5d		; PLUS SIGN
		sta menu_y_sign
test_y_zero:
		lda menu_y_numb
		cmp #$30
		bne do_goal_x
			lda #$00
			sta menu_y_sign
do_goal_x:
	lda map_x
	sta temp_8bit_1
	inc temp_8bit_1
	lda goal_x, y
	cmp temp_8bit_1
	bcs other_x
		lda temp_8bit_1
		sec
		sbc goal_x, y
		clc
		adc #$30
		sta menu_x_numb
		bne test_x_zero
other_x:
	lda goal_x, y
	sec
	sbc temp_8bit_1
	clc
	adc #$30
	sta menu_x_numb
	lda #$5d		; PLUS SIGN
	sta menu_x_sign
test_x_zero:
	lda menu_x_numb
	cmp #$30
	bne goal_done
		lda #$00
		sta menu_x_sign
		beq goal_done
inc_it_more:
	iny
;	sty goal_offset
	cpy #(goal_which - goal_x)
	beq goal_done
		jsr blank_goals
		jmp start_goal
goal_done:
	rts


