; f0=dialog done/change npc dialog number, f1=yes/no, f2=nothing extra
; f3=item (if next byte has bit 7 set, then item must be counted as NPC already acknowledging it)
; f4=game from npc, f5=game from search, f6=change for nesvc, f7=item change npc and change another npc dialog

npc_words_lo_lo:
.byte <nothingw_lo
.byte <clikword_lo,<doorword_lo,<elecword_lo,<boulderw_lo,<issaword_lo,<lunchbox_lo,<logiudic_lo,<ebishopw_lo
.byte <aluptonw_lo,<dandockw_lo,<tremblyw_lo,<siskorpw_lo,<xavier0w_lo,<djsmyl_w_lo,<lemuel_w_lo,<cow_guyw_lo
.byte <batboy00_lo,<batboy01_lo,<flowgirl_lo,<dojogy0w_lo,<blanky0w_lo,<dojogy2w_lo,<richmo_w_lo,<pinballw_lo
.byte <tinyhome_lo,<quad_csw_lo,<brundetw_lo,<jeaninew_lo,<kincl_0w_lo,<dollgrlw_lo,<junkguyw_lo,<bigtop0w_lo
.byte <efnchadw_lo
npc_words_lo_hi:
.byte >nothingw_lo
.byte >clikword_lo,>doorword_lo,>elecword_lo,>boulderw_lo,>issaword_lo,>lunchbox_lo,>logiudic_lo,>ebishopw_lo
.byte >aluptonw_lo,>dandockw_lo,>tremblyw_lo,>siskorpw_lo,>xavier0w_lo,>djsmyl_w_lo,>lemuel_w_lo,>cow_guyw_lo
.byte >batboy00_lo,>batboy01_lo,>flowgirl_lo,>dojogy0w_lo,>blanky0w_lo,>dojogy2w_lo,>richmo_w_lo,>pinballw_lo
.byte >tinyhome_lo,>quad_csw_lo,>brundetw_lo,>jeaninew_lo,>kincl_0w_lo,>dollgrlw_lo,>junkguyw_lo,>bigtop0w_lo
.byte >efnchadw_lo
npc_words_hi_lo:
.byte <nothingw_hi
.byte <clikword_hi,<doorword_hi,<elecword_hi,<boulderw_hi,<issaword_hi,<lunchbox_hi,<logiudic_hi,<ebishopw_hi
.byte <aluptonw_hi,<dandockw_hi,<tremblyw_hi,<siskorpw_hi,<xavier0w_hi,<djsmyl_w_hi,<lemuel_w_hi,<cow_guyw_hi
.byte <batboy00_hi,<batboy01_hi,<flowgirl_hi,<dojogy0w_hi,<blanky0w_hi,<dojogy2w_hi,<richmo_w_hi,<pinballw_hi
.byte <tinyhome_hi,<quad_csw_hi,<brundetw_hi,<jeaninew_hi,<kincl_0w_hi,<dollgrlw_hi,<junkguyw_hi,<bigtop0w_hi
.byte <efnchadw_hi
npc_words_hi_hi:
.byte >nothingw_hi
.byte >clikword_hi,>doorword_hi,>elecword_hi,>boulderw_hi,>issaword_hi,>lunchbox_hi,>logiudic_hi,>ebishopw_hi
.byte >aluptonw_hi,>dandockw_hi,>tremblyw_hi,>siskorpw_hi,>xavier0w_hi,>djsmyl_w_hi,>lemuel_w_hi,>cow_guyw_hi
.byte >batboy00_hi,>batboy01_hi,>flowgirl_hi,>dojogy0w_hi,>blanky0w_hi,>dojogy2w_hi,>richmo_w_hi,>pinballw_hi
.byte >tinyhome_hi,>quad_csw_hi,>brundetw_hi,>jeaninew_hi,>kincl_0w_hi,>dollgrlw_hi,>junkguyw_hi,>bigtop0w_hi
.byte >efnchadw_hi
npc_name_lo:
.byte <nothing0
.byte <clik0000,   <wooddoor,   <elecdoor,   <boulder0,   <issawor0,   <lunchb0x,   <logiudic,   <ebishop0
.byte <alupton0,   <dandock0,   <trembly0,   <siskorp0,   <xavierc0,   <djsmyl_0,   <lemuel_0,   <cowguy_0
.byte <batboy00,   <batboy01,   <flwgirl0,   <dojoguy0,   <blanky00,   <dojoguy2,   <richmon0,   <pinbguy0
.byte <tinyhom0,   <quad_cs0,   <brundet0,   <jeanine0,   <kinclgy0,   <dollgrl0,   <junkguy0,   <bigtop00
.byte <efnchad0
npc_name_hi:
.byte >nothing0
.byte >clik0000,   >wooddoor,   >elecdoor,   >boulder0,   >issawor0,   >lunchb0x,   >logiudic,   >ebishop0
.byte >alupton0,   >dandock0,   >trembly0,   >siskorp0,   >xavierc0,   >djsmyl_0,   >lemuel_0,   >cowguy_0
.byte >batboy00,   >batboy01,   >flwgirl0,   >dojoguy0,   >blanky00,   >dojoguy2,   >richmon0,   >pinbguy0
.byte >tinyhom0,   >quad_cs0,   >brundet0,   >jeanine0,   >kinclgy0,   >dollgrl0,   >junkguy0,   >bigtop00
.byte >efnchad0

nothing0:
	.byte $ff
clik0000:	; $01
	.byte "CLIK",$ff
wooddoor:	; $02
	.byte "DOOR",$ff
elecdoor:	; $03
	.byte "ELECTRIC DOOR",$ff
boulder0:	; $04
	.byte "BOULDER",$ff
issawor0:	; $05
	.byte "ISSA THE HERO",$ff
lunchb0x:	; $06
	.byte "RJ LUNCHBOX HUFF",$ff
logiudic:	; $07
	.byte "LOGIUDICE",$ff
ebishop0:	; $08
	.byte "BISHOP",$ff
alupton0:	; $09
	.byte "ALEX UPTON",$ff
