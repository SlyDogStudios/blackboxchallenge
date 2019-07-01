.segment "BANK22"
setup_title:

	ldy #$04
	jsr wipe_viewable_ppu


	ldx #$00
	lda #$3f
	sta $2006
	lda #$00
	sta $2006
	lda #$0f
:	sta pal_address, x
	sta $2007
	inx
	cpx #$20
	bne :-

	lda #<title_chr				;  CHRs are in banks 7, 8 and 9. Only bank
	sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
	lda #>title_chr				;  correct address for them all
	sta temp_16bit_1+1			;
 	ldy #$00					; Get Y ready while also setting up where
	sty $2006					;  to begin storage of the CHR in its RAM
	sty $2006					;
	ldx #$10					; Need to loop 32 times
:	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne :-
		inc temp_16bit_1+1		;
		dex						;
		bne :-

	lda #<title_nam				;  CHRs are in banks 7, 8 and 9. Only bank
	sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
	lda #>title_nam				;  correct address for them all
	sta temp_16bit_1+1			;
 	lda #$20					; Get Y ready while also setting up where
	sta $2006
	ldy #$00					;  to begin storage of the CHR in its RAM
	sty $2006					;
	ldx #$04					; Need to loop 32 times
:	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne :-
		inc temp_16bit_1+1		;
		dex						;
		bne :-

	lda #<contribs_nam			;  CHRs are in banks 7, 8 and 9. Only bank
	sta temp_16bit_1+0			;  7 carries the label "some_chr" to have
	lda #>contribs_nam			;  correct address for them all
	sta temp_16bit_1+1			;
 	lda #$24					; Get Y ready while also setting up where
	sta $2006
	ldy #$00					;  to begin storage of the CHR in its RAM
	sty $2006					;
	ldx #$04					; Need to loop 32 times
:	lda (temp_16bit_1), y		;
	sta $2007					;
	iny							;
	bne :-
		inc temp_16bit_1+1		;
		dex						;
		bne :-

	lda #$78
	sta temp_8bit_1

	lda #<stall_for_palette
	sta loop_pointer+0
	lda #>stall_for_palette
	sta loop_pointer+1
	lda #<nmi_empty
	sta nmi_pointer+0
	lda #>nmi_empty
	sta nmi_pointer+1

		jsr title_beep
:	bit $2002
	bpl :-

	lda #%10100000
	sta $2000
	sta save2000
	lda #%00011110
	sta $2001
	sta save2001

stall_for_palette:
	dec temp_8bit_1
	bne :++
		ldx #$00
:		lda title_pal, x
		sta pal_address, x
		inx
		cpx #$20
		bne :-
		lda #<loop_title
		sta loop_pointer+0
		lda #>loop_title
		sta loop_pointer+1
		lda #<nmi_title
		sta nmi_pointer+0
		lda #>nmi_title
		sta nmi_pointer+1
:	jmp end_loop
	

loop_title:

	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq not_start_title
		lda temp_8bit_1
		bne :++
			ldx #$00
			lda #$0f
:			sta pal_address+0, x
			inx
			cpx #$20
			bne :-
			jsr nmi_wait
			lda #$00
			sta $2000
			sta save2000
			sta $2001
			sta save2001
			jmp wipe_for_story
:		cmp #$01
		bne :++
			ldx #$00
			lda #$0f
:			sta pal_address+0, x
			inx
			cpx #$20
			bne :-
			jsr nmi_wait
			lda #$00
			sta $2000
			sta save2000
			sta $2001
			sta save2001
			jsr load_save_data
			jmp do_the_continue
:		lda #$24
		sta nametable
		lda #$00
		sta temp_16bit_3+0
		sta temp_8bit_3
		jsr contri_beep
		lda #<loop_contrib
		sta loop_pointer+0
		lda #>loop_contrib
		sta loop_pointer+1
		lda #<nmi_contrib0
		sta nmi_pointer+0
		lda #>nmi_contrib0
		sta nmi_pointer+1
		jmp loop_contrib
not_start_title:
	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq not_up_title
		lda temp_8bit_1
		beq not_down_title
			jsr store_beep
			dec temp_8bit_1
			lda temp_8bit_2
			bne :+
				dec temp_8bit_1
:
			jmp not_down_title
