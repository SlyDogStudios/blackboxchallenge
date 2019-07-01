.segment "BANK30"

game_chr_lo_lo:
	.byte <game_chr0_lo, <game_chr1_lo, <game_chr2_lo, <game_chr3_lo
game_chr_lo_hi:
	.byte >game_chr0_lo, >game_chr1_lo, >game_chr2_lo, >game_chr3_lo
game_chr_hi_lo:
	.byte <game_chr0_hi, <game_chr1_hi, <game_chr2_hi, <game_chr3_hi
game_chr_hi_hi:
	.byte >game_chr0_hi, >game_chr1_hi, >game_chr2_hi, >game_chr3_hi
game_tiles_lo:
	.byte $c0,$d0,$e0,$f0
game_tiles_hi:
	.byte $0c,$0d,$0e,$0f
game_chr0_lo:
	.byte <game8_0chr, <game0_0chr, <game8_0chr, <game9_0chr, <game1_0chr
	.byte <game0_0chr, <game2_0chr, <game5_0chr, <game7_0chr, <game2_0chr
	.byte <game3_0chr, <game5_0chr, <game5_0chr, <game1_0chr, <game0_0chr
	.byte <game4_0chr, <game0_0chr, <game0_0chr, <game8_0chr, <game5_0chr
	.byte <game9_0chr, <game0_0chr, <game2_0chr, <game0_0chr, <game7_0chr
	.byte <game3_0chr, <game4_0chr, <game7_0chr, <game6_0chr, <game8_0chr
	.byte <game9_0chr, <game9_0chr, <game8_0chr
game_chr0_hi:
	.byte >game8_0chr, >game0_0chr, >game8_0chr, >game9_0chr, >game1_0chr
	.byte >game0_0chr, >game2_0chr, >game5_0chr, >game7_0chr, >game2_0chr
	.byte >game3_0chr, >game5_0chr, >game5_0chr, >game1_0chr, >game0_0chr
	.byte >game4_0chr, >game0_0chr, >game0_0chr, >game8_0chr, >game5_0chr
	.byte >game9_0chr, >game0_0chr, >game2_0chr, >game0_0chr, >game7_0chr
	.byte >game3_0chr, >game4_0chr, >game7_0chr, >game6_0chr, >game8_0chr
	.byte >game9_0chr, >game9_0chr, >game8_0chr

game_chr1_lo:
	.byte <game8_1chr, <game0_1chr, <game8_1chr, <game9_1chr, <game1_1chr
	.byte <game0_1chr, <game2_1chr, <game5_1chr, <game7_1chr, <game2_1chr
	.byte <game3_1chr, <game5_1chr, <game5_1chr, <game1_1chr, <game0_1chr
	.byte <game4_1chr, <game0_1chr, <game0_1chr, <game8_1chr, <game5_1chr
	.byte <game9_1chr, <game0_1chr, <game2_1chr, <game0_1chr, <game7_1chr
	.byte <game3_1chr, <game4_1chr, <game7_1chr, <game6_1chr, <game8_1chr
	.byte <game9_1chr, <game9_1chr, <game8_1chr
game_chr1_hi:
	.byte >game8_1chr, >game0_1chr, >game8_1chr, >game9_1chr, >game1_1chr
	.byte >game0_1chr, >game2_1chr, >game5_1chr, >game7_1chr, >game2_1chr
	.byte >game3_1chr, >game5_1chr, >game5_1chr, >game1_1chr, >game0_1chr
	.byte >game4_1chr, >game0_1chr, >game0_1chr, >game8_1chr, >game5_1chr
	.byte >game9_1chr, >game0_1chr, >game2_1chr, >game0_1chr, >game7_1chr
	.byte >game3_1chr, >game4_1chr, >game7_1chr, >game6_1chr, >game8_1chr
	.byte >game9_1chr, >game9_1chr, >game8_1chr

game_chr2_lo:
	.byte <game8_2chr, <game0_2chr, <game8_2chr, <game9_2chr, <game1_2chr
	.byte <game0_2chr, <game2_2chr, <game5_2chr, <game7_2chr, <game2_2chr
	.byte <game3_2chr, <game5_2chr, <game5_2chr, <game1_2chr, <game0_2chr
	.byte <game4_2chr, <game0_2chr, <game0_2chr, <game8_2chr, <game5_2chr
	.byte <game9_2chr, <game0_2chr, <game2_2chr, <game0_2chr, <game7_2chr
	.byte <game3_2chr, <game4_2chr, <game7_2chr, <game6_2chr, <game8_2chr
	.byte <game9_2chr, <game9_2chr, <game8_2chr
