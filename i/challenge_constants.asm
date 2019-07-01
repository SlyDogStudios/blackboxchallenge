; remap some punctuation for ascii
.charmap $21,$3e	; !
.charmap $22,$5b	; "
.charmap $27,$5c	; '
.charmap $2b,$5d	; +
.charmap $2c,$3c	; ,
.charmap $2d,$5e	; -
.charmap $2e,$3d	; .
.charmap $20,$00	; (space)
.charmap $26,$3b	; &
.charmap $2a,$5f	; *
.charmap $23,$40	; #

nilene	= $00	; used as a placeholder so I know what to replace ("nil enemy")

casual	= $00
larper	= $01
pcgame	= $02
review	= $03
critic	= $04
youtub	= $05
gamerg	= $06
boothb	= $07
cospla	= $08
seller	= $09
resell	= $0a
vendor	= $0b
hobbyi	= $0c
collec	= $0d
trader	= $0e
bullys	= $0f
lurker	= $10
trolls	= $11
profit	= $12
pirate	= $13
scamme	= $14
newbie	= $15
hacker	= $16
brewer	= $17
fright	= $18
phanto	= $19
ghosts	= $1a
fabric	= $1b
reprod	= $1c
reseal	= $1d
pakrat	= $1e
scaven	= $1f
hoarde	= $20
fleaes	= $21
dealer	= $22
auctio	= $23
buyers	= $24
hunter	= $25
sniper	= $26
social	= $27
modera	= $28
admins	= $29
preser	= $2a
histor	= $2b
revisi	= $2c
lblock	= $2d
ggenie	= $2e
ddoggy	= $2f
rrobby	= $30
shadow	= $31
strong	= $32
octops	= $33



; Constants
a_punch				=	$01
b_punch				=	$02
select_punch		=	$04
start_punch			=	$08
up_punch			=	$10
down_punch			=	$20
left_punch			=	$40
right_punch			=	$80
up_left				=	$50
up_right			=	$90
down_left			=	$60
down_right			=	$a0


pal_address			= $00d0
FlashRamPage		= $0700

OAM_ram				=	$200
cursor				=	$0200

cur_behind0			=	$0204
cur_behind1			=	$0208
cur_behind2			=	$020c
cur_behind3			=	$0210
cur_behind4			=	$0214
cur_behind5			=	$0218
cur_behind6			=	$021c

p_topleft			=	$0220
p_topright			=	$0224
npc_topleft			=	$0228
npc_topright		=	$022c
npc2_topleft		=	$0230
npc2_topright		=	$0234
npc3_topleft		=	$0238
npc3_topright		=	$023c

off_tl				=	$0630
off_tr				=	$0634
off_bl				=	$0638
off_br				=	$063c
def_tl				=	$0640
def_tr				=	$0644
def_bl				=	$0648
def_br				=	$064c
spe_tl				=	$0650
spe_tr				=	$0654
spe_bl				=	$0658
spe_br				=	$065c

p_com_tly			=	$0660
p_com_tlt			=	$0661
p_com_tla			=	$0662
p_com_tlx			=	$0663
p_com_tmy			=	$0664
p_com_tmt			=	$0665
p_com_tma			=	$0666
p_com_tmx			=	$0667
p_com_try			=	$0668
p_com_trt			=	$0669
p_com_tra			=	$066a
p_com_trx			=	$066b

p_com_lm1y			=	$066c
p_com_lm1t			=	$066d
p_com_lm1a			=	$066e
p_com_lm1x			=	$066f
p_com_mm1y			=	$0670
p_com_mm1t			=	$0671
p_com_mm1a			=	$0672
p_com_mm1x			=	$0673
p_com_rm1y			=	$0674
p_com_rm1t			=	$0675
p_com_rm1a			=	$0676
p_com_rm1x			=	$0677

