.segment "BANK16"
end_chars0:
.incbin "i\bank16\end_characters0.chr"
end_chars1:
.incbin "i\bank16\end_characters1.chr"

end_name:
.incbin "i\bank16\end_name_test.nam"
end_results:
.incbin "i\bank16\end_results_test.nam"
end_family:
.incbin "i\bank16\end_fam.nam"

enemy_health:
.byte $32,       $35,       $34,        $33,       $36,       $38
.byte $34,       $37,       $38,        $35,       $36,       $38
.byte $34,       $36,       $38,        $34,       $36,       $35
.byte $34,       $35,       $38,        $35,       $35,       $37
.byte $33,       $34,       $37,        $35,       $34,       $38
.byte $33,       $37,       $38,        $34,       $37,       $38
.byte $34,       $36,       $38,        $34,       $37,       $38
.byte $36,       $37,       $38,        $37,       $38,       $38
.byte $38,       $30,       $30,        $30,       $00,       $00
.byte $00
enemy_stamina:
.byte $36,       $37,       $36,        $34,       $36,       $36
.byte $37,       $38,       $36,        $35,       $36,       $36
.byte $34,       $34,       $34,        $34,       $34,       $34
.byte $34,       $34,       $36,        $36,       $35,       $35
.byte $35,       $36,       $36,        $36,       $36,       $36
.byte $35,       $33,       $33,        $35,       $36,       $36
.byte $36,       $36,       $36,        $35,       $35,       $35
.byte $34,       $34,       $35,        $35,       $35,       $35
.byte $35,       $35,       $35,        $35,       $00,       $00
.byte $00
enemy_block:
.byte $00,       $32,       $32,        $00,       $00,       $00
.byte $00,       $32,       $32,        $00,       $32,       $32
.byte $31,       $32,       $32,        $31,       $00,       $32
.byte $31,       $31,       $32,        $00,       $32,       $31
.byte $31,       $31,       $32,        $31,       $31,       $35
.byte $00,       $00,       $00,        $00,       $32,       $32
.byte $00,       $32,       $32,        $00,       $32,       $32
.byte $00,       $32,       $32,        $33,       $33,       $33
.byte $33,       $34,       $34,        $35,       $00,       $00
.byte $00
enemy_manuals:
.byte $01,       $04,       $05,        $02,       $04,       $05
.byte $04,       $05,       $06,        $01,       $05,       $05
.byte $02,       $04,       $04,        $01,       $07,       $04
.byte $05,       $05,       $05,        $03,       $04,       $04
.byte $02,       $03,       $04,        $04,       $04,       $04
.byte $03,       $05,       $05,        $02,       $05,       $06
.byte $03,       $04,       $05,        $03,       $05,       $05
.byte $04,       $05,       $06,        $10,       $15,       $20
.byte $20,       $25,       $30,        $30,       $00,       $00
.byte $00
enemy_offset_tester:
.byte $00,       $01,       $02,        $03,       $04,       $05
.byte $06,       $07,       $08,        $09,       $0a,       $0b
.byte $0c,       $0d,       $0e,        $10,       $0f,       $11
.byte $12,       $13,       $14,        $15,       $16,       $17
.byte $18,       $19,       $1a,        $1b,       $1c,       $1d
.byte $1e,       $1f,       $20,        $21,       $22,       $23
.byte $24,       $25,       $26,        $27,       $28,       $29
.byte $2a,       $2b,       $2c,        $32,       $2f,       $33
.byte $30,       $2e,       $2d,        $31,       $00,       $00
.byte $00
enemy_nm_lo:
.byte <casual_nm,<larper_nm,<pcgame_nm, <review_nm,<critic_nm,<youtub_nm	; $00,$05
.byte <gamerg_nm,<boothb_nm,<cospla_nm, <seller_nm,<resell_nm,<vendor_nm	; $06,$0b
.byte <hobbyi_nm,<collec_nm,<trader_nm, <lurker_nm,<bullys_nm,<trolls_nm	; $0c,$11
.byte <profit_nm,<pirate_nm,<scamme_nm, <newbie_nm,<hacker_nm,<brewer_nm	; $12,$17
.byte <fright_nm,<phanto_nm,<ghosts_nm, <fabric_nm,<reprod_nm,<devver_nm	; $18,$1d
.byte <pakrat_nm,<scaven_nm,<hoarde_nm, <fleaes_nm,<dealer_nm,<auctio_nm	; $1e,$23
.byte <buyers_nm,<hunter_nm,<sniper_nm, <social_nm,<modera_nm,<admins_nm	; $24,$29
.byte <preser_nm,<histor_nm,<revisi_nm, <strong_nm,<ddoggy_nm,<octops_nm	; $2a,$2f
.byte <rrobby_nm,<ggenie_nm,<lblock_nm, <shadow_nm,<karnov_nm,<andand_nm	; $30,$35
.byte <charac_nm	; $36
enemy_nm_hi:
.byte >casual_nm,>larper_nm,>pcgame_nm, >review_nm,>critic_nm,>youtub_nm
.byte >gamerg_nm,>boothb_nm,>cospla_nm, >seller_nm,>resell_nm,>vendor_nm
.byte >hobbyi_nm,>collec_nm,>trader_nm, >lurker_nm,>bullys_nm,>trolls_nm
.byte >profit_nm,>pirate_nm,>scamme_nm, >newbie_nm,>hacker_nm,>brewer_nm
.byte >fright_nm,>phanto_nm,>ghosts_nm, >fabric_nm,>reprod_nm,>devver_nm
.byte >pakrat_nm,>scaven_nm,>hoarde_nm, >fleaes_nm,>dealer_nm,>auctio_nm
.byte >buyers_nm,>hunter_nm,>sniper_nm, >social_nm,>modera_nm,>admins_nm
.byte >preser_nm,>histor_nm,>revisi_nm, >strong_nm,>ddoggy_nm,>octops_nm
.byte >rrobby_nm,>ggenie_nm,>lblock_nm, >shadow_nm,>karnov_nm,>andand_nm
.byte >charac_nm