not_up_title:
	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq not_down_title
		lda temp_8bit_1
		cmp #$02
		beq not_down_title
			jsr store_beep
			inc temp_8bit_1
			lda temp_8bit_2
			bne :+
				inc temp_8bit_1
:
			jmp not_down_title
not_down_title:
	jmp end_loop
nmi_title:
	ldx temp_8bit_1
	lda #$23
	sta $2006
	lda #$db
	sta $2006
	lda attrib0, x
	sta $2007
	lda attrib1, x
	sta $2007
	lda #$23
	sta $2006
	lda #$e2
	sta $2006
	lda attrib2, x
	sta $2007
	lda attrib3, x
	sta $2007
	lda attrib4, x
	sta $2007
	lda attrib5, x
	sta $2007
	jmp end_nmi

attrib0:
.byte $ff,$55,$55
attrib1:
.byte $ff,$55,$55
attrib2:
.byte $55,$55,$f5
attrib3:
.byte $55,$5f,$f5
attrib4:
.byte $55,$5f,$f5
attrib5:
.byte $55,$55,$f5



wipe_viewable_ppu:
	lda ppu_wipe, y
	sta $2006
	ldx #$00
	txa
	sta $2006
:	sta $2007
	sta $2007
	sta $2007
	sta $2007
	dex
	bne :-
		dey
		bne wipe_viewable_ppu
	rts
ppu_wipe:
	.byte $00,$24,$2c,$20,$28

title_chr:
.incbin "i\bank22\title_screen.chr"
title_nam:
.incbin "i\bank22\title_screen.nam"
title_pal:
.incbin "i\bank22\chall_title.pal"
.byte $0f,$0f,$0f,$0f, $0f,$0f,$0f,$0f, $0f,$0f,$0f,$0f, $0f,$0f,$0f,$0f
contribs_nam:
.incbin "i\bank22\backers.nam"
backers:
.include "i\bank22\gamebackers.asm"

loop_done_story:
	lda temp_8bit_2
	cmp #$04
	bne :++
			ldx #$00
			lda #$0f
:			sta pal_address+0, x
			inx
			cpx #$20
			bne :-
			jsr nmi_wait
			lda #$00
			sta temp_8bit_1
			sta temp_8bit_2
			sta temp_8bit_3
			sta temp_8bit_4
			sta temp_16bit_1+0
			sta temp_16bit_1+1
			sta temp_16bit_2+0
			sta temp_16bit_2+1
			sta temp_16bit_3+0
			sta temp_16bit_3+1
			sta temp_16bit_4+0
			sta temp_16bit_4+1
			sta $2000
			sta save2000
			sta $2001
			sta save2001
			jmp jump_over_title
:
	dec temp_8bit_1
	bne :+
		lda #$40
		sta temp_8bit_1
		inc temp_8bit_2
:
	lda temp_8bit_1
	cmp #$20
	bcs :+
		lda #$27
		bne :++
:	lda #$27
:	sta pal_address+1
	jmp end_loop

nmi_done_story:
	lda save2000
	sta $2000
		lda #<nmi_empty
		sta nmi_pointer+0
		lda #>nmi_empty
		sta nmi_pointer+1
	jmp end_nmi

loop_do_story:
	lda temp_16bit_3+1
	cmp #$04
	bne :+
		lda #$a0
		sta save2000
		lda #$20
		sta nametable
		sta temp_8bit_1
		lda #$00
		sta scroll_y
		sta temp_8bit_2
		lda #<loop_done_story
		sta loop_pointer+0
		lda #>loop_done_story
		sta loop_pointer+1
		lda #<nmi_done_story
		sta nmi_pointer+0
		lda #>nmi_done_story
		sta nmi_pointer+1
		jmp end_loop
:

	lda temp_16bit_3+0
	cmp #60
	bne :+
		lda #$ff
		sta temp_16bit_3+0
		inc temp_8bit_1
:	inc temp_16bit_3+0


	lda temp_8bit_2
	clc
	adc #<dkjr_vine
	sta temp_8bit_2
	lda temp_8bit_3
	adc #>dkjr_vine
	sta temp_8bit_3
	sta scroll_y
	cmp #$ef
	bne no_scroll_changing
		inc temp_16bit_3+1
		lda temp_8bit_4
		bne :+
			lda #$01
			sta temp_8bit_4
			lda #$2c
			bne :++