dandock0:	; $0a
	.byte "DAN DOCK",$ff
trembly0:	; $0b
	.byte "JUSTIN TREMBLAY",$ff
siskorp0:	; $0c
	.byte "SINISTER SKORP",$ff
xavierc0:	; $0d
	.byte "XAVIER CONSTANTIN",$ff
djsmyl_0:	; $0e
	.byte "DJ SM",$e2,"L",$ff
lemuel_0:	; $0f
	.byte "LEMUEL",$ff
cowguy_0:	; $10
	.byte "URBAN WEST",$ff
batboy00:	; $11
	.byte "JACK",$ff
batboy01:	; $12
	.byte "GUIDO",$ff
flwgirl0:	; $13
	.byte "JILL",$ff
dojoguy0:	; $14
	.byte "BOLO",$ff
blanky00:	; $15
	.byte "",$ff
dojoguy2:	; $16
	.byte "MOON",$ff
richmon0:	; $17
	.byte "RICHMOND",$ff
pinbguy0:	; $18
	.byte "JANET",$ff
tinyhom0:	; $19
	.byte "JENNIFER",$ff
quad_cs0:	; $1a
	.byte "QUAD",$ff
brundet0:	; $1b
	.byte "JOSHUA BRUNDETT",$ff
jeanine0:	; $1c
	.byte "JEANINE",$ff
kinclgy0:	; $1d
	.byte "KINCL",$ff
dollgrl0:	; $1e
	.byte "JACKIE",$ff
junkguy0:	; $1f
	.byte "SANFORD",$ff
bigtop00:	; $20
	.byte "ELSA",$ff
efnchad0:	; $21
	.byte "CHAD",$ff

; x ISSA THE HERO
; x LUNCHBOX HUFF
; x ALEX UPTON
;  BISHOP				NESVC			
; x DAN DOCK
; x SINISTER SKORP
; x  KINCL
;   TONY ROTELLA			PRO WRESTLING	name = tony
; x ZACHARY HANEY
; x XAVIER CONSTANTIN
; x  GEEKCOM MALONEY		SMB/DK/KUNG FU	name = arthur
; x LOGIUDICE
; x LEMUEL
; x JUSTIN TREMBLAY
; x NICHOLAS ALEXANDER	-				*where you would least expect help. is classy*
;  SMYL					MARIO BROS		*write 2 overworld songs*



nothingw_lo:
.byte <nothingw0
nothingw_hi:
.byte >nothingw0
nothingw0:
.byte "***YOU'RE TOO SHY*** ***TO SPEAK WITH *** ***ANYONE AT ALL ***",$f2

clikword_lo:
.byte <clikword0,<clikword1,<clikword2,<clikword3
clikword_hi:
.byte >clikword0,>clikword1,>clikword2,>clikword3
clikword0:
.byte "HEY, IT'S ME, CLIK! I RUN YOUR COMPUTER. WHENEVER YOU WANT TO SAVE, JUST COME AND SEE ME! BESIDES THAT, JUST REMEMBER TO PLAY THE NES GAMES YOU FIND WHILE SITTING ON YOUR CHAIR DOWNSTAIRS! IT TAKES 5 POINTS TO UNLOCK AN ABILITY ON A GAME. HAVE FUN!",$f0,$01
clikword1:
.byte "DO YOU WANT TO SAVE?",$f1,$02,$03,$00,$00
clikword2:
.byte "GOTCHA! I'LL SAVE YOUR PROGRESS AFTER OUR CONVERSATION! STAY SAFE OUT THERE!",$fd,$01
clikword3:
.byte "STAY SAFE OUT THERE!",$f0,$01

doorword_lo:
.byte <doorword0,<doorword1,<doorword2,<doorword3
doorword_hi:
.byte >doorword0,>doorword1,>doorword2,>doorword3
doorword0:
.byte "UNLOCK THE DOOR?",$f1,$01,$02,$00,$00
doorword1:
.byte "YOU PICKED THE LOCK!",$f0,$00
doorword2:
.byte "IT REMAINS LOCKED.",$f0,$00
doorword3:
.byte "YOU HAVE NO TOOLS TO OPEN IT WITH.",$f0,$00

elecword_lo:
.byte <elecword0,<elecword1,<elecword2,<elecword3
elecword_hi:
.byte >elecword0,>elecword1,>elecword2,>elecword3
elecword0:
.byte "USE FRIEND CODE?",$f1,$01,$02,$00,$00
elecword1:
.byte "OPENED!",$f0,$00
elecword2:
.byte "THE DOOR STANDS FIRM",$f0,$00
elecword3:
.byte "YOU DO NOT HAVE A FRIEND CODE.",$f0,$00

boulderw_lo:
.byte <boulderw0,<boulderw1,<boulderw2,<boulderw3
boulderw_hi:
.byte >boulderw0,>boulderw1,>boulderw2,>boulderw3
boulderw0:
.byte "DESTROY BOULDER?",$f1,$01,$02,$00,$00
boulderw1:
.byte "USED THE HAMMER!",$f0,$00
boulderw2:
.byte "THE PATH IS STILL BLOCKED.",$f0,$00
boulderw3:
.byte "YOU HAVE NO WAY TO DESTROY IT.",$f0,$00


issaword_lo:
.byte <issawords0,<issawords1,<issawords2,<issawords3
issaword_hi:
.byte >issawords0,>issawords1,>issawords2,>issawords3
issawords0:
.byte "AYE, TRAVELLER, I AM ISSA, THE HERO! YOU HAVE PROBABLY HEARD OF ME.",$f1,$01,$03,$00,$00
issawords1:
.byte "THOU ART WELL VERSED IN HISTORY, I SEE!",$f0,$00
issawords2:
.byte "PLEASE TELL NO ONE OF MY SECRET, AND FARE THEE WELL, FELLOW HERO!",$f2
issawords3:
.byte "I HAVE RESCUED MORE DAMSELS IN DISTRESS THAN ALL OTHERS IN THIS LAND! I HAVE DONE SO BY USING THIS ZAPPER TO GET AN EDGE AGAINST ALL MY OPPONENTS. THAT IS WHY THESE PEOPLE MADE ME THEIR SHERIFF. THEY APPRECIATE A STRONG LEADER!",$fa,$e5,$01,<issawords4,>issawords4
issawords4:
.byte "STRANGELY ENOUGH, I GOT MY HANDS ON THIS MOST POWERFUL WEAPON BY PLAYING THIS GAME CALLED HOGAN'S ALLEY. YOU MAY HAVE IT, AND SEE IF IT WORKS FOR YOU AS WELL!",$f4,$02,$0d