enemy_pl_lo:
.byte <casual_pl,<larper_pl,<pcgame_pl, <review_pl,<critic_pl,<youtub_pl
.byte <gamerg_pl,<boothb_pl,<cospla_pl, <seller_pl,<resell_pl,<vendor_pl
.byte <hobbyi_pl,<collec_pl,<trader_pl, <lurker_pl,<bullys_pl,<trolls_pl
.byte <profit_pl,<pirate_pl,<scamme_pl, <newbie_pl,<hacker_pl,<brewer_pl
.byte <fright_pl,<phanto_pl,<ghosts_pl, <fabric_pl,<reprod_pl,<devver_pl
.byte <pakrat_pl,<scaven_pl,<hoarde_pl, <fleaes_pl,<dealer_pl,<auctio_pl
.byte <buyers_pl,<hunter_pl,<sniper_pl, <social_pl,<modera_pl,<admins_pl
.byte <preser_pl,<histor_pl,<revisi_pl, <strong_pl,<ddoggy_pl,<octops_pl
.byte <rrobby_pl,<ggenie_pl,<lblock_pl, <shadow_pl,<karnov_pl,<andand_pl
.byte <charac_pl
enemy_pl_hi:
.byte >casual_pl,>larper_pl,>pcgame_pl, >review_pl,>critic_pl,>youtub_pl
.byte >gamerg_pl,>boothb_pl,>cospla_pl, >seller_pl,>resell_pl,>vendor_pl
.byte >hobbyi_pl,>collec_pl,>trader_pl, >lurker_pl,>bullys_pl,>trolls_pl
.byte >profit_pl,>pirate_pl,>scamme_pl, >newbie_pl,>hacker_pl,>brewer_pl
.byte >fright_pl,>phanto_pl,>ghosts_pl, >fabric_pl,>reprod_pl,>devver_pl
.byte >pakrat_pl,>scaven_pl,>hoarde_pl, >fleaes_pl,>dealer_pl,>auctio_pl
.byte >buyers_pl,>hunter_pl,>sniper_pl, >social_pl,>modera_pl,>admins_pl
.byte >preser_pl,>histor_pl,>revisi_pl, >strong_pl,>ddoggy_pl,>octops_pl
.byte >rrobby_pl,>ggenie_pl,>lblock_pl, >shadow_pl,>karnov_pl,>andand_pl
.byte >charac_pl



enemy_stnd_lo:
.byte <casual_stnd,<larper_stnd,<pcgame_stnd, <review_stnd,<critic_stnd,<youtub_stnd
.byte <gamerg_stnd,<boothb_stnd,<cospla_stnd, <seller_stnd,<resell_stnd,<vendor_stnd
.byte <hobbyi_stnd,<collec_stnd,<trader_stnd, <lurker_stnd,<bullys_stnd,<trolls_stnd
.byte <profit_stnd,<pirate_stnd,<scamme_stnd, <newbie_stnd,<hacker_stnd,<brewer_stnd
.byte <fright_stnd,<phanto_stnd,<ghosts_stnd, <fabric_stnd,<reprod_stnd,<devver_stnd
.byte <pakrat_stnd,<scaven_stnd,<hoarde_stnd, <fleaes_stnd,<dealer_stnd,<auctio_stnd
.byte <buyers_stnd,<hunter_stnd,<sniper_stnd, <social_stnd,<modera_stnd,<admins_stnd
.byte <preser_stnd,<histor_stnd,<revisi_stnd, <strong_stnd,<ddoggy_stnd,<octops_stnd
.byte <rrobby_stnd,<ggenie_stnd,<lblock_stnd, <shadow_stnd,<karnov_stnd,<andand_stnd
.byte <charac_stnd
enemy_stnd_hi:
.byte >casual_stnd,>larper_stnd,>pcgame_stnd, >review_stnd,>critic_stnd,>youtub_stnd
.byte >gamerg_stnd,>boothb_stnd,>cospla_stnd, >seller_stnd,>resell_stnd,>vendor_stnd
.byte >hobbyi_stnd,>collec_stnd,>trader_stnd, >lurker_stnd,>bullys_stnd,>trolls_stnd
.byte >profit_stnd,>pirate_stnd,>scamme_stnd, >newbie_stnd,>hacker_stnd,>brewer_stnd
.byte >fright_stnd,>phanto_stnd,>ghosts_stnd, >fabric_stnd,>reprod_stnd,>devver_stnd
.byte >pakrat_stnd,>scaven_stnd,>hoarde_stnd, >fleaes_stnd,>dealer_stnd,>auctio_stnd
.byte >buyers_stnd,>hunter_stnd,>sniper_stnd, >social_stnd,>modera_stnd,>admins_stnd
.byte >preser_stnd,>histor_stnd,>revisi_stnd, >strong_stnd,>ddoggy_stnd,>octops_stnd
.byte >rrobby_stnd,>ggenie_stnd,>lblock_stnd, >shadow_stnd,>karnov_stnd,>andand_stnd
.byte >charac_stnd

