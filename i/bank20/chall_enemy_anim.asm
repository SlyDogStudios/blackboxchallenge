enemy_name_start:
.byte $cf,         $d5,         $d3,         $d3,         $d5,         $d3
.byte $d1,         $d1,         $d2,         $d5,         $d3,         $d5
.byte $d3,         $d2,         $d5,         $d6,         $d5,         $d6
.byte $d2,         $d5,         $d4,         $d5,         $d5,         $d5
.byte $d5,         $d4,         $d6,         $d1,         $d1,         $d3
.byte $d3,         $d2,         $d4,         $d7,         $d5,         $d1
.byte $d6,         $d5,         $d5,         $d2,         $d2,         $d6
.byte $d2,         $d2,         $d0,         $d4,         $d1,         $d0
.byte $d6,         $d1,         $d2,         $d0
end_top:
.byte $00,$03,$06,$09,$0c,$0f,$12,$15,$18,$1b,$1e,$21,$24,$27,$2a,$32,$33,$31
end_mid:
.byte $01,$04,$07,$0a,$0d,$10,$13,$16,$19,$1c,$1f,$22,$25,$28,$2b,$2f,$2d
end_bot:
.byte $02,$05,$08,$0b,$0e,$11,$14,$17,$1a,$1d,$20,$23,$26,$29,$2c,$30,$2e
enemy_name_lo:
.byte <casual_name,<larper_name,<pcgame_name, <review_name,<critic_name,<youtub_name	; $00,$05
.byte <gamerg_name,<boothb_name,<cospla_name, <seller_name,<resell_name,<vendor_name	; $06,$0b
.byte <hobbyi_name,<collec_name,<trader_name, <bullys_name,<lurker_name,<trolls_name	; $0c,$11
.byte <profit_name,<pirate_name,<scamme_name, <newbie_name,<hacker_name,<brewer_name	; $12,$17
.byte <fright_name,<phanto_name,<ghosts_name, <fabric_name,<reprod_name,<devver_name	; $18,$1d
.byte <pakrat_name,<scaven_name,<hoarde_name, <fleaes_name,<dealer_name,<auctio_name	; $1e,$23
.byte <buyers_name,<hunter_name,<sniper_name, <social_name,<modera_name,<admins_name	; $24,$29
.byte <preser_name,<histor_name,<revisi_name, <lblock_name,<ggenie_name,<ddoggy_name	; $2a,$2f
.byte <rrobby_name,<shadow_name,<strong_name, <octops_name	; $30,$33
enemy_name_hi:
.byte >casual_name,>larper_name,>pcgame_name,>review_name,>critic_name,>youtub_name
.byte >gamerg_name,>boothb_name,>cospla_name,>seller_name,>resell_name,>vendor_name
.byte >hobbyi_name,>collec_name,>trader_name,>bullys_name,>lurker_name,>trolls_name
.byte >profit_name,>pirate_name,>scamme_name,>newbie_name,>hacker_name,>brewer_name
.byte >fright_name,>phanto_name,>ghosts_name,>fabric_name,>reprod_name,>devver_name
.byte >pakrat_name,>scaven_name,>hoarde_name,>fleaes_name,>dealer_name,>auctio_name
.byte >buyers_name,>hunter_name,>sniper_name,>social_name,>modera_name,>admins_name
.byte >preser_name,>histor_name,>revisi_name,>lblock_name,>ggenie_name,>ddoggy_name
.byte >rrobby_name,>shadow_name,>strong_name,>octops_name

enemy_pal_lo:
.byte <casual_pal,<larper_pal,<pcgame_pal,<review_pal,<critic_pal,<youtub_pal
.byte <gamerg_pal,<boothb_pal,<cospla_pal,<seller_pal,<resell_pal,<vendor_pal
.byte <hobbyi_pal,<collec_pal,<trader_pal,<bullys_pal,<lurker_pal,<trolls_pal
.byte <profit_pal,<pirate_pal,<scamme_pal,<newbie_pal,<hacker_pal,<brewer_pal
.byte <fright_pal,<phanto_pal,<ghosts_pal,<fabric_pal,<reprod_pal,<devver_pal
.byte <pakrat_pal,<scaven_pal,<hoarde_pal,<fleaes_pal,<dealer_pal,<auctio_pal
.byte <buyers_pal,<hunter_pal,<sniper_pal,<social_pal,<modera_pal,<admins_pal
.byte <preser_pal,<histor_pal,<revisi_pal,<lblock_pal,<ggenie_pal,<ddoggy_pal
.byte <rrobby_pal,<shadow_pal,<strong_pal,<octops_pal
enemy_pal_hi:
.byte >casual_pal,>larper_pal,>pcgame_pal,>review_pal,>critic_pal,>youtub_pal
.byte >gamerg_pal,>boothb_pal,>cospla_pal,>seller_pal,>resell_pal,>vendor_pal
.byte >hobbyi_pal,>collec_pal,>trader_pal,>bullys_pal,>lurker_pal,>trolls_pal
.byte >profit_pal,>pirate_pal,>scamme_pal,>newbie_pal,>hacker_pal,>brewer_pal
.byte >fright_pal,>phanto_pal,>ghosts_pal,>fabric_pal,>reprod_pal,>devver_pal
.byte >pakrat_pal,>scaven_pal,>hoarde_pal,>fleaes_pal,>dealer_pal,>auctio_pal
.byte >buyers_pal,>hunter_pal,>sniper_pal,>social_pal,>modera_pal,>admins_pal
.byte >preser_pal,>histor_pal,>revisi_pal,>lblock_pal,>ggenie_pal,>ddoggy_pal
.byte >rrobby_pal,>shadow_pal,>strong_pal,>octops_pal

enemy_lo_lo:
.byte <casual_lo,<larper_lo,<pcgame_lo,<review_lo,<critic_lo,<youtub_lo
.byte <gamerg_lo,<boothb_lo,<cospla_lo,<seller_lo,<resell_lo,<vendor_lo
.byte <hobbyi_lo,<collec_lo,<trader_lo,<bullys_lo,<lurker_lo,<trolls_lo
.byte <profit_lo,<pirate_lo,<scamme_lo,<newbie_lo,<hacker_lo,<brewer_lo
.byte <fright_lo,<phanto_lo,<ghosts_lo,<fabric_lo,<reprod_lo,<devver_lo
.byte <pakrat_lo,<scaven_lo,<hoarde_lo,<fleaes_lo,<dealer_lo,<auctio_lo
.byte <buyers_lo,<hunter_lo,<sniper_lo,<social_lo,<modera_lo,<admins_lo
.byte <preser_lo,<histor_lo,<revisi_lo,<lblock_lo,<ggenie_lo,<ddoggy_lo
.byte <rrobby_lo,<shadow_lo,<strong_lo,<octops_lo
enemy_lo_hi:
.byte >casual_lo,>larper_lo,>pcgame_lo,>review_lo,>critic_lo,>youtub_lo
.byte >gamerg_lo,>boothb_lo,>cospla_lo,>seller_lo,>resell_lo,>vendor_lo
.byte >hobbyi_lo,>collec_lo,>trader_lo,>bullys_lo,>lurker_lo,>trolls_lo
.byte >profit_lo,>pirate_lo,>scamme_lo,>newbie_lo,>hacker_lo,>brewer_lo
.byte >fright_lo,>phanto_lo,>ghosts_lo,>fabric_lo,>reprod_lo,>devver_lo
.byte >pakrat_lo,>scaven_lo,>hoarde_lo,>fleaes_lo,>dealer_lo,>auctio_lo
.byte >buyers_lo,>hunter_lo,>sniper_lo,>social_lo,>modera_lo,>admins_lo
.byte >preser_lo,>histor_lo,>revisi_lo,>lblock_lo,>ggenie_lo,>ddoggy_lo
.byte >rrobby_lo,>shadow_lo,>strong_lo,>octops_lo

enemy_hi_lo:
.byte <casual_hi,<larper_hi,<pcgame_hi,<review_hi,<critic_hi,<youtub_hi
.byte <gamerg_hi,<boothb_hi,<cospla_hi,<seller_hi,<resell_hi,<vendor_hi
.byte <hobbyi_hi,<collec_hi,<trader_hi,<bullys_hi,<lurker_hi,<trolls_hi
.byte <profit_hi,<pirate_hi,<scamme_hi,<newbie_hi,<hacker_hi,<brewer_hi
.byte <fright_hi,<phanto_hi,<ghosts_hi,<fabric_hi,<reprod_hi,<devver_hi
.byte <pakrat_hi,<scaven_hi,<hoarde_hi,<fleaes_hi,<dealer_hi,<auctio_hi
.byte <buyers_hi,<hunter_hi,<sniper_hi,<social_hi,<modera_hi,<admins_hi
.byte <preser_hi,<histor_hi,<revisi_hi,<lblock_hi,<ggenie_hi,<ddoggy_hi
.byte <rrobby_hi,<shadow_hi,<strong_hi,<octops_hi
enemy_hi_hi:
.byte >casual_hi,>larper_hi,>pcgame_hi,>review_hi,>critic_hi,>youtub_hi
.byte >gamerg_hi,>boothb_hi,>cospla_hi,>seller_hi,>resell_hi,>vendor_hi
.byte >hobbyi_hi,>collec_hi,>trader_hi,>bullys_hi,>lurker_hi,>trolls_hi
.byte >profit_hi,>pirate_hi,>scamme_hi,>newbie_hi,>hacker_hi,>brewer_hi
.byte >fright_hi,>phanto_hi,>ghosts_hi,>fabric_hi,>reprod_hi,>devver_hi
.byte >pakrat_hi,>scaven_hi,>hoarde_hi,>fleaes_hi,>dealer_hi,>auctio_hi
.byte >buyers_hi,>hunter_hi,>sniper_hi,>social_hi,>modera_hi,>admins_hi
.byte >preser_hi,>histor_hi,>revisi_hi,>lblock_hi,>ggenie_hi,>ddoggy_hi
.byte >rrobby_hi,>shadow_hi,>strong_hi,>octops_hi

enemy_stat_lo:
.byte <casual_stat,<larper_stat,<pcgame_stat,<review_stat,<critic_stat,<youtub_stat
.byte <gamerg_stat,<boothb_stat,<cospla_stat,<seller_stat,<resell_stat,<vendor_stat
.byte <hobbyi_stat,<collec_stat,<trader_stat,<bullys_stat,<lurker_stat,<trolls_stat
.byte <profit_stat,<pirate_stat,<scamme_stat,<newbie_stat,<hacker_stat,<brewer_stat
.byte <fright_stat,<phanto_stat,<ghosts_stat,<fabric_stat,<reprod_stat,<devver_stat
.byte <pakrat_stat,<scaven_stat,<hoarde_stat,<fleaes_stat,<dealer_stat,<auctio_stat
.byte <buyers_stat,<hunter_stat,<sniper_stat,<social_stat,<modera_stat,<admins_stat
.byte <preser_stat,<histor_stat,<revisi_stat,<lblock_stat,<ggenie_stat,<ddoggy_stat
.byte <rrobby_stat,<shadow_stat,<strong_stat,<octops_stat
enemy_stat_hi:
.byte >casual_stat,>larper_stat,>pcgame_stat,>review_stat,>critic_stat,>youtub_stat
.byte >gamerg_stat,>boothb_stat,>cospla_stat,>seller_stat,>resell_stat,>vendor_stat
.byte >hobbyi_stat,>collec_stat,>trader_stat,>bullys_stat,>lurker_stat,>trolls_stat
.byte >profit_stat,>pirate_stat,>scamme_stat,>newbie_stat,>hacker_stat,>brewer_stat
.byte >fright_stat,>phanto_stat,>ghosts_stat,>fabric_stat,>reprod_stat,>devver_stat
.byte >pakrat_stat,>scaven_stat,>hoarde_stat,>fleaes_stat,>dealer_stat,>auctio_stat
.byte >buyers_stat,>hunter_stat,>sniper_stat,>social_stat,>modera_stat,>admins_stat
.byte >preser_stat,>histor_stat,>revisi_stat,>lblock_stat,>ggenie_stat,>ddoggy_stat
.byte >rrobby_stat,>shadow_stat,>strong_stat,>octops_stat


enemy_heal_lo:
.byte <casual_heal,<larper_heal,<pcgame_heal,<review_heal,<critic_heal,<youtub_heal
.byte <gamerg_heal,<boothb_heal,<cospla_heal,<seller_heal,<resell_heal,<vendor_heal
.byte <hobbyi_heal,<collec_heal,<trader_heal,<bullys_heal,<lurker_heal,<trolls_heal
.byte <profit_heal,<pirate_heal,<scamme_heal,<newbie_heal,<hacker_heal,<brewer_heal
.byte <fright_heal,<phanto_heal,<ghosts_heal,<fabric_heal,<reprod_heal,<devver_heal
.byte <pakrat_heal,<scaven_heal,<hoarde_heal,<fleaes_heal,<dealer_heal,<auctio_heal
.byte <buyers_heal,<hunter_heal,<sniper_heal,<social_heal,<modera_heal,<admins_heal
.byte <preser_heal,<histor_heal,<revisi_heal,<lblock_heal,<ggenie_heal,<ddoggy_heal
.byte <rrobby_heal,<shadow_heal,<strong_heal,<octops_heal
enemy_heal_hi:
.byte >casual_heal,>larper_heal,>pcgame_heal,>review_heal,>critic_heal,>youtub_heal
.byte >gamerg_heal,>boothb_heal,>cospla_heal,>seller_heal,>resell_heal,>vendor_heal
.byte >hobbyi_heal,>collec_heal,>trader_heal,>bullys_heal,>lurker_heal,>trolls_heal
.byte >profit_heal,>pirate_heal,>scamme_heal,>newbie_heal,>hacker_heal,>brewer_heal
.byte >fright_heal,>phanto_heal,>ghosts_heal,>fabric_heal,>reprod_heal,>devver_heal
.byte >pakrat_heal,>scaven_heal,>hoarde_heal,>fleaes_heal,>dealer_heal,>auctio_heal
.byte >buyers_heal,>hunter_heal,>sniper_heal,>social_heal,>modera_heal,>admins_heal
.byte >preser_heal,>histor_heal,>revisi_heal,>lblock_heal,>ggenie_heal,>ddoggy_heal
.byte >rrobby_heal,>shadow_heal,>strong_heal,>octops_heal


enemy_stam_lo:
.byte <casual_stam,<larper_stam,<pcgame_stam,<review_stam,<critic_stam,<youtub_stam
.byte <gamerg_stam,<boothb_stam,<cospla_stam,<seller_stam,<resell_stam,<vendor_stam
.byte <hobbyi_stam,<collec_stam,<trader_stam,<bullys_stam,<lurker_stam,<trolls_stam
.byte <profit_stam,<pirate_stam,<scamme_stam,<newbie_stam,<hacker_stam,<brewer_stam
.byte <fright_stam,<phanto_stam,<ghosts_stam,<fabric_stam,<reprod_stam,<devver_stam
.byte <pakrat_stam,<scaven_stam,<hoarde_stam,<fleaes_stam,<dealer_stam,<auctio_stam
.byte <buyers_stam,<hunter_stam,<sniper_stam,<social_stam,<modera_stam,<admins_stam
.byte <preser_stam,<histor_stam,<revisi_stam,<lblock_stam,<ggenie_stam,<ddoggy_stam
.byte <rrobby_stam,<shadow_stam,<strong_stam,<octops_stam
enemy_stam_hi:
.byte >casual_stam,>larper_stam,>pcgame_stam,>review_stam,>critic_stam,>youtub_stam
.byte >gamerg_stam,>boothb_stam,>cospla_stam,>seller_stam,>resell_stam,>vendor_stam
.byte >hobbyi_stam,>collec_stam,>trader_stam,>bullys_stam,>lurker_stam,>trolls_stam
.byte >profit_stam,>pirate_stam,>scamme_stam,>newbie_stam,>hacker_stam,>brewer_stam
.byte >fright_stam,>phanto_stam,>ghosts_stam,>fabric_stam,>reprod_stam,>devver_stam
.byte >pakrat_stam,>scaven_stam,>hoarde_stam,>fleaes_stam,>dealer_stam,>auctio_stam
.byte >buyers_stam,>hunter_stam,>sniper_stam,>social_stam,>modera_stam,>admins_stam
.byte >preser_stam,>histor_stam,>revisi_stam,>lblock_stam,>ggenie_stam,>ddoggy_stam
.byte >rrobby_stam,>shadow_stam,>strong_stam,>octops_stam

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals


; ********************************************
;casual
;larper
;pc gamer

