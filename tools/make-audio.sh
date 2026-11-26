#!/bin/bash
# Records every word, conjugation and sentence in Verbos with the Mac's Portugal Portuguese voice.
# Run on a Mac:  curl -fsSL https://raw.githubusercontent.com/DJeppsonBestDayHR/verbos/main/tools/make-audio.sh | bash
# Result: verbos-audio.zip on your Desktop. Safe to run again; it skips clips it already made.
set -e
OUT="$HOME/Desktop/verbos-audio"
mkdir -p "$OUT"
VOICES=$(say -v '?' | grep -E '[[:space:]]pt[_-]PT[[:space:]]' || true)
if [ -z "$VOICES" ]; then
  echo "No Portugal Portuguese voice found."
  echo "Open System Settings > Accessibility > Spoken Content > System Voice > Manage Voices,"
  echo "add a Portuguese (Portugal) voice such as Joana, then run this again."
  exit 1
fi
LINE=$(echo "$VOICES" | grep -iE 'premium|enhanced' | head -1)
[ -z "$LINE" ] && LINE=$(echo "$VOICES" | head -1)
VOICE=$(echo "$LINE" | sed -E 's/[[:space:]]+pt[_-]PT.*//')
echo "Recording with voice: $VOICE"
TMP="$OUT/.tmp.aiff"
TOTAL=1703
N=0
while IFS='|' read -r ID TEXT; do
  [ -z "$ID" ] && continue
  N=$((N+1))
  if [ ! -s "$OUT/$ID.m4a" ]; then
    say -v "$VOICE" -o "$TMP" "$TEXT"
    afconvert -f m4af -d aac -b 32000 "$TMP" "$OUT/$ID.m4a"
  fi
  printf "\r%d of %d recorded" "$N" "$TOTAL"