enemy_loc_lo:
.byte <casual_loc,<larper_loc,<pcgame_loc, <review_loc,<critic_loc,<youtub_loc
.byte <gamerg_loc,<boothb_loc,<cospla_loc, <seller_loc,<resell_loc,<vendor_loc
.byte <hobbyi_loc,<collec_loc,<trader_loc, <lurker_loc,<bullys_loc,<trolls_loc
.byte <profit_loc,<pirate_loc,<scamme_loc, <newbie_loc,<hacker_loc,<brewer_loc
.byte <fright_loc,<phanto_loc,<ghosts_loc, <fabric_loc,<reprod_loc,<devver_loc
.byte <pakrat_loc,<scaven_loc,<hoarde_loc, <fleaes_loc,<dealer_loc,<auctio_loc
.byte <buyers_loc,<hunter_loc,<sniper_loc, <social_loc,<modera_loc,<admins_loc
.byte <preser_loc,<histor_loc,<revisi_loc, <strong_loc,<ddoggy_loc,<octops_loc
.byte <rrobby_loc,<ggenie_loc,<lblock_loc, <shadow_loc,<ddoggy_loc,<octops_loc
.byte <rrobby_loc
enemy_loc_hi:
.byte >casual_loc,>larper_loc,>pcgame_loc, >review_loc,>critic_loc,>youtub_loc
.byte >gamerg_loc,>boothb_loc,>cospla_loc, >seller_loc,>resell_loc,>vendor_loc
.byte >hobbyi_loc,>collec_loc,>trader_loc, >lurker_loc,>bullys_loc,>trolls_loc
.byte >profit_loc,>pirate_loc,>scamme_loc, >newbie_loc,>hacker_loc,>brewer_loc
.byte >fright_loc,>phanto_loc,>ghosts_loc, >fabric_loc,>reprod_loc,>devver_loc
.byte >pakrat_loc,>scaven_loc,>hoarde_loc, >fleaes_loc,>dealer_loc,>auctio_loc
.byte >buyers_loc,>hunter_loc,>sniper_loc, >social_loc,>modera_loc,>admins_loc
.byte >preser_loc,>histor_loc,>revisi_loc, >strong_loc,>ddoggy_loc,>octops_loc
.byte >rrobby_loc,>ggenie_loc,>lblock_loc, >shadow_loc,>ddoggy_loc,>octops_loc
.byte >rrobby_loc

casual_loc:
.byte "     WORLD-SILO    "
larper_loc:
.byte "        WORLD      "
pcgame_loc:
.byte "    GREENS-PLANT   "
review_loc:
.byte "     WORLD-SILO    "
critic_loc:
.byte "        SLUMS      "
youtub_loc:
.byte "    GREENS-PLANT   "
gamerg_loc:
.byte "        WORLD      "
boothb_loc:
.byte "      JUNKYARD     "
cospla_loc:
.byte "       PALACE      "
seller_loc:
.byte "        WORLD      "
resell_loc:
.byte "      JUNKYARD     "
vendor_loc:
.byte " WORLD-CAVE-PALACE "
hobbyi_loc:
.byte "     WORLD-SEWER   "
collec_loc:
.byte "        WORLD      "
trader_loc:
.byte "CONSTRUCTION-PALACE"
lurker_loc:
.byte "        SEWER      "
bullys_loc:
.byte "     WORLD-TRACK   "
trolls_loc:
.byte "      SNOW-SHIP    "
profit_loc:
.byte "    WORLD-STADIUM  "
pirate_loc:
.byte "        SHIP       "
scamme_loc:
.byte " WORLD-MINE-PALACE "
newbie_loc:
.byte "        WORLD      "
hacker_loc:
.byte "     WORLD-SNOW    "
brewer_loc:
.byte "STADIUM-CAVE-PALACE"
fright_loc:
.byte "        SEWER      "
phanto_loc:
.byte "    SHIP-STADIUM   "
ghosts_loc:
.byte "  CAVE-MINE-PALACE "
fabric_loc:
.byte "     WORLD-SHIP    "
reprod_loc:
.byte "        WORLD      "
devver_loc:
.byte " WORLD-GREENS-PLANT"
pakrat_loc:
.byte "        WORLD      "
scaven_loc:
.byte "    WORLD-STADIUM  "
hoarde_loc:
.byte "CONSTRUCTION-PALACE"
fleaes_loc:
.byte "     WORLD-SILO    "
dealer_loc:
.byte "      JUNKYARD     "
auctio_loc:
.byte "     MINE-PALACE   "
buyers_loc:
.byte "        WORLD      "
hunter_loc:
.byte "        WORLD      "
sniper_loc:
.byte "       PALACE      "
social_loc:
.byte "        WORLD      "
modera_loc:
.byte "        SLUMS      "
admins_loc:
.byte "    CONSTRUCTION   "
preser_loc:
.byte "     WORLD-SNOW    "
histor_loc:
.byte "        SLUMS      "
revisi_loc:
.byte "       PALACE      "
strong_loc:
.byte "       BIG TOP     "
ddoggy_loc:
.byte "        POND       "
octops_loc:
.byte "        SHIP       "
rrobby_loc:
.byte "      JUNKYARD     "
ggenie_loc:
.byte "        CAVE       "
lblock_loc:
.byte "    CONSTRUCTION   "
shadow_loc:
.byte "       PALACE      "