casual_heal:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$09,$0a
casual_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
casual_stat:
.byte $00,$06,$06,$10,$10,$00,$01,$01
larper_heal:
.byte $00,$00,$00,$00,$00,$0a,$09,$0a,$09,$0a
larper_stam:
.byte $00,$0d,$0d,$0d,$0d,$0d,$0d,$0d
larper_stat:
.byte $00,$07,$07,$18,$18,$02,$01,$04
pcgame_heal:
.byte $00,$00,$00,$00,$00,$00,$09,$0a,$09,$0a
pcgame_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
pcgame_stat:
.byte $00,$06,$06,$14,$14,$02,$01,$05

casual_name:
.byte "CASUAL GAMER",$ff
larper_name:
.byte "LARPER",$ff
pcgame_name:
.byte "PC GAMER",$ff

casual_pal:
.byte $35,$27,$16, $0f,$30,$16,$0f
larper_pal:
.byte $17,$27,$1a, $0f,$30,$16,$0f
pcgame_pal:
.byte $37,$17,$1c, $0f,$30,$16,$0f

casual_lo:
.byte <casual_stand,<casual_block
.byte <casual_punch,<casual_punch,<casual_punch,<casual_punch,<casual_punch,<casual_punch,<casual_punch,<casual_punch
.byte <casual_punch,<casual_punch,<casual_punch,<casual_punch,<casual_punch,<casual_punch,<casual_punch,<casual_punch
casual_hi:
.byte >casual_stand,>casual_block
.byte >casual_punch,>casual_punch,>casual_punch,>casual_punch,>casual_punch,>casual_punch,>casual_punch,>casual_punch
.byte >casual_punch,>casual_punch,>casual_punch,>casual_punch,>casual_punch,>casual_punch,>casual_punch,>casual_punch
larper_lo:
.byte <casual_stand,<casual_block
.byte <casual_aah,<casual_knee,<casual_aah,<casual_knee,<casual_aah,<casual_knee,<casual_aah,<casual_knee
.byte <casual_aah,<casual_knee,<casual_aah,<casual_knee,<casual_aah,<casual_knee,<casual_aah,<casual_knee
larper_hi:
.byte >casual_stand,>casual_block
.byte >casual_aah,>casual_knee,>casual_aah,>casual_knee,>casual_aah,>casual_knee,>casual_aah,>casual_knee
.byte >casual_aah,>casual_knee,>casual_aah,>casual_knee,>casual_aah,>casual_knee,>casual_aah,>casual_knee
pcgame_lo:
.byte <casual_stand,<casual_block
.byte <casual_stomp,<casual_knee,<casual_aah,<casual_mac,<casual_stomp,<casual_aah,<casual_knee,<casual_mac
.byte <casual_stomp,<casual_knee,<casual_aah,<casual_mac,<casual_stomp,<casual_aah,<casual_knee,<casual_mac
pcgame_hi:
.byte >casual_stand,>casual_block
.byte >casual_stomp,>casual_knee,>casual_aah,>casual_mac,>casual_stomp,>casual_aah,>casual_knee,>casual_mac
.byte >casual_stomp,>casual_knee,>casual_aah,>casual_mac,>casual_stomp,>casual_aah,>casual_knee,>casual_mac

casual_stand:
.byte $00,$be,$00
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
casual_block:
.byte $bd,$be,$00
.byte $bc,$cd,$00
.byte $00,$dd,$00
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
casual_knee:
.byte $bd,$be,$00
.byte $bc,$cd,$00
.byte $db,$dd,$00
.byte $eb,$ed,$ef
.byte $00,$fd,$dc
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $68,$58		; target Y, target X
casual_punch:
.byte $00,$be,$00
.byte $cc,$cd,$00
.byte $00,$dd,$00
.byte $ec,$ed,$ef
.byte $fc,$fd,$dc
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $01			; damage
.byte $3c			; att move wait
.byte $68,$58		; target Y, target X
casual_mac:
.byte $00,$be,$00
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $bb,$bf		; att spr tiles
.byte $cb,$fb		;
.byte $03			; att spr palette
.byte $78,$a0		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
casual_aah:
.byte $00,$be,$00
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $e0,$e1		; att spr tiles
.byte $f0,$f1		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X
casual_stomp:
.byte $bd,$be,$00
.byte $bc,$cd,$00
.byte $db,$dd,$00
.byte $eb,$dc,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $40,$81		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $55,$48		; target Y, target X

; ********************************************





; ********************************************
;reviewer
;critic
;youtuber

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
review_heal:
.byte $00,$00,$00,$00,$00,$00,$00,$0a,$09,$0a
review_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
review_stat:
.byte $00,$04,$04,$20,$20,$00,$01,$02
critic_heal:
.byte $00,$00,$00,$00,$09,$0a,$09,$0a,$09,$0a
critic_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
critic_stat:
.byte $00,$06,$06,$1c,$1c,$00,$01,$04
youtub_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
youtub_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
youtub_stat:
.byte $00,$06,$06,$1c,$1c,$00,$01,$05

review_name:
.byte "REVIEWER",$ff
critic_name:
.byte "CRITIC",$ff
youtub_name:
.byte "YOUTUBER",$ff

review_pal:
.byte $30,$16,$00, $0f,$30,$16,$11
critic_pal:
.byte $27,$09,$1b, $0f,$30,$16,$11
youtub_pal:
.byte $36,$06,$17, $0f,$30,$16,$11

review_lo:
.byte <critic_stand,$00
.byte <critic_kick,<critic_thumb,<critic_kick,<critic_thumb,<critic_kick,<critic_thumb,<critic_kick,<critic_thumb
.byte <critic_kick,<critic_thumb,<critic_kick,<critic_thumb,<critic_kick,<critic_thumb,<critic_kick,<critic_thumb
review_hi:
.byte >critic_stand,$00
.byte >critic_kick,>critic_thumb,>critic_kick,>critic_thumb,>critic_kick,>critic_thumb,>critic_kick,>critic_thumb
.byte >critic_kick,>critic_thumb,>critic_kick,>critic_thumb,>critic_kick,>critic_thumb,>critic_kick,>critic_thumb
critic_lo:
.byte <critic_stand,$00
.byte <critic_aaahh,<critic_thumb,<critic_aaahh,<critic_kick2,<critic_thumb,<critic_aaahh,<critic_kick2,<critic_thumb
.byte <critic_kick2,<critic_thumb,<critic_aaahh,<critic_kick2,<critic_thumb,<critic_aaahh,<critic_kick2,<critic_thumb
critic_hi:
.byte >critic_stand,$00
.byte >critic_aaahh,>critic_thumb,>critic_aaahh,>critic_kick2,>critic_thumb,>critic_aaahh,>critic_kick2,>critic_thumb
.byte >critic_kick2,>critic_thumb,>critic_aaahh,>critic_kick2,>critic_thumb,>critic_aaahh,>critic_kick2,>critic_thumb
youtub_lo:
.byte <critic_stand,$00
.byte <critic_stomp,<critic_first,<critic_stomp,<critic_aaahh,<critic_first,<critic_kick2,<critic_first,<critic_stomp
.byte <critic_kick2,<critic_thumb,<critic_stomp,<critic_aaahh,<critic_first,<critic_kick2,<critic_first,<critic_stomp
youtub_hi:
.byte >critic_stand,$00
.byte >critic_stomp,>critic_first,>critic_stomp,>critic_aaahh,>critic_first,>critic_kick2,>critic_first,>critic_stomp
.byte >critic_kick2,>critic_thumb,>critic_stomp,>critic_aaahh,>critic_first,>critic_kick2,>critic_first,>critic_stomp

critic_stand:
.byte $b8,$b9,$00
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
critic_kick:
.byte $b8,$b9,$00
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $ba,$e9,$ea
.byte $f6,$f7,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $01			; damage
.byte $3c			; att move wait
.byte $7e,$58		; target Y, target X
critic_stomp:
.byte $b8,$b9,$00
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $e8,$e9,$ea
.byte $d0,$c1,$b7
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $40,$81		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $3c			; att move wait
.byte $55,$48		; target Y, target X
critic_thumb:
.byte $b8,$b9,$00
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $d6,$d7		; att spr tiles
.byte $e6,$e7		;
.byte $03			; att spr palette
.byte $68,$98		; att y pos start, att x pos start
.byte $58,$42		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $02			; damage
.byte $3c			; att move wait
.byte $68,$58		; target Y, target X
critic_first:
.byte $b8,$b9,$00
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $b6,$bf		; att spr tiles
.byte $c6,$c7		;
.byte $03			; att spr palette
.byte $68,$98		; att y pos start, att x pos start
.byte $58,$42		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
critic_aaahh:
.byte $b8,$b9,$00
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $e0,$e1		; att spr tiles
.byte $f0,$f1		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X
critic_kick2:
.byte $b8,$b9,$00
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $ba,$e9,$ea
.byte $f6,$f7,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X

; ********************************************





; ********************************************
;gamer girl
;booth babe
;cosplayer

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
gamerg_heal:
.byte $00,$00,$00,$00,$00,$00,$09,$0a,$09,$0a
gamerg_stam:
.byte $00,$0d,$0d,$0d,$0d,$0d,$0d,$0d
gamerg_stat:
.byte $00,$07,$07,$18,$18,$00,$01,$04
boothb_heal:
.byte $00,$00,$00,$0a,$09,$0a,$09,$0a,$09,$0a
boothb_stam:
.byte $0d,$0d,$0d,$0d,$0d,$0d,$0d,$0d
boothb_stat:
.byte $00,$08,$08,$18,$18,$02,$01,$05
cospla_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
cospla_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
cospla_stat:
.byte $00,$06,$06,$18,$18,$02,$01,$06

gamerg_name:
.byte "GAMER GIRL",$ff
boothb_name:
.byte "BOOTH BABE",$ff
cospla_name:
.byte "COSPLAYER",$ff

gamerg_pal:
.byte $07,$17,$04, $0f,$10,$00,$16
boothb_pal:
.byte $27,$13,$18, $0f,$10,$00,$16
cospla_pal:
.byte $37,$1a,$15, $0f,$10,$00,$16

gamerg_lo:
.byte <boothb_stand,$00
.byte <boothb_punch,<boothb_lokik,<boothb_punch,<boothb_lokik,<boothb_punch,<boothb_lokik,<boothb_punch,<boothb_lokik
.byte <boothb_punch,<boothb_lokik,<boothb_punch,<boothb_lokik,<boothb_punch,<boothb_lokik,<boothb_punch,<boothb_lokik
gamerg_hi:
.byte >boothb_stand,$00
.byte >boothb_punch,>boothb_lokik,>boothb_punch,>boothb_lokik,>boothb_punch,>boothb_lokik,>boothb_punch,>boothb_lokik
.byte >boothb_punch,>boothb_lokik,>boothb_punch,>boothb_lokik,>boothb_punch,>boothb_lokik,>boothb_punch,>boothb_lokik
boothb_lo:
.byte <boothb_stand,<boothb_block
.byte <boothb_mssle,<boothb_lkik2,<boothb_jpkik,<boothb_jpkik,<boothb_lkik2,<boothb_mssle,<boothb_jpkik,<boothb_lkik2
.byte <boothb_jpkik,<boothb_lkik2,<boothb_mssle,<boothb_jpkik,<boothb_lkik2,<boothb_jpkik,<boothb_mssle,<boothb_lkik2
boothb_hi:
.byte >boothb_stand,>boothb_block
.byte >boothb_mssle,>boothb_lkik2,>boothb_jpkik,>boothb_jpkik,>boothb_lkik2,>boothb_mssle,>boothb_jpkik,>boothb_lkik2
.byte >boothb_jpkik,>boothb_lkik2,>boothb_mssle,>boothb_jpkik,>boothb_lkik2,>boothb_jpkik,>boothb_mssle,>boothb_lkik2
cospla_lo:
.byte <boothb_stand,<boothb_block
.byte <boothb_stomp,<boothb_mssl2,<boothb_roll,<boothb_mssle,<boothb_rol2,<boothb_stomp,<boothb_mssl2,<boothb_roll
.byte <boothb_mssle,<boothb_rol2,<boothb_stomp,<boothb_roll,<boothb_rol2,<boothb_mssle,<boothb_stomp,<boothb_stomp
cospla_hi:
.byte >boothb_stand,>boothb_block
.byte >boothb_stomp,>boothb_mssl2,>boothb_roll,>boothb_mssle,>boothb_rol2,>boothb_stomp,>boothb_mssl2,>boothb_roll
.byte >boothb_mssle,>boothb_rol2,>boothb_stomp,>boothb_roll,>boothb_rol2,>boothb_mssle,>boothb_stomp,>boothb_stomp

boothb_stand:
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
boothb_block:
.byte $00,$b0,$b5
.byte $00,$c0,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
boothb_punch:
.byte $00,$b4,$b5
.byte $b1,$b2,$b3
.byte $00,$c2,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
boothb_jpkik:
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $d1,$d2,$d3
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $68,$58		; target Y, target X
boothb_lokik:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $d1,$d2,$d3
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
boothb_lkik2:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $d1,$d2,$d3
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $7e,$58		; target Y, target X
boothb_roll:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$e2,$e3
.byte $00,$f2,$f3
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $2c			; att move wait
.byte $7e,$58		; target Y, target X
boothb_rol2:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$e2,$e3
.byte $00,$f2,$f3
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $24,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $2c			; att move wait
.byte $7e,$34		; target Y, target X
boothb_mssle:
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $c3,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $38,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $02			; damage
.byte $2c			; att move wait
.byte $68,$34		; target Y, target X
boothb_mssl2:
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $d1,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$a0		; att y pos start, att x pos start
.byte $58,$42		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $02			; damage
.byte $2c			; att move wait
.byte $68,$58		; target Y, target X
boothb_stomp:
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $00,$d2,$d3
.byte $00,$f4,$f5
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $3c,$81		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $55,$48		; target Y, target X

; ********************************************





; ********************************************
; seller
; reseller
; vendor

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
seller_heal:
.byte $00,$00,$00,$00,$00,$0a,$09,$0a,$09,$0a
seller_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
seller_stat:
.byte $00,$05,$05,$20,$20,$00,$01,$01
resell_heal:
.byte $00,$00,$00,$00,$09,$0a,$09,$0a,$09,$0a
resell_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
resell_stat:
.byte $00,$06,$06,$20,$20,$02,$01,$05
vendor_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
vendor_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
vendor_stat:
.byte $00,$06,$06,$20,$20,$02,$01,$05

seller_name:
.byte "SELLER",$ff
resell_name:
.byte "RESELLER",$ff
vendor_name:
.byte "VENDOR",$ff

seller_pal:
.byte $37,$30,$13, $0f,$2a,$1a,$16
resell_pal:
.byte $30,$27,$00, $0f,$2a,$1a,$16
vendor_pal:
.byte $07,$30,$16, $0f,$2a,$1a,$16

seller_lo:
.byte <seller_stand,$00
.byte <seller_punch,<seller_hihed,<seller_punch,<seller_hihed,<seller_punch,<seller_hihed,<seller_punch,<seller_hihed
.byte <seller_punch,<seller_hihed,<seller_punch,<seller_hihed,<seller_punch,<seller_hihed,<seller_punch,<seller_hihed
seller_hi:
.byte >seller_stand,$00
.byte >seller_punch,>seller_hihed,>seller_punch,>seller_hihed,>seller_punch,>seller_hihed,>seller_punch,>seller_hihed
.byte >seller_punch,>seller_hihed,>seller_punch,>seller_hihed,>seller_punch,>seller_hihed,>seller_punch,>seller_hihed
resell_lo:
.byte <seller_stand,<seller_block
.byte <seller_lohed,<seller_hihed,<seller_money,<seller_lohed,<seller_hihed,<seller_hihed,<seller_money,<seller_lohed
.byte <seller_money,<seller_hihed,<seller_money,<seller_lohed,<seller_hihed,<seller_hihed,<seller_money,<seller_hihed
resell_hi:
.byte >seller_stand,>seller_block
.byte >seller_lohed,>seller_hihed,>seller_money,>seller_lohed,>seller_hihed,>seller_hihed,>seller_money,>seller_lohed
.byte >seller_money,>seller_hihed,>seller_money,>seller_lohed,>seller_hihed,>seller_hihed,>seller_money,>seller_hihed
vendor_lo:
.byte <seller_stand,<seller_block
.byte <seller_jpkik,<seller_hihed,<seller_money,<seller_jpkik,<seller_lohed,<seller_hihed,<seller_jpkik,<seller_lohed
.byte <seller_jpkik,<seller_hihed,<seller_money,<seller_jpkik,<seller_lohed,<seller_hihed,<seller_jpkik,<seller_lohed
vendor_hi:
.byte >seller_stand,>seller_block
.byte >seller_jpkik,>seller_hihed,>seller_money,>seller_jpkik,>seller_lohed,>seller_hihed,>seller_jpkik,>seller_lohed
.byte >seller_jpkik,>seller_hihed,>seller_money,>seller_jpkik,>seller_lohed,>seller_hihed,>seller_jpkik,>seller_lohed