:		lda #$00
		sta temp_8bit_4
		lda #$24
:		sta nametable
		lda #$00
		sta scroll_y
no_scroll_changing:

	lda nametable
	cmp #$20
	bne :++
		lda temp_8bit_4
		bne :+
			lda #$a1
			sta save2000
			lda temp_8bit_3
			sta scroll_y
			lda #$24
			sta nametable
			jmp done_scroll_stuffs
:		lda #$a3
		sta save2000
		lda temp_8bit_3
		sta scroll_y
		lda #$2c
		sta nametable
		jmp done_scroll_stuffs
:	lda scroll_y
	sta temp_8bit_3
	lda #$00
	sta scroll_y
	lda #$a0
	sta save2000
	lda #$20
	sta nametable
done_scroll_stuffs:

		lda #<nmi_do_story
		sta nmi_pointer+0
		lda #>nmi_do_story
		sta nmi_pointer+1
	jmp end_loop

nmi_do_story:
	ldx temp_8bit_1
	lda story_lo, x
	sta temp_16bit_1+0
	lda story_hi, x
	sta temp_16bit_1+1

	lda story_ppu_hi, x
	sta $2006
	lda story_ppu_lo, x
	sta $2006

	ldy #$00
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #$1d
	bne :-

	lda save2000
	sta $2000
	
	jmp end_nmi


wipe_for_story:
	ldy #$01
	jsr wipe_viewable_ppu
	sty temp_8bit_2
	sty temp_8bit_4
	sty temp_16bit_3+0
	sty temp_16bit_3+1

	lda #$24
	sta nametable
	lda #$30
	sta pal_address+13
	lda #$03
	sta pal_address+1

	lda #$10
	sta scroll_y
	sta temp_8bit_3

	lda #$21
	sta $2006
	lda #$ac
	sta $2006
	ldx #$00
	txa
:	sta $2007
	inx
	cpx #$08
	bne :-

	lda #$27
	sta $2006
	lda #$c0
	sta $2006
	ldx #$00
	lda #$ff
:	sta $2007
	inx
	cpx #64
	bne :-

	lda #$2f
	sta $2006
	lda #$c0
	sta $2006
	ldx #$00
	lda #$ff
:	sta $2007
	inx
	cpx #64
	bne :-

		jsr story0_beep
	lda #%10100000
	sta $2000
	sta save2000
	lda #%00011110
	sta $2001
	sta save2001

		lda #<loop_do_story
		sta loop_pointer+0
		lda #>loop_do_story
		sta loop_pointer+1
	jmp end_loop



story_lo:
.byte <story00
.byte <story01,<story02,<story03,<story04,<story05,<story06,<story07,<story08,<storyff,<story09,<story10
.byte <story11,<story12,<story13,<story14,<story15,<story16,<storyff,<story17,<story18,<story19,<story20
.byte <story21,<story22,<story23,<story24,<story25,<story26,<story27,<storyff,<story28,<story29,<story30
.byte <story31,<story32,<story33,<story34,<story35,<storyff,<storyff,<storyff,<story36,<storyff,<storyff
.byte <storyff,<storyff,<storyff,<storyff,<storyff,<storyff,<storyff,<storyff,<storyff,<storyff,<storyff
.byte <storyff,<storyff,<storyff,<storyff,<storyff,<storyff,<storyff,<storyff,<storyff,<storyff,<storyff
story_hi:
.byte >story00
.byte >story01,>story02,>story03,>story04,>story05,>story06,>story07,>story08,>storyff,>story09,>story10
.byte >story11,>story12,>story13,>story14,>story15,>story16,>storyff,>story17,>story18,>story19,>story20
.byte >story21,>story22,>story23,>story24,>story25,>story26,>story27,>storyff,>story28,>story29,>story30
.byte >story31,>story32,>story33,>story34,>story35,>storyff,>storyff,>storyff,>story36,>storyff,>storyff
.byte >storyff,>storyff,>storyff,>storyff,>storyff,>storyff,>storyff,>storyff,>storyff,>storyff,>storyff
.byte >storyff,>storyff,>storyff,>storyff,>storyff,>storyff,>storyff,>storyff,>storyff,>storyff,>storyff