lunchbox_lo:
.byte <lunchbox0,<lunchbox1,<lunchbox2
lunchbox_hi:
.byte >lunchbox0,>lunchbox1,>lunchbox2
lunchbox0:
.byte "I WOULD LOVE TO HAVE THE SOUNDTRACK FROM THE RISE OF AMONDUS ON VINYL. I HAVE HEARD THERE IS A STASH OF VINYL RECORDS STORED IN THE WESTERN CAVE. IT'S PRETTY DANGEROUS THESE DAYS, THOUGH. NO WAY AM I GOING THERE!",$f2
lunchbox1:
.byte "WHOA! YOU FOUND RISE OF AMONDUS ON VINYL?! I HEARD IT DIDN'T ACTUALLY EXIST, BUT YOU FOUND ONE?! THANK YOU! ALL I REALLY HAVE TO GIVE YOU AS THANKS IS THIS CARTRIDGE OF ICE CLIMBER.",$f4,$82,$0e
lunchbox2:
.byte "HEH. YES, IT'S TRUE THAT I NEARLY DIED FOR A DIET COKE. NOW EXCUSE ME, I NEED SOME CURRY!",$f2

logiudic_lo:
.byte <logiudic0,<logiudic1,<logiudic2,<logiudic3,<logiudic4,<logiudic5,<logiudic6,<logiudic7,<logiudic8
logiudic_hi:
.byte >logiudic0,>logiudic1,>logiudic2,>logiudic3,>logiudic4,>logiudic5,>logiudic6,>logiudic7,>logiudic8
logiudic0:
.byte "HI! I RUN GAL - THE GAMER'S ASSOCIATION OF LOUISIANA. I'M GOING TO REVOLUTIONIZE THE GAMING INDUSTRY THROUGH... GARDENING! JUST KIDDING, BUT I WILL THROUGH OTHER MEANS! ANYWAY, CAN YOU DO ME A FAVOR?",$f1,$01,$02,$00,$00
logiudic1:
.byte "EXCELLENT! I NEED TO COMPLETE A TRADE WITH JENNIFER IN THE TOWN JUST WEST OF HERE. TAKE THIS COPY OF MEGA MAN TO HER, AND COME BACK WITH ADVENTURE ISLAND.",$f7,$04,$19,$01
logiudic2:
.byte "WELL, COME BACK WHEN YOU CAN HELP OUT, AND I'LL REWARD YOU WITH SOMETHING FOR SURE.",$f0,$03
logiudic3:
.byte "READY TO HELP ME OUT?",$f1,$01,$02,$00,$00
logiudic4:
.byte "WAITING ON MY COPY OF ADVENTURE ISLAND...",$f2
logiudic5:
.byte "HM? OH GEEZ, I CAN'T BELIEVE I GAVE YOU THE WRONG VERSION OF MEGA MAN! HERE IS THE PROPER 5-SCREW VARIANT OF IT. SORRY ABOUT THAT.",$f7,$04,$19,$03
logiudic6:
.byte "WOOHOO--- DUDE, WTF? SHE WAS SUPPOSED TO GIVE ME THE OVAL SEAL VERSION OF ADVENTURE ISLAND... *SIGH* OKAY, CAN YOU TAKE THIS BACK AND GET THE CART I WAS EXPECTING?",$f7,$04,$19,$04
logiudic7:
.byte "FINALLY! I HAVE THE OVAL SEAL ADVENTURE ISLAND! I AM DEFINITELY STOKED ABOUT THIS! SINCE YOU WENT THROUGH ALL OF THAT, HERE HAVE A COPY OF DONKEY KONG 3!",$f4,$08,$06
logiudic8:
.byte "WITH ALL THIS DONE, I MAY JUST HEAD BACK TO NEW ORLEANS TO TAKE CARE OF SOME OF THE CLUBS I OWN. IT'S A THANKLESS JOB, I TELL YA!",$f2

ebishopw_lo:
.byte <bishop0,<bishop1,<bishop2
ebishopw_hi:
.byte >bishop0,>bishop1,>bishop2
bishop0:
.byte $f6,"IF YOUR NES GAMES AREN'T WORKING, DON'T BLOW INTO THE CARTS! YOU CAN GET YOUR NES RUNNING AGAIN WITH NES VIRUS CLEANER. IF YOU HAVE TROUBLE, JUST COME BACK AND SEE ME. I'LL HOOK YOU UP!",$f2
bishop1:
.byte "OH MAN, YOUR NES ACTUALLY STOPPED WORKING? OKAY, NO PROBLEM. GO BOOT THIS UP IN IT AND CLEAN THE VIRUSES OUT OF IT WITH NES VIRUS CLEANER.",$f4,$82,$1E
bishop2:
.byte "YOU SHOULD CHECK OUT OTHER HOMEBREWS BESIDES NES VIRUS CLEANER. THE INCIDENT, LEGEND OF OWLIA, HAUNTED HALLOWEEN '86... THERE ARE A HOST OF OTHER GREAT NES HOMEBREWS. TOO MANY TO LIST!",$f2

