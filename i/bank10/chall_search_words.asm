; f0=dialog done/change npc dialog number, f1=yes/no, f2=nothing extra
; f3=item (if next byte has bit 7 set, then item must be counted as NPC already acknowledging it)
; f4=game from npc, f5=game from search, f6=change for nesvc, f7=item change npc and change another npc dialog

dialog_remove_sprites:
	ldx #$00
:	lda p_topleft, x
	sta p_topleft_save, x
	cmp #$9b
	bcc :+
		lda #$ef
		sta p_topleft, x
:	inx
	inx
	inx
	inx
	cpx #$20
	bne :--
	rts



loop_dlg_wait:
	jsr clear_500
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda attr_hi
		sec
		sbc #$01
		sta ppu_addy+1
		lda #$e8
		sta attr_lo
		lda #39
		sta temp_8bit_1
		lda #$a0
		sta temp_8bit_2
		lda #$80
		sta ppu_addy+0
		jsr talk_beep
		jmp leave_dialog
@no_a:
	jmp end_loop

nmi_do_dialog:
	ldy #$00
@next_line:
	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	sta $2006
@cont_dlg:
	lda (temp_16bit_1), y
	cmp #$f2
	bne @not_f2
		lda #<loop_dlg_wait
		sta loop_pointer+0
		lda #>loop_dlg_wait
		sta loop_pointer+1
		lda #<nmi_empty
		sta nmi_pointer+0
		lda #>nmi_empty
		sta nmi_pointer+1
		jmp end_nmi
@not_f2:
	cmp #$f3
	bne @not_f3
		lda ppu_addy+0
		clc
		adc #$20
		sta ppu_addy+0
		iny
		lda (temp_16bit_1), y
		tax
		iny
		lda npc_dialogs, x
		and #$80
		beq :+
			lda #<search_nada
			sta temp_16bit_1+0
			lda #>search_nada
			sta temp_16bit_1+1
			ldy #$00
			beq @next_line
:		lda (temp_16bit_1), y
		sta npc_dialogs, x
		jsr game_story_setup_jump
		iny
		bne @next_line
@not_f3:
	cmp #$f5
	bne @not_f5
		lda ppu_addy+0
		clc
		adc #$20
		sta ppu_addy+0
		iny
		lda (temp_16bit_1), y
		tax
		lda games, x
		beq :+
			lda #<search_nada
			sta temp_16bit_1+0
			lda #>search_nada
			sta temp_16bit_1+1
			ldy #$00
			beq @next_line
:		iny
		lda (temp_16bit_1), y
		sta games, x
		jsr game_sound_setup_jump
		iny
		bne @next_line
@not_f5:
	sta $2007
	iny
	bne @cont_dlg
	jmp end_nmi

game_sound_setup_jump:
		txa
		pha
		tya
		pha
		lda #$f0
		sta got_a_game
		pla
		tay
		pla
		tax
		rts

game_story_setup_jump:
		txa
		pha
		tya
		pha
		lda #$20
		sta got_a_game
		pla
		tay
		pla
		tax
		rts

loop_dlg:
	ldy temp_8bit_1
	cpy #$0c
	bne :++
		lda dialog_type
		cmp #$01
		bne :+
			lda #$00
			sta temp_8bit_1
			lda attr_hi
			sec
			sbc #$01
			sta ppu_addy+1
			lda #$c5
			sta ppu_addy+0
			lda #<loop_empty
			sta loop_pointer+0
			lda #>loop_empty
			sta loop_pointer+1
			lda #<nmi_do_dialog
			sta nmi_pointer+0
			lda #>nmi_do_dialog
			sta nmi_pointer+1
			jmp end_loop
:
		lda #$1f
		sta cursor+1
		jmp npc_not_search
:

	lda dlg_tiles, y
	tay
	lda dlg_tile32a, y
	tax
		lda dlg_tile16a, x
		sta store_meta16+0
		lda dlg_tile16b, x
		sta store_meta16+1
		lda dlg_tile16c, x
		sta store_meta16+4
		lda dlg_tile16d, x
		sta store_meta16+5
		lda dlg_tile16e, x
		sta store_coll0+0
	lda dlg_tile32b, y
	tax
		lda dlg_tile16a, x
		sta store_meta16+2
		lda dlg_tile16b, x
		sta store_meta16+3
		lda dlg_tile16c, x
		sta store_meta16+6
		lda dlg_tile16d, x
		sta store_meta16+7
		lda dlg_tile16e, x
		sta store_coll0+1
	lda dlg_tile32c, y
	tax
		lda dlg_tile16a, x
		sta store_meta16+8
		lda dlg_tile16b, x
		sta store_meta16+9
		lda dlg_tile16c, x
		sta store_meta16+12
		lda dlg_tile16d, x
		sta store_meta16+13
		lda dlg_tile16e, x
		sta store_coll0+2
	lda dlg_tile32d, y
	tax
		lda dlg_tile16a, x
		sta store_meta16+10
		lda dlg_tile16b, x
		sta store_meta16+11
		lda dlg_tile16c, x
		sta store_meta16+14
		lda dlg_tile16d, x
		sta store_meta16+15
		lda dlg_tile16e, x
		sta store_coll0+3
	lda #$00
	sta store_meta16+16

	jmp end_loop

nmi_dlg:
	ldx temp_8bit_1
	lda ppu_addy+1
	sta $2006
	lda dlg_ppu_lo, x
	sta $2006
	lda store_meta16+0
	sta $2007
	lda store_meta16+1
	sta $2007
	lda store_meta16+2
	sta $2007
	lda store_meta16+3
	sta $2007

	lda ppu_addy+1
	sta $2006
	lda dlg_ppu_lo, x
	clc
	adc #$20
	sta $2006
	lda store_meta16+4
	sta $2007
	lda store_meta16+5
	sta $2007
	lda store_meta16+6
	sta $2007
	lda store_meta16+7
	sta $2007

	lda ppu_addy+1
	sta $2006
	lda dlg_ppu_lo, x
	clc
	adc #$40
	sta $2006
	lda store_meta16+8
	sta $2007
	lda store_meta16+9
	sta $2007
	lda store_meta16+10
	sta $2007
	lda store_meta16+11
	sta $2007

	lda ppu_addy+1
	sta $2006
	lda dlg_ppu_lo, x
	clc
	adc #$60
	sta $2006
	lda store_meta16+12
	sta $2007
	lda store_meta16+13
	sta $2007
	lda store_meta16+14
	sta $2007
	lda store_meta16+15
	sta $2007

	lda attr_hi
	sta $2006
	lda dlg_attr_lo, x
	sta $2006
	lda store_meta16+16
	sta $2007

	inx
	stx temp_8bit_1
	cpx #$06
	bne :+
		inc ppu_addy+1
:
	jmp end_nmi

get_p_dir1:
	lda p_anim_state
	and #$03
	bne :+
		lda #$01
		sta npc_anim_state+0
		rts
:	cmp #$01
	bne :+
		lda #$00
		sta npc_anim_state+0
		rts
:	cmp #$02
	bne :+
		lda #$03
		sta npc_anim_state+0
		rts
:	lda #$02
	sta npc_anim_state+0
	rts
get_p_dir2:
	lda p_anim_state
	and #$03
	bne :+
		lda #$01
		sta npc_anim_state+1
		rts
:	cmp #$01
	bne :+
		lda #$00
		sta npc_anim_state+1
		rts
:	cmp #$02
	bne :+
		lda #$03
		sta npc_anim_state+1
		rts
:	lda #$02
	sta npc_anim_state+1
	rts
get_p_dir3:
	lda p_anim_state
	and #$03
	bne :+
		lda #$01
		sta npc_anim_state+2
		rts
:	cmp #$01
	bne :+
		lda #$00
		sta npc_anim_state+2
		rts
:	cmp #$02
	bne :+
		lda #$03
		sta npc_anim_state+2
		rts
:	lda #$02
	sta npc_anim_state+2
	rts

get_npc_dir:
	lda bg_ram, x
	and #$7f
	cmp npc1+0
	bne :+
		jsr get_p_dir1
		jsr adjust_npc1
		rts
:	cmp npc1+1
	bne :+
		jsr get_p_dir2
		jsr adjust_npc2
		rts