seller_stand:
.byte $00,$be,$bf
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
seller_block:
.byte $00,$bc,$bf
.byte $00,$cc,$cd
.byte $00,$de,$dd
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
seller_punch:
.byte $00,$be,$bf
.byte $00,$bd,$cd
.byte $00,$de,$dd
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
seller_hihed:
.byte $dc,$ec,$ed
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
seller_lohed:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $dc,$bb,$cb
.byte $db,$eb,$fb
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
seller_jpkik:
.byte $00,$00,$00
.byte $00,$be,$bf
.byte $00,$ce,$cf
.byte $db,$eb,$fb
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $3c,$81		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $55,$48		; target Y, target X
seller_money:
.byte $00,$be,$bf
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $fc,$fd		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $0f			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X

; ********************************************






; ********************************************
; hobbyist
; collector
; trader

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
hobbyi_heal:
.byte $00,$00,$00,$00,$00,$00,$09,$0a,$09,$0a
hobbyi_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
hobbyi_stat:
.byte $00,$04,$04,$3c,$3c,$01,$01,$02
collec_heal:
.byte $00,$00,$00,$00,$09,$0a,$09,$0a,$09,$0a
collec_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
collec_stat:
.byte $00,$04,$04,$3c,$3c,$02,$01,$04
trader_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
trader_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
trader_stat:
.byte $00,$04,$04,$3c,$3c,$02,$01,$04

hobbyi_name:
.byte "HOBBYIST",$ff
collec_name:
.byte "COLLECTOR",$ff
trader_name:
.byte "TRADER",$ff

hobbyi_pal:
.byte $17,$27,$21, $0f,$10,$00,$1a
collec_pal:
.byte $36,$00,$05, $0f,$10,$00,$1a
trader_pal:
.byte $37,$06,$30, $0f,$10,$00,$1a

hobbyi_lo:
.byte <trader_stand,<trader_block
.byte <trader_punch,<trader_punch,<trader_punch,<trader_punch,<trader_punch,<trader_punch,<trader_punch,<trader_punch
.byte <trader_punch,<trader_punch,<trader_punch,<trader_punch,<trader_punch,<trader_punch,<trader_punch,<trader_punch
hobbyi_hi:
.byte >trader_stand,>trader_block
.byte >trader_punch,>trader_punch,>trader_punch,>trader_punch,>trader_punch,>trader_punch,>trader_punch,>trader_punch
.byte >trader_punch,>trader_punch,>trader_punch,>trader_punch,>trader_punch,>trader_punch,>trader_punch,>trader_punch
collec_lo:
.byte <trader_stand,<trader_block
.byte <trader_cart,<trader_kick,<trader_cart,<trader_kick,<trader_punch,<trader_kick,<trader_cart,<trader_cart
.byte <trader_punch,<trader_kick,<trader_cart,<trader_kick,<trader_cart,<trader_kick,<trader_punch,<trader_kick
collec_hi:
.byte >trader_stand,>trader_block
.byte >trader_cart,>trader_kick,>trader_cart,>trader_kick,>trader_punch,>trader_kick,>trader_cart,>trader_cart
.byte >trader_punch,>trader_kick,>trader_cart,>trader_kick,>trader_cart,>trader_kick,>trader_punch,>trader_kick
trader_lo:
.byte <trader_stand,<trader_block
.byte <trader_head,<trader_head,<trader_kick,<trader_cart,<trader_punch,<trader_head,<trader_kick,<trader_cart
.byte <trader_punch,<trader_head,<trader_kick,<trader_cart,<trader_punch,<trader_head,<trader_kick,<trader_cart
trader_hi:
.byte >trader_stand,>trader_block
.byte >trader_head,>trader_head,>trader_kick,>trader_cart,>trader_punch,>trader_head,>trader_kick,>trader_cart
.byte >trader_punch,>trader_head,>trader_kick,>trader_cart,>trader_punch,>trader_head,>trader_kick,>trader_cart

trader_stand:
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $f3,$f4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
trader_block:
.byte $c0,$b4,$b5
.byte $d0,$e0,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $f3,$f4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
trader_punch:
.byte $00,$b4,$b5
.byte $b1,$b2,$b3
.byte $00,$c2,$c3
.byte $00,$e4,$e5
.byte $f3,$f4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $01			; damage
.byte $2c			; att move wait
.byte $68,$58		; target Y, target X
trader_head:
.byte $00,$f1,$f2
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $f3,$f4,$f5
.byte $b0,$00		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $58,$b2		; att y pos start, att x pos start
.byte $48,$82		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $58			; att y pos next
.byte $04			; damage
.byte $2c			; att move wait
.byte $55,$48		; target Y, target X
trader_kick:
.byte $c1,$b4,$b5
.byte $d1,$c4,$c5
.byte $e1,$d2,$d5
.byte $00,$e2,$e3
.byte $00,$00,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
trader_cart:
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $f3,$f4,$f5
.byte $d3,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $38,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X

; ********************************************






; ********************************************
; troll
; lurker
; bully

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
bullys_heal:
.byte $00,$00,$00,$00,$09,$0a,$09,$0a,$09,$0a
bullys_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
bullys_stat:
.byte $00,$04,$04,$3c,$3c,$00,$01,$07
lurker_heal:
.byte $00,$00,$00,$00,$00,$00,$09,$0a,$09,$0a
lurker_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
lurker_stat:
.byte $00,$04,$04,$2c,$2c,$01,$01,$01
trolls_heal:
.byte $00,$00,$00,$00,$00,$0a,$09,$0a,$09,$0a
trolls_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
trolls_stat:
.byte $00,$04,$04,$30,$30,$02,$01,$04

bullys_name:
.byte "BULLY",$ff
lurker_name:
.byte "LURKER",$ff
trolls_name:
.byte "TROLL",$ff

bullys_pal:
.byte $36,$14,$30, $0f,$30,$0f,$0f
lurker_pal:
.byte $22,$16,$1b, $0f,$30,$0f,$0f
trolls_pal:
.byte $29,$17,$00, $0f,$30,$0f,$0f

bullys_lo:
.byte <lurker_stand,$00
.byte <lurker_bite,<lurker_laugh,<lurker_bite,<lurker_laugh,<lurker_laugh,<lurker_bite,<lurker_bite,<lurker_laugh
.byte <lurker_bite,<lurker_laugh,<lurker_bite,<lurker_laugh,<lurker_laugh,<lurker_bite,<lurker_laugh,<lurker_bite
bullys_hi:
.byte >lurker_stand,$00
.byte >lurker_bite,>lurker_laugh,>lurker_bite,>lurker_laugh,>lurker_laugh,>lurker_bite,>lurker_bite,>lurker_laugh
.byte >lurker_bite,>lurker_laugh,>lurker_bite,>lurker_laugh,>lurker_laugh,>lurker_bite,>lurker_laugh,>lurker_bite
lurker_lo:
.byte <lurker_stand,<lurker_block
.byte <lurker_bite,<lurker_bite,<lurker_bite,<lurker_bite,<lurker_bite,<lurker_bite,<lurker_bite,<lurker_bite
.byte <lurker_bite,<lurker_bite,<lurker_bite,<lurker_bite,<lurker_bite,<lurker_bite,<lurker_bite,<lurker_bite
lurker_hi:
.byte >lurker_stand,>lurker_block
.byte >lurker_bite,>lurker_bite,>lurker_bite,>lurker_bite,>lurker_bite,>lurker_bite,>lurker_bite,>lurker_bite
.byte >lurker_bite,>lurker_bite,>lurker_bite,>lurker_bite,>lurker_bite,>lurker_bite,>lurker_bite,>lurker_bite
trolls_lo:
.byte <lurker_stand,<lurker_block
.byte <lurker_laugh,<lurker_punch,<lurker_laugh,<lurker_laugh,<lurker_punch,<lurker_laugh,<lurker_bite,<lurker_punch
.byte <lurker_punch,<lurker_punch,<lurker_laugh,<lurker_bite,<lurker_punch,<lurker_laugh,<lurker_bite,<lurker_punch
trolls_hi:
.byte >lurker_stand,>lurker_block
.byte >lurker_laugh,>lurker_punch,>lurker_laugh,>lurker_laugh,>lurker_punch,>lurker_laugh,>lurker_bite,>lurker_punch
.byte >lurker_punch,>lurker_punch,>lurker_laugh,>lurker_bite,>lurker_punch,>lurker_laugh,>lurker_bite,>lurker_punch

lurker_stand:
.byte $00,$00,$00
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
lurker_block:
.byte $00,$00,$00
.byte $c6,$c7,$ca
.byte $d8,$d7,$da
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
lurker_bite:
.byte $00,$00,$00
.byte $b6,$d6,$ca
.byte $f6,$f7,$da
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $2c			; att move wait
.byte $68,$58		; target Y, target X
lurker_punch:
.byte $00,$00,$00
.byte $c8,$c9,$ca
.byte $b9,$d9,$da
.byte $ba,$e9,$ea
.byte $f8,$f9,$fa
.byte $b7,$b8		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $78,$98		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
lurker_laugh:
.byte $00,$00,$00
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $e6,$e7		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $68,$34		; target Y, target X

; ********************************************






; ********************************************
; profiteer
; pirate
; scammer

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
profit_heal:
.byte $00,$00,$00,$00,$00,$00,$09,$0a,$09,$0a
profit_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
profit_stat:
.byte $00,$04,$04,$30,$30,$01,$01,$05
pirate_heal:
.byte $00,$00,$00,$00,$00,$0a,$09,$0a,$09,$0a
pirate_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
pirate_stat:
.byte $00,$04,$04,$30,$30,$01,$01,$05
scamme_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
scamme_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
scamme_stat:
.byte $00,$06,$06,$30,$30,$02,$01,$05

profit_name:
.byte "PROFITEER",$ff
pirate_name:
.byte "PIRATE",$ff
scamme_name:
.byte "SCAMMER",$ff

profit_pal:
.byte $27,$30,$1b, $0f,$30,$1a,$10
pirate_pal:
.byte $37,$17,$0c, $0f,$30,$16,$10
scamme_pal:
.byte $35,$18,$15, $0f,$30,$1a,$10

profit_lo:
.byte <profit_stand,<profit_block
.byte <profit_money,<profit_kick,<profit_punch,<profit_money,<profit_punch,<profit_kick,<profit_punch,<profit_money
.byte <profit_punch,<profit_money,<profit_punch,<profit_kick,<profit_money,<profit_kick,<profit_punch,<profit_kick
profit_hi:
.byte >profit_stand,>profit_block
.byte >profit_money,>profit_kick,>profit_punch,>profit_money,>profit_punch,>profit_kick,>profit_punch,>profit_money
.byte >profit_punch,>profit_money,>profit_punch,>profit_kick,>profit_money,>profit_kick,>profit_punch,>profit_kick
pirate_lo:
.byte <pirate_stand,<pirate_block
.byte <pirate_knife,<pirate_knife,<pirate_gun,<pirate_box,<pirate_money,<pirate_knife,<pirate_punch,<pirate_kick
.byte <pirate_box,<pirate_kick,<pirate_gun,<pirate_box,<pirate_money,<pirate_knife,<pirate_punch,<pirate_knife
pirate_hi:
.byte >pirate_stand,>pirate_block
.byte >pirate_knife,>pirate_knife,>pirate_gun,>pirate_box,>pirate_money,>pirate_knife,>pirate_punch,>pirate_kick
.byte >pirate_box,>pirate_kick,>pirate_gun,>pirate_box,>pirate_money,>pirate_knife,>pirate_punch,>pirate_knife
scamme_lo:
.byte <profit_stand,<profit_block
.byte <profit_box,<profit_kick,<profit_box,<profit_punch,<profit_kick,<profit_box,<profit_punch,<profit_kick
.byte <profit_punch,<profit_kick,<profit_box,<profit_punch,<profit_kick,<profit_box,<profit_punch,<profit_kick
scamme_hi:
.byte >profit_stand,>profit_block
.byte >profit_box,>profit_kick,>profit_box,>profit_punch,>profit_kick,>profit_box,>profit_punch,>profit_kick
.byte >profit_punch,>profit_kick,>profit_box,>profit_punch,>profit_kick,>profit_box,>profit_punch,>profit_kick

pirate_stand:
.byte $00,$be,$bf
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
pirate_block:
.byte $bc,$be,$bf
.byte $cc,$cd,$cf
.byte $00,$dd,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
pirate_gun:
.byte $00,$be,$bf
.byte $bd,$cd,$cf
.byte $00,$dd,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $a8,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
pirate_kick:
.byte $00,$be,$bf
.byte $00,$ce,$cf
.byte $dc,$ec,$df
.byte $00,$ee,$fc
.byte $00,$fe,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
pirate_punch:
.byte $00,$be,$bf
.byte $da,$cd,$cf
.byte $00,$dd,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
pirate_box:
.byte $00,$be,$bf
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $ea,$eb		; att spr tiles
.byte $fa,$fb		;
.byte $03			; att spr palette
.byte $78,$98		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
pirate_money:
.byte $00,$be,$bf
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $cb,$db		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$98		; att y pos start, att x pos start
.byte $58,$42		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $0f			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
pirate_knife:
.byte $00,$be,$bf
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $ed,$fd		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X

profit_stand:
.byte $00,$ba,$bb
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$fe
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
profit_block:
.byte $bc,$ba,$bb
.byte $cc,$cd,$cf
.byte $00,$dd,$df
.byte $00,$ee,$ef
.byte $00,$fe,$fe
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
profit_gun:
.byte $00,$ba,$bb
.byte $bd,$cd,$cf
.byte $00,$dd,$df
.byte $00,$ee,$ef
.byte $00,$fe,$fe
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
profit_kick:
.byte $00,$ba,$bb
.byte $00,$ce,$cf
.byte $f7,$ec,$df
.byte $00,$ee,$fc
.byte $00,$fe,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
profit_punch:
.byte $00,$ba,$bb
.byte $da,$cd,$cf
.byte $00,$dd,$df
.byte $00,$ee,$ef
.byte $00,$fe,$fe
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
profit_money:
.byte $00,$ba,$bb
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$fe
.byte $cb,$db		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $48,$ac		; att y pos start, att x pos start
.byte $48,$82		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $48			; att y pos next
.byte $0f			; damage
.byte $30			; att move wait
.byte $55,$48		; target Y, target X
profit_box:
.byte $00,$ba,$bb
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$fe
.byte $ea,$eb		; att spr tiles
.byte $fa,$fb		;
.byte $03			; att spr palette
.byte $48,$ac		; att y pos start, att x pos start
.byte $40,$82		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $48			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $55,$48		; target Y, target X

; ********************************************






; ********************************************
; newbie
; hacker
; brewer

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
newbie_heal:
.byte $00,$00,$00,$00,$00,$0a,$09,$0a,$09,$0a
newbie_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
newbie_stat:
.byte $00,$06,$06,$18,$18,$00,$01,$03
hacker_heal:
.byte $00,$00,$00,$00,$00,$0a,$09,$0a,$09,$0a
hacker_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
hacker_stat:
.byte $00,$05,$05,$20,$20,$02,$01,$04
brewer_heal:
.byte $00,$00,$00,$0a,$09,$0a,$09,$0a,$09,$0a
brewer_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
brewer_stat:
.byte $00,$05,$05,$30,$30,$01,$01,$04

newbie_name:
.byte "NEWBIE",$ff
hacker_name:
.byte "HACKER",$ff
brewer_name:
.byte "BREWER",$ff

newbie_pal:
.byte $3b,$18,$07, $0f,$2a,$30,$27
hacker_pal:
.byte $37,$00,$11, $0f,$2a,$30,$27
brewer_pal:
.byte $27,$16,$12, $0f,$2a,$30,$27