aluptonw_lo:
.byte <aupton0,<aupton1,<aupton2,<aupton3
aluptonw_hi:
.byte >aupton0,>aupton1,>aupton2,>aupton3
aupton0:
.byte "I JUST ARRIVED IN THIS TIME PERIOD NOT TOO LONG AGO, AND I LOVE IT! I AM A TIME TRAVELLER, AND I COLLECT VARIOUS GAMES FROM THEIR SPECIFIC TIME PERIOD TO GET THE BEST COPIES AVAILABLE. THEY HAVE TO LOOK NICE!",$fa,$c5,$01,<aupton4,>aupton4
aupton1:
.byte "NO LUCK FINDING A WOMAN YET? THAT IS FINE. I HAVE FAITH IN YOU!",$f2
aupton2:
.byte "JILL? THAT IS A GREAT NAME! LOVE IT! CAN'T WAIT TO MEET THIS LADY. HERE YOU GO, TAKE MY COPY OF VOLLEYBALL. STRAIGHT FROM THE 80'S AND MINTY!",$f4,$03,$1b
aupton3:
.byte "I WILL CATCH UP WITH THIS JILL LADY SOON ENOUGH.",$f2
aupton4:
.byte "THE LAST THING I HAVE TO DO BEFORE I MAKE MY NEXT LEAP IS TO MEET A WOMAN. IF YOU CAN HELP ME DO THAT, I MIGHT HAVE SOMETHING FOR YOU...",$f7,$01,$13,$01

dandockw_lo:
.byte <dandock00
dandockw_hi:
.byte >dandock00
dandock00:
.byte "DONKEY KONG ON NES? I CAN'T BE BOTHERED WITH THIS CONSOLE NONSENSE. BUT YES, I DO HAVE A COPY OF IT. IT'S SAFELY AT MY HOME, THOUGH, WITH THE REST OF MY DK COLLECTION. DEFINITELY NOT IN ANY WEIRD PLACE LIKE HIDDEN IN A SEWER. DEFINITELY NOT...",$f0,$00

tremblyw_lo:
.byte <trembl0,<trembl1,<trembl2,<trembl3,<trembl4,<trembl5,<trembl6
tremblyw_hi:
.byte >trembl0,>trembl1,>trembl2,>trembl3,>trembl4,>trembl5,>trembl6
trembl0:
.byte "YES I DO HAVE DONKEY KONG JR. MATH! BUT... IT WILL COST YOU 10 MANUALS TO GET IT. IT'S A REALLY GREAT GAME... WILL YOU PAY?",$f1,$01,$02,$00,$00
trembl1:
.byte "YOU KNOW, 10 MANUALS ISN'T ENOUGH. I NEED 80 OF THOSE BAD BOYS. I MEAN SERIOUSLY, IT IS AN AWESOME GAME!... WILL YOU PAY THAT AMOUNT?",$f1,$03,$06,$08,$05
trembl2:
.byte "THAT'S TOO BAD. COME BACK LATER IF YOU WANT IT!",$f0,$00
trembl3:
.byte "THAT'S THE SPIRIT! WELL, HERE IS YOUR COPY OF DONKEY KONG JR. MATH!",$f4,$04,$07
trembl4:
.byte "ME, GREEDY? WELL, YEAH! LIKE YOU'RE NOT GREEDY, HOARDING ALL THESE NES GAMES!",$f2
trembl5:
.byte "UHHHH... YOU DON'T HAVE ENOUGH MONEY, FACE!",$f0,$01
trembl6:
.byte "IT'S THE ONLY COPY YOU WILL COME ACROSS, SO I GUESS THAT'S UP TO YOU.",$f0,$01


siskorpw_lo:
.byte <siskorp00,<siskorp01,<siskorp02,<siskorp03
siskorpw_hi:
.byte >siskorp00,>siskorp01,>siskorp02,>siskorp03
siskorp00:
.byte "I'VE BEEN SO BUMMED OUT LATELY. I SEEM TO HAVE LOST MY SOUL! I CAN'T EVEN BRING MYSELF TO RIDE MY SPEEDBIKE BECAUSE I'M SO DEVASTATED ABOUT IT.",$f2
siskorp01:
.byte "WOW! THIS TAPE IS AMAZING! I FEEL MY SOUL CREEPING BACK INTO ME! GOOD OL' XAVIER! HEY MAN, IF YOU WANT TO LEARN TO RIDE FAST, TAKE MY COPY OF EXCITEBIKE!",$f4,$02,$09
siskorp02:
.byte "AHHHH, TO BE A FREE SPIRIT ONCE MORE!",$f2
siskorp03:
.byte "YEAH, I'M NOT FEELING MYSELF RIGHT NOW. NICE TO HEAR THAT XAVIER IS CONCERNED, THOUGH! LET HIM KNOW I'M STILL IN A FUNK.",$f7,$00,$0d,$01

xavier0w_lo:
.byte <xavierc00,<xavierc01,<xavierc02
xavier0w_hi:
.byte >xavierc00,>xavierc01,>xavierc02
xavierc00:
.byte "I'M WORRIED ABOUT MY BUDDY SINISTER SKORP. COULD YOU GO CHECK ON HIM TO SEE IF HE'S STILL IN HARD TIMES? IF YOU HAVEN'T MET HIM, HE SHOULD BE AT THE RACE TRACK.",$f7,$02,$0c,$03
xavierc01:
.byte "MAN, I FIGURED HE WOULD STILL BE IN THAT STATE OF MIND. HERE, TAKE HIM A TAPE OF MY SONG ON GUITAR. IT CAN SOOTHE -ANY- SOUL, I THINK!",$f7,$02,$0c,$01
xavierc02:
.byte "BACK TO BUSINESS AS USUAL, I SUPPOSE. GOTTA ADD TO THIS COLLECTION OF OVER 2,000 GAMES!",$f2

djsmyl_w_lo:
.byte <djsmyl0,<djsmyl1,<djsmyl2,<djsmyl3,<djsmyl4,<djsmyl5,<djsmyl6,<djsmyl7,<djsmyl8
djsmyl_w_hi:
.byte >djsmyl0,>djsmyl1,>djsmyl2,>djsmyl3,>djsmyl4,>djsmyl5,>djsmyl6,>djsmyl7,>djsmyl8
djsmyl0:
.byte "WOULD YOU LIKE TO CHANGE THE OVERWORLD MUSIC?",$f1,$01,$02,$00,$00
djsmyl1:
.byte "TRY THIS JAM!",$f9,$03,$21
djsmyl2:
.byte "RIGHT ON, COME BACK IF YOU CHANGE YOUR MIND!",$f0,$00
djsmyl3:
.byte "TRY ONE OTHER TUNE ON FOR SIZE?",$f1,$04,$05,$00,$00
djsmyl4:
.byte "ALRIIIIGHT, CHECK THIS ONE OUT!",$f9,$06,$22
djsmyl5:
.byte "NO PROBLEM. I'LL BE HERE!",$f0,$03
djsmyl6:
.byte "IS THAT SECOND SONG OKAY?",$f1,$07,$08,$00,$00
djsmyl7:
.byte "AW YEAH, GLAD YA DIG!",$f0,$06
djsmyl8:
.byte "OKAY, HERE IS THE REGULAR OVERWORLD TUNE FOR YOU. COME BACK IF YOU CHANGE YOUR MIND!",$f9,$00,$02

lemuel_w_lo:
.byte <lemuel0,<lemuel1,<lemuel2
lemuel_w_hi:
.byte >lemuel0,>lemuel1,>lemuel2
lemuel0:
.byte "GRUMBLE,GRUMBLE...",$f2
lemuel1:
.byte "I AM",$fa,$c5,$01,<lemuel7,>lemuel7
lemuel7:
.byte "ERROR.",$f0,$01
lemuel2:
.byte "WHOA, URBAN AND THE REST OF COWBOY CULTURE IS WONDERING HOW I AM? THAT'S REALLY COOL. I DON'T KNOW, I HAVE JUST FELT BUMMED OUT FOR THE LAST TWO WEEKS OR SO. I DECIDED I NEEDED SOME ALONE TIME.",$fa,$c5,$01,<lemuel3,>lemuel3
lemuel3:
.byte "FIRST, I WAS REJECTED FROM APPEARING IN FINAL FANTASY. OH, SURE, I WAS 'KIND OF' IN IT AND HAD ONE STUPID LINE. 'THE PRINCESS WAS LOOKING FOR YOU!' HURR HURR. WHAT A GYP. AND THE INTERNET REFERS TO ME AS AN INVISIBLE WOMAN... ME!",$fa,$05,$00,<lemuel4,>lemuel4
lemuel4:
.byte "THEN I GET A ROLE IN THIS GAME YOU'RE PLAYING RIGHT NOW. WHAT HAPPENS? I STILL DON'T TECHNICALLY APPEAR IN IT! I MEAN SERIOUSLY. I HAVE NO IDEA WHAT IT'S GOING TO TAKE FOR ME TO ACTUALLY BE 'SEEN' IN A GAME.",$fa,$25,$00,<lemuel5,>lemuel5
lemuel5:
.byte "I'M GIVING IT ONE MORE SHOT, AND AM REHEARSING LINES FROM ZELDA GAMES AND HOPING I GET CALLED UP FOR A SPOT IN THE CAST. IF THAT DOESN'T FALL THROUGH, I DON'T KNOW WHAT I'M GOING TO DO. JOBS ARE FEW AND FAR BETWEEN FOR CLERICS THESE DAYS.",$fa,$c5,$01,<lemuel6,>lemuel6
lemuel6:
.byte "ANYWAY, I'M JUST FRUSTRATED RIGHT NOW. THANKS FOR LISTENING TO MY STORY. DO ME A FAVOR... CAN YOU GO TELL URBAN AND THE OTHERS THAT I APPRECIATE THE HOSPITALITY THEY GAVE, BUT I WILL NOT BE RETURNING. THANKS. SEE YOU NEXT!",$f7,$01,$10,$83


cow_guyw_lo:
.byte <cow_guy0,<cow_guy1,<cow_guy2,<cow_guy3,<cow_guy4
cow_guyw_hi:
.byte >cow_guy0,>cow_guy1,>cow_guy2,>cow_guy3,>cow_guy4
cow_guy0:
.byte "MUH WHEEL-HORSE LEMUEL DONE DECIDED TO BE A CLERIC ONCE'T MORE! DON'T RIGHT KNOW WHY. BUT IF YOUSE-UN GET MUH SHOVEL FROM THAT THERE MINE, I'D BE RIGHT HAPPY TO HELP YA FIND HIM. TRY SEARCHING AROUND THE ORE DEPOSITS.",$f2
cow_guy1:
.byte "MUH SHOVEL! THANK YA! NOW LEMUEL SAYS TO ME HE'S GONE ON ONE OF THEM THAR QUESTS FOR ADVENTURE AND EXCITEMENT SOMEWHERE'S YONDER IN THAT SNOWY WASTELAND. GOOD LUCK FINDIN' 'IM THOUGH, YOU AIN'TN'T GONNA PHYSICALLY SEE 'IM.",$f7,$82,$0f,$02
cow_guy2:
.byte "EVERYONE HERE MISSES LEMUEL'S SCREWY OL' WAYS.",$f2
cow_guy3:
.byte "SO YOU ACTUALLY FOUND 'IM, HUH? WELL IF HE ISN'T GONNA COME BACK TO US, I ONLY HOPE FER THE BEST FER 'IM. I RECKON FER YER TROUBLES I CAN GIVE YA THIS COPY OF WILD GUNMAN.",$f4,$84,$1c
cow_guy4:
.byte "COPENHAGEN, IT MAKES ME FEEL SO GOOD. COPENHAGEN, THE WAY I KNOW IT SHOULD! I PUT A LIL' CHEW IN MY MOUTH GO SPITTIN' AND A SLOBBERIN' ALL AROUND THE HOUSE, THAT COPENHAGEN IT MAKES ME FEEL SO GOOD! LOVE ME SOME CHRIS LEDOUX!",$f2

batboy00_lo:
.byte <batboy0w0,<batboy0w1,<batboy0w2
batboy00_hi:
.byte >batboy0w0,>batboy0w1,>batboy0w2
batboy0w0:
.byte "*SOB* MY BAT WAS STOLEN BY THAT BULLY GUIDO. I DON'T KNOW WHERE HE WENT. HE WAS RUNNING TOWARD CENTER-FIELD AND JUST DISAPPEARED.",$f2
batboy0w1:
.byte "HEY IT'S MY BAT! THANK YOU SO, SO, SO MUCH! YOU'RE LOOKING FOR NES GAMES, EH? WELL, HERE, I HAPPEN TO HAVE A COPY OF BASEBALL THAT I CAN GIVE YOU.",$f4,$82,$02
batboy0w2:
.byte "I'M SO GLAD TO HAVE MY BAT BACK!",$f2