:	jsr get_p_dir3
	jsr adjust_npc3
	rts

p_pos_table:
	.addr facing_up-1, facing_down-1, facing_left-1, facing_right-1
pdir_jumper:
	lda p_anim_state
	and #$0f
	asl a
	tay
	lda p_pos_table+1, y
	pha
	lda p_pos_table+0, y
	pha
	rts
facing_up:
	lda p_pos
	sec
	sbc #$10
	tax
	stx npc_offset
	lda bg_ram, x
	and #$80
	cmp #$80
	bne not_npc
		jsr get_npc_dir
		jmp the_npc
facing_down:
	lda p_pos
	clc
	adc #$10
	tax
	stx npc_offset
	lda bg_ram, x
	and #$80
	cmp #$80
	bne not_npc
		jsr get_npc_dir
		jmp the_npc
facing_left:
	ldx p_pos
	dex
	stx npc_offset
	lda bg_ram, x
	and #$80
	cmp #$80
	bne not_npc
		jsr get_npc_dir
		jmp the_npc
facing_right:
	ldx p_pos
	inx
	stx npc_offset
	lda bg_ram, x
	and #$80
	cmp #$80
	bne not_npc
		jsr get_npc_dir
the_npc:
		jsr npc_tie_sprites
		lda #$02
		sta dialog_type
		rts
not_npc:
	ldy #$00
:	lda p_pos
	cmp search_pos, y
	beq :++
:		iny
		cpy #$05
		bne :--
			lda #<no_item
			sta temp_16bit_1+0
			lda #>no_item
			sta temp_16bit_1+1
			jmp :+++
:	lda p_anim_state
	and #$03
	cmp search_dir, y
	beq :+
		bne :--
:	lda search_lo, y
	sta temp_16bit_1+0
	lda search_hi, y
	sta temp_16bit_1+1
:	lda #$01
	sta dialog_type
	rts





dlg_tile16a:
	.byte $00,$01,$02,$02,$04,$00,$04,$00,$00
dlg_tile16b:
	.byte $00,$02,$02,$03,$00,$05,$00,$00,$05
dlg_tile16c:
	.byte $00,$04,$00,$00,$04,$00,$06,$07,$07
dlg_tile16d:
	.byte $00,$00,$00,$05,$00,$05,$07,$07,$08
dlg_tile16e:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

dlg_tile32a:
	.byte $00,$01,$02,$02,$04,$00,$00
dlg_tile32b:
	.byte $00,$02,$02,$03,$00,$00,$05
dlg_tile32c:
	.byte $00,$04,$00,$00,$06,$07,$07
dlg_tile32d:
	.byte $00,$00,$00,$05,$07,$07,$08


dlg_tiles:
	.byte $01,$02,$02,$02,$02,$03
	.byte $06,$05,$05,$05,$05,$04
dlg_ppu_lo:
	.byte $84,$88,$8c,$90,$94,$98
	.byte $18,$14,$10,$0c,$08,$04
dlg_attr_lo:
	.byte $e9,$ea,$eb,$ec,$ed,$ee
	.byte $f6,$f5,$f4,$f3,$f2,$f1

; f0=dialog done/change npc dialog number, f1=yes/no, f2=nothing extra
; f3=item (if next byte has bit 7 set, then item must be counted as NPC already acknowledging it)
; f4=game from npc, f5=game from search

no_item:
	.byte "THERE'S NOTHING HERE.",$f2

search_nada:
	.byte "NOTHING.",$f2

item000:
	.byte "THE BOX SEAT HAD...",$f5,$00,$01,"10-YARD FIGHT!",$f2
item004:
	.byte "BEHIND THE FENCING...",$f5,$04,$01,"DONKEY KONG!",$f2
item005:
	.byte "BY THE CHAIR LEG WAS",$f5,$05,$01,"DONKEY KONG JR.!",$f2
item008:
	.byte "THE DRESSER HAD...",$f5,$08,$01,"DUCK HUNT!",$f2
item811:
	.byte "FINALLY FOUND...",$f5,$11,$01,"MARIO BROS!",$f2
item813:
	.byte "IN THE WHEEL...",$f5,$13,$01,"POPEYE!",$f2