game_chr2_hi:
	.byte >game8_2chr, >game0_2chr, >game8_2chr, >game9_2chr, >game1_2chr
	.byte >game0_2chr, >game2_2chr, >game5_2chr, >game7_2chr, >game2_2chr
	.byte >game3_2chr, >game5_2chr, >game5_2chr, >game1_2chr, >game0_2chr
	.byte >game4_2chr, >game0_2chr, >game0_2chr, >game8_2chr, >game5_2chr
	.byte >game9_2chr, >game0_2chr, >game2_2chr, >game0_2chr, >game7_2chr
	.byte >game3_2chr, >game4_2chr, >game7_2chr, >game6_2chr, >game8_2chr
	.byte >game9_2chr, >game9_2chr, >game8_2chr

game_chr3_lo:
	.byte <game8_3chr, <game0_3chr, <game8_3chr, <game9_3chr, <game1_3chr
	.byte <game0_3chr, <game2_3chr, <game5_3chr, <game7_3chr, <game2_3chr
	.byte <game3_3chr, <game5_3chr, <game5_3chr, <game1_3chr, <game0_3chr
	.byte <game4_3chr, <game0_3chr, <game0_3chr, <game8_3chr, <game5_3chr
	.byte <game9_3chr, <game0_3chr, <game2_3chr, <game0_3chr, <game7_3chr
	.byte <game3_3chr, <game4_3chr, <game7_3chr, <game6_3chr, <game8_3chr
	.byte <game9_3chr, <game9_3chr, <game8_3chr
game_chr3_hi:
	.byte >game8_3chr, >game0_3chr, >game8_3chr, >game9_3chr, >game1_3chr
	.byte >game0_3chr, >game2_3chr, >game5_3chr, >game7_3chr, >game2_3chr
	.byte >game3_3chr, >game5_3chr, >game5_3chr, >game1_3chr, >game0_3chr
	.byte >game4_3chr, >game0_3chr, >game0_3chr, >game8_3chr, >game5_3chr
	.byte >game9_3chr, >game0_3chr, >game2_3chr, >game0_3chr, >game7_3chr
	.byte >game3_3chr, >game4_3chr, >game7_3chr, >game6_3chr, >game8_3chr
	.byte >game9_3chr, >game9_3chr, >game8_3chr

game0_0chr:
.incbin "i\bank30\game0_0.chr"
game0_1chr:
.incbin "i\bank30\game0_1.chr"
game0_2chr:
.incbin "i\bank30\game0_2.chr"
game0_3chr:
.incbin "i\bank30\game0_3.chr"

game1_0chr:
.incbin "i\bank30\game1_0.chr"
game1_1chr:
.incbin "i\bank30\game1_1.chr"
game1_2chr:
.incbin "i\bank30\game1_2.chr"
game1_3chr:
.incbin "i\bank30\game1_3.chr"

game2_0chr:
.incbin "i\bank30\game2_0.chr"
game2_1chr:
.incbin "i\bank30\game2_1.chr"
game2_2chr:
.incbin "i\bank30\game2_2.chr"
game2_3chr:
.incbin "i\bank30\game2_3.chr"

game3_0chr:
.incbin "i\bank30\game3_0.chr"
game3_1chr:
.incbin "i\bank30\game3_1.chr"
game3_2chr:
.incbin "i\bank30\game3_2.chr"
game3_3chr:
.incbin "i\bank30\game3_3.chr"

game4_0chr:
.incbin "i\bank30\game4_0.chr"
game4_1chr:
.incbin "i\bank30\game4_1.chr"
game4_2chr:
.incbin "i\bank30\game4_2.chr"
game4_3chr:
.incbin "i\bank30\game4_3.chr"

game5_0chr:
.incbin "i\bank30\game5_0.chr"
game5_1chr:
.incbin "i\bank30\game5_1.chr"
game5_2chr:
.incbin "i\bank30\game5_2.chr"
game5_3chr:
.incbin "i\bank30\game5_3.chr"

game6_0chr:
.incbin "i\bank30\game6_0.chr"
game6_1chr:
.incbin "i\bank30\game6_1.chr"
game6_2chr:
.incbin "i\bank30\game6_2.chr"
game6_3chr:
.incbin "i\bank30\game6_3.chr"

game7_0chr:
.incbin "i\bank30\game7_0.chr"
game7_1chr:
.incbin "i\bank30\game7_1.chr"
game7_2chr:
.incbin "i\bank30\game7_2.chr"
game7_3chr:
.incbin "i\bank30\game7_3.chr"

game8_0chr:
.incbin "i\bank30\game8_0.chr"
game8_1chr:
.incbin "i\bank30\game8_1.chr"
game8_2chr:
.incbin "i\bank30\game8_2.chr"
game8_3chr:
.incbin "i\bank30\game8_3.chr"

game9_0chr:
.incbin "i\bank30\game9_0.chr"
game9_1chr:
.incbin "i\bank30\game9_1.chr"
game9_2chr:
.incbin "i\bank30\game9_2.chr"
game9_3chr:
.incbin "i\bank30\game9_3.chr"

