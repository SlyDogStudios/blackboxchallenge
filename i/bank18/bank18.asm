.segment "BANK18"
.segment "SAVESPOT"
save_here:




.segment "SAVESTUFF"
;Some macro defines for calling the functions.  You must include this file in whatever bank this code is going to be run from, then make the calls to
;these macros.
	

.macro CallWriteVerify			;Internally used by CallEraseSector and CallWriteByte.
	
.endmacro
	
;CallSoftwareIdentify - Returns Chip Manufacturer and Chip ID information. THis can be used
;to determine how much free space you have, if for example, your game only uses 128KB, but is flashed
;to a 256KB or 512KB flash chip.  The chip manufacturer for most of the installed chips is likely to
;be 0xBF, and Chip ID be 0xB5 for 128KB, 0xB6 for 256KB or 0xB7 for 512KB.
;
;This is the one command you can attempt to execute to determine if flash saving is enabled on the cart or not.
;Just make sure you don't have 0xBF in address 0, and 0xB5/0xB6/0xB7 in address 1, as these are the addresses this command
;actually reads.

.macro CallSoftwareIdentify		;Uses ReturnBank. A destroyed, X = Chip Manufacturer, Y = Chip ID
	JSR (FlashRamPage+(SoftwareIdentify-WriteVerify))
.endmacro
	
;CallEraseSector - Used to erase a 4KB sector of flash.
;Erasing sets every single byte in that sector to 0xFF.
;If there are any values you wish to save, read them out before 
;erasing the sector.

.macro CallEraseSector			;Uses TargetBank, TargetAddress, ReturnBank. A & Y destroyed.
	jsr FlashRamPage + (EraseSector-WriteVerify)
.endmacro
	
;CallWriteByte - Used to write a byte to flash.
;The byte actually written is a logical bitwise AND of the desired value to write, and the value currently stored in flash.
;Because of this, writes will progress from 0xFF towards 0x00.  Flash bits can only be cleared with this function.

.macro CallWriteByte			;Byte to Write in A, Address is TargetAddress+Y. Uses TargetBank, TargetAddress, ReturnBank.
	jsr FlashRamPage + (WriteByte-WriteVerify)
.endmacro
	
;JmpExitBank - mostly needed only for flash saving hacks. Put the bank to exit with on the A register, then use this macro.

.macro JmpExitBank				;Bank to switch to on return in A register.
	JMP (FlashRamPage+(ReturnToBank-WriteVerify))
.endmacro


; 9 bytes
WriteVerify:
;	nop
;	nop
	lda (TargetAddress), y
	cmp (TargetAddress), y
	bne WriteVerify
	rts

; 71 bytes
EraseSector:
	lda #$01
	sta $c000
	lda #$aa
	sta $9555
	lda #$00
	sta $c000
	lda #$55
	sta $aaaa
	lda #$01
	sta $c000
	lda #$80
	sta $9555
	lda #$01
	sta $c000
	lda #$aa
	sta $9555
	lda #$00
	sta $c000
	lda #$55
	sta $aaaa
	lda TargetBank
	sta $c000
	ldy #$00
	lda #$30
	sta (TargetAddress), y
	jsr FlashRamPage
	lda ReturnBank
ReturnToBank:
	sta $c000
	rts ;jmp rtnErase

; 49 bytes
WriteByte:
	pha
	lda #$01
	sta $c000
	lda #$aa
	sta $9555
	lda #$00
	sta $c000
	lda #$55
	sta $aaaa
	lda #$01
	sta $c000
	lda #$a0
	sta $9555
	lda TargetBank
	sta $c000
	pla
	sta (TargetAddress), y
	jsr FlashRamPage
	lda ReturnBank
	sta $c000
	rts

; 60 bytes
SoftwareIdentify:
	lda #$80
	sta TargetAddress+1
	lda #$01
	sta TargetAddress+0
	sta $c000
	lda #$aa
	sta $9555
	lda #$00
	sta $c000
	lda #$55
	sta $aaaa
	lda #$01
	sta $c000
	lda #$90
	sta $9555
	jsr FlashRamPage
	lda $8000
	tax
	lda $8001
	tay
	lda #$f0
	sta $8000
	jsr FlashRamPage
	lda ReturnBank
	sta $c000
	rts

;Call this routine to copy all the flash related functions into ram.
CopyFlashRoutine:
	ldy #$00
CopyFlashRoutineLoop:
	lda WriteVerify, y
	sta FlashRamPage, y
	iny
	cpy #(CopyFlashRoutine - WriteVerify)
	bne CopyFlashRoutineLoop
	rts
loop_save:

	ldx #$00
:	lda sds, x
	sta sds_thingy, x
	inx
	cpx #$04
	bne :-

	ldy #$00
:	lda p_topleft_save, y
	sta save700page, y
	iny
	cpy #$30
	bne :-
	lda #18
	sta TargetBank
	lda #$00
	sta TargetAddress+0
	lda #$80
	sta TargetAddress+1
	lda #$00;games+0
	sta SourceAddress
	lda #$00;games+1
	sta SourceAddress_h
	lda #18
	sta ReturnBank
	jsr CopyFlashRoutine

	ldy #$00
	CallEraseSector

	ldy #$00
save_some_more0:
	lda (SourceAddress), y
		CallWriteByte
	iny
	cpy #$46
	bne save_some_more0

	lda #$00
	sta TargetAddress+0
	lda #$81
	sta TargetAddress+1
	lda #$00;npc_dialogs+0
	sta SourceAddress
	lda #$04;npc_dialogs+1
	sta SourceAddress_h
	ldy #$00
save_some_more1:
	lda (SourceAddress), y
		CallWriteByte
	iny
	bne save_some_more1


	lda #$00
	sta TargetAddress+0
	lda #$82
	sta TargetAddress+1
	lda #$80;npc_dialogs+0
	sta SourceAddress
	lda #$05;npc_dialogs+1
	sta SourceAddress_h

	ldy #$00
save_some_more2:
	lda (SourceAddress), y
		CallWriteByte
	iny
	cpy #$04
	bne save_some_more2

	ldy #$00
	tya
:	sta p_topleft_save, y
	iny
	bne :-
	
	ldy #$00
:	lda save700page, y
	sta p_topleft_save, y
	iny
	cpy #$30
	bne :-
	jmp rtn_from_save