item015:
	.byte "LAYING IN THE OPEN...",$f5,$15,$01,"SLALOM!",$f2
item016:
	.byte "THE BOTTOM DRAWER HAD",$f5,$10,$01,"MACH RIDER!",$f2
item023:
	.byte "UNDER THE SINK WAS...",$f5,$17,$01,"STACK-UP!",$f2
item026:
	.byte "WITHIN THE BOX WAS...",$f5,$1a,$01,"URBAN CHAMPION!",$f2

item006:
	.byte "WELL LOOK AT THAT...",$f3,$06,$81,"AMONDUS ON VINYL!",$f2
item010:
	.byte "NEXT TO THE ORE...",$f3,$10,$81,"A SHOVEL!",$f2
item011:
	.byte "ON THE SHELF WAS... ",$f3,$11,$81,"JACK'S BAT!",$f2
item013:
	.byte "AMONG THE FLOWERS...",$f3,$28,$81,"FIRE FLOWERS!",$f2
item017:
	.byte "STUCK IN A STILT...",$f3,$17,$81,"A COIN!",$f2
item020:
	.byte "ON THE TABLE...",$f3,$1a,$82,"ACTION 52!",$f2
item01e:
	.byte "BY THE TOILET WAS...",$f3,$1e,$81,"A DOLL!",$f2
; cave stuff
sear000:
	.byte "I WOULD BE SO LUCKY.",$f2
sear001:
	.byte "ROCK ME AMADEUS!",$f2
sear002:
	.byte "NO AMONDUS HERE...",$f2
sear003:
	.byte "I'M BAD! CH'MON!",$f2
sear004:
	.byte "RHCP, STYX, INXS...",$f2
sear005:
	.byte "EVERYTHING ON THE 1!",$f2
sear006:
	.byte "BADGE? WHO IS THAT?",$f2
sear007:
	.byte "GOOD OL' WAYLON!",$f2
sear008:
	.byte "SUPERBOWL SHUFFLE!",$f2
sear009:
	.byte "BIG MIKE, DR. DRE...",$f2
sear010:
	.byte "WHAT'S A G.G. ALLIN?",$f2
sear011:
	.byte "NONE SO VILE! BRUTAL!",$f2
sear012:
	.byte "SQUIRREL NUT ZIPPERS!",$f2
sear013:
	.byte "WAFFLE HOUSE XMAS...?",$f2
sear014:
	.byte "YEAH, BURN THIS ONE.",$f2
sear015:
	.byte "FLEETWOOD MAC! W00T!",$f2

; university stuff
sear016:
	.byte "OOH! OH... NOTHING.",$f2
sear017:
	.byte "FRANKENSTEIN",$f2
sear018:
	.byte "SOLAR BONES",$f2
sear019:
	.byte "HISTORY OF IRELAND",$f2
sear020:
	.byte "LIBERTY + TYRANNY",$f2
sear021:
	.byte "TREASURE ISLAND!",$f2
sear022:
	.byte "THE LAW, BY BASTIAT",$f2
sear023:
	.byte "THE THRAWN TRILOGY",$f2
sear024:
	.byte "THE INVISIBLE MAN",$f2
sear025:
	.byte "IRISH IS A LANGUAGE?",$f2
sear026:
	.byte "TO HELL OR BARBADOS",$f2
sear027:
	.byte "THE FLASH CHRONICLES",$f2
sear028:
	.byte "DUNE",$f2
sear029:
	.byte "SHERLOCK HOLMES",$f2

sear030:
	.byte "THE GREAT GATSBY",$f2
sear031:
	.byte "THE OUTSIDERS",$f2
sear032:
	.byte "A LIFE IN LETTERS",$f2
sear033:
	.byte "MARTIAN CHRONICLES",$f2

sear034:
	.byte "MEDITATIONS",$f2
sear035:
	.byte "THE VANISHING TOWER",$f2
sear036:
	.byte "MOBY DICK",$f2
sear037:
	.byte "CAT IN THE HAT...",$f2
sear038:
	.byte "THE HOLY BIBLE",$f2


; FOR THE SHIP
sear039:
	.byte "JUST A TAPESTRY.",$f2
sear040:
	.byte "NICE SCONCE.",$f2