batboy01_lo:
.byte <batboy1w0
batboy01_hi:
.byte >batboy1w0
batboy1w0:
.byte "YEAH, I'M OLDER THAN HIM, AND YEAH, THAT'S RIGHT, I TOOK JERK-FACE'S BAT. AND I'D BE USING IT ON YOU RIGHT NOW IF I HADN'T LEFT IT IN THE SILO AT THE CORNFIELDS!",$f2

flowgirl_lo:
.byte <flgirl0,<flgirl1,<flgirl2
flowgirl_hi:
.byte >flgirl0,>flgirl1,>flgirl2
flgirl0:
.byte "MY DREAM IS TO SOMEDAY MEET AN ADVENTUROUS MAN. ONE THAT WILL SPOIL ME WITH COMPLIMENTS, TOO. I LOVE FLATTERY SO MUCH! THEN AGAIN, WHO DOESN'T? *TEEHEE",$f2
flgirl1:
.byte "ALEX UPTON? AND YOU SAY HE IS AN -ACTUAL- ADVENTURER? HMMMM... SOUNDS EXCITING! TELL HIM THAT I WILL AGREE TO MEET HIM!",$f7,$02,$09,$02
flgirl2:
.byte "I REALLY HOPE IT WORKS OUT WITH THIS ALEX GUY!",$f2


dojogy0w_lo:
.byte <dojo0_0,<dojo0_1,<dojo0_2
dojogy0w_hi:
.byte >dojo0_0,>dojo0_1,>dojo0_2
dojo0_0:
.byte "WOULD YOU LIKE TO LEARN ABOUT COMBAT?",$f1,$01,$02,$00,$00
dojo0_1:
.byte "VERY WELL. STEP ON THE MATS, PLEASE...",$f3,$00
dojo0_2:
.byte "NO PROBLEM. WE'RE ALWAYS HERE IF YOU NEED US!",$f0,$00

blanky0w_lo:
.byte <blanky0
blanky0w_hi:
.byte >blanky0
blanky0:
.byte "",$f2

dojogy2w_lo:
.byte <dojo2_0
dojogy2w_hi:
.byte >dojo2_0
dojo2_0:
.byte "YOUR STAMINA BAR WILL START TO REFILL AFTER EVERY MOVE, BE IT OFFENSIVE, DEFENSIVE OR SPECIAL. MAKE SURE TO KEEP TRACK OF HOW MUCH YOU HAVE SO YOU KNOW WHAT MOVES YOU CAN PULL OFF.",$f0,$00

richmo_w_lo:
.byte <rich0,<rich1,<rich2
richmo_w_hi:
.byte >rich0,>rich1,>rich2
rich0:
.byte "I REALLY WISH I COULD HELP YOU OUT. RIGHT NOW I AM MORE CONCERNED ABOUT MY LUCKY COIN. I SEEM TO HAVE MISPLACED IT! SOME LUCK. I HAD IT WHEN I WAS USING MY STILTS IN THE SEWER, BUT NOW... IT'S GONE. I NEED TO LEARN A -BLOCK- DEFENSE, FIRST.",$f2
rich1:
.byte "WHOA! MY LUCKY COIN! I CAN'T BELIEVE YOU FOUND IT... MISTER, YOU HAVE PERFORMED A GREAT SERVICE TODAY. HERE, TAKE MY COPY OF CLU-CLU LAND FOR YOUR TROUBLES!",$f4,$82,$03
rich2:
.byte "HUH? WHY DO YOU ASK? DOESN'T EVERYBODY GO SIGHT-SEEING IN THE SEWERS? YOU'RE MISSING OUT, BUB!",$f2

pinballw_lo:
.byte <pin0,<pin1,<pin2,<pin3,<pin4
pinballw_hi:
.byte >pin0,>pin1,>pin2,>pin3,>pin4
pin0:
.byte "HEY THERE FRIEND! WELCOME TO JOLLY JESTER! CAN I INTEREST YOU IN THE LAST NES GAME AVAILABLE FOR SALE IN OUR STORE? IT'S PINBALL, A TRUE CLASSIC! ONLY 30 MANUALS! YOU DON'T WANT TO PASS THIS UP!",$f1,$01,$02,$03,$03
pin1:
.byte "RIGHT ON! YOU'RE GOING TO LOVE IT. OUR GAMES ARE ALL CLEANED AND READY TO GO. JUST PUT IT IN YOUR NES AND ENJOY!",$f4,$04,$12
pin2:
.byte "THAT'S QUITE ALRIGHT. WELCOME TO JOLLY JESTER ALL THE SAME!",$f0,$00
pin3:
.byte "OH, I'M SORRY. YOU DON'T SEEM TO HAVE 30 MANUALS RIGHT NOW. MAYBE LATER?",$f0,$00
pin4:
.byte "WELCOME BACK TO JOLLY JESTER!",$f2

tinyhome_lo:
.byte <tiny0,<tiny1,<tiny2,<tiny3,<tiny4
tinyhome_hi:
.byte >tiny0,>tiny1,>tiny2,>tiny3,>tiny4
tiny0:
.byte "YES, IT'S A SMALL HOME, BUT IT IS MINE.",$f2
tiny1:
.byte "OH SWEET, THAT COPY OF MEGA MAN I WAS EXPECTING FROM LOGIUDICE! UMMM... WAIT A SECOND. IT WAS SUPPOSED TO BE A 5-SCREW MEGA MAN. PLEASE GO BACK AND GET THE CORRECT VARIANT FOR ME...",$f7,$02,$07,$05
tiny2:
.byte "WAITING ON THAT 5-SCREW VARIANT OF MEGA MAN, OR ELSE NO ADVENTURE ISLAND FOR LOGIUDICE...",$f2
tiny3:
.byte "AH, THERE IT IS! I HAVE BEEN WANTING THIS 5-SCREW MEGA MAN FOR SOME TIME NOW! OKAY, HERE IS ADVENTURE ISLAND FOR LOGIUDICE!",$f7,$00,$07,$06
tiny4:
.byte "HOW EMBARASSING! I CAN'T BELIEVE I MESSED UP WHICH CART TO GIVE HIM AFTER HE DID THE SAME THING. OKAY, HERE IS THE OVAL SEAL VERSION OF ADVENTURE ISLAND FOR HIM. THANKS FOR ALL YOUR TROUBLES!",$f7,$00,$07,$07