done <<'PHRASES'
pwj9k|Bom dia! Estou a aprender português em Moçambique.
b6ssb7|Olá! Isto é um teste.
1fpt5q8|estar
kziae3|Estou na paragem à espera do chapa.
1p8q459|Como estás? Estou bem, obrigado.
1uh9jgv|eu estou
2zxvmi|tu estás
1m4bcpi|ele está
gundzr|nós estamos
wcz9p2|vós estais
afl29e|eles estão
qym08b|eu estive
pqsc0i|tu estiveste
fyedaz|ele esteve
1m8zou4|nós estivemos
1bul73c|vós estivestes
diooum|eles estiveram
1p28jxr|eu estava
1eiduix|tu estavas
n4t0wj|ele estava
s9ahmw|nós estávamos
mblr2n|vós estáveis
1986qjp|eles estavam
tawd12|que eu esteja
19a87qy|que tu estejas
1oilsfo|que ele esteja
11721x1|que nós estejamos
sbgmlo|que vós estejais
17ml94e|que eles estejam
1cc3o8m|se eu estivesse
1w193gs|se tu estivesses
1dw4eym|se ele estivesse
1xnv7kf|se nós estivéssemos
1lzi3ke|se vós estivésseis
1ukaj58|se eles estivessem
rl764t|quando eu estiver
hb9c74|quando tu estiveres
1t87hh|quando ele estiver
3xt5hu|quando nós estivermos
ra2i4r|quando vós estiverdes
s5c54|quando eles estiverem
1kn81h1|ser
k7sr2l|Ela é professora numa escola primária em Nampula.
1w9vnfz|Jesus Cristo é o nosso Salvador.
99qxq6|eu sou
4jjley|tu és
mloehs|ele é
7ijavs|nós somos
4628ff|vós sois
4mib37|eles são
1d7neb3|eu fui
16j0bcd|tu foste
hh810t|ele foi
1kcfr4n|nós fomos
e9ms9l|vós fostes
1ma9x9h|eles foram
np4vi5|eu era
1x0m7q1|tu eras
1jtns61|ele era
4c0j9y|nós éramos
zo68l|vós éreis
13fx4gt|eles eram
3hknpp|que eu seja
1qvr8h7|que tu sejas
1w3c8iz|que ele seja
1n3x15g|que nós sejamos
3s4bmn|que vós sejais
yzrv5f|que eles sejam
n0nisx|se eu fosse
up4he5|se tu fosses
16sphkp|se ele fosse
1uikd7v|se nós fôssemos
1sinw3m|se vós fôsseis
1ugwi1l|se eles fossem
emokte|quando eu for
1gj9fan|quando tu fores
5nhrui|quando ele for
cext5z|quando nós formos
110tt4y|quando vós fordes
169o6hb|quando eles forem
18o94qo|ter
ct1tue|Tens tempo para conversar depois do mata-bicho?
1ril636|Temos uma mensagem sobre a família.
1nbfs9l|eu tenho
pm6t9e|tu tens
4v2drl|ele tem
c9qylz|nós temos
1u79fck|vós tendes
r6pon1|eles têm
mb2ssv|eu tive
iyigje|tu tiveste
1t96skv|ele teve
1q3ehig|nós tivemos
i5n8bg|vós tivestes
fbrl36|eles tiveram
phkzs3|eu tinha
1wxv2gf|tu tinhas
1ba5a7r|ele tinha
1k2bm5k|nós tínhamos
upc633|vós tínheis
15xb76f|eles tinham
1hstwvk|que eu tenha
n1bw0i|que tu tenhas
k9l68e|que ele tenha
eh650b|que nós tenhamos
1ww3bde|que vós tenhais
1brujxa|que eles tenham
aadxdy|se eu tivesse
10551pc|se tu tivesses
1cbygtq|se ele tivesse
fmol6n|se nós tivéssemos
1aywcu6|se vós tivésseis
kpvr2k|se eles tivessem
1lmkl9h|quando eu tiver
19j921g|quando tu tiveres
1pkbhbx|quando ele tiver
1gurpju|quando nós tivermos
ho56pf|quando vós tiverdes
1rd764w|quando eles tiverem
lfc682|ir
1km278u|Amanhã vamos à cidade de machimbombo.
8umpv2|Fui ao mercado do Xipamanine ontem.
1oe19od|eu vou
1rz8n9z|tu vais
1t4uipj|ele vai
gokrpt|nós vamos
1y7f10k|vós ides
okx3x0|eles vão
jcnovb|eu ia
19is4zp|tu ias
hc3ker|ele ia
1l4wt1g|nós íamos
191xdy3|vós íeis
1m61vux|eles iam
1bm5lz9|que eu vá
12g7o63|que tu vás
1xk342v|que ele vá
oujuig|que nós vamos
1l4pjrp|que vós vades
fbu1fv|que eles vão
jezcsf|querer
14bb6gj|Queres matapa ou caril de amendoim?
1sqilp4|Ele quer saber mais sobre Jesus Cristo.
jmlwyl|eu quero
1eq23cv|tu queres
52vwsc|ele quer
15fmj08|nós queremos
1xn5zcb|vós quereis
19fidmv|eles querem
uilmdz|eu quis
pgmyev|tu quiseste
7lyl8b|ele quis
1daus2j|nós quisemos
1dzrk1x|vós quisestes
1ungulj|eles quiseram
1e29jb2|eu queria
1nha67q|tu querias
6djs6i|ele queria
1h13k0v|nós queríamos
1b81fj6|vós queríeis
1j5w9s6|eles queriam
vqo7jh|que eu queira
ct42vv|que tu queiras
1tl00rj|que ele queira
isjtxs|que nós queiramos
1m3dqwj|que vós queirais
19m8ahr|que eles queiram
192yj05|se eu quisesse
1sjyyer|se tu quisesses
1dki99|se ele quisesse
1r4pqlq|se nós quiséssemos
ehfku9|se vós quisésseis
1p9esr|se eles quisessem
59qyhy|quando eu quiser
1uwflx|quando tu quiseres
9ri5gu|quando ele quiser
1in11z7|quando nós quisermos
ynu74e|quando vós quiserdes
j7s9op|quando eles quiserem
1oamy7g|dar
y27klf|A avó deu-me uma capulana nova.
92txom|Deus dá-nos forças todos os dias.
1k2emtn|eu dou
81j7cy|tu dás
1t3gmf6|ele dá
111h15v|nós damos
1uboc62|vós dais
1c37cvq|eles dão
1mbbekp|eu dei
1kyjcw1|tu deste
khv0u1|ele deu
qiskcn|nós demos
49iy2h|vós destes
1vw3uc9|eles deram
3p0xd7|eu dava
d4yqtt|tu davas
17u44sn|ele dava
pl67ng|nós dávamos
13c6uf7|vós dáveis
fz5wn5|eles davam
1jp6nam|que eu dê
17uvx3e|que tu dês
1tcwih4|que ele dê
sqsgyy|que nós demos
ap3rh1|que vós deis
1em72pc|que eles deem
14p4ndt|se eu desse
1ezl195|se tu desses
1hlg95l|se ele desse
1931vmy|se nós déssemos
1q9jaqd|se vós désseis
zl9omd|se eles dessem
3ucpky|quando eu der
e68cab|quando tu deres
1txv1e2|quando ele der
1cozxx3|quando nós dermos
1b0xnc2|quando vós derdes
1bs12mr|quando eles derem
i27hfv|dizer
11qb51a|O que é que ele disse?
1yu5omb|Diga-me, como posso ajudar?
19nzif8|eu digo
18akoi1|tu dizes
kt0vq8|ele diz
muu504|nós dizemos
19wq3i7|vós dizeis
1l1td6h|eles dizem
pwqshf|eu disse
1wv40d4|tu disseste
1lv8a7r|ele disse
10aunck|nós dissemos
33eutc|vós dissestes
23tefs|eles disseram
zbxysi|eu dizia
1skag5g|tu dizias
1y7ed32|ele dizia
4zrlqr|nós dizíamos
33zchi|vós dizíeis
139ged8|eles diziam
hn9dlb|que eu diga
1pvifk1|que tu digas
piwle1|que ele diga
d9guza|que nós digamos
1n2ugd5|que vós digais
6zgxq9|que eles digam
1drzb2q|se eu dissesse
10b0nh6|se tu dissesses
10h2d3e|se ele dissesse
spbmrv|se nós disséssemos
129s9de|se vós dissésseis
khv0ga|se eles dissessem
hoi5jt|quando eu disser
10wsena|quando tu disseres
vw6hep|quando ele disser
d3egli|quando nós dissermos
1hj4vkv|quando vós disserdes
13v5lce|quando eles disserem
404b8h|fazer
1hr35z8|O que fazes no fim de semana?
1yqwf9s|Está a fazer muito calor hoje.
1v8wfby|eu faço
wcg1a3|tu fazes
c8fj1m|ele faz
fa7pdi|nós fazemos
wy6x6x|vós fazeis
kiygcr|eles fazem
16sqa5i|eu fiz
y8pr0g|tu fizeste
a03vw6|ele fez
1xxi4dq|nós fizemos
x07tku|vós fizestes
15q9lok|eles fizeram
1p5vne4|eu fazia
t0igle|tu fazias
11o177s|ele fazia
19tp8e1|nós fazíamos
18lsa84|vós fazíeis
18ff7ve|eles faziam
1y1zxx1|que eu faça
1ppwttf|que tu faças
1f6oko3|que ele faça
1jiup1o|que nós façamos
1mveu07|que vós façais
hs2cwz|que eles façam
maa53c|se eu fizesse
1xxtxfq|se tu fizesses
1caqsqo|se ele fizesse
17loik5|se nós fizéssemos
1wkecxo|se vós fizésseis
97ox0q|se eles fizessem
1sh3ud7|quando eu fizer
tqfhfm|quando tu fizeres
om3zj7|quando ele fizer
12vpic|quando nós fizermos
1uucq0x|quando vós fizerdes
1vvsyw6|quando eles fizerem
5apwre|saber
pn8s7h|Sabes onde fica a paragem do chapa?
6ldjuf|Sei que Deus me ama.
binph8|eu sei
r4wkv0|tu sabes
1ixzkvs|ele sabe
ao17xp|nós sabemos
sy141w|vós sabeis
dh44ac|eles sabem
1hpr25f|eu soube
1xvk7lo|tu soubeste
fdhexb|ele soube
vdwx0k|nós soubemos
1shl3n4|vós soubestes
1r7sg6g|eles souberam
1hucldf|eu sabia
1fdg4un|tu sabias
1g4vnsn|ele sabia
rczds0|nós sabíamos
kbvtgn|vós sabíeis
xcws7n|eles sabiam
kznxaq|que eu saiba
1ppz5x0|que tu saibas
136ks3o|que ele saiba
1phq3yt|que nós saibamos
1u41jq4|que vós saibais
o2nt3k|que eles saibam
1vqklvi|se eu soubesse
toiv5u|se tu soubesses
yaljx2|se ele soubesse
12e2zjb|se nós soubéssemos
sfik5y|se vós soubésseis
1q8op8u|se eles soubessem
1owvq6d|quando eu souber
ts4oty|quando tu souberes
1ohnbil|quando ele souber
rruze2|quando nós soubermos
19s81tf|quando vós souberdes
1gu35lu|quando eles souberem
1b67bnq|sair
1yyl3|O chapa sai às seis da manhã.
v6bent|Saímos cedo para evitar o calor.
oe71t1|eu saio
1qb40xq|tu sais
1strj3w|ele sai
1p0fi59|nós saímos
1mnscd9|vós saís
1a48ipq|eles saem
19wvlw4|eu saí
fywvz9|tu saíste
1ncq4a3|ele saiu
112or8b|vós saístes
1ixj4a5|eles saíram
vyp3u7|eu saía
xcjpxp|tu saías
1mksnwj|ele saía
36zjt4|nós saíamos
1uwuntr|vós saíeis
siw7b9|eles saíam
1hmccii|que eu saia
1cu5hfe|que tu saias
t0s39w|que ele saia
h25mfp|que nós saiamos
z3sl0s|que vós saiais
1efi56q|que eles saiam
3jb8qf|se eu saísse
1ewt4f9|se tu saísses
11d1izz|se ele saísse
1einjmw|se nós saíssemos
5h9xn|se vós saísseis
1iw7l2p|se eles saíssem
jcd3x4|quando eu sair
avppz|quando tu saíres
1not4ww|quando ele sair
1l5l5cx|quando nós sairmos
1xbcdi8|quando vós sairdes
2bgfxz|quando eles saírem
ckazn|trazer
69gp3a|Traz água, está muito calor.
jqtcub|Trouxemos pão para a família.
tgohik|eu trago
1e6hklb|tu trazes
1w7e3rk|ele traz
1nje170|nós trazemos
161e913|vós trazeis
8ajao3|eles trazem
18pv6bo|eu trouxe
12lwbm3|tu trouxeste
b1yqr4|ele trouxe
10qf5fx|nós trouxemos
6rp7ij|vós trouxestes
1x3awfn|eles trouxeram
1b4dv0q|eu trazia
1hhw9o6|tu trazias
1u0ini|ele trazia
lkt85n|nós trazíamos
r5p66|vós trazíeis
us195e|eles traziam
18v7c0l|que eu traga
17t976h|que tu tragas
qoysfr|que ele traga
lm93lk|que nós tragamos
1f5lirf|que vós tragais
1v8dyx|que eles tragam
dmn13|se eu trouxesse
f8e8yn|se tu trouxesses
17sqi5r|se ele trouxesse
v2t30s|se nós trouxéssemos
3gw1rb|se vós trouxésseis
fa5lq7|se eles trouxessem
8uf3ys|quando eu trouxer
a46ur5|quando tu trouxeres
i1ifx8|quando ele trouxer
n965it|quando nós trouxermos
n3etb8|quando vós trouxerdes
11lf4il|quando eles trouxerem
knc808|ler
uw8im2|Leio as escrituras todas as manhãs.
1i5qsgk|Podes ler este versículo em voz alta?
1twlbii|eu leio
14eh1st|tu lês
1v0k72n|ele lê
115eivj|nós lemos
1o0g08a|vós ledes
1e9r5wd|eles leem
74vpum|eu li
16gj12x|tu leste
1vi262p|ele leu
3c20qp|vós lestes
gxiu2p|eles leram
y4lffx|eu lia
8zmwm5|tu lias
1li1ni1|ele lia
zit65y|nós líamos
1du7wo5|vós líeis
1lver99|eles liam
6kqag1|que eu leia
2hhlun|que tu leias
n4gs2v|que ele leia
19kcwig|que nós leiamos
17qy1t7|que vós leiais
refysn|que eles leiam
1xzdxrt|se eu lesse
1rzuojl|se tu lesses
ob4r5t|se ele lesse
1ghwwl3|se nós lêssemos
1l4gnfa|se vós lêsseis
1sg3trh|se eles lessem
10qwwii|quando eu ler
j0blgb|quando tu leres
x1augi|quando ele ler
fbxne7|quando nós lermos
2enjuy|quando vós lerdes
1w0s0cb|quando eles lerem
uau342|ouvir
1wnihrr|Ouviste a chuva ontem à noite?
1vbrou8|Obrigado por ouvir a nossa mensagem.
ulwhyn|eu ouço
5epg9s|tu ouves
8uavs4|ele ouve
yt4gd1|nós ouvimos
ua2tbp|vós ouvis
dt9knk|eles ouvem
us2f98|eu ouvi
1pfd0s7|tu ouviste
gcvd0v|ele ouviu
11fq10j|vós ouvistes
1oohm6f|eles ouviram
z3xqef|eu ouvia
1772o77|tu ouvias
at3b5f|ele ouvia
1y9m2bo|nós ouvíamos
6nc0m3|vós ouvíeis
1q6rsov|eles ouviam
14we4g0|que eu ouça
h5x958|que tu ouças
1d0ycty|que ele ouça
gmg0j7|que nós ouçamos
s1qne|que vós ouçais
v2fz84|que eles ouçam
18t8ulr|se eu ouvisse
rapdrn|se tu ouvisses
95ftc7|se ele ouvisse
15ctda4|se nós ouvíssemos
95jdbb|se vós ouvísseis
1i7z0uj|se eles ouvissem
uht43o|quando eu ouvir
5rm5k5|quando tu ouvires
17naxik|quando ele ouvir
xh8y85|quando nós ouvirmos
dva0d0|quando vós ouvirdes
pemkeh|quando eles ouvirem
13unzbp|pedir
1pxz3vj|Vou pedir um refresco, por favor.
10cqgqc|Peço a Deus que vos abençoe.
s1fsbo|eu peço
gqfs03|tu pedes
iopwjx|ele pede
9wjmy2|nós pedimos
1mkltlu|vós pedis
29vrc3|eles pedem
128q9sd|eu pedi
q5t7l0|tu pediste
ypjjkk|ele pediu
14b2xfm|vós pedistes
15372q8|eles pediram
rzgmpw|eu pedia
1bp567e|tu pedias
t5rhp4|ele pedia
1qj4pgh|nós pedíamos
qiktj0|vós pedíeis
1swj2ia|eles pediam
1we6ywv|que eu peça
1ttgjhd|que tu peças
a8w4k1|que ele peça
s4pcxq|que nós peçamos
1eynm35|que vós peçais
tun1z5|que eles peçam
1ga82fw|se eu pedisse
5frmpm|se tu pedisses
7f3wmc|se ele pedisse
ic94tt|se nós pedíssemos
qxm1a8|se vós pedísseis
4njedi|se eles pedissem
960t7b|quando eu pedir
h8q3tq|quando tu pedires
gtg43z|quando ele pedir
135gvhk|quando nós pedirmos
19gq5hh|quando vós pedirdes
1vwepju|quando eles pedirem
104f7nm|ver
1ehwvcy|Vemo-nos amanhã na capela.
1l6egqt|Viste o pôr do sol na Costa do Sol?
141v6zb|eu vejo
9cj3vr|tu vês
1m7fq9x|ele vê
wc2uet|nós vemos
14f1ppg|vós vedes
1srx6dz|eles veem
evzgo8|eu vi
ln7f4j|tu viste
1ynv4zf|ele viu
1we7xuh|nós vimos
ub0gxb|vós vistes
1pqdzy7|eles viram
1hppoff|eu via
lkbljb|tu vias
1vbzwnr|ele via
qx8gvc|nós víamos
hxc0z3|vós víeis
1gt6q3r|eles viam
1puo8yg|que eu veja
1njy3vg|que tu vejas
me0fty|que ele veja
1e3o2pv|que nós vejamos
1uxsvei|que vós vejais
r501vw|que eles vejam
ah50hb|se eu visse
1vpptzv|se tu visses
b1mlsn|se ele visse
10mm64s|se nós víssemos
19wc6p3|se vós vísseis
1pc59u7|se eles vissem
wh5itw|quando eu vir
1cs7y8t|quando tu vires
1mb6tf0|quando ele vir
qzj69x|quando nós virmos
1msxzt0|quando vós virdes
ocy15h|quando eles virem
xvc4wm|vir
roz4iv|Vens connosco à reunião no domingo?
v9bmt1|Eles vieram da Beira de machimbombo.
5r3pr|eu venho
zpzv28|tu vens
1v0ijz|ele vem
1md7fre|vós vindes
o1m6mn|eles vêm
1glr9nj|eu vim
15lk80o|tu vieste
4cpkbo|ele veio
1a2wsbk|nós viemos
1lixkdw|vós viestes
1ndpqac|eles vieram
xc707x|eu vinha
cenudp|tu vinhas
jnxhox|ele vinha
thllni|nós vínhamos
1hdndod|vós vínheis
18hre5x|eles vinham
1dv79v6|que eu venha
1ks1eo8|que tu venhas
1yokqek|que ele venha
h0znod|que nós venhamos
ut8uus|que vós venhais
16luxlg|que eles venham
2rh5bm|se eu viesse
ggfuu6|se tu viesses
1bx9j56|se ele viesse
19kf5yj|se nós viéssemos
1tvf74i|se vós viésseis
r40fne|se eles viessem
9et47t|quando eu vier
1g5uesy|quando tu vieres
1trcnfl|quando ele vier
ptergm|quando nós viermos
1ir85j3|quando vós vierdes
1426dwu|quando eles vierem
1v14skb|poder
5yv6c8|Posso entrar?
1b26f5u|Pode repetir mais devagar, por favor?
188sm9n|eu posso
1p45aph|tu podes
1q0h0rb|ele pode
mt6rn8|nós podemos
1h005nz|vós podeis
19oqnfp|eles podem
13ymtkp|eu pude
1jdj3q8|tu pudeste
ns9b7e|ele pôde
gzsqem|nós pudemos
htvpr2|vós pudestes
xewttw|eles puderam
gs5laa|eu podia
18ik2rk|tu podias
iwi0ba|ele podia
tt71v|nós podíamos
42y35y|vós podíeis
rbpm60|eles podiam
18s8dvm|que eu possa
sm6me8|que tu possas
zw74ts|que ele possa
1o4x7ix|que nós possamos
tyvld4|que vós possais
119i2rc|que eles possam
9xx1g0|se eu pudesse
1h37gge|se tu pudesses
hqofew|se ele pudesse
6skaf1|se nós pudéssemos
1ef6xfo|se vós pudésseis
vqhkmq|se eles pudessem
10gmhu3|quando eu puder
r6ykma|quando tu puderes
l7uaj7|quando ele puder
17sbu38|quando nós pudermos
1jdoyb5|quando vós puderdes
v2e5d2|quando eles puderem
nda361|pôr
g9crtn|Põe a panela no fogo.
1nagf86|Pus as escrituras na mochila.
14914hf|eu ponho
fmks1l|tu pões
sfhczh|ele põe
85sfuh|nós pomos
172faju|vós pondes
m5yos9|eles põem
19n5ubz|eu pus
nyx71x|tu puseste
xfdcyy|ele pôs
1azcsvn|nós pusemos
1jwssnh|vós pusestes
7csva9|eles puseram
142apur|eu punha
1kh9qmv|tu punhas
1j7lpxz|ele punha
rzl7op|nós púnhamos
19tj3c4|vós púnheis
tnbp0n|eles punham
2lhmmq|que eu ponha
17vjy7o|que tu ponhas
1uwlrws|que ele ponha
1b4838t|que nós ponhamos
1pwewwk|que vós ponhais
122of0g|que eles ponham
h6fmzl|se eu pusesse
qcs1wx|se tu pusesses
1rvrzix|se ele pusesse
1dnjoh6|se nós puséssemos
djdp05|se vós pusésseis
1ywd469|se eles pusessem
gwetci|quando eu puser
10jfo0b|quando tu puseres
1i832e2|quando ele puser
113nk7|quando nós pusermos
k4p4k2|quando vós puserdes
bsdcqv|quando eles puserem
yhpewb|haver
1l6tax7|Há muita gente no mercado hoje.
k2x315|Houve uma reunião de jovens ontem.
b0s07p|eu hei
dfml5y|tu hás
1qudjo6|ele há
1nhf1us|nós havemos
116g09r|vós haveis
j1kuzu|eles hão
1qgtwca|eu houve
1jxw5lz|tu houveste
l8puz2|ele houve
ml52w7|nós houvemos
gvkd3d|vós houvestes
m0p1fn|eles houveram
17iohsi|eu havia
o73p7o|tu havias
b14tj2|ele havia
ev4epv|nós havíamos
fzsqdy|vós havíeis
16ciodg|eles haviam
1pzlyqi|que eu haja
i42p8q|que tu hajas
lnaszw|que ele haja
brkn71|que nós hajamos
7u1044|que vós hajais
zkla16|que eles hajam
1wgzxf1|se eu houvesse
10e52jb|se tu houvesses
1v9i3kl|se ele houvesse
11l54ly|se nós houvéssemos
1o68shl|se vós houvésseis
1mo5vgb|se eles houvessem
z1wi0u|quando eu houver
dwst69|quando tu houveres
xrx5iu|quando ele houver
stuxej|quando nós houvermos
1cddxpy|quando vós houverdes
n414s9|quando eles houverem
1sbh7t7|dever
deb8kl|Devemos chegar antes das nove.
l9ig2b|Deves beber muita água com este calor.
1h954oh|eu devo
1o34e4h|tu deves
1ebpfzz|ele deve
foaat0|nós devemos
j23v27|vós deveis
1a61v2p|eles devem
1ht4c2f|eu devi
69s2da|tu deveste
1lrwigu|ele deveu
ohlg8w|vós devestes
15e4k72|eles deveram
1hav9aa|eu devia
deqnoc|tu devias
1g8ja72|ele devia
zolqk3|nós devíamos
1jkleba|vós devíeis
250f4k|eles deviam
16jgoa6|que eu deva
1drrt6m|que tu devas
1dtgpag|que ele deva
1wcf3nl|que nós devamos
305a6o|que vós devais
1ektudi|que eles devam
i7mua|se eu devesse
1oo3kos|se tu devesses
1sd7cze|se ele devesse
b8ot2|se nós devêssemos
1c0id0p|se vós devêsseis
vvfn7k|se eles devessem
1xztmm9|quando eu dever
1pbjz9c|quando tu deveres
1ujjih|quando ele dever
mcsuri|quando nós devermos
ow0mc7|quando vós deverdes
xexs1w|quando eles deverem
xywwji|ficar
iyrjq8|Fico em Maputo até dezembro.
1fjzoua|Ficámos muito contentes com a visita.
p6pjze|eu fico
1tm0zc|tu ficas
m1jjyc|ele fica
1i8uf35|nós ficamos
weqy7k|vós ficais
38ul6g|eles ficam
g1mdf0|eu fiquei
14rzd3n|tu ficaste
1ilu5ft|ele ficou
1c3v23l|nós ficámos
1nnzngn|vós ficastes
ps76ar|eles ficaram
1xsb08p|eu ficava
1hvthb7|tu ficavas
1578b1x|ele ficava
19fij1q|nós ficávamos
qsf18d|vós ficáveis
1bbonkf|eles ficavam
hhbt2a|que eu fique
1hpupxs|que tu fiques
2e3wuw|que ele fique
1rz8mdt|que nós fiquemos
clnkxs|que vós fiqueis
1ukh2hc|que eles fiquem
s1ib6r|se eu ficasse
8ikljb|se tu ficasses
rntii3|se ele ficasse
vlz4f0|se nós ficássemos
1ief8nr|se vós ficásseis
11ar7tb|se eles ficassem
xq0kw0|quando eu ficar
wy6kc1|quando tu ficares
186lue0|quando ele ficar
1dhi8ll|quando nós ficarmos
2lqufs|quando vós ficardes
13litkl|quando eles ficarem
f66ikk|deixar
plto3t|Deixa-me ajudar com isso.
d92rly|Deixei o guarda-chuva no chapa.
17e7nj8|eu deixo
a4ha6w|tu deixas
1w3j74a|ele deixa
1uwdrt7|nós deixamos
d1fbzm|vós deixais
zg0eh0|eles deixam
1pdgozl|eu deixei
yqh8qb|tu deixaste
20171r|ele deixou
1oreetn|nós deixámos
va46d|vós deixastes
qumwlr|eles deixaram
10i85kz|eu deixava
1bu95c3|tu deixavas
1sle1lb|ele deixava
shqls4|nós deixávamos
aq5au3|vós deixáveis
5zyrqb|eles deixavam
1vihejl|que eu deixe
1r91id1|que tu deixes
1a51ltf|que ele deixe
15t8bqk|que nós deixemos
1ahdumv|que vós deixeis
nxsa8t|que eles deixem
g5ttxl|se eu deixasse
1q30duz|se tu deixasses
ff4fox|se ele deixasse
wgcyk6|se nós deixássemos
78ntah|se vós deixásseis
wnhglb|se eles deixassem
1oi6uj6|quando eu deixar
1ci86kt|quando tu deixares
s0z4bu|quando ele deixar
1561j|quando nós deixarmos
1to6nea|quando vós deixardes
clju6t|quando eles deixarem
1eebj1j|levar
p3kc1|Levamos o almoço para a machamba.
1mwsuj1|Quanto tempo leva daqui até à Matola?
1tue67t|eu levo
1p4wmrh|tu levas
bnbw7f|ele leva
1dbmeow|nós levamos
hsbc1f|vós levais
1v3wjkl|eles levam
1vry92|eu levei
1q46iru|tu levaste
1hamagg|ele levou
1jglrog|nós levámos
9ejvz8|vós levastes
19xjfuq|eles levaram
1hvq1iu|eu levava
1lz5ud6|tu levavas
eyigpe|ele levava
ek9mcb|nós levávamos
1txh832|vós leváveis
owneza|eles levavam
362s82|que eu leve
uo4fve|que tu leves
hju53w|que ele leve
13uafrh|que nós levemos
1ir92uc|que vós leveis
guc3aa|que eles levem
11sijy6|se eu levasse
hxfrn4|se tu levasses
1ofiwo6|se ele levasse
hzm4vf|se nós levássemos
1do0daq|se vós levásseis
u4yt18|se eles levassem
17sp7vh|quando eu levar
eqlftg|quando tu levares
wc14yd|quando ele levar
44oxc2|quando nós levarmos
19rby57|quando vós levardes
mv102o|quando eles levarem
8rbqp4|achar
bj7e0|Acho que vai chover.
r24qqz|Achas que ele vem?
qun1ko|eu acho
qvqnka|tu achas
mgmzku|ele acha
wgfvin|nós achamos
ew2hq6|vós achais
16yzaj6|eles acham
5p0ef1|eu achei
p7cw6l|tu achaste
odqyvv|ele achou
qbgij3|nós achámos
19kw65d|vós achastes
oa2da1|eles acharam
zhiol3|eu achava
1ucz0ux|tu achavas
oo7bx7|ele achava
q0wyow|nós achávamos
1sdmgaf|vós acháveis
c4tmlp|eles achavam
1pffaib|que eu ache
1hj9vtl|que tu aches
nwpzqt|que ele ache
urij22|que nós achemos
9qn2c5|que vós acheis
19vh9dt|que eles achem
ukvg0d|se eu achasse
v8uctl|se tu achasses
cyated|se ele achasse
agplk2|se nós achássemos
7psm25|se vós achásseis
9km8zt|se eles achassem
dooj12|quando eu achar
u5fi77|quando tu achares
1im4w9a|quando ele achar
ygy76r|quando nós acharmos
10y8j9a|quando vós achardes
gy0lsf|quando eles acharem
1eypils|sentir
60t2nu|Sinto a paz de Deus quando oro.
1xosm69|Como te sentes hoje?
1a71n4k|eu sinto
gd9kzs|tu sentes
10an92y|ele sente
v276rb|nós sentimos
1gj7nvn|vós sentis
1gu321w|eles sentem
6voq2y|eu senti
18qforz|tu sentiste
1brrli1|ele sentiu
1facprt|vós sentistes
7kx0xf|eles sentiram
w7781d|eu sentia
a8febv|tu sentias
1hbjndh|ele sentia
1o4mlwq|nós sentíamos
1cepde1|vós sentíeis
xmz8v7|eles sentiam
16z99kd|que eu sinta
1a5adt5|que tu sintas
1628eif|que ele sinta
qq40ns|que nós sintamos
4qo117|que vós sintais
r95o29|que eles sintam
1xwvzph|se eu sentisse
1ui6pkv|se tu sentisses
2s5mj1|se ele sentisse
1lq1ed2|se nós sentíssemos
mj1ybt|se vós sentísseis
uvnbfv|se eles sentissem
1dvqgi6|quando eu sentir
mfibmp|quando tu sentires
1qmokcm|quando ele sentir
1nwb1uz|quando nós sentirmos
yfa86|quando vós sentirdes
ej3te9|quando eles sentirem
4h8dks|precisar
1tw3kok|Preciso de comprar crédito para o telefone.
18iuaxb|Precisamos de ajuda para levar as cadeiras.
2kjsc|eu preciso
11zuevg|tu precisas
dmv3ka|ele precisa
p97prn|nós precisamos
15vrv2i|vós precisais
cgr7ng|eles precisam
1au916h|eu precisei
1sa9x9z|tu precisaste
1y2cj3|ele precisou
ve72r7|nós precisámos
8a1xhp|vós precisastes
s8vs5j|eles precisaram
sidlaz|eu precisava
1an1y3j|tu precisavas
16kaemn|ele precisava
az2ht8|nós precisávamos
1hn02j7|vós precisáveis
7e5fob|eles precisavam
1by7srl|que eu precise
16ezm01|que tu precises
v1ls7j|que ele precise
1aqzz8w|que nós precisemos
mbpahv|que vós preciseis
s5rafp|que eles precisem
ceqcd1|se eu precisasse
1qz3h7v|se tu precisasses
1dsg0i5|se ele precisasse
fa3wi2|se nós precisássemos
1j35lk5|se vós precisásseis
1e2qwv7|se eles precisassem
omb0ce|quando eu precisar
13onwl|quando tu precisares
13i31dy|quando ele precisar
vkkyy3|quando nós precisarmos
j6095i|quando vós precisardes
1tlru2x|quando eles precisarem
tcapld|chegar
m7rm87|Chegámos tarde porque o chapa avariou.
1fiesrt|Quando chegares, liga-me.
14mduvz|eu chego
r0e8ql|tu chegas
v119l1|ele chega
q2cyly|nós chegamos
13u7hw9|vós chegais
1go2ikl|eles chegam
12ia8ar|eu cheguei
1ronc3u|tu chegaste
1ljbcfu|ele chegou
jxdlme|nós chegámos
xn1geu|vós chegastes
6r8bgy|eles chegaram
1ski9sc|eu chegava
1njmnp6|tu chegavas
lncqyg|ele chegava
1i3vs6d|nós chegávamos
ynrlkw|vós chegáveis
1kxm0yu|eles chegavam
nthdud|que eu chegue
hm3trr|que tu chegues
7onop7|que ele chegue
1885ttg|que nós cheguemos
1yat0sf|que vós chegueis
13jgjgf|que eles cheguem
1u4akhg|se eu chegasse
1r59tqo|se tu chegasses
1vk8amk|se ele chegasse
binlhh|se nós chegássemos
juqrdo|se vós chegásseis
223jvw|se eles chegassem
9v6zon|quando eu chegar
1xyags4|quando tu chegares
108j8lr|quando ele chegar
3gx5ns|quando nós chegarmos
17wadg5|quando vós chegardes
3p3hnk|quando eles chegarem
xtjesf|encontrar
yylpnz|Encontrei a irmã Celeste no mercado.
144ig37|Não encontro as minhas chaves.
aj3lap|eu encontro
51zd39|tu encontras
1ijbfyb|ele encontra
1gvpw8o|nós encontramos
msc1u3|vós encontrais
1xb8u5h|eles encontram
1fumrpq|eu encontrei
166ganm|tu encontraste
uanh48|ele encontrou
1n0p988|nós encontrámos
mtb430|vós encontrastes
my1lbm|eles encontraram
128dcm6|eu encontrava
11ybo8y|tu encontravas
xkr4a|ele encontrava
5mfrcj|nós encontrávamos
awleme|vós encontráveis
23b8ue|eles encontravam
vwkuia|que eu encontre
3rrlxm|que tu encontres
c5hmhw|que ele encontre
11wxkcl|que nós encontremos
1rrjrp8|que vós encontreis
1wufcyy|que eles encontrem
8xniy6|se eu encontrasse
m2qedc|se tu encontrasses
1y0bqmu|se ele encontrasse
1uyhg63|se nós encontrássemos
uub602|se vós encontrásseis
14aya1g|se eles encontrassem
1eidz9p|quando eu encontrar
10vtock|quando tu encontrares
1oglg3p|quando ele encontrar
opvype|quando nós encontrarmos
m3rl2j|quando vós encontrardes
1kbrou0|quando eles encontrarem
1wh7vad|receber
5k6mg9|A família recebeu-nos com muita alegria.
v7ln9p|Recebeste a minha mensagem?
ze2y3z|eu recebo
4c3orb|tu recebes
102tj1d|ele recebe
146bmmi|nós recebemos
1xdrq79|vós recebeis
1iuzr17|eles recebem
yu3qq1|eu recebi
4kl910|tu recebeste
11238ak|ele recebeu
9vn3w2|vós recebestes
rmo558|eles receberam
3qfvlk|eu recebia
mkp6q6|tu recebias
16lggkc|ele recebia
tsbfn9|nós recebíamos
77sjkg|vós recebíeis
1y3d5ca|eles recebiam
g3a0jw|que eu receba
sl0h00|que tu recebas
hytuti|que ele receba
1u9yadv|que nós recebamos
7ghlga|que vós recebais
d5gkb8|que eles recebam
1s3cyog|se eu recebesse
1jf7852|se tu recebesses
n9tjew|se ele recebesse
n9nggk|se nós recebêssemos
1q19yfj|se vós recebêsseis
tfeghq|se eles recebessem
1d85eaz|quando eu receber
tjqwai|quando tu receberes
yh7fxv|quando ele receber
271kqc|quando nós recebermos
yl39gx|quando vós receberdes
4iujd6|quando eles receberem
9bwhyu|seguir
i6uz53|Segue em frente até à rotunda.
yvms6o|Quero seguir Jesus Cristo.
4sxh67|eu sigo
ba74lm|tu segues
16flrlc|ele segue
voloyx|nós seguimos
3vp1rd|vós seguis
1igkwqi|eles seguem
1yb1tk|eu segui
i62h7l|tu seguiste
j65zlf|ele seguiu
yssen|vós seguistes
1pjpk51|eles seguiram
1c5pu57|eu seguia
rva3cx|tu seguias
opy1gv|ele seguia
1ugby54|nós seguíamos
1v4zk3z|vós seguíeis
1lf3c59|eles seguiam
7qoqnc|que eu siga
1vvbbec|que tu sigas
1kifk4u|que ele siga
1hwj923|que nós sigamos
1sm48lu|que vós sigais
p0l4t0|que eles sigam
v900uf|se eu seguisse
1i63mel|se tu seguisses
6n5ygv|se ele seguisse
1wir2h0|se nós seguíssemos
koebin|se vós seguísseis
14h6mad|se eles seguissem
192gm10|quando eu seguir
19bayun|quando tu seguires
18tz00c|quando ele seguir
cdp205|quando nós seguirmos
1vcaegk|quando vós seguirdes
1bp9p1v|quando eles seguirem
5pa57c|abençoar
1hwdkt9|Que Deus te abençoe.
13bkcis|O pai abençoou a comida antes do jantar.
1cwkpyg|eu abençoo
rqbtuw|tu abençoas
3pe8sm|ele abençoa
ptwdof|nós abençoamos
1b81n0u|vós abençoais
qh5zg|eles abençoam
19kngp9|eu abençoei
sygdf|tu abençoaste
wgsvj7|ele abençoou
vyvqnz|nós abençoámos
pkg0hd|vós abençoastes
1mg7md3|eles abençoaram
14api13|eu abençoava
4xz4s3|tu abençoavas
1mapsf7|ele abençoava
1um250w|nós abençoávamos
ul0h3|vós abençoáveis
11ljhhn|eles abençoavam
1om5itl|que eu abençoe
1cn5v0p|que tu abençoes
1gja5oj|que ele abençoe
me3lss|que nós abençoemos
9ey3af|que vós abençoeis
yx654h|que eles abençoem
dp3jwd|se eu abençoasse
165tbv7|se tu abençoasses
1lxbn39|se ele abençoasse
1rz80ky|se nós abençoássemos
1srmfr1|se vós abençoásseis
1jea0bz|se eles abençoassem
xptkry|quando eu abençoar
1bdd6bp|quando tu abençoares
1a2v6ue|quando ele abençoar
1bt8cuj|quando nós abençoarmos
1mytpeu|quando vós abençoardes
1nswy4l|quando eles abençoarem
s4gdm6|acreditar
1whp8gv|Acredito em ti.
1oqk1r2|Acreditamos que as famílias são importantes para Deus.
18it0je|eu acredito
1uj4g84|tu acreditas
1ac4l38|ele acredita
vqbrjl|nós acreditamos
2a4474|vós acreditais
6p2884|eles acreditam
dkn8pb|eu acreditei
c39rpr|tu acreditaste
16tqakp|ele acreditou
plcek1|nós acreditámos
o5s87r|vós acreditastes
pgupb|eles acreditaram
11qpgp|eu acreditava
1ssgxbr|tu acreditavas
1gmlh4l|ele acreditava
oedbdq|nós acreditávamos
15zqdm5|vós acreditáveis
1e73fer|eles acreditavam
1jgdm7l|que eu acredite
erjvuz|que tu acredites
1pqlywf|que ele acredite
15i5rpc|que nós acreditemos
16rxdoj|que vós acrediteis
7xwur|que eles acreditem
1f680y3|se eu acreditasse
htlfmj|se tu acreditasses
nm5p3n|se ele acreditasse
1fezcxg|se nós acreditássemos
fywjm7|se vós acreditásseis
1m4pv3n|se eles acreditassem
19oq4p4|quando eu acreditar
e6h9e5|quando tu acreditares
x9fdy8|quando ele acreditar
1ntnvkx|quando nós acreditarmos
9sfnww|quando vós acreditardes
qdq40h|quando eles acreditarem
13q5hay|adorar
1rbj91g|Adoramos a Deus aos domingos.
14sam4v|Adoro matapa com caranguejo!
1uxk8ue|eu adoro
1q0cc0e|tu adoras
14if788|ele adora
1ankd1p|nós adoramos
1qyxi4k|vós adorais
lbpf52|eles adoram
10382v7|eu adorei
x4ihbl|tu adoraste
1xat685|ele adorou
1gsjq19|nós adorámos
qrwfsb|vós adorastes
7156ml|eles adoraram
zlglv9|eu adorava
16u4ut1|tu adoravas
1exnwi9|ele adorava
55o6si|nós adorávamos
xaf4w1|vós adoráveis
jv79p5|eles adoravam
1j0pjd3|que eu adore
apa83v|que tu adores
zpd5ep|que ele adore
1726qsu|que nós adoremos
r91l29|que vós adoreis
1xolihr|que eles adorem
jrnvkb|se eu adorasse
1e5gaq5|se tu adorasses
jqzhoj|se ele adorasse
mnxpgk|se nós adorássemos
1tx82of|se vós adorásseis
i8xgdp|se eles adorassem
19ermug|quando eu adorar
87g4bb|quando tu adorares
eu52eo|quando ele adorar
t7pr3l|quando nós adorarmos
1fx912o|quando vós adorardes
49kbc3|quando eles adorarem
ov3h44|arrepender-se
u4rue2|Arrependo-me do que disse.
jljmx9|Se nos arrependermos, Deus perdoa-nos.
y2p7xw|eu arrependo-me
35ortz|tu arrependes-te
1f6dzgw|ele arrepende-se
imuibg|nós arrependemo-nos
o68uto|vós arrependeis-vos
1czmavo|eles arrependem-se
fkve7u|eu arrependi-me
12lsn7i|tu arrependeste-te
1r6qa6n|ele arrependeu-se
sm1q7n|vós arrependestes-vos
qxmxz9|eles arrependeram-se
2d1tq9|eu arrependia-me
xlioco|tu arrependias-te
32nxr|ele arrependia-se
1iuiq9t|nós arrependíamo-nos
18ehqe5|vós arrependíeis-vos
3lytqz|eles arrependiam-se
1r9hlk4|que eu me arrependa
2fxifj|que tu te arrependas
132j698|que ele se arrependa
kva0xl|que nós nos arrependamos
1b8pur4|que vós vos arrependais
1px7vk2|que eles se arrependam
ac2rbc|se eu me arrependesse
v1nqhf|se tu te arrependesses
dclyi|se ele se arrependesse
1y5f548|se nós nos arrependêssemos
1s7rzab|se vós vos arrependêsseis
11l0bak|se eles se arrependessem
aa52vn|quando eu me arrepender
u3vg9h|quando tu te arrependeres
1uvyza1|quando ele se arrepender
sz2aq8|quando nós nos arrependermos
1mi61kl|quando vós vos arrependerdes
gc3220|quando eles se arrependerem
1695hzr|crer
17by1dz|Creio em Jesus Cristo.
2pxt29|Quem crer será salvo.
hwt5sv|eu creio
11p9hjw|tu crês
yrdcfe|ele crê
1dddvqo|nós cremos
97skb1|vós credes
1ks401u|eles creem
1uc6ioz|eu cri
1on1gu4|tu creste
11jfpki|ele creu
jyvxtg|vós crestes
1hzu5w4|eles creram
191w3qe|eu cria
fik1sm|tu crias
174e0n6|ele cria
tfdjsn|nós críamos
jpoc2i|vós críeis
qvxaz6|eles criam
1dbluf2|que eu creia
1qf3oe8|que tu creias
4z2xg0|que ele creia
1n5ge1|que nós creiamos
1els85k|que vós creiais
1wowa9w|que eles creiam
1ld0uye|se eu cresse
1n814s6|se tu cresses
l4pc2m|se ele cresse
t79zhm|se nós crêssemos
2zp7l1|se vós crêsseis
theafy|se eles cressem
nvdb99|quando eu crer
18hsr4y|quando tu creres
1dsutmd|quando ele crer
1t0sz1e|quando nós crermos
1vlgfiz|quando vós crerdes
1vdccle|quando eles crerem
igjhde|obedecer
hhr9mh|As crianças obedecem aos pais.
ppy7ng|Quando obedecemos aos mandamentos, sentimos paz.
6hvbra|eu obedeço
1rd83i2|tu obedeces
1alaot4|ele obedece
66grut|nós obedecemos
j9ed5o|vós obedeceis
2flxcm|eles obedecem
4h5blk|eu obedeci
82v2t9|tu obedeceste
1ihppjr|ele obedeceu
1w2fecz|vós obedecestes
16l7dzx|eles obedeceram
1yn0ixn|eu obedecia
epti8h|tu obedecias
1f5fnmf|ele obedecia
uid3fc|nós obedecíamos
2r37tr|vós obedecíeis
1ygukp5|eles obedeciam
nbllp7|que eu obedeça
7htv3v|que tu obedeças
1btvrzt|que ele obedeça
1wo30mu|que nós obedeçamos
sniwqx|que vós obedeçais
gbcszf|que eles obedeçam
mw2le7|se eu obedecesse
1v3m7s5|se tu obedecesses
lepgg7|se ele obedecesse
guobm5|se nós obedecêssemos
1jawxsk|se vós obedecêsseis
1ip2nvd|se eles obedecessem
lxzhd8|quando eu obedecer
1ekg4zr|quando tu obedeceres
1rojzas|quando ele obedecer
dguu9p|quando nós obedecermos
ml0qh8|quando vós obedecerdes
eqe53z|quando eles obedecerem
1waoy9j|orar
11bzdi1|Vamos orar antes de comer.
ymstxz|Ela orava todas as noites com os filhos.
1fignax|eu oro
o56dvr|tu oras
fdpbbn|ele ora
s4vgtc|nós oramos
152djxf|vós orais
6i95cr|eles oram
1eupq1y|eu orei
f9m284|tu oraste
ev41tk|ele orou
y9utsw|nós orámos
3qa2l0|vós orastes
v9zydo|eles oraram
16eh0s6|eu orava
9xj11k|tu oravas
1iw3rcq|ele orava
2i4eor|nós orávamos
1qt5jwe|vós oráveis
1gthfnc|eles oravam
1f7hfpg|que eu ore
1nja8le|que tu ores
1pfboy6|que ele ore
1bu6uwb|que nós oremos
1j8e042|que vós oreis
lz0mbm|que eles orem
2w9rl2|se eu orasse
11xbd5a|se tu orasses
hz3nvi|se ele orasse
1w8w64z|se nós orássemos
4qjtu2|se vós orásseis
1xe7x86|se eles orassem
683ldp|quando eu orar
364r4q|quando tu orares
1gugy05|quando ele orar
1km9aaa|quando nós orarmos
1ysthzv|quando vós orardes
1lzjasa|quando eles orarem
1kd720w|pecar
dziiaj|Todos pecamos, mas podemos mudar.
891dl4|Ele pecou e depois arrependeu-se.
rpetxc|eu peco
ucxham|tu pecas
hk9ioe|ele peca
wxtvxz|nós pecamos
1mi0bdi|vós pecais
xf8ks6|eles pecam
17pq6aa|eu pequei
p3c1m9|tu pecaste
pimyrv|ele pecou
qsuiyf|nós pecámos
sj4qnd|vós pecastes
bmf0sd|eles pecaram
1iwsssv|eu pecava
ysyf3p|tu pecavas
g9c86j|ele pecava
15z5kbs|nós pecávamos
1bgk1lb|vós pecáveis
161hknd|eles pecavam
16biudo|que eu peque
1hfaism|que tu peques
cw5dnq|que ele peque
1pp0dab|que nós pequemos
13imhcq|que vós pequeis
11o0a1i|que eles pequem
1hicxjx|se eu pecasse
116s3kd|se tu pecasses
1ukpy2d|se ele pecasse
ni018i|se nós pecássemos
1xyc659|se vós pecásseis
ki9sul|se eles pecassem
1be9966|quando eu pecar
1ilw3nr|quando tu pecares
1itxsvq|quando ele pecar
12gpfx7|quando nós pecarmos
19b7ppi|quando vós pecardes
1ijm8sj|quando eles pecarem
1mg2byq|perdoar
13790qa|Perdoa-me, cheguei atrasado.
zlgj51|Deus perdoa quem se arrepende.
16s5vym|eu perdoo
1c1yszo|tu perdoas
r7ylwg|ele perdoa
v8mk39|nós perdoamos
q50who|vós perdoais
mef0u4|eles perdoam
ev6i7v|eu perdoei
l02567|tu perdoaste
16ry5sd|ele perdoou
p3n73p|nós perdoámos
hk3snn|vós perdoastes
txx9s7|eles perdoaram
1u8hlbh|eu perdoava
3cu5zr|tu perdoavas
np4yyh|ele perdoava
1vm7rbe|nós perdoávamos
nii661|vós perdoáveis
936xaz|eles perdoavam
1rnrvdl|que eu perdoe
cxnxzj|que tu perdoes
1bu6ynj|que ele perdoe
4e6k0w|que nós perdoemos
ztvgeb|que vós perdoeis
1im1v87|que eles perdoem
1cmhv3|se eu perdoasse
g1pq3n|se tu perdoasses
jpw2qf|se ele perdoasse
1sgw4ww|se nós perdoássemos
1prqa0j|se vós perdoásseis
1c14har|se eles perdoassem
iunkgk|quando eu perdoar
58ycol|quando tu perdoares
sag60c|quando ele perdoar
1xhdu9x|quando nós perdoarmos
kjd5d0|quando vós perdoardes
19wdusx|quando eles perdoarem
972qcx|ressuscitar
vr1d97|Cristo ressuscitou ao terceiro dia.
1ypo1w0|Cremos que todos vão ressuscitar.
1bnfq9b|eu ressuscito
fvbiwz|tu ressuscitas
1tu8mol|ele ressuscita
t0w92|nós ressuscitamos
1jwqam1|vós ressuscitais
1277udr|eles ressuscitam
7ub7m4|eu ressuscitei
1591wk0|tu ressuscitaste
hwmc22|ele ressuscitou
6y098m|nós ressuscitámos
1vkr6ly|vós ressuscitastes
y3rqn4|eles ressuscitaram
2h6xh8|eu ressuscitava
1lvd7cs|tu ressuscitavas
1iqufl4|ele ressuscitava
1k79od1|nós ressuscitávamos
1pkrqao|vós ressuscitáveis
lygsd0|eles ressuscitavam
ahfj9k|que eu ressuscite
14e4jl0|que tu ressuscites
lg3snm|que ele ressuscite
17a6l6v|que nós ressuscitemos
qal1c6|que vós ressusciteis
p8u61c|que eles ressuscitem
net1qs|se eu ressuscitasse
1bylpde|se tu ressuscitasses
1a4380s|se ele ressuscitasse
5gr0b9|se nós ressuscitássemos
1rxsfp8|se vós ressuscitásseis
1fpgz9e|se eles ressuscitassem
eq2c3r|quando eu ressuscitar
1q3ox8u|quando tu ressuscitares
122p6zj|quando ele ressuscitar
1yiqoxk|quando nós ressuscitarmos
b1ofmd|quando vós ressuscitardes
66gt6e|quando eles ressuscitarem
1fmzc9m|restaurar
bp4k4n|Restauraram a velha capela do bairro.
14m5oog|Deus pode restaurar a nossa esperança.
1qhin5y|eu restauro
1rmgcmc|tu restauras
1mq7l94|ele restaura
1hpn18t|nós restauramos
jei6is|vós restaurais
121i5eo|eles restauram
k93rlv|eu restaurei
njawjz|tu restauraste
n9wgqt|ele restaurou
1nume8d|nós restaurámos
106d7qj|vós restaurastes
w7lqzv|eles restauraram
1a7bi5x|eu restaurava
5w2xdj|tu restauravas
15twz0x|ele restaurava
4k0y|nós restaurávamos
1vb2z29|vós restauráveis
1h2c3h3|eles restauravam
80m6ad|que eu restaure
wywa6z|que tu restaures
1rcxmgv|que ele restaure
cioyv4|que nós restauremos
1677wur|que vós restaureis
tm7hhb|que eles restaurem
1rmz5sr|se eu restaurasse
1m37i4f|se tu restaurasses
1059v2r|se ele restaurasse
5yvr04|se nós restaurássemos
1wzfoqn|se vós restaurásseis
1h6q9bn|se eles restaurassem
1k2z7mg|quando eu restaurar
1ofnem1|quando tu restaurares
1y5delc|quando ele restaurar
eouee9|quando nós restaurarmos
9ck7wg|quando vós restaurardes
1998y9d|quando eles restaurarem
7pe1dg|salvar
swzt4v|Jesus Cristo salva-nos.
zysxr6|O vizinho salvou a criança do rio.
54ogec|eu salvo
10uoe0c|tu salvas
1kh4d56|ele salva
1e065kb|nós salvamos
1f6i4zm|vós salvais
u5iv34|eles salvam
19hedcx|eu salvei
i71b6f|tu salvaste
nwqdnz|ele salvou
17v6skr|nós salvámos
um5v91|vós salvastes
8h2odn|eles salvaram
1fakg9v|eu salvava
jvjlr|tu salvavas
wjjdqn|ele salvava
vyttno|nós salvávamos
kvvp6z|vós salváveis
tbt0uv|eles salvavam
akzrqd|que eu salve
1u5rwe5|que tu salves
12dtwpz|que ele salve
1fl1mew|que nós salvemos
ljdhjf|que vós salveis
1qme1i5|que eles salvem
ex09ox|se eu salvasse
1to7zan|se tu salvasses
1k8ilzd|se ele salvasse
1010cny|se nós salvássemos
14atv35|se vós salvásseis
1kekfm3|se eles salvassem
11ws3sa|quando eu salvar
lsffvd|quando tu salvares
1m8jitu|quando ele salvar
1lc1yfj|quando nós salvarmos
185614q|quando vós salvardes
14jbrex|quando eles salvarem
fowvmu|servir
225huz|Servimos a comunidade aos sábados.
4x42ua|Posso servir-te mais xima?
tqbw66|eu sirvo
1uhidke|tu serves
14xggo8|ele serve
1wznjzt|nós servimos
9k0i8p|vós servis
1issoki|eles servem
xcpxu0|eu servi
17qz57h|tu serviste
negvnv|ele serviu
go1u3j|vós servistes
1nm5x8t|eles serviram
a6djuz|eu servia
18ap7th|tu servias
sy8xjb|ele servia
1qnal6w|nós servíamos
11c6b9b|vós servíeis
is0c6d|eles serviam
1deugcn|que eu sirva
i3fp2r|que tu sirvas
1wj9m9h|que ele sirva
1gmizfu|que nós sirvamos
1owz4wl|que vós sirvais
kw9yub|que eles sirvam
pybcpn|se eu servisse
1dc4d7h|se tu servisses
1t3o90z|se ele servisse
ob4zs|se nós servíssemos
bno6i3|se vós servísseis
1b0l8tt|se eles servissem
1klw8c8|quando eu servir
6b0rqv|quando tu servires
cifrs0|quando ele servir
1gi0lgh|quando nós servirmos
p4b5s|quando vós servirdes
1qy06e7|quando eles servirem
t36js9|testificar
1okrbwz|Testifico que Deus vive.
w9wfln|Ela testificou do amor de Cristo.
1ft5i5j|eu testifico
ya17ch|tu testificas
1g5upvx|ele testifica
12z6jq6|nós testificamos
1ryrhld|vós testificais
i9advx|eles testificam
1a5md5l|eu testifiquei
naskwe|tu testificaste
1ptjz9e|ele testificou
1945wpq|nós testificámos
1pti96m|vós testificastes
10poa62|eles testificaram
1cxgp0|eu testificava
wr4eo6|tu testificavas
1mgpby8|ele testificava
i5b2kt|nós testificávamos
vf2hug|vós testificáveis
f66swe|eles testificavam
1qi5mbf|que eu testifique
1m3e7yx|que tu testifiques
1gd9af5|que ele testifique
m4hyr2|que nós testifiquemos
17ijyg1|que vós testifiqueis
ajy2dx|que eles testifiquem
1lh7odk|se eu testificasse
6s7ymw|se tu testificasses
8ac9bk|se ele testificasse
1w0tob5|se nós testificássemos
9j9czk|se vós testificásseis
1deskqw|se eles testificassem
192ecf7|quando eu testificar
blf7do|quando tu testificares
1vfilcr|quando ele testificar
jsnw4s|quando nós testificarmos
9dj2wp|quando vós testificardes
nde8pg|quando eles testificarem
1prr7nv|Eu falo um pouco de português.
1r3jlf8|Vamos à igreja todos os domingos.
1yau2q0|Amanhã vou à Beira.
6f36kz|Ontem fui ao mercado.
iicerz|Já comeste?
eacev2|Ela chegou às oito.
1kavmbv|Quando era criança, ia à igreja com a minha avó.
jaqygl|Estava a chover quando saímos.
19j8hgy|Queria um refresco, por favor.
16elu2v|Quero que venhas comigo.
1283uym|Espero que esteja tudo bem.
1suh1h9|Talvez ele saiba.
1oa6uax|Se eu tivesse tempo, ficava mais.
pgl12y|Ele pediu que orássemos juntos.
6z206a|Fala como se fosse de Maputo.
so8flz|Se puderes, vem amanhã.
PHRASES
rm -f "$TMP"
cd "$HOME/Desktop"
rm -f verbos-audio.zip
ditto -c -k --keepParent verbos-audio verbos-audio.zip
echo
echo "Done. Attach verbos-audio.zip (on your Desktop) in the chat with Claude."