p_com_lm2y			=	$0678
p_com_lm2t			=	$0679
p_com_lm2a			=	$067a
p_com_lm2x			=	$067b
p_com_mm2y			=	$067c
p_com_mm2t			=	$067d
p_com_mm2a			=	$067e
p_com_mm2x			=	$067f
p_com_rm2y			=	$0680
p_com_rm2t			=	$0681
p_com_rm2a			=	$0682
p_com_rm2x			=	$0683

p_com_lm3y			=	$0684
p_com_lm3t			=	$0685
p_com_lm3a			=	$0686
p_com_lm3x			=	$0687
p_com_mm3y			=	$0688
p_com_mm3t			=	$0689
p_com_mm3a			=	$068a
p_com_mm3x			=	$068b
p_com_rm3y			=	$068c
p_com_rm3t			=	$068d
p_com_rm3a			=	$068e
p_com_rm3x			=	$068f

p_com_bly			=	$0690
p_com_blt			=	$0691
p_com_bla			=	$0692
p_com_blx			=	$0693
p_com_bmy			=	$0694
p_com_bmt			=	$0695
p_com_bma			=	$0696
p_com_bmx			=	$0697
p_com_bry			=	$0698
p_com_brt			=	$0699
p_com_bra			=	$069a
p_com_brx			=	$069b

p_att1				=	$069c
p_att1t				=	$069d

e_com_tly			=	$06a0
e_com_tlt			=	$06a1
e_com_tla			=	$06a2
e_com_tlx			=	$06a3
e_com_tmy			=	$06a4
e_com_tmt			=	$06a5
e_com_tma			=	$06a6
e_com_tmx			=	$06a7
e_com_try			=	$06a8
e_com_trt			=	$06a9
e_com_tra			=	$06aa
e_com_trx			=	$06ab
e_com_lm1y			=	$06ac
e_com_lm1t			=	$06ad
e_com_lm1a			=	$06ae
e_com_lm1x			=	$06af
e_com_mm1y			=	$06b0
e_com_mm1t			=	$06b1
e_com_mm1a			=	$06b2
e_com_mm1x			=	$06b3
e_com_rm1y			=	$06b4
e_com_rm1t			=	$06b5
e_com_rm1a			=	$06b6
e_com_rm1x			=	$06b7
e_com_lm2y			=	$06b8
e_com_lm2t			=	$06b9
e_com_lm2a			=	$06ba
e_com_lm2x			=	$06bb
e_com_mm2y			=	$06bc
e_com_mm2t			=	$06bd
e_com_mm2a			=	$06be
e_com_mm2x			=	$06bf
e_com_rm2y			=	$06c0
e_com_rm2t			=	$06c1
e_com_rm2a			=	$06c2
e_com_rm2x			=	$06c3
e_com_lm3y			=	$06c4
e_com_lm3t			=	$06c5
e_com_lm3a			=	$06c6
e_com_lm3x			=	$06c7
e_com_mm3y			=	$06c8
e_com_mm3t			=	$06c9
e_com_mm3a			=	$06ca
e_com_mm3x			=	$06cb
e_com_rm3y			=	$06cc
e_com_rm3t			=	$06cd
e_com_rm3a			=	$06ce
e_com_rm3x			=	$06cf
e_com_bly			=	$06d0
e_com_blt			=	$06d1
e_com_bla			=	$06d2
e_com_blx			=	$06d3
e_com_bmy			=	$06d4
e_com_bmt			=	$06d5
e_com_bma			=	$06d6
e_com_bmx			=	$06d7
e_com_bry			=	$06d8
e_com_brt			=	$06d9
e_com_bra			=	$06da
e_com_brx			=	$06db
e_att1				=	$06dc
e_att2				=	$06e0
e_att3				=	$06e4
e_att4				=	$06e8
clu1				=	$06ec
clu2				=	$06f0
clu3				=	$06f4
clu4				=	$06f8


npc_dialogs			=	$0400
;store_items			=	$0474
enemy_clue			=	$0480
store_items			=	$04b4
game_hitens			=	$04c0
game_hiones			=	$04e0



