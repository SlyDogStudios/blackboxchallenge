.include "i\challenge_constants.asm"
.include "i\bank11\challenge_music_declarations.asm"

.segment "ZEROPAGE"
.include "i\challenge_zp.asm"

.include "i\bank00\bank00.asm"			; indoors graphics
.include "i\bank01\bank01.asm"			; overworld map (used sdsmdata program to generate)
.include "i\bank02\bank02.asm"			; outdoors graphics
.include "i\bank03\bank03.asm"			; indoor metatiles, indoor rooms, indoor palettes, store
.include "i\bank04\bank04.asm"			; overworld graphics
.include "i\bank05\bank05.asm"			; outdoor metatiles, outdoor rooms, outdoor palettes
.include "i\bank06\bank06.asm"			; (open)
.include "i\bank07\bank07.asm"			; overworld metatiles, overworld rooms, overworld palettes
.include "i\bank08\bank08.asm"			; NPC animation, NPC movement
.include "i\bank09\bank09.asm"			; (open)
.include "i\bank10\bank10.asm"			; searching rooms
.include "i\bank11\bank11.asm"			; sound
.include "i\bank12\bank12.asm"			; (open)
.include "i\bank13\bank13.asm"			; NPC #0-33 dialogue
.include "i\bank14\bank14.asm"			; dojo battle training graphics and code
.include "i\bank15\bank15.asm"			; NPC #34-96 dialogue
.include "i\bank16\bank16.asm"			; ending graphics and code
.include "i\bank17\bank17.asm"			; (open)
.include "i\bank18\bank18.asm"			; save
.include "i\bank19\bank19.asm"			; (open)
.include "i\bank20\bank20.asm"			; enemy data, battle ability tests, flicker, fill stamina, fill health,
										;   enemy rand, battle win, battle setup
.include "i\bank21\bank21.asm"			; (open)
.include "i\bank22\bank22.asm"			; title, title graphics, kickstarter thanks
.include "i\bank23\bank23.asm"			; (open)
.include "i\bank24\bank24.asm"			; player/enemy/Karnov battle graphics, battle/peripheral load
.include "i\bank25\bank25.asm"			; enemy/boss select, boss locations, gameplay menu

; ***** MINIGAME MAIN *****
.include "i\bank26\bank26.asm"			; Karnov, Mach Rider, Pinball, NES Virus Cleaner
.include "i\bank27\bank27.asm"			; Donkey Kong, Gyromite, Popeye, Clu Clu Land, Gumshoe, Tennis,
										;   Wrecking Crew, Pro Wrestling, Super Mario Bros.
.include "i\bank28\bank28.asm"			; "NES not working," Donkey Kong Jr. Math, Hogan's Alley, Excitebike,
										;   Golf, Donkey Kong Jr., Ice Climber, Kung Fu, Soccer,
										;   Wild Gunman, Donkey Kong 3, Balloon Fight, Volleyball, Mario Bros.,
										;   10-Yard Fight, Urban Champion
.include "i\bank29\bank29.asm"			;   Baseball, Duck Hunt, Slalom, Stack-Up
										;   TV graphics, loading, prizes
.include "i\bank30\bank30.asm"			; All minigame graphics
; ***** END MINIGAME MAIN *****

.include "i\bankFixed\bankFixed.asm"	; Main loop/nmi, special checks, overhead abilities, NPC setups,
										;   player battle animations, bike movement, battles, enemy clusters,
										;   minigame driver and sfx, palette animation, bankswitching, vectors