andand_stnd:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
casual_stnd:
larper_stnd:
pcgame_stnd:
.byte $00,$bc,$00
.byte $00,$cc,$cd
.byte $00,$dc,$dd
.byte $00,$ec,$ed
.byte $00,$fc,$fd
review_stnd:
critic_stnd:
youtub_stnd:
.byte $b9,$ba,$00
.byte $c9,$ca,$cb
.byte $d9,$da,$db
.byte $e9,$ea,$eb
.byte $f9,$fa,$fb
gamerg_stnd:
boothb_stnd:
cospla_stnd:
.byte $00,$be,$bf
.byte $00,$ce,$cf
.byte $00,$de,$df
.byte $00,$ee,$ef
.byte $00,$fe,$ff
seller_stnd:
resell_stnd:
vendor_stnd:
.byte $00,$b2,$b3
.byte $00,$c2,$c3
.byte $00,$d2,$d3
.byte $00,$e2,$e3
.byte $00,$f2,$f3
hobbyi_stnd:
collec_stnd:
trader_stnd:
.byte $00,$b4,$b5
.byte $00,$c4,$c5
.byte $00,$d4,$d5
.byte $00,$e4,$e5
.byte $a0,$f4,$f5
bullys_stnd:
lurker_stnd:
trolls_stnd:
.byte $00,$00,$00
.byte $c6,$c7,$c8
.byte $d6,$d7,$d8
.byte $e6,$e7,$e8
.byte $f6,$f7,$f8
pirate_stnd:
.byte $00,$b0,$b1
.byte $00,$c0,$c1
.byte $00,$d0,$d1
.byte $00,$e0,$e1
.byte $00,$f0,$f1
profit_stnd:
scamme_stnd:
.byte $00,$b6,$b7
.byte $00,$c0,$c1
.byte $00,$d0,$d1
.byte $00,$e0,$e1
.byte $00,$f0,$f0
newbie_stnd:
hacker_stnd:
brewer_stnd:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$85
.byte $00,$94,$95
.byte $a3,$a4,$a5
fright_stnd:
phanto_stnd:
ghosts_stnd:
.byte $00,$00,$00
.byte $00,$6a,$b8
.byte $00,$bb,$bd
.byte $00,$00,$00
.byte $00,$00,$00
fabric_stnd:
.byte $00,$00,$6c
.byte $00,$7b,$7c
.byte $00,$00,$8c
.byte $00,$7a,$9c
.byte $00,$8a,$ac
reprod_stnd:
devver_stnd:
.byte $00,$00,$6c
.byte $00,$7b,$7c
.byte $00,$00,$8c
.byte $9a,$9b,$9c
.byte $aa,$ab,$ac
pakrat_stnd:
scaven_stnd:
hoarde_stnd:
.byte $00,$6e,$6f
.byte $7d,$7e,$7f
.byte $8d,$8e,$8f
.byte $9d,$9e,$9f
.byte $ad,$ae,$af
fleaes_stnd:
dealer_stnd:
auctio_stnd:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$81,$82
.byte $00,$91,$92
.byte $00,$a1,$a2
buyers_stnd:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$60,$61
.byte $00,$70,$74
.byte $72,$83,$84
hunter_stnd:
sniper_stnd:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $62,$63,$64
.byte $00,$73,$74
.byte $72,$83,$84
social_stnd:
modera_stnd:
admins_stnd:
.byte $65,$66,$67
.byte $75,$76,$77
.byte $00,$86,$87
.byte $00,$96,$97
.byte $00,$a6,$a7
preser_stnd:
histor_stnd:
revisi_stnd:
.byte $00,$68,$69
.byte $00,$78,$79
.byte $00,$88,$89
.byte $00,$98,$99
.byte $00,$a8,$a9
strong_stnd:
.byte $00,$0e,$0f
.byte $90,$1e,$1f
.byte $2d,$2e,$2f
.byte $00,$0c,$0d
.byte $1b,$1c,$1d
ddoggy_stnd:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $18,$19,$1a
.byte $28,$29,$2a
.byte $27,$2b,$2c
octops_stnd:
.byte $00,$10,$11
.byte $12,$13,$14
.byte $15,$16,$17
.byte $20,$21,$22
.byte $23,$24,$25
rrobby_stnd:
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$00,$00
.byte $00,$6b,$6d
.byte $00,$71,$80
ggenie_stnd:
.byte $00,$60,$61
.byte $00,$62,$63
.byte $00,$64,$65
.byte $00,$66,$67
.byte $00,$68,$69
lblock_stnd:
.byte $00,$00,$6a
.byte $00,$00,$6a
.byte $00,$00,$6a
.byte $00,$00,$6a
.byte $6a,$6a,$6a
shadow_stnd:
.byte $00,$20,$00
.byte $21,$22,$23
.byte $24,$25,$26
.byte $27,$28,$29
.byte $2a,$2b,$2c
karnov_stnd:
.byte $00,$0c,$00
.byte $0d,$0e,$0f
.byte $1d,$1e,$1f
.byte $2d,$2e,$2f
.byte $6b,$6c,$6d
charac_stnd:
.byte $00,$10,$00
.byte $11,$12,$13
.byte $14,$15,$16
.byte $17,$18,$19
.byte $1a,$1b,$1c