dialog_text			=	$0500
store_meta16		=	$0500
store_ppu_lo		=	$0511
store_ppu_hi		=	$051d
store_attr_lo		=	$0529
store_attr_hi		=	$0535
; next one 539
store_coll0			=	$05dc
pal_save			=	$05e0
;next one 520



store_top_16		=	$0500
store_bot_16		=	$0525
search_pos			=	$0550
search_dir			=	$0558
search_lo			=	$0560
search_hi			=	$0568
search_p_pos		=	$0570

sds_thingy			=	$0580

save700page			=	$05d0


bg_ram				=	$0600
dain_game			=	$06f0
dain_xtra			=	$06f1
dain_peri			=	$06f2

p_topleft_save		=	$700

menu_x_sign			=	$720
menu_x_numb			=	$721
menu_y_sign			=	$722
menu_y_numb			=	$723
got_a_game			=	$724

;combat_stuff*****************************
btl_letters			=	$720
e_stat_import		=	$730
e_stam_dec			=	$731
e_stam_perm			=	$732
e_stam_tick			=	$733
e_stam_tick_perm	=	$734
e_percent_block		=	$735
e_num_attacks		=	$736
e_num_manuals		=	$737
e_health_bar		=	$740
e_stamina_bar		=	$750
e_att_next_x		=	$760
e_att_next_which	=	$761
e_att_next_y		=	$762
e_att_damage		=	$763
e_att_counter		=	$764
e_att_counter2		=	$765

shake_offset		=	$770
e_shake_offset		=	$771
p_stam_cost			=	$772
p_next_x			=	$773
p_next_which		=	$774
p_anim_count_other	=	$775
p_damage_done		=	$776
p_stam_ticker		=	$777
e_block_test		=	$778
p_str_used			=	$780
p_adr_used			=	$781
p_mul_used			=	$782
p_qdr_used			=	$783
p_clu_used			=	$784


;combat_stuff^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

g_left				=	$700
g_right				=	$701
g_top				=	$702
g_bot				=	$703
g_counter1			=	$704
g_counter2			=	$705
g_counter3			=	$706
e1_left				=	$707
e2_left				=	$708
e3_left				=	$709
e4_left				=	$70a
e5_left				=	$70b
e6_left				=	$70c
e1_right			=	$70d
e2_right			=	$70e
e3_right			=	$70f
e4_right			=	$710
e5_right			=	$711
e6_right			=	$712
e1_top				=	$713
e2_top				=	$714
e3_top				=	$715
e4_top				=	$716
e5_top				=	$717
e6_top				=	$718
e1_bot				=	$719
e2_bot				=	$71a
e3_bot				=	$71b
e4_bot				=	$71c
e5_bot				=	$71d
e6_bot				=	$71e
e1_dir				=	$71f
e2_dir				=	$720
e3_dir				=	$721
e4_dir				=	$722
e5_dir				=	$723
e6_dir				=	$724
e1_hit				=	$725
e2_hit				=	$726
e3_hit				=	$727
e4_hit				=	$728
e5_hit				=	$729
e6_hit				=	$72a
s_left				=	$72b
s_right				=	$72c
s_top				=	$72d
s_bot				=	$72e
e1_spd_lo			=	$72f
e2_spd_lo			=	$730
e3_spd_lo			=	$731
e4_spd_lo			=	$732
e5_spd_lo			=	$733
e6_spd_lo			=	$734
game_quit			=	$735
game_orig_win		=	$736
game_tens			=	$737
game_ones			=	$738
game_misses			=	$739
game_xtra0			=	$73a
game_xtra1			=	$73b
game_xtra2			=	$73c
game_xtra3			=	$73d


bball_speed1		=	$00c0
bball_speed2		=	$00e0
bball_speed3		=	$0100
bball_speed4		=	$0140
popeye_heart		=	$0010
popeye_vert			=	$0020
dkjr_vine			=	$0040
dkjr_chomp			=	$0080

npc_move_hi			=	$0080

; minigame sprite constants
; -------------------------
game_spr_start		=	$218