story_ppu_hi:
.byte $2c
.byte $2c,     $2c,     $2d,     $2d,     $2d,     $2d,     $2e,     $2e,     $2e,     $2e,     $2f
.byte $2f,     $2f,     $24,     $24,     $24,     $24,     $25,     $25,     $25,     $25,     $26
.byte $26,     $26,     $26,     $27,     $27,     $27,     $2c,     $2c,     $2c,     $2c,     $2d
.byte $2d,     $2d,     $2d,     $2e,     $2e,     $2e,     $2e,     $2f,     $2f,     $2f,     $24
.byte $24,     $24,     $24,     $25,     $25,     $25,     $25,     $26,     $26,     $26,     $26
.byte $27,     $27,     $27,     $2c,     $2c,     $2c,     $2c,     $2d,     $2d,     $2d,     $2d
story_ppu_lo:
.byte $41
.byte $81,     $c1,     $01,     $41,     $81,     $c1,     $01,     $41,     $81,     $c1,     $01
.byte $41,     $81,     $01,     $41,     $81,     $c1,     $01,     $41,     $81,     $c1,     $01
.byte $41,     $81,     $c1,     $01,     $41,     $81,     $01,     $41,     $81,     $c1,     $01
.byte $41,     $81,     $c1,     $01,     $41,     $81,     $c1,     $01,     $41,     $81,     $01
.byte $41,     $81,     $c1,     $01,     $41,     $81,     $c1,     $01,     $41,     $81,     $c1
.byte $01,     $41,     $81,     $01,     $41,     $81,     $c1,     $01,     $41,     $81,     $c1

story00:
.byte "WAKING UP IN THE MORNING, YOU"
story01:
.byte "STRETCH HEARTILY. AS YOU RUB "
story02:
.byte "  AT YOUR EYES, THERE IS A   "
story03:
.byte " SUDDEN SENSE THAT THERE WAS "
story04:
.byte " SOMETHING YOU NEEDED TO DO. "
story05:
.byte " YOU STOP MOVING AS IT COMES "
story06:
.byte "  BACK TO YOU. ",$5b,"NES!,",$5b," YOU   "
story07:
.byte " EXCITEDLY SHOUT TO AN EMPTY "
story08:
.byte "          BEDROOM.           "
story09:
.byte "YOU JUST RETURNED FROM A TRIP"
story10:
.byte "YESTERDAY EVENING, AND WHILE "
story11:
.byte " THERE, FOUND A FLEA MARKET  "
story12:
.byte " THAT HAD MANY OLD GAMES YOU "
story13:
.byte "   USED TO PLAY. IT WAS A    "
story14:
.byte "NOSTALGIC DAY THAT TAKES ONE "
story15:
.byte " BACK TO WHAT SEEMED TO BE A "
story16:
.byte "      MORE SIMPLE TIME.      "
story17:
.byte "   TALKING TO YOURSELF, AS   "
story18:
.byte " IF RETELLING SOME OTHER OF  "
story19:
.byte "   AN EVENT THAT OCCURRED    "
story20:
.byte " OUTSIDE OF THEIR KNOWLEDGE, "
story21:
.byte "   A STATEMENT WAS MADE.     "
story22:
.byte $5b,"I HOOKED UP MY OLD NES LAST "
story23:
.byte " NIGHT, BUT WAS TOO TIRED TO "
story24:
.byte " LOOK FOR THE GAMES I STILL  "
story25:
.byte " HAVE LAYING AROUND. I KNOW  "
story26:
.byte "    I HAVE THREE OF THEM     "
story27:
.byte "  SOMEWHERE IN THIS HOUSE.",$5b,"  "
story28:
.byte " REMEMBERING THAT THE THREE  "
story29:
.byte "  YOU HAVE ARE PART OF THE   "
story30:
.byte "  ORIGINAL BLACK BOX SET OF  "
story31:
.byte "GAMES, YOU THINK, IN YOUR OWN"
story32:
.byte " HEAD THIS TIME, ",$5b,"HEY, MAYBE "
story33:
.byte "I'LL COLLECT ALL OF THE BLACK"
story34:
.byte "BOX GAMES. IT COULDN'T BE TOO"
story35:
.byte "  DIFFICULT TO PULL OFF...   "
story36:
.byte "           ",$5b,"RIGHT?",$5b,"           "

storyff:
.byte "                             "