nilene_nm:
.byte "    ???     "
casual_nm:
.byte "CASUAL GAMER"
larper_nm:
.byte "   LARPER   "
pcgame_nm:
.byte "  PC GAMER  "
review_nm:
.byte "  REVIEWER  "
critic_nm:
.byte "   CRITIC   "
youtub_nm:
.byte "  YOUTUBER  "
gamerg_nm:
.byte " GAMER GIRL "
boothb_nm:
.byte " BOOTH BABE "
cospla_nm:
.byte "  COSPLAYER "
seller_nm:
.byte "   SELLER   "
resell_nm:
.byte "  RESELLER  "
vendor_nm:
.byte "   VENDOR   "
hobbyi_nm:
.byte "  HOBBYIST  "
collec_nm:
.byte "  COLLECTOR "
trader_nm:
.byte "   TRADER   "
bullys_nm:
.byte "    BULLY   "
lurker_nm:
.byte "   LURKER   "
trolls_nm:
.byte "    TROLL   "
profit_nm:
.byte "  PROFITEER "
pirate_nm:
.byte "   PIRATE   "
scamme_nm:
.byte "   SCAMMER  "
newbie_nm:
.byte "   NEWBIE   "
hacker_nm:
.byte "   HACKER   "
brewer_nm:
.byte "   BREWER   "
fright_nm:
.byte "   FRIGHT   "
phanto_nm:
.byte "   PHANTOM  "
ghosts_nm:
.byte "    GHOST   "
fabric_nm:
.byte " FABRICATOR "
reprod_nm:
.byte " REPRODUCER "
devver_nm:
.byte "  RESEALER  "
pakrat_nm:
.byte "  PACK RAT  "
scaven_nm:
.byte "  SCAVENGER "
hoarde_nm:
.byte "   HOARDER  "
fleaes_nm:
.byte "    FLEA    "
dealer_nm:
.byte "   DEALER   "
auctio_nm:
.byte " AUCTIONEER "
buyers_nm:
.byte "    BUYER   "
hunter_nm:
.byte "   HUNTER   "
sniper_nm:
.byte "   SNIPER   "
social_nm:
.byte "  SOCIALITE "
modera_nm:
.byte "  MODERATOR "
admins_nm:
.byte "    ADMIN   "
preser_nm:
.byte "  PRESERVER "
histor_nm:
.byte "  HISTORIAN "
revisi_nm:
.byte " REVISIONIST"
strong_nm:
.byte "  STRONGMAN "
ddoggy_nm:
.byte " MR. PEEPERS"
octops_nm:
.byte " CAP'N OCTO "
rrobby_nm:
.byte "    R.O.B   "
ggenie_nm:
.byte " GAME GENIE "
lblock_nm:
.byte "   L-BLOCK  "
shadow_nm:
.byte " THE SHADOW "
karnov_nm:
.byte "   KARNOV   "
andand_nm:
.byte " ... AND... "
charac_nm:
.byte "    YOU!    "





casual_pl:
.byte $35,$27,$16
larper_pl:
.byte $17,$27,$1a
pcgame_pl:
.byte $37,$17,$1c
review_pl:
.byte $30,$16,$00
critic_pl:
.byte $27,$09,$1b
youtub_pl:
.byte $36,$06,$17
gamerg_pl:
.byte $07,$17,$04
boothb_pl:
.byte $27,$13,$18
cospla_pl:
.byte $37,$1a,$15
seller_pl:
.byte $37,$30,$13
resell_pl:
.byte $30,$27,$00
vendor_pl:
.byte $07,$30,$16
hobbyi_pl:
.byte $17,$27,$21
collec_pl:
.byte $36,$00,$05
trader_pl:
.byte $37,$06,$30
bullys_pl:
.byte $36,$14,$30
lurker_pl:
.byte $22,$16,$1b
trolls_pl:
.byte $29,$17,$00
profit_pl:
.byte $27,$30,$1b
pirate_pl:
.byte $37,$17,$0c
scamme_pl:
.byte $35,$18,$15
newbie_pl:
.byte $3b,$18,$07
hacker_pl:
.byte $37,$00,$11
brewer_pl:
.byte $27,$16,$12
fright_pl:
.byte $03,$06,$03
phanto_pl:
.byte $28,$06,$03
ghosts_pl:
.byte $30,$06,$03
fabric_pl:
.byte $35,$26,$05
reprod_pl:
.byte $37,$17,$19
devver_pl:
.byte $27,$17,$30
pakrat_pl:
.byte $17,$07,$24
scaven_pl:
.byte $37,$27,$06
hoarde_pl:
.byte $30,$16,$1a
fleaes_pl:
.byte $35,$30,$18
dealer_pl:
.byte $37,$30,$00
auctio_pl:
.byte $2c,$30,$17
buyers_pl:
.byte $37,$0c,$28
hunter_pl:
.byte $37,$17,$21
sniper_pl:
.byte $17,$00,$1b
social_pl:
.byte $37,$11,$27
modera_pl:
.byte $36,$1a,$17
admins_pl:
.byte $30,$00,$10
preser_pl:
.byte $37,$30,$1c
histor_pl:
.byte $17,$30,$28
revisi_pl:
.byte $30,$00,$13
lblock_pl:
.byte $07,$17,$27
ggenie_pl:
.byte $37,$25,$05
ddoggy_pl:
.byte $06,$16,$30
rrobby_pl:
.byte $10,$00,$16
shadow_pl:
.byte $00,$00,$00
strong_pl:
.byte $37,$17,$1a
octops_pl:
.byte $13,$23,$30
karnov_pl:
.byte $37,$17,$16
andand_pl:
.byte $0f,$0f,$0f
charac_pl:
.byte $37,$17,$11