newbie_lo:
.byte <brewer_stand,$00
.byte <brewer_kick,<brewer_money,<brewer_kick,<brewer_money,<brewer_kick,<brewer_money,<brewer_kick,<brewer_money
.byte <brewer_kick,<brewer_money,<brewer_kick,<brewer_money,<brewer_kick,<brewer_money,<brewer_kick,<brewer_money
newbie_hi:
.byte >brewer_stand,$00
.byte >brewer_kick,>brewer_money,>brewer_kick,>brewer_money,>brewer_kick,>brewer_money,>brewer_kick,>brewer_money
.byte >brewer_kick,>brewer_money,>brewer_kick,>brewer_money,>brewer_kick,>brewer_money,>brewer_kick,>brewer_money
hacker_lo:
.byte <brewer_stand,<brewer_block
.byte <brewer_nes1a,<brewer_money,<brewer_nes1a,<brewer_kick,<brewer_money,<brewer_nes1a,<brewer_nes1a,<brewer_nes1a
.byte <brewer_kick,<brewer_nes1a,<brewer_nes1a,<brewer_kick,<brewer_money,<brewer_nes1a,<brewer_kick,<brewer_nes1a
hacker_hi:
.byte >brewer_stand,>brewer_block
.byte >brewer_nes1a,>brewer_money,>brewer_nes1a,>brewer_kick,>brewer_money,>brewer_nes1a,>brewer_nes1a,>brewer_nes1a
.byte >brewer_kick,>brewer_nes1a,>brewer_nes1a,>brewer_kick,>brewer_money,>brewer_nes1a,>brewer_kick,>brewer_nes1a
brewer_lo:
.byte <brewer_stand,<brewer_block
.byte <brewer_decre,<brewer_money,<brewer_nes1a,<brewer_decre,<brewer_tools,<brewer_kick,<brewer_decre,<brewer_tools
.byte <brewer_kick,<brewer_money,<brewer_nes1a,<brewer_decre,<brewer_tools,<brewer_kick,<brewer_tools,<brewer_tools
brewer_hi:
.byte >brewer_stand,>brewer_block
.byte >brewer_decre,>brewer_money,>brewer_nes1a,>brewer_decre,>brewer_tools,>brewer_kick,>brewer_decre,>brewer_tools
.byte >brewer_kick,>brewer_money,>brewer_nes1a,>brewer_decre,>brewer_tools,>brewer_kick,>brewer_tools,>brewer_tools

brewer_stand:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$d9
.byte $00,$e8,$e9
.byte $f7,$f8,$f9
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
brewer_block:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$d6,$d7
.byte $00,$e6,$e7
.byte $f7,$f8,$f9
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
brewer_kick:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $d5,$00,$d9
.byte $e5,$f5,$e9
.byte $f7,$f8,$f9
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $01			; damage
.byte $28			; att move wait
.byte $7e,$58		; target Y, target X
brewer_tools:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$d9
.byte $00,$e8,$e9
.byte $f7,$f8,$f9
.byte $b6,$b7		; att spr tiles
.byte $c6,$c7		;
.byte $03			; att spr palette
.byte $78,$c0		; att y pos start, att x pos start
.byte $30,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $7e,$34		; target Y, target X
brewer_nes1a:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$d9
.byte $00,$e8,$e9
.byte $f7,$f8,$f9
.byte $b8,$b9		; att spr tiles
.byte $c8,$c9		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $68,$34		; target Y, target X
brewer_money:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$d9
.byte $00,$e8,$e9
.byte $f7,$f8,$f9
.byte $b5,$c5		; att spr tiles
.byte $f6,$f6		;
.byte $03			; att spr palette
.byte $68,$98		; att y pos start, att x pos start
.byte $58,$42		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $0f			; damage
.byte $28			; att move wait
.byte $68,$58		; target Y, target X
brewer_decre:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$d9
.byte $00,$e8,$e9
.byte $f7,$f8,$f9
.byte $d8,$ca		; att spr tiles
.byte $cb,$cb		;
.byte $03			; att spr palette
.byte $48,$ac		; att y pos start, att x pos start
.byte $48,$82		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $48			; att y pos next
.byte $0f			; damage
.byte $28			; att move wait
.byte $55,$48		; target Y, target X

; ********************************************






; ********************************************
; fright
; phantom
; ghost

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
fright_heal:
.byte $00,$00,$00,$00,$00,$00,$00,$0a,$09,$0a
fright_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
fright_stat:
.byte $00,$05,$05,$20,$20,$01,$01,$02
phanto_heal:
.byte $00,$00,$00,$00,$00,$00,$09,$0a,$09,$0a
phanto_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
phanto_stat:
.byte $00,$06,$06,$20,$20,$01,$01,$03
ghosts_heal:
.byte $00,$00,$00,$0a,$09,$0a,$09,$0a,$09,$0a
ghosts_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
ghosts_stat:
.byte $00,$06,$06,$20,$20,$02,$01,$04

fright_name:
.byte "FRIGHT",$ff
phanto_name:
.byte "PHANTOM",$ff
ghosts_name:
.byte "GHOST",$ff

fright_pal:
.byte $03,$06,$03, $0f,$30,$21,$16
phanto_pal:
.byte $28,$06,$03, $0f,$30,$21,$16
ghosts_pal:
.byte $30,$06,$03, $0f,$30,$21,$16

fright_lo:
.byte <fright_stand,<fright_block
.byte <fright_attak,<fright_boo,<fright_attak,<fright_boo,<fright_attak,<fright_boo,<fright_attak,<fright_boo
.byte <fright_attak,<fright_boo,<fright_attak,<fright_boo,<fright_attak,<fright_boo,<fright_attak,<fright_boo
fright_hi:
.byte >fright_stand,>fright_block
.byte >fright_attak,>fright_boo,>fright_attak,>fright_boo,>fright_attak,>fright_boo,>fright_attak,>fright_boo
.byte >fright_attak,>fright_boo,>fright_attak,>fright_boo,>fright_attak,>fright_boo,>fright_attak,>fright_boo
phanto_lo:
.byte <fright_stand,<fright_block
.byte <fright_bakat,<fright_bakat,<fright_loatt,<fright_loatt,<fright_attak,<fright_bakat,<fright_loatt,<fright_loatt
.byte <fright_attak,<fright_bakat,<fright_loatt,<fright_loatt,<fright_attak,<fright_bakat,<fright_loatt,<fright_bakat
phanto_hi:
.byte >fright_stand,>fright_block
.byte >fright_bakat,>fright_bakat,>fright_loatt,>fright_loatt,>fright_attak,>fright_bakat,>fright_loatt,>fright_loatt
.byte >fright_attak,>fright_bakat,>fright_loatt,>fright_loatt,>fright_attak,>fright_bakat,>fright_loatt,>fright_bakat
ghosts_lo:
.byte <fright_stand,<fright_block
.byte <fright_stomp,<fright_bakat,<fright_loatt,<fright_stomp,<fright_hiatt,<fright_bakat,<fright_loatt,<fright_stomp
.byte <fright_stomp,<fright_hiatt,<fright_loatt,<fright_stomp,<fright_hiatt,<fright_bakat,<fright_loatt,<fright_stomp
ghosts_hi:
.byte >fright_stand,>fright_block
.byte >fright_stomp,>fright_bakat,>fright_loatt,>fright_stomp,>fright_hiatt,>fright_bakat,>fright_loatt,>fright_stomp
.byte >fright_stomp,>fright_hiatt,>fright_loatt,>fright_stomp,>fright_hiatt,>fright_bakat,>fright_loatt,>fright_stomp

fright_stand:
.byte $00,$00,$00
.byte $00,$e3,$e4
.byte $00,$f3,$f4
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
fright_block:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
fright_attak:
.byte $00,$00,$00
.byte $b1,$b2,$00
.byte $f3,$f4,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $01			; damage
.byte $28			; att move wait
.byte $68,$58		; target Y, target X
fright_boo:
.byte $00,$00,$00
.byte $00,$e3,$e4
.byte $00,$f3,$f4
.byte $00,$00,$00
.byte $00,$00,$00
.byte $b3,$b4		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$98		; att y pos start, att x pos start
.byte $58,$42		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $01			; damage
.byte $28			; att move wait
.byte $68,$58		; target Y, target X
fright_stomp:
.byte $00,$00,$00
.byte $00,$e3,$e4
.byte $00,$f3,$f4
.byte $00,$00,$00
.byte $00,$00,$00
.byte $c1,$c2		; att spr tiles
.byte $d1,$d2		;
.byte $03			; att spr palette
.byte $48,$ac		; att y pos start, att x pos start
.byte $44,$82		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $48			; att y pos next
.byte $03			; damage
.byte $28			; att move wait
.byte $55,$48		; target Y, target X
fright_hiatt:
.byte $00,$00,$00
.byte $00,$e3,$e4
.byte $00,$f3,$f4
.byte $00,$00,$00
.byte $00,$00,$00
.byte $c3,$c4		; att spr tiles
.byte $d3,$d4		;
.byte $02			; att spr palette
.byte $68,$a0		; att y pos start, att x pos start
.byte $58,$42		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $28			; att move wait
.byte $68,$58		; target Y, target X
fright_loatt:
.byte $00,$00,$00
.byte $00,$e3,$e4
.byte $00,$f3,$f4
.byte $00,$00,$00
.byte $00,$00,$00
.byte $c3,$c4		; att spr tiles
.byte $d3,$d4		;
.byte $03			; att spr palette
.byte $78,$a0		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
fright_bakat:
.byte $00,$00,$00
.byte $00,$e3,$e4
.byte $00,$f3,$f4
.byte $00,$00,$00
.byte $00,$00,$00
.byte $e1,$e2		; att spr tiles
.byte $f1,$f2		;
.byte $02			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X

; ********************************************






; ********************************************
; fabricator
; reproducer
; devver

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
fabric_heal:
.byte $00,$00,$00,$00,$00,$0a,$09,$0a,$09,$0a
fabric_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
fabric_stat:
.byte $00,$06,$06,$1c,$1c,$01,$01,$04
reprod_heal:
.byte $00,$00,$00,$00,$00,$00,$09,$0a,$09,$0a
reprod_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
reprod_stat:
.byte $00,$06,$06,$14,$14,$01,$01,$04
devver_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
devver_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
devver_stat:
.byte $00,$06,$06,$1c,$1c,$05,$01,$04

fabric_name:
.byte "FABRICATOR",$ff
reprod_name:
.byte "REPRODUCER",$ff
devver_name:
.byte "RESEALER",$ff

fabric_pal:
.byte $35,$26,$05, $0f,$10,$17,$00
reprod_pal:
.byte $37,$17,$19, $0f,$10,$17,$00
devver_pal:
.byte $27,$17,$30, $0f,$10,$17,$00

fabric_lo:
.byte <fabric_stand,<fabric_block
.byte <fabric_punch,<fabric_cart,<fabric_screw,<fabric_punch,<fabric_cart,<fabric_cart,<fabric_punch,<fabric_cart
.byte <fabric_punch,<fabric_cart,<fabric_screw,<fabric_punch,<fabric_screw,<fabric_cart,<fabric_punch,<fabric_screw
fabric_hi:
.byte >fabric_stand,>fabric_block
.byte >fabric_punch,>fabric_cart,>fabric_screw,>fabric_punch,>fabric_cart,>fabric_cart,>fabric_punch,>fabric_cart
.byte >fabric_punch,>fabric_cart,>fabric_screw,>fabric_punch,>fabric_screw,>fabric_cart,>fabric_punch,>fabric_screw
reprod_lo:
.byte <devver_stand,<devver_block
.byte <devver_crt2,<devver_iron,<devver_crt2,<devver_screw,<devver_iron,<devver_crt2,<devver_screw,<devver_iron
.byte <devver_punch,<devver_iron,<devver_crt2,<devver_screw,<devver_iron,<devver_crt2,<devver_screw,<devver_iron
reprod_hi:
.byte >devver_stand,>devver_block
.byte >devver_crt2,>devver_iron,>devver_crt2,>devver_screw,>devver_iron,>devver_crt2,>devver_screw,>devver_iron
.byte >devver_punch,>devver_iron,>devver_crt2,>devver_screw,>devver_iron,>devver_crt2,>devver_screw,>devver_iron
devver_lo:
.byte <devver_stand,<devver_block
.byte <devver_stomp,<devver_stomp,<devver_crt2,<devver_iron,<devver_screw,<devver_crt2,<devver_iron,<devver_stomp
.byte <devver_punch,<devver_stomp,<devver_crt2,<devver_iron,<devver_screw,<devver_crt2,<devver_iron,<devver_screw
devver_hi:
.byte >devver_stand,>devver_block
.byte >devver_stomp,>devver_stomp,>devver_crt2,>devver_iron,>devver_screw,>devver_crt2,>devver_iron,>devver_stomp
.byte >devver_punch,>devver_stomp,>devver_crt2,>devver_iron,>devver_screw,>devver_crt2,>devver_iron,>devver_screw

devver_stand:
.byte $00,$00,$bf
.byte $00,$ce,$cf
.byte $00,$00,$df
.byte $ed,$ee,$ef
.byte $fd,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
devver_block:
.byte $00,$eb,$bf
.byte $00,$fb,$bc
.byte $00,$00,$df
.byte $ed,$ee,$ef
.byte $fd,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
devver_punch:
.byte $00,$00,$bf
.byte $00,$bb,$bc
.byte $00,$00,$df
.byte $ed,$ee,$ef
.byte $fd,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $3c			; att move wait
.byte $68,$58		; target Y, target X
devver_stomp:
.byte $00,$00,$bf
.byte $00,$ce,$cf
.byte $00,$00,$df
.byte $00,$ec,$ef
.byte $00,$fc,$ff
.byte $cd,$cd		; att spr tiles
.byte $bd,$be		;
.byte $03			; att spr palette
.byte $48,$ac		; att y pos start, att x pos start
.byte $48,$82		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $48			; att y pos next
.byte $03			; damage
.byte $3c			; att move wait
.byte $55,$48		; target Y, target X
devver_cart:
.byte $00,$00,$bf
.byte $00,$ce,$cf
.byte $00,$00,$df
.byte $ed,$ee,$ef
.byte $fd,$fe,$ff
.byte $dd,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $38,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $01			; damage
.byte $3c			; att move wait
.byte $68,$34		; target Y, target X
devver_crt2:
.byte $00,$00,$bf
.byte $00,$ce,$cf
.byte $00,$00,$df
.byte $ed,$ee,$ef
.byte $fd,$fe,$ff
.byte $dd,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $38,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $3c			; att move wait
.byte $68,$34		; target Y, target X
devver_iron:
.byte $00,$00,$bf
.byte $00,$ce,$cf
.byte $00,$00,$df
.byte $ed,$ee,$ef
.byte $fd,$fe,$ff
.byte $cb,$cc		; att spr tiles
.byte $00,$dc		;
.byte $03			; att spr palette
.byte $78,$c0		; att y pos start, att x pos start
.byte $30,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $03			; damage
.byte $3c			; att move wait
.byte $7e,$34		; target Y, target X
devver_screw:
.byte $00,$00,$bf
.byte $00,$ce,$cf
.byte $00,$00,$df
.byte $ed,$ee,$ef
.byte $fd,$fe,$ff
.byte $de,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $78,$a0		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $02			; damage
.byte $3c			; att move wait
.byte $7e,$58		; target Y, target X

fabric_stand:
.byte $00,$00,$bf
.byte $00,$ce,$cf
.byte $00,$00,$df
.byte $00,$ec,$ef
.byte $00,$fc,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
fabric_block:
.byte $00,$eb,$bf
.byte $00,$fb,$bc
.byte $00,$00,$df
.byte $00,$ec,$ef
.byte $00,$fc,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
fabric_punch:
.byte $00,$00,$bf
.byte $00,$bb,$bc
.byte $00,$00,$df
.byte $00,$ec,$ef
.byte $00,$fc,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
fabric_cart:
.byte $00,$00,$bf
.byte $00,$ce,$cf
.byte $00,$00,$df
.byte $00,$ec,$ef
.byte $00,$fc,$ff
.byte $dd,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $38,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $3c			; att move wait
.byte $68,$34		; target Y, target X
fabric_screw:
.byte $00,$00,$bf
.byte $00,$ce,$cf
.byte $00,$00,$df
.byte $00,$ec,$ef
.byte $00,$fc,$ff
.byte $de,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $78,$a0		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $01			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X

; ********************************************






; ********************************************
; pack rat
; scavenger
; hoarder

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
pakrat_heal:
.byte $00,$00,$00,$00,$00,$00,$00,$0a,$09,$0a
pakrat_stam:
.byte $00,$00,$00,$00,$00,$00,$00,$00
pakrat_stat:
.byte $00,$05,$05,$40,$40,$00,$01,$03
scaven_heal:
.byte $00,$00,$00,$0a,$09,$0a,$09,$0a,$09,$0a
scaven_stam:
.byte $00,$00,$00,$00,$00,$00,$00,$00
scaven_stat:
.byte $00,$03,$03,$40,$40,$00,$01,$05
hoarde_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
hoarde_stam:
.byte $00,$00,$00,$00,$00,$00,$00,$00
hoarde_stat:
.byte $00,$03,$03,$40,$40,$00,$01,$05