sear041:
	.byte "TOASTY!",$f2
sear042:
	.byte "ANOTHER TAPESTRY.",$f2
sear043:
	.byte "HMMM... WHY... ?",$f2
sear044:
	.byte "WHY... PURPLE?",$f2
sear045:
	.byte "WHAT AN ODD CHOICE.",$f2
sear046:
	.byte "I MEAN REALLY... ",$f2
sear047:
	.byte "WHO PICKS PURPLE?",$f2
sear048:
	.byte "IT'S A PIRATE SHIP.",$f2
sear049:
	.byte "WHY NOT BLACK?",$f2
sear050:
	.byte "BLACK MAKES SENSE...",$f2
sear051:
	.byte "PURPLE'S JUST WEIRD.",$f2
sear052:
	.byte "FEMME PIRATES, MAYBE?",$f2
sear053:
	.byte "NOTHING WRONG WITH IT",$f2
sear054:
	.byte "IT'S JUST DIFFERENT.",$f2
sear055:
	.byte "MORE PURPLE!",$f2
sear056:
	.byte "I'M OVER IT.",$f2
sear057:
	.byte "YUP.",$f2
sear058:
	.byte "OH... -HE'S- PURPLE.",$f2

sear059:
	.byte "THE SHIP'S ANCHORED.",$f2
sear060:
	.byte "THAT'S TERRIBLY HOT!",$f2
sear061:
	.byte "PRETTY COLORS.",$f2
sear062:
	.byte "LOTS OF THESE AROUND.",$f2
sear063:
	.byte "I GUESS SEEING HELPS.",$f2
sear064:
	.byte "YOU KNOW, LIGHT, ETC.",$f2
sear065:
	.byte "AH! I HAVE NO SHADOW!",$f2
sear066:
	.byte "THAT IS SO CREEPY.",$f2
sear067:
	.byte "NO SHADOW, NO PERSON?",$f2
sear068:
	.byte "NO CLUE WHAT TO THINK.",$f2
sear069:
	.byte "MAYBE IT SWAM AWAY?",$f2
sear070:
	.byte "WELL, THIS IS A SHIP.",$f2
sear071:
	.byte "SHADOWS DON'T DO THAT!",$f2
sear072:
	.byte "WAIT... DO THEY?",$f2
sear073:
	.byte "MAYBE THEY DO... ?",$f2
sear074:
	.byte "NAH. THEY DON'T.",$f2
sear075:
	.byte "ANYWAY, THESE ARE NICE",$f2
sear076:
	.byte "THEY LOOK FAMILIAR...",$f2
sear077:
	.byte "THE TOPS LOOK LIKE...",$f2
sear078:
	.byte "... MOUNTAINS MAYBE?",$f2
sear079:
	.byte "THE BOTTOMS LIKE....",$f2
sear080:
	.byte "LIKE SHIPS! THAT'S IT!",$f2
sear081:
	.byte "TILES AND GAME DEV...",$f2
sear082:
	.byte "MAKE FOR WEIRD COMBOS.",$f2


; MINE STUFF
sear083:
	.byte "NO SHOVEL HERE.",$f2
sear084:
	.byte "JUST PRETTY ORE.",$f2
sear085:
	.byte "DON'T SEE A SHOVEL.",$f2
sear086:
	.byte "IT'S... NOT A SHOVEL!",$f2
sear087:
	.byte "JUST DIRT... UGH.",$f2
sear088:
	.byte "SHOOOVVEELL? ANYWHERE?",$f2
sear089:
	.byte "DON'T SEE ONE HERE.",$f2
sear090:
	.byte "REALLY WANT A SHOVEL!",$f2
sear091:
	.byte "HELLO? SHOVEL?",$f2
sear092:
	.byte "NO DARNED SHOVEL!",$f2
sear093:
	.byte "WOULD'VE BEEN NICE...",$f2
sear094:
	.byte "LOOKS LIKE A DEAD END?",$f2

; GYM
sear095:
	.byte "OH! I -AM- SEXY!",$f2
sear096:
	.byte "THESE BELLS ARE DUMB.",$f2
sear097:
	.byte "NO SQUATS FOR ME!",$f2