loop_results_t0:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda #$00
		sta map_x
		sta map_y
		lda #$33
		sta p_pos
		lda #$01
		sta p_anim_state
		lda #$02
		sta do_save
		lda #<loop_play
		sta loop_pointer+0
		lda #>loop_play
		sta loop_pointer+1
		jmp loop_play
@no_a:
	jmp end_loop

nmi_results_t0:
	
	jmp end_nmi


nmi_cast_write:
	ldx temp_8bit_1
	lda enemy_nm_lo, x
	sta temp_16bit_1+0
	lda enemy_nm_hi, x
	sta temp_16bit_1+1
	lda enemy_pl_lo, x
	sta temp_16bit_2+0
	lda enemy_pl_hi, x
	sta temp_16bit_2+1
	lda enemy_stnd_lo, x
	sta temp_16bit_3+0
	lda enemy_stnd_hi, x
	sta temp_16bit_3+1
	cpx #$34
	bne :+
		lda games+31
		cmp #$81
		beq :+
			lda #<nilene_nm
			sta temp_16bit_1+0
			lda #>nilene_nm
			sta temp_16bit_1+1
			lda #<shadow_pl
			sta temp_16bit_2+0
			lda #>shadow_pl
			sta temp_16bit_2+1
:
	ldy #$00
	lda #$2d
	sta $2006
	lda #$0a
	sta $2006
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #12
	bne :-

	ldy #$00
:	lda (temp_16bit_2), y
	sta pal_address+17, y
	iny
	cpy #3
	bne :-

	ldy #$00
	ldx #$00
:	lda (temp_16bit_3), y
	sta p_com_tlt, x
	inx
	inx
	inx
	inx
	iny
	cpy #15
	bne :-
				lda #<nmi_stats_write
				sta nmi_pointer+0
				lda #>nmi_stats_write
				sta nmi_pointer+1
	jmp end_nmi

nmi_stats_write:
	ldx temp_8bit_1
	lda enemy_offset_tester, x
	tay
	lda enemy_clue, y
	bne :+
		jmp nmi_stats_questions
:
	lda #$2e
	sta $2006
	lda #$4d
	sta $2006
	lda enemy_health, x
	cmp #$30
	bne :+
		lda #$31
		sta $2007
		bne :++
:	lda #$00
	sta $2007
:	lda enemy_health, x
	sta $2007

	lda #$00
	sta $2007
	sta $2007

	lda enemy_block, x
	sta $2007
	lda #$30
	sta $2007

	lda #$2e
	sta $2006
	lda #$8e
	sta $2006
	lda enemy_stamina, x
	sta $2007

	lda #$00
	sta $2007
	sta $2007

	lda enemy_manuals, x
	and #$30
	beq :+
		lda enemy_manuals, x
		and #$30
		ror
		ror
		ror
		ror
		and #$0f
		clc
		adc #$30
		sta $2007
		lda enemy_manuals, x
		and #$0f
		clc
		adc #$30
		sta $2007
		jmp :++
:	lda #$00
	sta $2007
	lda enemy_manuals, x
	clc
	adc #$30
	sta $2007
:
				lda #<nmi_cast_loc
				sta nmi_pointer+0
				lda #>nmi_cast_loc
				sta nmi_pointer+1

	jmp end_nmi


nmi_stats_questions:
	lda #$2e
	sta $2006
	lda #$4d
	sta $2006
	lda #$3f
	sta $2007
	sta $2007

	lda #$00
	sta $2007
	sta $2007

	lda #$3f
	sta $2007
	sta $2007

	lda #$2e
	sta $2006
	lda #$8e
	sta $2006
	lda #$3f
	sta $2007

	lda #$00
	sta $2007
	sta $2007
	lda #$3f
	sta $2007
	sta $2007

	lda #<nmi_cast_loc
	sta nmi_pointer+0
	lda #>nmi_cast_loc
	sta nmi_pointer+1
	jmp end_nmi

nmi_cast_loc:	;#$13
	ldx temp_8bit_1
	lda enemy_loc_lo, x
	sta temp_16bit_1+0
	lda enemy_loc_hi, x
	sta temp_16bit_1+1
	lda #$2f
	sta $2006
	lda #$06
	sta $2006
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #$13
	bne :-

				lda #<nmi_wait_spr_up
				sta nmi_pointer+0
				lda #>nmi_wait_spr_up
				sta nmi_pointer+1

	jmp end_nmi


nmi_wait_spr_up:
	lda temp_8bit_1
	cmp #$31
	bcc :+
		lda #%10011011
		bne :++
:	lda #%10000011
:	sta $2000
	sta save2000
	lda #$4f
	sta p_com_tly
	lda #$74
	sta p_com_tlx

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

	lda #$00
	sta temp_8bit_2
				lda #<nmi_cast_clear
				sta nmi_pointer+0
				lda #>nmi_cast_clear
				sta nmi_pointer+1
	jmp end_nmi

nmi_cast_clear:
	dec temp_8bit_2
	bne not_ready_to_clear
		lda #$2d
		sta $2006
		lda #$4a
		sta $2006
		ldy #$00
		tya
:		sta $2007
		iny
		cpy #12
		bne :-

		ldx #$00
		ldy #$00
:		lda #$ef
		sta p_com_tly, x
		lda #$00
		sta p_com_tla, x
		inx
		inx
		inx
		inx
		iny
		cpy #15
		bne :-

		lda #$0f
		sta pal_address+17
		sta pal_address+18
		sta pal_address+19
		inc temp_8bit_1
			lda temp_8bit_1
			cmp #$34
			bcc :+
				lda #$0f
				sta pal_address+9