pakrat_name:
.byte "PACK RAT",$ff
scaven_name:
.byte "SCAVENGER",$ff
hoarde_name:
.byte "HOARDER",$ff

pakrat_pal:
.byte $17,$07,$24, $0f,$30,$16,$0f
scaven_pal:
.byte $37,$27,$06, $0f,$30,$16,$0f
hoarde_pal:
.byte $30,$16,$1a, $0f,$30,$16,$0f

pakrat_lo:
.byte <pakrat_stand,$00
.byte <pakrat_slap,<pakrat_slap,<pakrat_slap,<pakrat_slap,<pakrat_slap,<pakrat_slap,<pakrat_slap,<pakrat_slap
.byte <pakrat_slap,<pakrat_slap,<pakrat_slap,<pakrat_slap,<pakrat_slap,<pakrat_slap,<pakrat_slap,<pakrat_slap
pakrat_hi:
.byte >pakrat_stand,$00
.byte >pakrat_slap,>pakrat_slap,>pakrat_slap,>pakrat_slap,>pakrat_slap,>pakrat_slap,>pakrat_slap,>pakrat_slap
.byte >pakrat_slap,>pakrat_slap,>pakrat_slap,>pakrat_slap,>pakrat_slap,>pakrat_slap,>pakrat_slap,>pakrat_slap
scaven_lo:
.byte <pakrat_stand,$00
.byte <pakrat_give,<pakrat_give,<pakrat_slap,<pakrat_give,<pakrat_kick,<pakrat_give,<pakrat_slap,<pakrat_give
.byte <pakrat_kick,<pakrat_give,<pakrat_kick,<pakrat_give,<pakrat_slap,<pakrat_give,<pakrat_kick,<pakrat_give
scaven_hi:
.byte >pakrat_stand,$00
.byte >pakrat_give,>pakrat_give,>pakrat_slap,>pakrat_give,>pakrat_kick,>pakrat_give,>pakrat_slap,>pakrat_give
.byte >pakrat_kick,>pakrat_give,>pakrat_kick,>pakrat_give,>pakrat_slap,>pakrat_give,>pakrat_kick,>pakrat_give
hoarde_lo:
.byte <pakrat_stand,$00
.byte <pakrat_stomp,<pakrat_stomp,<pakrat_kick,<pakrat_give,<pakrat_slap,<pakrat_stomp,<pakrat_kick,<pakrat_give
.byte <pakrat_slap,<pakrat_stomp,<pakrat_kick,<pakrat_give,<pakrat_slap,<pakrat_stomp,<pakrat_kick,<pakrat_give
hoarde_hi:
.byte >pakrat_stand,$00
.byte >pakrat_stomp,>pakrat_stomp,>pakrat_kick,>pakrat_give,>pakrat_slap,>pakrat_stomp,>pakrat_kick,>pakrat_give
.byte >pakrat_slap,>pakrat_stomp,>pakrat_kick,>pakrat_give,>pakrat_slap,>pakrat_stomp,>pakrat_kick,>pakrat_give

pakrat_stand:
.byte $00,$b9,$ba
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
pakrat_slap:
.byte $00,$b9,$ba
.byte $c6,$c7,$d6
.byte $d8,$e6,$e7
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $3c			; att move wait
.byte $68,$58		; target Y, target X
pakrat_stomp:
.byte $00,$00,$00
.byte $00,$b9,$ba
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $b6,$b7,$b8
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $40,$81		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $04			; damage
.byte $3c			; att move wait
.byte $55,$48		; target Y, target X
pakrat_kick:
.byte $00,$b9,$ba
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $b6,$b7,$b8
.byte $00,$f8,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $3c			; att move wait
.byte $7e,$58		; target Y, target X
pakrat_give:
.byte $00,$b9,$ba
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $e8,$e9,$ea
.byte $f8,$f9,$fa
.byte $b5,$d7		; att spr tiles
.byte $f6,$f7		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $04			; damage
.byte $3c			; att move wait
.byte $68,$34		; target Y, target X

; ********************************************






; ********************************************
; flea
; dealer
; auctioneer

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
fleaes_heal:
.byte $00,$00,$00,$00,$00,$00,$09,$0a,$09,$0a
fleaes_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
fleaes_stat:
.byte $00,$05,$05,$20,$20,$00,$01,$02
dealer_heal:
.byte $00,$00,$00,$0a,$09,$0a,$09,$0a,$09,$0a
dealer_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
dealer_stat:
.byte $00,$06,$06,$2c,$2c,$02,$01,$05
auctio_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
auctio_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
auctio_stat:
.byte $00,$06,$06,$2c,$2c,$02,$01,$06

fleaes_name:
.byte "FLEA",$ff
dealer_name:
.byte "DEALER",$ff
auctio_name:
.byte "AUCTIONEER",$ff

fleaes_pal:
.byte $35,$30,$18, $0f,$10,$30,$00
dealer_pal:
.byte $37,$30,$00, $0f,$10,$30,$00
auctio_pal:
.byte $2c,$30,$17, $0f,$10,$30,$00

fleaes_lo:
.byte <dealer_stand,$00
.byte <dealer_punch,<dealer_rock,<dealer_punch,<dealer_rock,<dealer_punch,<dealer_rock,<dealer_punch,<dealer_rock
.byte <dealer_punch,<dealer_rock,<dealer_punch,<dealer_rock,<dealer_punch,<dealer_rock,<dealer_punch,<dealer_rock
fleaes_hi:
.byte >dealer_stand,$00
.byte >dealer_punch,>dealer_rock,>dealer_punch,>dealer_rock,>dealer_punch,>dealer_rock,>dealer_punch,>dealer_rock
.byte >dealer_punch,>dealer_rock,>dealer_punch,>dealer_rock,>dealer_punch,>dealer_rock,>dealer_punch,>dealer_rock
dealer_lo:
.byte <dealer_stand,<dealer_block
.byte <dealer_spink,<dealer_rock2,<dealer_pnch2,<dealer_jpkik,<dealer_pnch2,<dealer_rock2,<dealer_jpkik,<dealer_spink
.byte <dealer_pnch2,<dealer_rock2,<dealer_spink,<dealer_jpkik,<dealer_jpkik,<dealer_rock2,<dealer_pnch2,<dealer_spink
dealer_hi:
.byte >dealer_stand,>dealer_block
.byte >dealer_spink,>dealer_rock2,>dealer_pnch2,>dealer_jpkik,>dealer_pnch2,>dealer_rock2,>dealer_jpkik,>dealer_spink
.byte >dealer_pnch2,>dealer_rock2,>dealer_spink,>dealer_jpkik,>dealer_jpkik,>dealer_rock2,>dealer_pnch2,>dealer_spink
auctio_lo:
.byte <dealer_stand,<dealer_block
.byte <dealer_stomp,<dealer_rock2,<dealer_pnch2,<dealer_stomp,<dealer_jpkik,<dealer_spink,<dealer_pnch2,<dealer_rock2
.byte <dealer_pnch2,<dealer_stomp,<dealer_jpkik,<dealer_spink,<dealer_pnch2,<dealer_rock2,<dealer_jpkik,<dealer_spink
auctio_hi:
.byte >dealer_stand,>dealer_block
.byte >dealer_stomp,>dealer_rock2,>dealer_pnch2,>dealer_stomp,>dealer_jpkik,>dealer_spink,>dealer_pnch2,>dealer_rock2
.byte >dealer_pnch2,>dealer_stomp,>dealer_jpkik,>dealer_spink,>dealer_pnch2,>dealer_rock2,>dealer_jpkik,>dealer_spink

dealer_stand:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
dealer_block:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$d0,$d1
.byte $00,$e0,$e1
.byte $00,$f0,$f1
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
dealer_punch:
.byte $00,$d4,$d5
.byte $c4,$c5,$e5
.byte $00,$b4,$f5
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $01			; damage
.byte $20			; att move wait
.byte $68,$58		; target Y, target X
dealer_pnch2:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$d4,$d5
.byte $c4,$c5,$e5
.byte $00,$b4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $20			; att move wait
.byte $7e,$58		; target Y, target X
dealer_stomp:
.byte $00,$00,$00
.byte $00,$d2,$d3
.byte $00,$e2,$e3
.byte $00,$f2,$f3
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $3c,$81		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $04			; damage
.byte $2c			; att move wait
.byte $55,$48		; target Y, target X
dealer_jpkik:
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $b0,$b1,$b2
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $68,$58		; target Y, target X
dealer_spink:
.byte $00,$c0,$c1
.byte $00,$c2,$c3
.byte $00,$f2,$f3
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $30,$11		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $2c			; att move wait
.byte $68,$34		; target Y, target X
dealer_rock:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $b3,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $68,$98		; att y pos start, att x pos start
.byte $58,$42		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $02			; damage
.byte $20			; att move wait
.byte $68,$58		; target Y, target X
dealer_rock2:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $b3,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $78,$c0		; att y pos start, att x pos start
.byte $38,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $7e,$34		; target Y, target X

; ********************************************






; ********************************************
; buyer
; hunter
; sniper

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
buyers_heal:
.byte $00,$00,$00,$00,$00,$00,$09,$0a,$09,$0a
buyers_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
buyers_stat:
.byte $00,$06,$06,$18,$18,$00,$01,$03
hunter_heal:
.byte $00,$00,$00,$00,$09,$0a,$09,$0a,$09,$0a
hunter_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
hunter_stat:
.byte $00,$06,$06,$18,$18,$02,$01,$04
sniper_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
sniper_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
sniper_stat:
.byte $00,$06,$06,$18,$18,$02,$01,$05

buyers_name:
.byte "BUYER",$ff
hunter_name:
.byte "HUNTER",$ff
sniper_name:
.byte "SNIPER",$ff

buyers_pal:
.byte $37,$0c,$28, $0f,$06,$11,$27
hunter_pal:
.byte $37,$17,$21, $0f,$06,$11,$27
sniper_pal:
.byte $17,$00,$1b, $0f,$06,$11,$27

buyers_lo:
.byte <buyers_stand,$00
.byte <sniper_sweep,<sniper_jpkik,<sniper_sweep,<sniper_jpkik,<sniper_sweep,<sniper_jpkik,<sniper_sweep,<sniper_jpkik
.byte <sniper_sweep,<sniper_jpkik,<sniper_sweep,<sniper_jpkik,<sniper_sweep,<sniper_jpkik,<sniper_sweep,<sniper_jpkik
buyers_hi:
.byte >buyers_stand,$00
.byte >sniper_sweep,>sniper_jpkik,>sniper_sweep,>sniper_jpkik,>sniper_sweep,>sniper_jpkik,>sniper_sweep,>sniper_jpkik
.byte >sniper_sweep,>sniper_jpkik,>sniper_sweep,>sniper_jpkik,>sniper_sweep,>sniper_jpkik,>sniper_sweep,>sniper_jpkik
hunter_lo:
.byte <sniper_stand,<sniper_block
.byte <sniper_scope,<sniper_stock,<sniper_stock,<sniper_sweep,<sniper_sweep,<sniper_scope,<sniper_stock,<sniper_scope
.byte <sniper_sweep,<sniper_stock,<sniper_stock,<sniper_scope,<sniper_sweep,<sniper_scope,<sniper_stock,<sniper_scope
hunter_hi:
.byte >sniper_stand,>sniper_block
.byte >sniper_scope,>sniper_stock,>sniper_stock,>sniper_sweep,>sniper_sweep,>sniper_scope,>sniper_stock,>sniper_scope
.byte >sniper_sweep,>sniper_stock,>sniper_stock,>sniper_scope,>sniper_sweep,>sniper_scope,>sniper_stock,>sniper_scope
sniper_lo:
.byte <sniper_stand,<sniper_block
.byte <sniper_stomp,<sniper_jkik2,<sniper_sweep,<sniper_scope,<sniper_stomp,<sniper_sweep,<sniper_scope,<sniper_stomp
.byte <sniper_sweep,<sniper_jkik2,<sniper_stomp,<sniper_scope,<sniper_stomp,<sniper_jkik2,<sniper_scope,<sniper_stomp
sniper_hi:
.byte >sniper_stand,>sniper_block
.byte >sniper_stomp,>sniper_jkik2,>sniper_sweep,>sniper_scope,>sniper_stomp,>sniper_sweep,>sniper_scope,>sniper_stomp
.byte >sniper_sweep,>sniper_jkik2,>sniper_stomp,>sniper_scope,>sniper_stomp,>sniper_jkik2,>sniper_scope,>sniper_stomp

sniper_stand:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $dd,$de,$df
.byte $00,$ee,$ef
.byte $fd,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
sniper_block:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$cc,$cd
.byte $00,$dc,$ef
.byte $fd,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
sniper_stock:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $bb,$bc,$bd
.byte $00,$ee,$ef
.byte $fd,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $68,$58		; target Y, target X
sniper_sweep:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$ec,$cd
.byte $fb,$fc,$ef
.byte $fd,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $28			; att move wait
.byte $7e,$58		; target Y, target X
sniper_jpkik:
.byte $00,$ec,$cd
.byte $fb,$fc,$ef
.byte $fd,$fe,$ff
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $01			; damage
.byte $28			; att move wait
.byte $68,$58		; target Y, target X
sniper_jkik2:
.byte $00,$ec,$cd
.byte $fb,$fc,$ef
.byte $fd,$fe,$ff
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $68,$58		; target Y, target X
sniper_scope:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $dd,$de,$df
.byte $00,$ee,$ef
.byte $fd,$fe,$ff
.byte $be,$bf		; att spr tiles
.byte $ce,$cf		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $04			; damage
.byte $2c			; att move wait
.byte $68,$34		; target Y, target X
sniper_stomp:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $dd,$de,$df
.byte $00,$ee,$ef
.byte $fd,$fe,$ff
.byte $cb,$eb		; att spr tiles
.byte $db,$ed		;
.byte $03			; att spr palette
.byte $48,$ac		; att y pos start, att x pos start
.byte $44,$82		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $48			; att y pos next
.byte $04			; damage
.byte $2c			; att move wait
.byte $55,$48		; target Y, target X

buyers_stand:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$ec,$cd
.byte $00,$ee,$ef
.byte $fd,$fe,$ff
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X

; ********************************************






; ********************************************
; socialite
; moderator
; admin

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
social_heal:
.byte $00,$00,$00,$00,$00,$00,$09,$0a,$09,$0a
social_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
social_stat:
.byte $00,$05,$05,$1c,$1c,$00,$01,$03
modera_heal:
.byte $00,$00,$00,$0a,$09,$0a,$09,$0a,$09,$0a
modera_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
modera_stat:
.byte $00,$05,$05,$1c,$1c,$02,$01,$05
admins_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
admins_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
admins_stat:
.byte $00,$05,$05,$1c,$1c,$02,$01,$05

social_name:
.byte "SOCIALITE",$ff
modera_name:
.byte "MODERATOR",$ff
admins_name:
.byte "ADMIN",$ff

social_pal:
.byte $37,$11,$27, $0f,$17,$30,$00
modera_pal:
.byte $36,$1a,$17, $0f,$17,$30,$00
admins_pal:
.byte $30,$00,$10, $0f,$17,$30,$00

social_lo:
.byte <admins_stand,$00
.byte <admins_punch,<admins_tablt,<admins_tablt,<admins_tablt,<admins_punch,<admins_tablt,<admins_punch,<admins_punch
.byte <admins_punch,<admins_tablt,<admins_tablt,<admins_tablt,<admins_punch,<admins_tablt,<admins_punch,<admins_punch
social_hi:
.byte >admins_stand,$00
.byte >admins_punch,>admins_punch,>admins_punch,>admins_punch,>admins_punch,>admins_punch,>admins_punch,>admins_punch
.byte >admins_punch,>admins_punch,>admins_punch,>admins_punch,>admins_punch,>admins_punch,>admins_punch,>admins_punch
modera_lo:
.byte <admins_stand,<admins_block
.byte <admins_delet,<admins_tablt,<admins_delet,<admins_punch,<admins_tablt,<admins_delet,<admins_tablt,<admins_delet
.byte <admins_punch,<admins_tablt,<admins_delet,<admins_punch,<admins_tablt,<admins_delet,<admins_tablt,<admins_delet
modera_hi:
.byte >admins_stand,>admins_block
.byte >admins_delet,>admins_tablt,>admins_delet,>admins_punch,>admins_tablt,>admins_delet,>admins_tablt,>admins_delet
.byte >admins_punch,>admins_tablt,>admins_delet,>admins_punch,>admins_tablt,>admins_delet,>admins_tablt,>admins_delet
admins_lo:
.byte <admins_stand,<admins_block
.byte <admins_stomp,<admins_tablt,<admins_delet,<admins_stomp,<admins_delet,<admins_tablt,<admins_delet,<admins_stomp
.byte <admins_punch,<admins_stomp,<admins_delet,<admins_stomp,<admins_punch,<admins_tablt,<admins_delet,<admins_stomp
admins_hi:
.byte >admins_stand,>admins_block
.byte >admins_stomp,>admins_tablt,>admins_delet,>admins_stomp,>admins_delet,>admins_tablt,>admins_delet,>admins_stomp
.byte >admins_punch,>admins_stomp,>admins_delet,>admins_stomp,>admins_punch,>admins_tablt,>admins_delet,>admins_stomp

admins_stand:
.byte $b8,$b9,$ba
.byte $c8,$c9,$ca
.byte $00,$d9,$da
.byte $00,$e9,$ea
.byte $00,$f9,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
admins_block:
.byte $00,$b6,$ba
.byte $00,$f8,$ca
.byte $00,$d9,$da
.byte $00,$e9,$ea
.byte $00,$f9,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
admins_punch:
.byte $00,$b9,$ba
.byte $f7,$f8,$ca
.byte $00,$d9,$da
.byte $00,$e9,$ea
.byte $00,$f9,$fa
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $3c			; att move wait
.byte $68,$58		; target Y, target X
admins_stomp:
.byte $b8,$b9,$ba
.byte $c8,$c9,$ca
.byte $00,$d9,$da
.byte $00,$e9,$ea
.byte $00,$f9,$fa
.byte $d7,$d8		; att spr tiles
.byte $e7,$e8		;
.byte $03			; att spr palette
.byte $4e,$ac		; att y pos start, att x pos start
.byte $48,$82		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $4e			; att y pos next
.byte $04			; damage
.byte $3c			; att move wait
.byte $55,$48		; target Y, target X
admins_delet:
.byte $b8,$b9,$ba
.byte $c8,$c9,$ca
.byte $00,$d9,$da
.byte $00,$e9,$ea
.byte $00,$f9,$fa
.byte $c6,$e6		; att spr tiles
.byte $d6,$f6		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $3c			; att move wait
.byte $68,$34		; target Y, target X
admins_tablt:
.byte $00,$b9,$ba
.byte $c7,$c9,$ca
.byte $00,$d9,$da
.byte $00,$e9,$ea
.byte $00,$f9,$fa
.byte $b7,$00		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $78,$c0		; att y pos start, att x pos start
.byte $38,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $02			; damage
.byte $3c			; att move wait
.byte $7e,$34		; target Y, target X

; ********************************************






; ********************************************
; preserver
; historian
; revisionist

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
preser_heal:
.byte $00,$00,$00,$00,$09,$0a,$09,$0a,$09,$0a
preser_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
preser_stat:
.byte $00,$04,$04,$2c,$2c,$00,$01,$04
histor_heal:
.byte $00,$00,$00,$0a,$09,$0a,$09,$0a,$09,$0a
histor_stam:
.byte $00,$00,$00,$00,$0d,$0d,$0d,$0d
histor_stat:
.byte $00,$04,$04,$2c,$2c,$02,$01,$05
revisi_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
revisi_stam:
.byte $00,$00,$0d,$0d,$0d,$0d,$0d,$0d
revisi_stat:
.byte $00,$05,$05,$2c,$2c,$02,$01,$06

preser_name:
.byte "PRESERVER",$ff
histor_name:
.byte "HISTORIAN",$ff
revisi_name:
.byte "REVISIONIST",$ff

preser_pal:
.byte $37,$30,$1c, $0f,$0f,$0f,$0f
histor_pal:
.byte $17,$30,$28, $0f,$0f,$0f,$0f
revisi_pal:
.byte $30,$00,$13, $0f,$0f,$0f,$0f

preser_lo:
.byte <preser_stand,<preser_block
.byte <preser_punch,<preser_armbk,<preser_punch,<preser_armbk,<preser_punch,<preser_armbk,<preser_punch,<preser_armbk
.byte <preser_punch,<preser_armbk,<preser_punch,<preser_armbk,<preser_punch,<preser_armbk,<preser_punch,<preser_armbk
preser_hi:
.byte >preser_stand,>preser_block
.byte >preser_punch,>preser_armbk,>preser_punch,>preser_armbk,>preser_punch,>preser_armbk,>preser_punch,>preser_armbk
.byte >preser_punch,>preser_armbk,>preser_punch,>preser_armbk,>preser_punch,>preser_armbk,>preser_punch,>preser_armbk
histor_lo:
.byte <preser_stand,<preser_block
.byte <preser_armfr,<preser_armbk,<preser_hed2,<preser_armfr,<preser_armbk,<preser_armfr,<preser_armfr,<preser_hed2
.byte <preser_armbk,<preser_armfr,<preser_hed2,<preser_armfr,<preser_hed2,<preser_hed2,<preser_armfr,<preser_hed2
histor_hi:
.byte >preser_stand,>preser_block
.byte >preser_armfr,>preser_armbk,>preser_hed2,>preser_armfr,>preser_armbk,>preser_armfr,>preser_armfr,>preser_hed2
.byte >preser_armbk,>preser_armfr,>preser_hed2,>preser_armfr,>preser_hed2,>preser_hed2,>preser_armfr,>preser_hed2
revisi_lo:
.byte <preser_stand,<preser_block
.byte <preser_stomp,<preser_armfr,<preser_hed2,<preser_armbk,<preser_head,<preser_armfr,<preser_stomp,<preser_head
.byte <preser_hed2,<preser_armfr,<preser_stomp,<preser_armbk,<preser_head,<preser_hed2,<preser_stomp,<preser_head
revisi_hi:
.byte >preser_stand,>preser_block
.byte >preser_stomp,>preser_armfr,>preser_hed2,>preser_armbk,>preser_head,>preser_armfr,>preser_stomp,>preser_head
.byte >preser_hed2,>preser_armfr,>preser_stomp,>preser_armbk,>preser_head,>preser_hed2,>preser_stomp,>preser_head

preser_stand:
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
preser_block:
.byte $00,$b4,$b5
.byte $b1,$b3,$c5
.byte $00,$c3,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
preser_punch:
.byte $00,$b4,$b5
.byte $b2,$b3,$c5
.byte $00,$c3,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
preser_stomp:
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$00,$00
.byte $00,$00,$00
.byte $e4,$e5		; att spr tiles
.byte $c2,$f5		;
.byte $02			; att spr palette
.byte $48,$ac		; att y pos start, att x pos start
.byte $44,$82		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $48			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $55,$48		; target Y, target X
preser_head:
.byte $00,$c0,$c1
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $b0,$00		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $78,$a0		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
preser_hed2:
.byte $00,$c0,$c1
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $f1,$00		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $78,$c0		; att y pos start, att x pos start
.byte $38,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$34		; target Y, target X
preser_armfr:
.byte $00,$b4,$b5
.byte $00,$d0,$d1
.byte $00,$e0,$e1
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $b2,$f0		; att spr tiles
.byte $b2,$f0		;
.byte $02			; att spr palette
.byte $68,$a0		; att y pos start, att x pos start
.byte $58,$42		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
preser_armbk:
.byte $00,$b4,$b5
.byte $00,$d0,$d1
.byte $00,$e0,$e1
.byte $00,$e4,$e5
.byte $00,$f4,$f5
.byte $d2,$d3		; att spr tiles
.byte $d2,$d3		;
.byte $02			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X

; ********************************************






; ********************************************
; l-block

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
lblock_heal:
.byte $09,$0a,$09,$0a,$09,$0a,$09,$0a,$09,$0a
lblock_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
lblock_stat:
.byte $00,$05,$05,$1e,$1e,$04,$01,$30

lblock_name:
.byte "L-BLOCK",$ff

lblock_pal:
.byte $07,$17,$27, $0f,$07,$17,$27

lblock_lo:
.byte <lblock_stand,<lblock_block
.byte <lblock_stomp,<lblock_zigza,<lblock_tshot,<lblock_lshot,<lblock_squar,<lblock_stomp,<lblock_zigza,<lblock_tshot
.byte <lblock_stomp,<lblock_zigza,<lblock_tshot,<lblock_lshot,<lblock_squar,<lblock_stomp,<lblock_zigza,<lblock_tshot
lblock_hi:
.byte >lblock_stand,>lblock_block
.byte >lblock_stomp,>lblock_zigza,>lblock_tshot,>lblock_lshot,>lblock_squar,>lblock_stomp,>lblock_zigza,>lblock_tshot
.byte >lblock_stomp,>lblock_zigza,>lblock_tshot,>lblock_lshot,>lblock_squar,>lblock_stomp,>lblock_zigza,>lblock_tshot

lblock_stand:
.byte $00,$00,$bf
.byte $00,$00,$bf
.byte $00,$00,$bf
.byte $00,$00,$bf
.byte $bf,$bf,$bf
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
lblock_block:
.byte $bf,$bf,$bf
.byte $bf,$bf,$bf
.byte $bf,$bf,$bf
.byte $bf,$bf,$bf
.byte $bf,$bf,$bf
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
lblock_stomp:
.byte $00,$bf,$00
.byte $00,$bf,$00
.byte $00,$bf,$00
.byte $00,$bf,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $40,$81		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $2c			; att move wait
.byte $55,$48		; target Y, target X
lblock_zigza:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $bf,$bf,$00
.byte $00,$bf,$bf
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $24,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $2c			; att move wait
.byte $7e,$34		; target Y, target X
lblock_tshot:
.byte $00,$bf,$00
.byte $bf,$bf,$00
.byte $00,$bf,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $2c			; att move wait
.byte $68,$58		; target Y, target X
lblock_lshot:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$bf
.byte $bf,$bf,$bf
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $2c			; att move wait
.byte $7e,$58		; target Y, target X
lblock_squar:
.byte $00,$00,$00
.byte $00,$bf,$bf
.byte $00,$bf,$bf
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $28,$11		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $2c			; att move wait
.byte $68,$34		; target Y, target X

; ********************************************






; ********************************************
; game genie

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
ggenie_heal:
.byte $09,$0a,$09,$0a,$09,$0a,$09,$0a,$09,$0a
ggenie_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
ggenie_stat:
.byte $00,$05,$05,$1e,$1e,$04,$01,$25

ggenie_name:
.byte "GAME GENIE",$ff

ggenie_pal:
.byte $37,$25,$05, $0f,$27,$0f,$0f

ggenie_lo:
.byte <ggenie_stand,<ggenie_block
.byte <ggenie_hatat,<ggenie_tail,<ggenie_hatat,<ggenie_stomp,<ggenie_punch,<ggenie_tail,<ggenie_hatat,<ggenie_stomp
.byte <ggenie_punch,<ggenie_tail,<ggenie_hatat,<ggenie_stomp,<ggenie_punch,<ggenie_tail,<ggenie_hatat,<ggenie_stomp
ggenie_hi:
.byte >ggenie_stand,>ggenie_block
.byte >ggenie_hatat,>ggenie_tail,>ggenie_hatat,>ggenie_stomp,>ggenie_punch,>ggenie_tail,>ggenie_hatat,>ggenie_stomp
.byte >ggenie_punch,>ggenie_tail,>ggenie_hatat,>ggenie_stomp,>ggenie_punch,>ggenie_tail,>ggenie_hatat,>ggenie_stomp

ggenie_stand:
.byte $00,$b7,$b8
.byte $00,$c7,$c8
.byte $00,$d7,$d8
.byte $00,$e7,$e8
.byte $00,$f7,$f8
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
ggenie_block:
.byte $e9,$b7,$b8
.byte $f9,$da,$c8
.byte $00,$ea,$d8
.byte $00,$e7,$e8
.byte $00,$f7,$f8
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
ggenie_punch:
.byte $00,$b7,$b8
.byte $d9,$da,$c8
.byte $00,$ea,$d8
.byte $00,$e7,$e8
.byte $00,$f7,$f8
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
ggenie_tail:
.byte $00,$b7,$b8
.byte $00,$c7,$c8
.byte $00,$d7,$d8
.byte $00,$e7,$e8
.byte $c9,$ca,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
ggenie_hatat:
.byte $00,$e6,$b2
.byte $00,$c7,$c8
.byte $00,$d7,$d8
.byte $00,$e7,$e8
.byte $00,$f7,$f8
.byte $c6,$d6		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $34,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X
ggenie_stomp:
.byte $00,$b7,$b8
.byte $00,$c7,$c8
.byte $00,$d7,$d8
.byte $00,$e7,$e8
.byte $00,$f7,$f8
.byte $b6,$fa		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $44,$ac		; att y pos start, att x pos start
.byte $44,$82		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $44			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $55,$48		; target Y, target X

; ********************************************






; ********************************************
; doggy

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
ddoggy_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
ddoggy_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
ddoggy_stat:
.byte $00,$05,$05,$1e,$1e,$03,$01,$15

ddoggy_name:
.byte "MR. PEEPERS",$ff

ddoggy_pal:
.byte $06,$16,$30, $0f,$27,$1a,$30

ddoggy_lo:
.byte <ddoggy_stand,<ddoggy_block
.byte <ddoggy_brdhi,<ddoggy_hiatt,<ddoggy_loatt,<ddoggy_brdhi,<ddoggy_brdlo,<ddoggy_loatt,<ddoggy_hiatt,<ddoggy_loatt
.byte <ddoggy_loatt,<ddoggy_hiatt,<ddoggy_brdlo,<ddoggy_brdhi,<ddoggy_brdlo,<ddoggy_loatt,<ddoggy_hiatt,<ddoggy_brdhi
ddoggy_hi:
.byte >ddoggy_stand,>ddoggy_block
.byte >ddoggy_brdhi,>ddoggy_hiatt,>ddoggy_loatt,>ddoggy_brdhi,>ddoggy_brdlo,>ddoggy_loatt,>ddoggy_hiatt,>ddoggy_loatt
.byte >ddoggy_loatt,>ddoggy_hiatt,>ddoggy_brdlo,>ddoggy_brdhi,>ddoggy_brdlo,>ddoggy_loatt,>ddoggy_hiatt,>ddoggy_brdhi

ddoggy_stand:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $b0,$b1,$b2
.byte $c0,$c1,$c2
.byte $d0,$d1,$d2
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
ddoggy_block:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $b5,$b3,$b4
.byte $c5,$d5,$c4
.byte $00,$d3,$d4
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
ddoggy_loatt:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$b2
.byte $00,$e3,$c2
.byte $c0,$f3,$d2
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
ddoggy_hiatt:
.byte $b0,$b1,$00
.byte $c0,$f4,$b1
.byte $d0,$d1,$f5
.byte $00,$00,$f6
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
ddoggy_bstmp:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$b3,$b4
.byte $00,$c3,$c4
.byte $00,$d3,$d4
.byte $e2,$00		; att spr tiles
.byte $f2,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $ef,$ef		; target Y, target X
ddoggy_brdhi:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$b3,$b4
.byte $00,$c3,$c4
.byte $00,$d3,$d4
.byte $e0,$e1		; att spr tiles
.byte $f0,$f1		;
.byte $03			; att spr palette
.byte $60,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $60			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X
ddoggy_brdlo:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$b3,$b4
.byte $00,$c3,$c4
.byte $00,$d3,$d4
.byte $e0,$e1		; att spr tiles
.byte $f0,$f1		;
.byte $03			; att spr palette
.byte $78,$c0		; att y pos start, att x pos start
.byte $30,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$34		; target Y, target X

; ********************************************






; ********************************************
; rob

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
rrobby_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
rrobby_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
rrobby_stat:
.byte $00,$05,$05,$1e,$1e,$03,$01,$20

rrobby_name:
.byte "R.O.B",$ff

rrobby_pal:
.byte $10,$00,$16, $0f,$27,$11,$1a

rrobby_lo:
.byte <rrobby_stand,<rrobby_block
.byte <rrobby_hisht,<rrobby_losht,<rrobby_hiatt,<rrobby_lobak,<rrobby_lobak,<rrobby_hisht,<rrobby_losht,<rrobby_hiatt
.byte <rrobby_hisht,<rrobby_losht,<rrobby_hiatt,<rrobby_lobak,<rrobby_lobak,<rrobby_hisht,<rrobby_losht,<rrobby_hiatt
rrobby_hi:
.byte >rrobby_stand,>rrobby_block
.byte >rrobby_hisht,>rrobby_losht,>rrobby_hiatt,>rrobby_lobak,>rrobby_lobak,>rrobby_hisht,>rrobby_losht,>rrobby_hiatt
.byte >rrobby_hisht,>rrobby_losht,>rrobby_hiatt,>rrobby_lobak,>rrobby_lobak,>rrobby_hisht,>rrobby_losht,>rrobby_hiatt