quad_csw_lo:
.byte <quad0,<quad1,<quad2,<quad3
quad_csw_hi:
.byte >quad0,>quad1,>quad2,>quad3
quad0:
.byte "HI! I USUALLY WORK IN A WAREHOUSE, BUT I TOOK THIS JOB TO GET A LITTLE EXTRA MOOLAH. I SEEM TO HAVE RUN INTO A PROBLEM THOUGH. I TEND TO TAKE ACTION 52 WITH ME WHERE EVER I GO. I ACCIDENTALLY FORGOT IT AT THE TOP OF THIS STRUCTURE!",$fa,$e5,$01,<quad4,>quad4
quad1:
.byte "I HOPE AT SOME POINT YOU HAVE THE ABILITY TO GET MY ACTION 52 FOR ME. I'M ITCHING TO PLAY WHEN I GET HOME! REMEMBER, WATCH YOUR HEAD!",$f2
quad2:
.byte "HEY, YOU DID IT! YOU GOT MY COPY OF ACTION 52! DIDN'T I TELL YOU IT WAS HORRIFIC UP THERE? WHO WOULD HAVE EVER THOUGHT TETRIS BLOCKS WOULD BETRAY US. ANYWAY, HERE IS A COPY OF TENNIS FOR YOU!",$f4,$83,$19
quad3:
.byte "THANKS AGAIN. I'M READY TO GET BUSY ON THESE GAMES!",$f2
quad4:
.byte "TYPICALLY, I WOULD JUST GO AND GET IT MYSELF, BUT THERE'S SOMETHING THAT IS BLOCKING THE PATH! IT'S... IT'S HORRIFIC! SOMETHING I NEVER EXPECTED TO SEE HAPPEN. THEY HAVE TURNED AGAINST US... THEY... YOU WOULD JUST HAVE TO SEE.",$fa,$25,$00,<quad5,>quad5
quad5:
.byte "RETRIEVE ACTION 52 FROM THE TABLE AT THE TOP FOR ME, AND I WILL GIVE YOU AN NES GAME OUT OF MY COLLECTION. BUT BEWARE, I WOULD -NOT- GO ANY FURTHER UNLESS YOU HAVE A MEANS OF PROTECTING AGAINST THINGS THAT COME DOWN ON YOUR HEAD. IT'S DANGEROUS!",$f0,$01

brundetw_lo:
.byte <brund0,<brund1
brundetw_hi:
.byte >brund0,>brund1
brund0:
.byte "IF YOU'RE LOOKING FOR A COPY OF DONKEY KONG JR. MATH, I BELIEVE MY BUDDY JUSTIN HAS ONE. HE LIVES IN THE MOUNTAINS THOUGH, SO YOU NEED TO FIND A WAY TO GET THERE.",$f2
brund1:
.byte "SO LET ME GET THIS STRAIGHT. HE ASKED FOR 10 MANUALS, BUT THEN UPPED IT TO 80 AT THE LAST SECOND? YEAH, THAT SOUNDS LIKE HIM. JUSTIN TREMBLAY, THE GREEDY LITTLE S#!T.",$f2

jeaninew_lo:
.byte <jeani0,<jeani1
jeaninew_hi:
.byte >jeani0,>jeani1
jeani0:
.byte "WOW... YOU CAME ALL THE WAY THROUGH THIS CLOSED COURSE? YOU DID NOTICE IT IS OVERRUN WITH IDIOTS ATTACKING PEOPLE, DIDN'T YOU? SINCE YOU CAN'T ACTUALLY PLAY OUR GREENS, HERE'S A CONSOLATION OF GOLF FOR THE NES.",$f4,$01,$0a
jeani1:
.byte "YOU SHOULD CALL AHEAD NEXT TIME!",$f2

kincl_0w_lo:
.byte <kincl0,<kincl1,<kincl2
kincl_0w_hi:
.byte >kincl0,>kincl1,>kincl2
kincl0:
.byte "HI! I'M THE EDITOR OF THE FANZINE HYPERPLAY RPG, THE WORLD'S BEST-SELLING RETRO RPG PUBLICATION! I'M GOING DOOR TO DOOR TO PROMOTE IT. IF YOU CAN PROVE TO ME YOU'RE A FAN, I'LL GIVE YOU A SUPER COOL PERIPHERAL FOR THE NES!",$f2
kincl1:
.byte "OH MAN, YOU -ARE- A FAN OF HYPERPLAY! I'LL UPHOLD MY END OF THE DEAL. WITH THIS PERIPHERAL, YOU WILL BE ABLE TO BLOCK ALL LOW ATTACKS THAT COME AT YOU FROM -BEHIND- BY DOING NOTHING... WITH NO USE OF STAMINA! I PRESENT TO YOU, THE U-FORCE!",$f4,$02,$22	;,$f8,$02,$02
kincl2:
.byte "GO FORTH ON YOUR QUEST, AND FIND YOUR JOY IN THIS BRAVE NEW GAME YOU'RE PLAYING!",$f2