:			lda temp_8bit_1
			cmp #$37
			bne :+
				lda #$03
				sta temp_16bit_2+1
				lda #$00
				sta temp_16bit_2+0
				lda #$28
				sta nametable
				lda #<nmi_fam
				sta nmi_pointer+0
				lda #>nmi_fam
				sta nmi_pointer+1
				jmp end_nmi
:				lda #<nmi_cast_write
				sta nmi_pointer+0
				lda #>nmi_cast_write
				sta nmi_pointer+1
not_ready_to_clear:
	jmp end_nmi


nmi_fam:

	dec temp_16bit_2+0
	bne :+
		dec temp_16bit_2+1
		bne :+
				lda #$24
				sta nametable
				lda #<loop_results_t0
				sta loop_pointer+0
				lda #>loop_results_t0
				sta loop_pointer+1
				lda #<nmi_results_t0
				sta nmi_pointer+0
				lda #>nmi_results_t0
				sta nmi_pointer+1
:	jmp end_nmi

loop_the_flicker:
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
		jmp end_loop
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
	jmp end_loop


erase_name:
	ldx #$00
	txa
:	sta $2007
	sta $2007
	sta $2007
	sta $2007
	dex
	bne :-
	rts

loop_end_clear:
	ldy #$00
	ldx #$00
	lda #$00
:	sta $262, x
	sta $662, x
	inx
	inx
	inx
	inx
	iny
	cpy #15
	bne :-
	lda #$20
	sta $2006
	lda #$00
	sta $2006
	jsr erase_name
	lda #$28
	sta $2006
	lda #$00
	sta $2006
	jsr erase_name

	ldy #$00
	ldx #$04
	lda #<end_name
	sta temp_16bit_1+0
	lda #>end_name
	sta temp_16bit_1+1
	lda #$2c
	sta $2006
	lda #$00
	sta $2006
:	lda (temp_16bit_1),y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-

	ldy #$00
	ldx #$04
	lda #<end_results
	sta temp_16bit_1+0
	lda #>end_results
	sta temp_16bit_1+1
	lda #$24
	sta $2006
	lda #$00
	sta $2006
:	lda (temp_16bit_1),y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-

	ldy #$00
	ldx #$04
	lda #<end_family
	sta temp_16bit_1+0
	lda #>end_family
	sta temp_16bit_1+1
	lda #$28
	sta $2006
	lda #$00
	sta $2006
:	lda (temp_16bit_1),y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-

	lda #<end_chars0
	sta temp_16bit_1
	lda #>end_chars0
	sta temp_16bit_1+1
 	ldy #0
	sty $2006
	sty $2006
	ldx #32
:	lda (temp_16bit_1), y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-

	jsr games_counter
	jsr clues_counter
	jsr perip_counter
	jsr healt_counter
	jsr stami_counter
	jsr final_percenter

	lda #$30
	sta pal_address+1
	sta pal_address+2
	sta pal_address+9
	sta pal_address+10
	sta pal_address+15
	lda #$0c
	sta pal_address+3
	lda #$27
	sta pal_address+5
	lda #$2a
	sta pal_address+13
	lda #$16
	sta pal_address+14
				lda #$00
				sta scroll_y
				sta scroll_x
				sta $2005
				sta $2005
				lda #$20
				sta nametable
	lda #$01
	sta is_beaten

	lda #%10100000
	sta $2000
	sta save2000
	lda #%00011110
	sta $2001
	sta save2001
				lda #$00
				sta temp_8bit_1
				lda #<loop_empty
				sta loop_pointer+0
				lda #>loop_empty
				sta loop_pointer+1
				lda #<nmi_end_words
				sta nmi_pointer+0
				lda #>nmi_end_words
				sta nmi_pointer+1
	jsr ender_beep
	jmp end_loop


nmi_end_words:
	ldx temp_8bit_1
	lda end_line_hi, x
	sta temp_16bit_1+1
	lda end_line_lo, x
	sta temp_16bit_1+0
	lda end_ppu_hi, x
	sta $2006
	lda end_ppu_lo, x
	sta $2006
	ldy #$00
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #27
	bne :-
		inx
		stx temp_8bit_1
		cpx #10
		bne :+
				lda #$00
				sta temp_16bit_2+0
				lda #$04
				sta temp_16bit_2+1
				lda #<nmi_end_wait
				sta nmi_pointer+0
				lda #>nmi_end_wait
				sta nmi_pointer+1
:
	jmp end_nmi

nmi_end_wait:
	dec temp_16bit_2+0
	bne :+
		dec temp_16bit_2+1
		bne :+
			lda #$2c
			sta nametable
			lda #$00
			sta temp_8bit_1
			sta temp_8bit_2
			lda #<loop_the_flicker
			sta loop_pointer+0
			lda #>loop_the_flicker
			sta loop_pointer+1
			lda #<nmi_cast_write
			sta nmi_pointer+0
			lda #>nmi_cast_write
			sta nmi_pointer+1
:
	jmp end_nmi

