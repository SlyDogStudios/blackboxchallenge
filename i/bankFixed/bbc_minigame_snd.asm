
; *****************************************************************
; SOUND RETURN ADDRESSES AND PAUSE STUFFS
; *****************************************************************
pause_routine:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq :+
		lda loop_pointer+0
		sta pause_loop_addy+0
		lda loop_pointer+1
		sta pause_loop_addy+1
		lda nmi_pointer+0
		sta pause_nmi_addy+0
		lda nmi_pointer+1
		sta pause_nmi_addy+1
		lda #<loop_pause
		sta loop_pointer+0
		lda #>loop_pause
		sta loop_pointer+1
		lda #<nmi_pause
		sta nmi_pointer+0
		lda #>nmi_pause
		sta nmi_pointer+1
		ldy #11
		jsr bankswitch
		jsr music_stopsfx
		ldy bank
		jsr bank_save
		jsr nmi_wait
		jsr paused_music
		jsr load_pause_music
:
	rts
load_pause_music:
	ldx #$01
	jmp return_music_routine
return_pause:
	rts
loop_pause:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq @stay_paused
		lda pause_loop_addy+0
		sta loop_pointer+0
		lda pause_loop_addy+1
		sta loop_pointer+1
		lda pause_nmi_addy+0
		sta nmi_pointer+0
		lda pause_nmi_addy+1
		sta nmi_pointer+1
		jsr paused_music_returns
@stay_paused:
	jmp end_loop
nmi_pause:
	jmp end_nmi
paused_music:
	ldx #$00
:	lda $300, x
	sta $500, x
	inx
	cpx #$40
	bne :-
	lda $380
	sta $580
	lda $381
	sta $581
	lda $382
	sta $582
	lda $583
	sta $583
	ldx #$00
:	lda $fa, x
	sta $5fa, x
	inx
	cpx #$06
	bne :-
	rts
paused_music_returns:
	ldx #$00
:	lda $500, x
	sta $300, x
	inx
	cpx #$40
	bne :-
	lda $580
	sta $380
	lda $581
	sta $381
	lda $582
	sta $382
	lda $583
	sta $383
	ldx #$00
:	lda $5fa, x
	sta $fa, x
	inx
	cpx #$06
	bne :-
	rts

return_music_lo:
	.byte <return_none,<return_pause
return_music_hi:
	.byte >return_none,>return_pause
return_music_routine:
	lda return_music_lo, x
	sta return_music+0
	lda return_music_hi, x
	sta return_music+1
	ldy #11
	jsr bankswitch
	txa
	jsr music_loadsong
	ldy bank
	jsr bankswitch
	jmp (return_music)

return_sfx_lo:
	.byte <return_silence
	.byte <yard_beep, <bfight_beep, <bball_beep, <bball_hit, <cc_beep
	.byte <cc_hit,    <dk_beep,     <dk_hit,     <dk_jump,   <dkjr_beep
	.byte <dkjr_hit,  <dk3_ehit,    <dk3_hit,    <dk3_woosh, <math_beep
	.byte <math_hit,  <math_switch, <dhunt_gun,  <excite_hit1,<excite_hit2
	.byte <excite_beep,<golf_beep,  <golf_hit,   <golf_woosh, <gshoe_gun
	.byte <gshoe_hit, <gmite_beep,  <gmite_woosh,<halley_gun, <climb_beep1
	.byte <climb_beep2,<kfu_beep,   <kfu_hit,    <rider_gun,  <rider_beep
	.byte <rider_hit, <mbros_jump,  <mbros_beep, <mbros_hit,  <pball_beep
	.byte <pball_bounce,<pball_hit, <peye_beep,  <peye_hit,   <wrestle_hit1
	.byte <wrestle_score,<slom_beep,<slom_hit,   <soc_beep,   <smb_beep
	.byte <smb_hit,     <smb_jump,  <smb_fire,   <tennis_beep,<tennis_hit
	.byte <tennis_miss,<uchamp_beep,<uchamp_hit, <vball_hit,  <vball_beep
	.byte <vball_miss, <gunman_shot,<gunman_beep,<wcrew_ham,  <wcrew_beep
	.byte <wcrew_hit, <virus_beep,  <karn_beep,  <karn_hit
return_sfx_hi:
	.byte >return_silence
	.byte >yard_beep, >bfight_beep, >bball_beep, >bball_hit, >cc_beep
	.byte >cc_hit,    >dk_beep,     >dk_hit,     >dk_jump,   >dkjr_beep
	.byte >dkjr_hit,  >dk3_ehit,    >dk3_hit,    >dk3_woosh, >math_beep
	.byte >math_hit,  >math_switch, >dhunt_gun,  >excite_hit1,>excite_hit2
	.byte >excite_beep,>golf_beep,  >golf_hit,   >golf_woosh, >gshoe_gun
	.byte >gshoe_hit, >gmite_beep,  >gmite_woosh,>halley_gun, >climb_beep1
	.byte >climb_beep2,>kfu_beep,   >kfu_hit,    >rider_gun,  >rider_beep
	.byte >rider_hit, >mbros_jump,  >mbros_beep, >mbros_hit,  >pball_beep
	.byte >pball_bounce,>pball_hit, >peye_beep,  >peye_beep,  >wrestle_hit1
	.byte >wrestle_score,>slom_beep,>slom_hit,   >soc_beep,   >smb_beep
	.byte >smb_hit,     >smb_jump,  >smb_fire,   >tennis_beep,>tennis_hit
	.byte >tennis_miss,>uchamp_beep,>uchamp_hit, >vball_hit,  >vball_beep
	.byte >vball_miss, >gunman_shot,>gunman_beep,>wcrew_ham,  >wcrew_beep
	.byte >wcrew_hit, >virus_beep, >karn_beep,   >karn_hit
return_sfx_routine:
	tya
	pha
	lda return_sfx_lo, x
	sta return_sfx+0
	lda return_sfx_hi, x
	sta return_sfx+1
	ldy #11
	jsr bankswitch
	txa
	jsr music_loadsfx
	ldy bank
	jsr bankswitch
	pla
	tay
	jmp (return_sfx)
return_silence:

	ldx #$00
	jmp return_music_routine
return_none:
