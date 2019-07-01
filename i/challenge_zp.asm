games:				.res 32
pg_have:			.res 1
pp_have:			.res 1
uf_have:			.res 1
db_have:			.res 1
ls_have:			.res 1
h0:					.res 10
m0:					.res 8
man0:				.res 3
p_health_max:		.res 1
p_stam_max:			.res 1
map_y:				.res 1
map_x:				.res 1
p_pos:				.res 1
p_anim_state:		.res 1
goal_offset:		.res 1
bosses:				.res 1
world_song:			.res 1
glitch_count:		.res 1
dain_all:			.res 1
is_beaten:			.res 1
	;  ^^^^  bytes to save (#$46)

p_anim_count:		.res 1
the_steps:			.res 1
desert_steps:		.res 1
desert_hurt:		.res 1

do_save:			.res 1
boss_offset:		.res 1
which_scroll_dir:	.res 1
p_anim_state_save:	.res 1
boss_switch:		.res 1
loop_pointer:		.res 2
nmi_pointer:		.res 2
ppu_addy:			.res 2
bank_addy:			.res 2
music_addy:			.res 2
temp_16bit_1:		.res 2
temp_16bit_2:		.res 2
temp_16bit_3:		.res 2
temp_16bit_4:		.res 2
pause_loop_addy:	.res 2
pause_nmi_addy:		.res 2
return_music:		.res 2
return_sfx:			.res 2
temp_addy2:			.res 2
p_anim_addy:		.res 2
pal_anim_addy:		.res 2

npc1_anim_addy:		.res 2
npc2_anim_addy:		.res 2
npc3_anim_addy:		.res 2
npc_offset:			.res 1
npc_offset_offset:	.res 1
npc1:				.res 3
npc_pos:			.res 3
npc_which:			.res 3
npc_anim_state:		.res 3
npc_anim_count:		.res 3
npc_move_y_n:		.res 3
npc_move_counter:	.res 3
npc_do_move:		.res 3


sprite_flicker:		.res 1

nmi_num:			.res 1
bank:				.res 1
bank_prg:			.res 1
bank_chr:			.res 1
bank_btl_save:		.res 1
seed:				.res 1
seed2:				.res 1
seed3:				.res 1
seed4:				.res 1
temp_8bit_1:		.res 1
temp_8bit_2:		.res 1
temp_8bit_3:		.res 1
temp_8bit_4:		.res 1
control_pad:		.res 1
control_old:		.res 1
scroll_y:			.res 1
scroll_x:			.res 1
nametable:			.res 1
attr_lo:			.res 1
attr_hi:			.res 1
save2000:			.res 1
save2001:			.res 1
scrn_change_type:	.res 1
dialog_type:		.res 1
quesyesno:			.res 4
music_tester:		.res 1
music_current:		.res 1

set_move:			.res 1
p_move_count:		.res 1
bike_move:			.res 1

cluster_addy:		.res 2
enemy_cluster:		.res 1 ; <---- MIGHT NOT NEED
enemy_choice:		.res 1

bg_ram_store:		.res 1
battle_incrementer:	.res 1
battle_active:		.res 1

pal_animation:		.res 1
pal_ticker:			.res 1
pal_increment:		.res 1



TargetBank:			.res 1
TargetAddress:		.res 2
SourceAddress:		.res 1
SourceAddress_h:	.res 1
ReturnBank:			.res 1


lets_train:			.res 1