end_line_lo:
.byte <end_line00, <end_line01, <end_line02, <end_line03, <end_line04
.byte <end_line05, <end_line06, <end_line07, <end_line08, <end_line09
end_line_hi:
.byte >end_line00, >end_line01, >end_line02, >end_line03, >end_line04
.byte >end_line05, >end_line06, >end_line07, >end_line08, >end_line09
end_ppu_lo:
.byte $82,         $c2,         $02,         $42,         $82
.byte $c2,         $02,         $42,         $82,         $c2
end_ppu_hi:
.byte $20,         $20,         $21,         $21,         $21
.byte $21,         $22,         $22,         $22,         $22
end_line00:
.byte "AS YOU WALK AWAY FROM THE  "
end_line01:
.byte "EVIL OVERLORD'S TOWER, YOU "
end_line02:
.byte "SPIN AROUND AND LOOK AT HIM"
end_line03:
.byte "ONE LAST TIME. HE GIVES YOU"
end_line04:
.byte "A WINK AND A NOD, AND YOU  "
end_line05:
.byte "CRACK A SMILE KNOWING THAT "
end_line06:
.byte "YOUR ADVENTURE IS FINALLY  "
end_line07:
.byte "AT AN END.                 "
end_line08:
.byte "                           "
end_line09:
.byte "     CONGRATULATIONS!      "


games_last_ones:
.byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39
.byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39
.byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39
.byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39
.byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39
.byte $30
games_last_tens:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31
.byte $32,$32,$32,$32,$32,$32,$32,$32,$32,$32,$33,$33,$33,$33,$33,$33,$33,$33,$33,$33
.byte $34,$34,$34,$34,$34,$34,$34,$34,$34,$34,$35,$35,$35,$35,$35,$35,$35,$35,$35,$35
.byte $36,$36,$36,$36,$36,$36,$36,$36,$36,$36,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37
.byte $38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$39,$39,$39,$39,$39,$39,$39,$39,$39,$39
.byte $30
games_counter:
	ldx #$00
	stx temp_8bit_3
:	lda games, x
	beq :+
		inc temp_8bit_3
:	inx
	cpx #32
	bne :--

	ldx temp_8bit_3
	lda #$25
	sta $2006
	lda #$75
	sta $2006
	lda games_last_tens, x
	sta $2007
	lda games_last_ones, x
	sta $2007
	rts

clues_counter:
	ldx #$00
	stx temp_16bit_4+1
:	lda enemy_clue, x
	beq :+
		inc temp_16bit_4+1
:	inx
	cpx #52
	bne :--

	ldx temp_16bit_4+1
	lda #$25
	sta $2006
	lda #$b5
	sta $2006
	lda games_last_tens, x
	sta $2007
	lda games_last_ones, x
	sta $2007

	lda temp_8bit_3
	clc
	adc temp_16bit_4+1
	sta temp_8bit_3
	rts

perip_ones:
.byte $30,$31,$32,$33,$34,$35
perip_counter:
	ldx #$00
	stx temp_8bit_4
:	lda pg_have, x
	beq :+
		inc temp_8bit_4
:	inx
	cpx #5
	bne :--

	ldx temp_8bit_4
	lda #$25
	sta $2006
	lda #$f7
	sta $2006
	lda games_last_ones, x
	sta $2007

	lda temp_8bit_3
	clc
	adc temp_8bit_4
	sta temp_8bit_3
	rts

healt_ones:
.byte $30,$30,$30,$30,$30,$30,$31,$32,$33,$34,$35
healt_adder:
.byte $00,$00,$00,$00,$00,$00,$01,$02,$03,$04,$05
healt_counter:
	ldx p_health_max
	lda temp_8bit_3
	clc
	adc healt_adder, x
	sta temp_8bit_3

	lda #$26
	sta $2006
	lda #$37
	sta $2006
	lda healt_ones, x
	sta $2007
	rts

stami_ones:
.byte $30,$30,$30,$30,$31,$32,$33,$34,$35
stami_adder:
.byte $00,$00,$00,$00,$01,$02,$03,$04,$05
stami_counter:
	ldx p_stam_max
	lda temp_8bit_3
	clc
	adc stami_adder, x
	sta temp_8bit_3

	lda #$26
	sta $2006
	lda #$77
	sta $2006
	lda stami_ones, x
	sta $2007

	lda goal_offset
	cmp #$f3
	bne :++
		inc temp_8bit_3
		lda #$26
		sta $2006
		lda #$a7
		sta $2006
		ldx #$00
:		lda invinc, x
		sta $2007
		inx
		cpx #(done_inv - invinc)
		bne :-
:	rts

invinc:
.byte "INVINCIBILITY     ",$0a
done_inv:

;end_percent_ones:
;.byte $30
;.byte $32,$34,$37,$39,$31,$33,$35,$37,$30,$32,$34,$36,$38,$30,$33,$35,$37,$39,$31,$33,$36,$38,$30
;.byte $32,$34,$37,$39,$31,$33,$35,$37,$30,$32,$34,$36,$38,$30,$33,$35,$37,$39,$31,$33,$36,$38,$30
;end_percent_tens:
;.byte $00
;.byte $00,$00,$00,$00,$31,$31,$31,$31,$32,$32,$32,$32,$32,$33,$33,$33,$33,$33,$34,$34,$34,$34,$35
;.byte $35,$35,$35,$35,$36,$36,$36,$36,$37,$37,$37,$37,$37,$38,$38,$38,$38,$38,$39,$39,$39,$39,$30
;end_percent_huns:
;.byte $00
;.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
;.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$31
final_percenter:
	ldx temp_8bit_3
	lda #$27
	sta $2006
	lda #$16
	sta $2006
	cpx #100
	bne :+
		lda #$31
		bne :++
:	lda #$00
:	sta $2007
	lda games_last_tens, x
	sta $2007
	lda games_last_ones, x
	sta $2007
	rts