rrobby_stand:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
rrobby_block:
.byte $00,$bb,$bc
.byte $00,$cb,$cc
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
rrobby_hisht:
.byte $00,$00,$00
.byte $00,$ee,$ef
.byte $00,$ed,$fd
.byte $00,$00,$00
.byte $00,$cd,$dd
.byte $bd,$bd		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X
rrobby_losht:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $bd,$bd		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $78,$a0		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
rrobby_hiatt:
.byte $db,$dc,$00
.byte $eb,$ec,$00
.byte $fb,$fc,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
rrobby_lobak:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$ee,$ef
.byte $00,$fe,$ff
.byte $bd,$bd		; att spr tiles
.byte $00,$00		;
.byte $02			; att spr palette
.byte $78,$c0		; att y pos start, att x pos start
.byte $30,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $03			; damage
.byte $30			; att move wait
.byte $7e,$34		; target Y, target X

; ********************************************






; ********************************************
; shadow

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
shadow_heal:
.byte $09,$0a,$09,$0a,$09,$0a,$09,$0a,$09,$0a
shadow_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
shadow_stat:
.byte $00,$05,$05,$20,$20,$05,$01,$30

shadow_name:
.byte "THE SHADOW",$ff

shadow_pal:
.byte $00,$00,$00, $0f,$0f,$16,$27

shadow_lo:
.byte <shadow_stand,<shadow_block
.byte <shadow_stomp,<shadow_biter,<shadow_upper,<shadow_fireb,<shadow_lokik,<shadow_stomp,<shadow_biter,<shadow_upper
.byte <shadow_fireb,<shadow_lokik,<shadow_stomp,<shadow_lokik,<shadow_fireb,<shadow_biter,<shadow_stomp,<shadow_stomp
shadow_hi:
.byte >shadow_stand,>shadow_block
.byte >shadow_stomp,>shadow_biter,>shadow_upper,>shadow_fireb,>shadow_lokik,>shadow_stomp,>shadow_biter,>shadow_upper
.byte >shadow_fireb,>shadow_lokik,>shadow_stomp,>shadow_lokik,>shadow_fireb,>shadow_biter,>shadow_stomp,>shadow_stomp

shadow_stand:
.byte $00,$b9,$00
.byte $c8,$c9,$ca
.byte $d8,$d9,$da
.byte $b0,$b1,$b2
.byte $c0,$c1,$c2
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
shadow_block:
.byte $bb,$d3,$00
.byte $cb,$d5,$d6
.byte $dd,$de,$df
.byte $b0,$b1,$b2
.byte $c0,$c1,$c2
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
shadow_upper:
.byte $bb,$b9,$00
.byte $cb,$d7,$ca
.byte $dd,$ba,$da
.byte $b0,$b1,$b2
.byte $c0,$c1,$c2
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $05			; damage
.byte $20			; att move wait
.byte $68,$58		; target Y, target X
shadow_biter:
.byte $00,$00,$b8
.byte $00,$b6,$b7
.byte $00,$c6,$c7
.byte $00,$c3,$c4
.byte $00,$d4,$d4
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $28,$11		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $05			; damage
.byte $20			; att move wait
.byte $68,$34		; target Y, target X
shadow_stomp:
.byte $bb,$bc,$bd
.byte $cb,$cc,$cd
.byte $d0,$d1,$d2
.byte $e0,$e1,$e2
.byte $00,$00,$00
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $40,$81		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $05			; damage
.byte $20			; att move wait
.byte $55,$48		; target Y, target X
shadow_fireb:
.byte $00,$e6,$00
.byte $e3,$e4,$e5
.byte $dd,$e7,$df
.byte $b0,$b1,$b2
.byte $c0,$c1,$c2
.byte $e8,$e8		; att spr tiles
.byte $e8,$e8		;
.byte $03			; att spr palette
.byte $68,$98		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $05			; damage
.byte $20			; att move wait
.byte $7e,$58		; target Y, target X
shadow_lokik:
.byte $be,$00,$00
.byte $bf,$ce,$00
.byte $cf,$db,$dc
.byte $b3,$b4,$b5
.byte $00,$00,$c5
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $24,$21		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $05			; damage
.byte $20			; att move wait
.byte $7e,$34		; target Y, target X

; ********************************************






; ********************************************
; strongman

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
strong_heal:
.byte $00,$00,$00,$0a,$09,$0a,$09,$0a,$09,$0a
strong_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
strong_stat:
.byte $00,$05,$05,$1e,$1e,$03,$01,$10

strong_name:
.byte "STRONGMAN",$ff

strong_pal:
.byte $37,$17,$1a, $0f,$10,$00,$0f

strong_lo:
.byte <strong_stand,<strong_block
.byte <strong_punch,<strong_bar,<strong_bar,<strong_punch,<strong_bar,<strong_punch,<strong_bar,<strong_punch
.byte <strong_punch,<strong_bar,<strong_bar,<strong_punch,<strong_bar,<strong_punch,<strong_bar,<strong_punch
strong_hi:
.byte >strong_stand,>strong_block
.byte >strong_punch,>strong_bar,>strong_bar,>strong_punch,>strong_bar,>strong_punch,>strong_bar,>strong_punch
.byte >strong_punch,>strong_bar,>strong_bar,>strong_punch,>strong_bar,>strong_punch,>strong_bar,>strong_punch

strong_stand:
.byte $00,$b1,$b2
.byte $c0,$c1,$c2
.byte $d0,$d1,$d2
.byte $00,$e1,$e2
.byte $df,$e8,$e9
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $01			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
strong_block:
.byte $b0,$b1,$b2
.byte $e0,$b3,$c2
.byte $00,$c3,$d2
.byte $00,$e1,$e2
.byte $df,$e8,$e9
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
strong_punch:
.byte $00,$b1,$b2
.byte $d3,$b3,$c2
.byte $00,$c3,$d2
.byte $00,$e1,$e2
.byte $df,$e8,$e9
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
strong_bar:
.byte $00,$b1,$b2
.byte $c0,$c1,$c2
.byte $d0,$d1,$d2
.byte $00,$e1,$e2
.byte $df,$e8,$e9
.byte $b4,$c4		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $78,$98		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
strong_1ton:
.byte $00,$b1,$b2
.byte $c0,$c1,$c2
.byte $d0,$d1,$d2
.byte $00,$e1,$e2
.byte $df,$e8,$e9
.byte $e3,$e4		; att spr tiles
.byte $ce,$cf		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $01			; damage
.byte $30			; att move wait
.byte $55,$48		; target Y, target X

; ********************************************






; ********************************************
; capn octo

; health hit before deduction, stamina, stamina permanent, stamina ticker
; stamina ticker permanent, % block, # of attacks, # of manuals
octops_heal:
.byte $00,$00,$09,$0a,$09,$0a,$09,$0a,$09,$0a
octops_stam:
.byte $00,$00,$00,$0d,$0d,$0d,$0d,$0d
octops_stat:
.byte $00,$05,$05,$1e,$1e,$03,$01,$20

octops_name:
.byte "CAP'N OCTO",$ff

octops_pal:
.byte $13,$23,$30, $0f,$11,$21,$30

octops_lo:
.byte <octops_stand,<octops_block
.byte <octops_wbkbm,<octops_bite,<octops_wtrtp,<octops_wbktp,<octops_wtrbm,<octops_bite,<octops_wtrtp,<octops_wbkbm
.byte <octops_wtrbm,<octops_bite,<octops_wtrtp,<octops_wbktp,<octops_wtrbm,<octops_bite,<octops_wtrtp,<octops_wbkbm
octops_hi:
.byte >octops_stand,>octops_block
.byte >octops_wbkbm,>octops_bite,>octops_wtrtp,>octops_wbktp,>octops_wtrbm,>octops_bite,>octops_wtrtp,>octops_wbkbm
.byte >octops_wtrbm,>octops_bite,>octops_wtrtp,>octops_wbktp,>octops_wtrbm,>octops_bite,>octops_wtrtp,>octops_wbkbm

octops_stand:
.byte $00,$b6,$b7
.byte $c5,$c6,$c7
.byte $d5,$d6,$d7
.byte $e5,$e6,$e7
.byte $dc,$dd,$de
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $ff			; att move wait
.byte $ef,$ef		; target Y, target X
octops_block:
.byte $b8,$b6,$b7
.byte $c8,$c6,$c7
.byte $d8,$d6,$d7
.byte $e5,$e6,$e7
.byte $dc,$dd,$de
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $ef,$ef		; target Y, target X
octops_punch:
.byte $b8,$b6,$b7
.byte $c8,$c6,$c7
.byte $d8,$d6,$d7
.byte $e5,$e6,$e7
.byte $dc,$dd,$de
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
octops_bite:
.byte $bc,$b6,$be
.byte $cc,$cd,$00
.byte $d6,$bf,$d7
.byte $ba,$bd,$e7
.byte $dc,$dd,$de
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $58,$41		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $02			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
octops_stomp:
.byte $00,$b6,$b7
.byte $c5,$c6,$c7
.byte $b9,$d6,$bb
.byte $c9,$ca,$cb
.byte $d9,$da,$db
.byte $00,$00		; att spr tiles
.byte $00,$00		;
.byte $03			; att spr palette
.byte $ef,$ef		; att y pos start, att x pos start
.byte $ef,$00		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $ef			; att y pos next
.byte $00			; damage
.byte $00			; att move wait
.byte $55,$48		; target Y, target X
octops_wtrtp:
.byte $00,$b6,$b7
.byte $c5,$c6,$c7
.byte $d5,$d6,$d7
.byte $e5,$e6,$e7
.byte $dc,$dd,$de
.byte $b5,$b5		; att spr tiles
.byte $b5,$b5		;
.byte $03			; att spr palette
.byte $68,$98		; att y pos start, att x pos start
.byte $58,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $01			; damage
.byte $30			; att move wait
.byte $7e,$58		; target Y, target X
octops_wtrbm:
.byte $00,$b6,$b7
.byte $c5,$c6,$c7
.byte $d5,$d6,$d7
.byte $e5,$e6,$e7
.byte $dc,$dd,$de
.byte $d4,$d4		; att spr tiles
.byte $d4,$d4		;
.byte $03			; att spr palette
.byte $78,$98		; att y pos start, att x pos start
.byte $58,$42		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $01			; damage
.byte $30			; att move wait
.byte $68,$58		; target Y, target X
octops_wbktp:
.byte $00,$b6,$b7
.byte $c5,$c6,$c7
.byte $d5,$d6,$d7
.byte $e5,$e6,$e7
.byte $dc,$dd,$de
.byte $ea,$ea		; att spr tiles
.byte $ea,$ea		;
.byte $03			; att spr palette
.byte $68,$c0		; att y pos start, att x pos start
.byte $30,$22		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $78			; att y pos next
.byte $01			; damage
.byte $30			; att move wait
.byte $7e,$34		; target Y, target X
octops_wbkbm:
.byte $00,$b6,$b7
.byte $c5,$c6,$c7
.byte $d5,$d6,$d7
.byte $e5,$e6,$e7
.byte $dc,$dd,$de
.byte $eb,$eb		; att spr tiles
.byte $eb,$eb		;
.byte $03			; att spr palette
.byte $78,$c0		; att y pos start, att x pos start
.byte $30,$12		; att x pos next, att with which (8=hd,4=body,2=ft,1=bk / 0=nothing, 1=body, 2=projectile)
.byte $68			; att y pos next
.byte $01			; damage
.byte $30			; att move wait
.byte $68,$34		; target Y, target X

; ********************************************






tie_battle_sprites:
	ldy #$00
:	lda off_tl+0, y
	sta off_tr+0, y
	clc
	adc #$08
	sta off_bl+0, y
	sta off_br+0, y
	lda off_tl+3, y
	sta off_bl+3, y
	clc
	adc #$08
	sta off_tr+3, y
	sta off_br+3, y
	tya
	clc
	adc #$10
	tay
	cpy #$30
	bne :-

	lda p_com_tly
	sta p_com_tmy
	sta p_com_try
	clc
	adc #$08
	sta p_com_lm1y
	sta p_com_mm1y
	sta p_com_rm1y
	clc
	adc #$08
	sta p_com_lm2y
	sta p_com_mm2y
	sta p_com_rm2y
	clc
	adc #$08
	sta p_com_lm3y
	sta p_com_mm3y
	sta p_com_rm3y
	clc
	adc #$08
	sta p_com_bly
	sta p_com_bmy
	sta p_com_bry

	lda p_com_tlx
	sta p_com_lm1x
	sta p_com_lm2x
	sta p_com_lm3x
	sta p_com_blx
	clc
	adc #$08
	sta p_com_tmx
	sta p_com_mm1x
	sta p_com_mm2x
	sta p_com_mm3x
	sta p_com_bmx
	clc
	adc #$08
	sta p_com_trx
	sta p_com_rm1x
	sta p_com_rm2x
	sta p_com_rm3x
	sta p_com_brx

	lda clu1+0
	sta clu2+0
	clc
	adc #$08
	sta clu3+0
	sta clu4+0
	lda clu1+3
	sta clu3+3
	clc
	adc #$08
	sta clu2+3
	sta clu4+3

	lda e_com_tly
	sta e_com_tmy
	sta e_com_try
	clc
	adc #$08
	sta e_com_lm1y
	sta e_com_mm1y
	sta e_com_rm1y
	clc
	adc #$08
	sta e_com_lm2y
	sta e_com_mm2y
	sta e_com_rm2y
	clc
	adc #$08
	sta e_com_lm3y
	sta e_com_mm3y
	sta e_com_rm3y
	clc
	adc #$08
	sta e_com_bly
	sta e_com_bmy
	sta e_com_bry

	lda e_com_tlx
	sta e_com_lm1x
	sta e_com_lm2x
	sta e_com_lm3x
	sta e_com_blx
	clc
	adc #$08
	sta e_com_tmx
	sta e_com_mm1x
	sta e_com_mm2x
	sta e_com_mm3x
	sta e_com_bmx
	clc
	adc #$08
	sta e_com_trx
	sta e_com_rm1x
	sta e_com_rm2x
	sta e_com_rm3x
	sta e_com_brx

	lda e_att1
	sta e_att2
	clc
	adc #$08
	sta e_att3
	sta e_att4
	lda e_att1+3
	sta e_att3+3
	clc
	adc #$08
	sta e_att2+3
	sta e_att4+3

	ldy #$00
	ldx #$00
	lda #$02
:	sta e_com_tla, y
	iny
	iny
	iny
	iny
	inx
	cpx #15
	bne :-
	rts


def_letter_tests:
	ldx #$00
	lda games+4
	and #$c0
	beq @not1
:		lda word_jump, x
		sta btl_letters, x
		inx
		cpx #$03
		bne :-
		beq @two
@not1:
	txa
:	sta btl_letters, x
	inx
	cpx #$03
	bne :-

@two:
	ldx #$00
	lda games+15
	and #$c0
	beq @not2
:		lda word_cntr, x
		sta btl_letters+3, x
		inx
		cpx #$03
		bne :-
		beq @three
@not2:
	txa
:	sta btl_letters+3, x
	inx
	cpx #$03
	bne :-

@three:
	ldx #$00
	lda games+18
	and #$c0
	beq @not3
		ldx #$00
:		lda word_blck, x
		sta btl_letters+6, x
		inx
		cpx #$03
		bne :-
		beq @four
@not3:
	txa
:	sta btl_letters+6, x
	inx
	cpx #$03
	bne :-

@four:
	ldx #$00
	lda games+0
	and #$c0
	beq @not4
		ldx #$00
:		lda word_juke, x
		sta btl_letters+9, x
		inx
		cpx #$03
		bne :-
		beq @done
@not4:
	txa
:	sta btl_letters+9, x
	inx
	cpx #$03
	bne :-
@done:
	rts



att_letter_tests:
	ldx #$00
	lda games+17
	and #$c0
	beq @not1
:		lda word_stmp, x
		sta btl_letters, x
		inx
		cpx #$03
		bne :-
		beq @two
@not1:
	txa
:	sta btl_letters, x
	inx
	cpx #$03
	bne :-

@two:
	ldx #$00
	lda games+24
	and #$c0
	beq @not2