dollgrlw_lo:
.byte <dolly0,<dolly1,<dolly2
dollgrlw_hi:
.byte >dolly0,>dolly1,>dolly2
dolly0:
.byte "I'M REALLY, REALLY SAD RIGHT NOW. I LEFT MY DOLLY INSIDE THE BATHROOM, BUT WHEN I WENT TO GET IT BACK, THE STALL DOOR WAS LOCKED! I DON'T KNOW WHAT I'M GOING TO DO...",$f2
dolly1:
.byte "MY DOLLY! OH I MISSED YOU!... *SNIFF* EWWWWWW... I NEED TO GIVE HER A BATH! PLEASE TAKE THIS GAME AS THANKS. IT'S AN OLD ONE I NEVER COULD FIGURE OUT. IT'S CALLED GYROMITE.",$f4,$82,$0c
dolly2:
.byte "OH, DOLLY, I LOVE YOU!",$f2

junkguyw_lo:
.byte <junk0,<junk1
junkguyw_hi:
.byte >junk0,>junk1
junk0:
.byte $fb,$08,<junk2,>junk2,"MAN, YOU WON'T BELIEVE THIS. I OWN THE JUNKYARD, RIGHT? WELL, THERE IS AN EVIL FRIGGIN' -ROBOT- THAT TOOK IT OVER! I WISH SOMEONE WOULD SHOW HIM WHO'S BOSS. I'D DEFINITELY REWARD THEM.",$f2
junk1:
.byte "MY FAVORITE SONG OF ALL TIME IS 'DARE TO BE STUPID' BY WEIRD AL. IF YOU'RE WONDERING WHY, MAYBE YOU SHOULD CHECK OUT TRANSFORMERS THE MOVIE!",$f2
junk2:
.byte "HOLY COW, YOU DEFEATED THAT ROBOT? WHERE DID IT COME FROM, ANYWAY?! AH WELL, THAT DOESN'T REALLY MATTER. I CAN GET BACK TO WORK! HERE YOU GO MY FRIEND, YOU CAN LEARN A THING OR TWO. THIS ISN'T JUST FOR LEND, YOU CAN KEEP WRECKING CREW!",$f4,$01,$1d

bigtop0w_lo:
.byte <elsa0,<elsa1
bigtop0w_hi:
.byte >elsa0,>elsa1
elsa0:
.byte "MY LAND! YOU MUST FORGIVE THE STRONGMAN, HE GETS A BIT... OVER ZEALOUS AT TIMES. HE'S JUST LOOKING OUT FOR THE WORKERS HERE. BUT I DO HUMBLY APOLOGIZE. PLEASE TAKE THIS BALLOON FIGHT GAME AS A TOKEN OF GOOD WILL.",$f4,$01,$01
elsa1:
.byte "I TRUST THAT YOU WILL BE QUITE ALRIGHT WITH THAT PAYMENT. NOW PLEASE LEAVE MY BIG TOP!",$f2

efnchadw_lo:
.byte <chad0,<chad1,<chad2,<chad3,<chad4,<chad5,<chad6,<chad7,<chad8,<chad9,<chadA
efnchadw_hi:
.byte >chad0,>chad1,>chad2,>chad3,>chad4,>chad5,>chad6,>chad7,>chad8,>chad9,>chadA
chad0:
.byte "HEY CHUMP, MY NAME'S CHAD, AND I'M THE GREATEST GAMER EVER! YOU THINK YOU'RE SO HOT, WHY DON'T YOU TRY COMPETING WITH SOME OF MY SCORES? ASK ME WHAT THEY ARE IF YOU THINK YOU CAN HACK IT, CHUMP!",$f7,$01,$21,$01	;,$f0,$01
chad1:
.byte $fc, $1a,$02, $08,$03, $03,$02, $12,$06, $02,<chad2,>chad2,"TRY THESE, CHUMP!   URBAN CHAMPION....15 DUCK HUNT.........29 CLU-CLU LAND......19 PINBALL...........59",$f2
chad2:
.byte $fc, $02,$01, $04,$01, $06,$03, $01,$02, $03,<chad3,>chad3,"WHATEVER. NEXT!     BASEBALL.......... 9 DONKEY KONG....... 9 DONKEY KONG 3.....29 BALLOON FIGHT.....18",$f2
chad3:
.byte $fc, $16,$05, $13,$02, $11,$03, $0f,$02, $04,<chad4,>chad4,"CAN'T BEAT THESE... SOCCER............49 POPEYE............19 MARIO BROS........29 KUNG FU...........19",$f2
chad4:
.byte $fc, $14,$02, $09,$04, $1d,$03, $1b,$03, $05,<chad5,>chad5,"HAVE FUN CHUMP!     PRO WRESTLING.....15 EXCITEBIKE........39 WRECKING CREW.....29 VOLLEYBALL........27",$f2
chad5:
.byte $fc, $0d,$04, $18,$08, $15,$03, $00,$05, $06,<chad6,>chad6,"MAKE MY DAY...      HOGAN'S ALLEY.....39 SUPER MARIO BROS..79 SLALOM............29 10-YARD FIGHT.....49",$f2
chad6:
.byte $fc, $0e,$03, $05,$02, $0b,$02, $10,$05, $07,<chad7,>chad7,"OUT OF MY LEAGUE.   ICE CLIMBER.......29 DONKEY KONG JR....18 GUMSHOE...........18 MACH RIDER........49",$f2
chad7:
.byte $fc, $1c,$01, $07,$02, $19,$02, $0a,$02, $08,<chad8,>chad8,"NO WAY, CHUMP!      WILD GUNMAN....... 9 D. KONG JR MATH...15 TENNIS............15 GOLF..............18",$f2
chad8:
.byte $fc, $0c,$01, $1e,$02, $00,$00, $00,$00, $09,<chad9,>chad9,"UMMM I GUESS THESE? GYROMITE.......... 9 NES VIRUS CLEANER.19",$f2
chad9:
.byte "I CAN'T BELIEVE IT! YOU BEAT ALL OF MY HIGH SCORES?! ",$1c,"!#?",$1c,"! GET AWAY FROM ME! HERE, TAKE THIS STUPID GAME WITH YOU, TOO. ONLY COMPLETE LOSERS WOULD LIKE IT, SO IT'S RIGHT UP YOUR ALLEY!",$f4,$0a,$1f
chadA:
.byte "JUST LEAVE ME ALONE. I'LL GET YOU NEXT TIME, CHUMP!",$f2