:		lda word_fire, x
		sta btl_letters+3, x
		inx
		cpx #$03
		bne :-
		beq @three
@not2:
	txa
:	sta btl_letters+3, x
	inx
	cpx #$03
	bne :-

@three:
	ldx #$00
	lda games+26
	and #$c0
	beq @not3
		ldx #$00
:		lda word_jabs, x
		sta btl_letters+6, x
		inx
		cpx #$03
		bne :-
		beq @four
@not3:
	txa
:	sta btl_letters+6, x
	inx
	cpx #$03
	bne :-

@four:
	ldx #$00
	lda games+13
	and #$c0
	beq @not4
		ldx #$00
:		lda word_zaps, x
		sta btl_letters+9, x
		inx
		cpx #$03
		bne :-
		beq @done
@not4:
	txa
:	sta btl_letters+9, x
	inx
	cpx #$03
	bne :-
@done:
	rts



spe_letter_tests:
	ldx #$00
	lda games+20
	and #$c0
	beq @not1
:		lda word_strg, x
		sta btl_letters, x
		inx
		cpx #$03
		bne :-
		beq @two
@not1:
	txa
:	sta btl_letters, x
	inx
	cpx #$03
	bne :-

@two:
	ldx #$00
	lda games+8
	and #$c0
	beq @not2
:		lda word_esca, x
		sta btl_letters+3, x
		inx
		cpx #$03
		bne :-
		beq @three
@not2:
	txa
:	sta btl_letters+3, x
	inx
	cpx #$03
	bne :-

@three:
	ldx #$00
	lda games+3
	and #$c0
	beq @not3
		ldx #$00
:		lda word_clue, x
		sta btl_letters+6, x
		inx
		cpx #$03
		bne :-
		beq @four
@not3:
	txa
:	sta btl_letters+6, x
	inx
	cpx #$03
	bne :-

@four:
	ldx #$00
	lda games+16
	and #$c0
	beq @not4
		ldx #$00
:		lda word_adrn, x
		sta btl_letters+9, x
		inx
		cpx #$03
		bne :-
		beq @done
@not4:
	txa
:	sta btl_letters+9, x
	inx
	cpx #$03
	bne :-
@done:
	rts

btl_pushed_up:
		lda #$b0
		sta cursor+4
		lda #$13
		sta cursor+5
		lda #$01
		sta cursor+6
		lda #$38
		sta cursor+7
		rts
btl_pushed_dn:
		lda #$be
		sta cursor+4
		lda #$13
		sta cursor+5
		lda #$81
		sta cursor+6
		lda #$38
		sta cursor+7
		rts
btl_pushed_lt:
		lda #$b7
		sta cursor+4
		lda #$11
		sta cursor+5
		lda #$01
		sta cursor+6
		lda #$31
		sta cursor+7
		rts
btl_pushed_rt:
		lda #$b7
		sta cursor+4
		lda #$11
		sta cursor+5
		lda #$41
		sta cursor+6
		lda #$40
		sta cursor+7
		rts

hold_def:
	lda #$ef
	sta off_tl
	sta spe_tl
	lda #$2f
	sta def_tl
	rts
hold_off:
	lda #$ef
	sta spe_tl
	sta def_tl
	lda #$2f
	sta off_tl
	rts
hold_spe:
	lda #$ef
	sta off_tl
	sta def_tl
	lda #$2f
	sta spe_tl
	rts



flicker_em:
	lda sprite_flicker
	cmp #$01
	beq @go_backward_init

@go_forward_init:
	ldy #$30
@go_forward:
	lda bg_ram, y
	sta OAM_ram, y
	iny
	lda bg_ram, y
	sta OAM_ram, y
	iny
	lda bg_ram, y
	sta OAM_ram, y
	iny
	lda bg_ram, y
	sta OAM_ram, y
	iny
	bne @go_forward
		lda #$01
		sta sprite_flicker
		rts
@go_backward_init:
	ldx #$30
	ldy #$fc
@go_backward:
	lda bg_ram, x
	sta OAM_ram, y
	iny
	inx
	lda bg_ram, x
	sta OAM_ram, y
	iny
	inx
	lda bg_ram, x
	sta OAM_ram, y
	iny
	inx
	lda bg_ram, x
	sta OAM_ram, y
	tya
	sec
	sbc #$08
	tay
	iny
	inx
	bne @go_backward
		lda #$00
		sta sprite_flicker
@done:
	rts


battle_load_cont:

	ldx enemy_choice
	lda enemy_name_lo, x
	sta cluster_addy+0
	lda enemy_name_hi, x
	sta cluster_addy+1
	ldy #$00
	lda #$20
	sta $2006
	lda enemy_name_start, x
	sta $2006
:	lda (cluster_addy), y
	cmp #$ff
	beq :+
		sta $2007
		iny
		bne :-
:

	lda enemy_pal_lo, x
	sta cluster_addy+0
	lda enemy_pal_hi, x
	sta cluster_addy+1
	ldy #$00
	lda #$3f
	sta $2006
	lda #$19
	sta $2006
:	lda (cluster_addy), y
	sta pal_address+25, y
	sta $2007
	iny
	cpy #$07
	bne :-


	lda enemy_stat_lo, x
	sta cluster_addy+0
	lda enemy_stat_hi, x
	sta cluster_addy+1
	ldy #$00
:	lda (cluster_addy), y
	sta e_stat_import, y
	iny
	cpy #(larper_heal - casual_stat)
	bne :-


	lda enemy_heal_lo, x
	sta cluster_addy+0
	lda enemy_heal_hi, x
	sta cluster_addy+1
	ldy #$00
:	lda (cluster_addy), y
	sta e_health_bar, y
	iny
	cpy #10
	bne :-

	lda games+25
	beq @not_weakened
		lda boss_offset
		bne @not_weakened
	ldx #$00
:	lda e_health_bar, x
	beq :++
		cmp #$0b
		bcs :++
			cmp #$09
			bne :+
				lda #$0b
				sta e_health_bar, x
				jmp @not_weakened
:			lda #$0c
			sta e_health_bar, x
			jmp @not_weakened
:	inx
	bne :---
@not_weakened:

	ldx enemy_choice
	lda enemy_stam_lo, x
	sta cluster_addy+0
	lda enemy_stam_hi, x
	sta cluster_addy+1
	ldy #$00
:	lda (cluster_addy), y
	sta e_stamina_bar, y
	iny
	cpy #8
	bne :-

	lda enemy_lo_lo, x
	sta temp_16bit_1+0
	lda enemy_lo_hi, x
	sta temp_16bit_1+1
	ldy #$00
	lda (temp_16bit_1), y
	sta cluster_addy+0
	lda enemy_hi_lo, x
	sta temp_16bit_1+0
	lda enemy_hi_hi, x
	sta temp_16bit_1+1
	lda (temp_16bit_1), y
	sta cluster_addy+1

	lda #$60
	sta e_com_tly
	lda #$a8
	sta e_com_tlx
	lda #$00
	sta enemy_cluster	; TRY USING AS ENEMY ANIM
	jsr e_battle_anim

	lda #$00
	sta p_anim_state
	jsr p_battle_anim

	ldx #$00
	txa
:	sta btl_letters, x
	inx
	cpx #12
	bne :-

	lda #$20
	sta nametable

	lda #%10000000
	sta $2000
	sta save2000
	lda #%00011110
	sta $2001
	sta save2001

	jmp rtn_battle_load_cont


e_battle_anim:
	ldx enemy_choice
	lda enemy_lo_lo, x
	sta temp_16bit_1+0
	lda enemy_lo_hi, x
	sta temp_16bit_1+1
	ldy enemy_cluster		; ENEMY ANIM
	lda (temp_16bit_1), y
	sta cluster_addy+0
	lda enemy_hi_lo, x
	sta temp_16bit_1+0
	lda enemy_hi_hi, x
	sta temp_16bit_1+1
	lda (temp_16bit_1), y
	sta cluster_addy+1


	ldx #$00
	ldy #$00
:	lda (cluster_addy), y
	sta e_com_tlt, x
	inx
	inx
	inx
	inx
	iny
	cpy #19
	bne :-

	lda (cluster_addy), y
	sta e_att1+2
	sta e_att2+2
	sta e_att3+2
	sta e_att4+2
	iny
	lda (cluster_addy), y
	sta e_att1+0
	sta e_att2+0
	sta e_att3+0
	sta e_att4+0
	iny
	lda (cluster_addy), y
	sta e_att1+3
	sta e_att2+3
	sta e_att3+3
	sta e_att4+3
	iny
	lda (cluster_addy), y
	sta e_att_next_x
	iny
	lda (cluster_addy), y
	sta e_att_next_which
	iny
	lda (cluster_addy), y
	sta e_att_next_y
	iny
	lda (cluster_addy), y
	sta e_att_damage
	iny
	lda (cluster_addy), y
	sta e_att_counter
	sta e_att_counter2
		lda e_att_next_which
		and #$81
		cmp #$81
		bne :+
			lda #$38
			sta e_com_tly
:
	lda ls_have
	beq :+
		cmp #$81
		beq :+
			iny
			lda (cluster_addy), y
			sta cur_behind6+0
			iny
			lda (cluster_addy), y
			sta cur_behind6+3
			lda #$2f
			sta cur_behind6+1
:	rts

enemy_att_table:
	.byte 242,228,214,200,186,172,158,144,130,116,102,88,74,60,46,32,18,0

shake_table:
	.byte $00,$02,$fe,$02,$fe,$02,$fe,$02,$fe,$02,$fe,$02,$fe,$02,$fe


fill_hp_stam_combat:
	ldx #$00
@do_more:
	lda h0, x
	beq @done_health
		cmp #$0b
		bcc @increase_x
			bne :+
			lda #$09
			sta h0, x
			bne @increase_x
:		lda #$0a
		sta h0, x
@increase_x:
	inx
	cpx p_health_max
	bne @do_more
@done_health:
	ldx #$00
	lda #$0d
:	sta m0, x
	inx
	cpx p_stam_max
	bne :-
	rts

enough_stam_test:
	lda p_anim_state
	cmp #$0b
	bne not_escaping
		ldx p_stam_max
		dex
		lda m0, x
		bne :+
			lda #$00
			sta p_anim_state
			jsr p_battle_anim
			rts
:
		ldx #$00
		txa
:		sta m0, x
		inx
		cpx #$08
		bne :-
		rts
not_escaping:
	ldy #$00
	ldx #$00
:	lda m0, x
	beq :+
		inx
		iny
		bne :-
:	sty temp_8bit_3
	lda temp_8bit_3
	cmp p_stam_cost
	bcs :+
		lda #$00
		sta p_anim_state
		jsr p_battle_anim
		rts
:
	ldx #$08
:	dex
	lda m0, x
	bne :+
		beq :-
:	lda #$00
	sta m0, x
	dec p_stam_cost
	bne :--

	lda p_anim_state
	cmp #$0c
	bne :+
		ldx enemy_choice
		lda #$01
		sta enemy_clue, x
		sta p_clu_used
:

	lda p_anim_state
	cmp #$09
	bne :+
		lda #$01
		sta p_str_used
		bne :++
:	lda p_anim_state
	cmp #$0a
	bne :+
		lda #$01
		sta p_adr_used
:

	lda p_anim_state
	bne :+
		rts
:	cmp #$05
	bcc do_hero_build
		cmp #$09
		bcs check_dead_first
			rts
check_dead_first:
	cmp #$0d
	bne do_hero_build
		rts
do_hero_build:

	jsr hero_build_sfx
	rts

	rts

stamina_replenish:
	lda p_anim_state
	beq :+
		rts
:
	ldx p_stam_max
	dex
	lda m0, x
	beq :+
		rts
:	dec p_stam_ticker
	bne @still_ticking
		ldx #$00
:		lda m0, x
		bne :+++
			lda #$0d
			sta m0, x
	lda p_str_used
	beq :+
		lda #$50
		bne :++
:	lda #$78
:	sta p_stam_ticker
			rts
:		inx
		cpx p_stam_max
		bne :----
@still_ticking:
	rts


e_block_rand_table:
	.byte 231,206,181,157,133,107,81,57,26,0
e_block_00:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00
e_block_10:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$01, $00,$00,$00
e_block_20:
	.byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01, $00,$00,$00
e_block_30:
	.byte $00,$01,$00,$00,$00,$01,$00,$00,$00,$01, $00,$00,$00
e_block_40:
	.byte $00,$01,$00,$00,$01,$00,$01,$00,$00,$01, $00,$00,$00
e_block_50:
	.byte $00,$01,$00,$01,$00,$01,$00,$01,$00,$01, $00,$00,$00

e_block_lo:
	.byte <e_block_00,<e_block_10,<e_block_20,<e_block_30,<e_block_40,<e_block_50
e_block_hi:
	.byte >e_block_00,>e_block_10,>e_block_20,>e_block_30,>e_block_40,>e_block_50

which_e_block_test:
	lda e_block_test
	beq @not_blocking_already
		rts
@not_blocking_already:
	lda p_anim_state
	cmp #$01
	bcs :+
		rts
:	cmp #$05
	bcc :+
		rts
:
			ldy #$ff
:			iny
			lda seed4
			cmp e_block_rand_table, y
			bcc :-
	ldx e_percent_block
	lda e_block_lo, x
	sta temp_16bit_2+0
	lda e_block_hi, x
	sta temp_16bit_2+1

	lda (temp_16bit_2), y
	beq :+
		lda #$01
		sta enemy_cluster
		jsr e_battle_anim
		lda p_anim_count
		sta e_att_counter2
:	lda #$01
		sta e_block_test
	rts

subtract_manual:
	lda man0+2
	cmp #$30
	bne :+
		lda man0+1
		cmp #$30
		bne :+
			lda man0+0
			cmp #$30
			bne :+
				rts
:
	lda man0+2
	sec
	sbc #$01
	sta man0+2
	cmp #$2f
	bne @done_sub
		lda #$39
		sta man0+2
		lda man0+1
		sec
		sbc #$01
		sta man0+1
		cmp #$2f
		bne @done_sub
			lda #$39
			sta man0+1
			lda man0+0
			sec
			sbc #$01
			sta man0+0
			cmp #$2f
			bne @done_sub
				lda #$30
				sta man0+0
@done_sub:
	rts

add_manual:
	lda man0+2
	cmp #$38
	bne :+
		lda man0+1
		cmp #$36
		bne :+
			lda man0+0
			cmp #$37
			bne :+
				rts
:

	lda man0+2
	clc
	adc #$01
	sta man0+2
	cmp #$3a
	bne @done_sub
		lda #$30
		sta man0+2
		lda man0+1
		clc
		adc #$01
		sta man0+1
		cmp #$3a
		bne @done_sub
			lda #$30
			sta man0+1
			lda man0+0
			clc
			adc #$01
			sta man0+0
			cmp #$3a
			bne @done_sub
				lda #$30
				sta man0+0
@done_sub:
	rts


rand_steps_tbl:
.byte 192,128,64,0
rand_steps_get:
.byte $05,$07,$08,$09

btl_win:
	ldx boss_offset
	beq :+
		lda bosses
		clc
		adc boss_hexnum, x
		sta bosses
		lda #$00
		sta enemy_choice
		sta boss_offset
		sta boss_switch
:

		lda map_y
		cmp #$05
		bne :++
			lda map_x
			cmp #$09
			bcs :+
				jmp :++
:			cmp #$0c
			bcs :+
				jmp :+++
:
			ldx #$ff
:			inx
			lda nmi_num
			cmp rand_steps_tbl, x
			bcc :-
				lda rand_steps_get, x
				sta the_steps
:
	jsr all_sprites_gone
	lda e_num_manuals
	and #$0f
	clc
	adc #$30
	sta temp_8bit_1
	lda games+11
	and #$c0
	beq :+
		lda e_num_manuals
		beq :+
			inc temp_8bit_1
			inc temp_8bit_1
:
	lda e_num_manuals
	ror
	ror
	ror
	ror
	and #$0f
	clc
	adc #$30
	sta temp_8bit_2
	
	rts

loop_btl_setup_rtn:
	dec temp_8bit_1
	bne not_rtn_btl
	jsr fill_hp_stam_combat
	ldx #$00
	txa
:	sta btl_letters, x			; STARTS AT $720
	inx
	cpx #$65
	bne :-
			ldx #$00
			lda #$0f
:			sta pal_address, x
			inx
			cpx #$20
			bne :-
			jsr nmi_wait
			lda #$00
			sta $2000
			sta save2000
			sta $2001
			sta save2001
			jmp regrab_chr
not_rtn_btl:
	jmp end_loop




