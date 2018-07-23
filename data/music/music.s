;this file for FamiTone2 library generated by text2data tool

music_music_data:
	.byte 3
	.word @instruments
	.word @samples-3
	.word @song0ch0,@song0ch1,@song0ch2,@song0ch3,@song0ch4,307,256
	.word @song1ch0,@song1ch1,@song1ch2,@song1ch3,@song1ch4,307,256
	.word @song2ch0,@song2ch1,@song2ch2,@song2ch3,@song2ch4,307,256

@instruments:
	.byte $b0 ;instrument $02
	.word @env1,@env13,@env0
	.byte $00
	.byte $f0 ;instrument $03
	.word @env2,@env14,@env0
	.byte $00
	.byte $b0 ;instrument $04
	.word @env3,@env0,@env0
	.byte $00
	.byte $f0 ;instrument $06
	.word @env4,@env15,@env0
	.byte $00
	.byte $f0 ;instrument $09
	.word @env5,@env16,@env0
	.byte $00
	.byte $f0 ;instrument $0c
	.word @env6,@env17,@env0
	.byte $00
	.byte $b0 ;instrument $0d
	.word @env7,@env0,@env0
	.byte $00
	.byte $30 ;instrument $11
	.word @env8,@env19,@env0
	.byte $00
	.byte $70 ;instrument $13
	.word @env11,@env20,@env0
	.byte $00
	.byte $b0 ;instrument $14
	.word @env12,@env21,@env0
	.byte $00
	.byte $b0 ;instrument $1c
	.word @env8,@env18,@env0
	.byte $00
	.byte $b0 ;instrument $2d
	.word @env9,@env0,@env22
	.byte $00
	.byte $30 ;instrument $2e
	.word @env10,@env0,@env23
	.byte $00

@samples:
@env0:
	.byte $c0,$00,$00
@env1:
	.byte $cf,$03,$ce,$03,$cd,$00,$04
@env2:
	.byte $c7,$c1,$c1,$c0,$00,$03
@env3:
	.byte $c9,$c7,$c2,$c7,$c6,$c1,$00,$05
@env4:
	.byte $ca,$c6,$c6,$c5,$c5,$c4,$c4,$c3,$02,$c2,$02,$c1,$03,$c0,$00,$0d
@env5:
	.byte $cf,$cb,$c7,$02,$c8,$c7,$c3,$c2,$c1,$c0,$00,$09
@env6:
	.byte $cf,$cc,$06,$cb,$04,$ca,$05,$c9,$07,$c8,$06,$c7,$04,$c6,$05,$c5
	.byte $04,$c4,$05,$c3,$06,$c2,$06,$c1,$09,$c0,$00,$19
@env7:
	.byte $c1,$c3,$c5,$00,$02
@env8:
	.byte $ca,$c7,$0b,$c6,$15,$c5,$18,$c4,$00,$07
@env9:
	.byte $c4,$00,$00
@env10:
	.byte $c9,$c9,$c6,$cc,$cb,$c6,$c8,$c6,$c5,$c6,$00,$09
@env11:
	.byte $c6,$c2,$c6,$00,$02
@env12:
	.byte $c7,$00,$00
@env13:
	.byte $cc,$c0,$00,$01
@env14:
	.byte $c0,$bf,$00,$01
@env15:
	.byte $c0,$06,$bf,$00,$02
@env16:
	.byte $bd,$ca,$c5,$bc,$c3,$00,$04
@env17:
	.byte $ba,$bb,$bc,$bd,$be,$bf,$c0,$00,$06
@env18:
	.byte $d3,$c7,$c7,$c3,$c3,$c0,$c0,$00,$01
@env19:
	.byte $c0,$c3,$c7,$c3,$c3,$c0,$c0,$00,$01
@env20:
	.byte $c0,$03,$c5,$03,$c7,$03,$cc,$03,$c7,$c7,$c4,$c4,$00,$00
@env21:
	.byte $c0,$03,$c4,$03,$c7,$03,$ca,$03,$c7,$03,$c4,$03,$c0,$02,$c0,$00
	.byte $00
@env22:
	.byte $c3,$c9,$c6,$c0,$bd,$b7,$ba,$c0,$c0,$00,$00
@env23:
	.byte $c0,$0d,$c1,$c2,$02,$c0,$be,$02,$c0,$c2,$00,$05


@song0ch0:
	.byte $fb,$06
@song0ch0loop:
@ref0:
	.byte $fb,$03,$90,$36,$a9,$98,$36,$81
@ref1:
	.byte $41,$3d,$3a,$3c,$41,$3d,$3a,$89,$96,$3a,$8d
@ref2:
	.byte $98,$1e,$00,$14,$00,$1e,$00,$83,$1e,$00,$83,$2c,$00,$1e,$00,$2c
	.byte $00,$83,$2c,$00,$83
@ref3:
	.byte $28,$00,$22,$00,$29,$2c,$89,$28,$95
@ref4:
	.byte $1e,$01,$1e,$01,$1e,$00,$22,$01,$22,$01,$22,$00,$24,$01,$24,$01
	.byte $24,$00
@ref5:
	.byte $28,$01,$28,$01,$28,$00,$2c,$01,$2c,$01,$2c,$00,$2e,$01,$2e,$2c
	.byte $85
@ref6:
	.byte $2c,$2e,$2d,$2c,$28,$2d,$28,$24,$29,$24,$22,$25,$22,$1e,$8b
@ref7:
	.byte $1a,$89,$1c,$89,$22,$95
@ref8:
	.byte $96,$2c,$85,$98,$1e,$85,$24,$85,$1e,$95
@ref9:
	.byte $8f,$2d,$25,$2c,$95
	.byte $ff,$08
	.word @ref8
@ref11:
	.byte $24,$83,$28,$83,$2c,$89,$2c,$95
@ref12:
	.byte $3c,$85,$3c,$85,$00,$85,$3c,$85,$00,$8d
@ref13:
	.byte $40,$85,$01,$34,$85,$01,$36,$8d,$36,$85
@ref14:
	.byte $8e,$1e,$83,$1e,$83,$1e,$a1
@ref15:
	.byte $2e,$a5,$98,$2c,$85
@ref16:
	.byte $8c,$5c,$00,$54,$00,$52,$00,$4e,$00,$54,$52,$4e,$52,$5c,$95
@ref17:
	.byte $5e,$89,$58,$89,$5c,$58,$5c,$89,$98,$2c,$85
@ref18:
	.byte $8c,$4e,$95,$4e,$95
@ref19:
	.byte $54,$89,$58,$89,$4e,$8d,$98,$5c,$85
@ref20:
	.byte $8c,$5c,$95,$5c,$95
@ref21:
	.byte $5e,$89,$58,$89,$5c,$95
	.byte $fd
	.word @song0ch0loop

@song0ch1:
@song0ch1loop:
@ref22:
	.byte $98,$24,$00,$ab
@ref23:
	.byte $9f,$96,$52,$8d
@ref24:
	.byte $98,$36,$00,$2c,$00,$36,$00,$83,$36,$00,$83,$44,$00,$36,$00,$44
	.byte $00,$83,$44,$00,$83
@ref25:
	.byte $40,$00,$3a,$00,$41,$44,$89,$40,$95
@ref26:
	.byte $36,$01,$36,$01,$36,$00,$3a,$01,$3a,$01,$3a,$00,$3c,$01,$3c,$01
	.byte $3c,$00
@ref27:
	.byte $40,$01,$40,$01,$40,$00,$44,$01,$44,$01,$44,$00,$46,$01,$46,$44
	.byte $85
@ref28:
	.byte $14,$16,$15,$14,$10,$15,$10,$0c,$11,$0c,$0a,$0d,$0a,$06,$8b
@ref29:
	.byte $02,$89,$04,$89,$0a,$95
@ref30:
	.byte $96,$14,$85,$98,$06,$85,$0c,$85,$06,$95
@ref31:
	.byte $8f,$15,$0d,$14,$95
@ref32:
	.byte $96,$44,$85,$98,$36,$85,$3c,$85,$36,$95
@ref33:
	.byte $3c,$83,$40,$83,$44,$89,$44,$95
@ref34:
	.byte $1e,$85,$1e,$8d,$1e,$95
@ref35:
	.byte $1e,$89,$22,$89,$1e,$8d,$24,$85
@ref36:
	.byte $2c,$83,$2c,$83,$2c,$89,$2c,$95
@ref37:
	.byte $2e,$89,$28,$89,$2c,$8d,$28,$85
@ref38:
	.byte $2c,$95,$2c,$95
	.byte $ff,$08
	.word @ref37
@ref40:
	.byte $44,$95,$44,$95
@ref41:
	.byte $46,$89,$40,$89,$44,$8d,$40,$85
@ref42:
	.byte $44,$95,$44,$95
@ref43:
	.byte $46,$89,$40,$89,$44,$95
	.byte $fd
	.word @song0ch1loop

@song0ch2:
@song0ch2loop:
@ref44:
	.byte $80,$36,$85,$00,$8d,$2c,$85,$00,$8d
@ref45:
	.byte $36,$85,$01,$98,$32,$85,$01,$84,$3a,$85,$01,$98,$40,$85,$00,$81
	.byte $ff,$08
	.word @ref44
@ref47:
	.byte $98,$28,$85,$01,$26,$85,$01,$84,$22,$95
	.byte $ff,$08
	.word @ref44
	.byte $ff,$0d
	.word @ref45
	.byte $ff,$08
	.word @ref44
	.byte $ff,$08
	.word @ref47
@ref52:
	.byte $80,$1e,$85,$00,$8d,$1e,$85,$00,$8d
@ref53:
	.byte $98,$46,$85,$01,$46,$85,$01,$44,$95
	.byte $ff,$08
	.word @ref52
@ref55:
	.byte $98,$36,$83,$3a,$83,$3c,$89,$44,$8d,$3a,$85
	.byte $ff,$0a
	.word @ref12
	.byte $ff,$0a
	.word @ref13
@ref58:
	.byte $3c,$83,$3c,$01,$3c,$89,$3c,$85,$00,$8d
	.byte $ff,$0a
	.word @ref13
@ref60:
	.byte $3c,$85,$00,$8d,$3c,$85,$00,$8d
	.byte $ff,$0a
	.word @ref13
@ref62:
	.byte $54,$85,$00,$8d,$54,$85,$00,$8d
@ref63:
	.byte $58,$85,$01,$4c,$85,$01,$4e,$8d,$4e,$85
	.byte $ff,$08
	.word @ref62
@ref65:
	.byte $58,$85,$01,$4c,$85,$01,$4e,$95
	.byte $fd
	.word @song0ch2loop

@song0ch3:
@song0ch3loop:
@ref66:
	.byte $86,$18,$85,$82,$19,$18,$85,$19,$86,$18,$85,$82,$19,$18,$85,$18
	.byte $81
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
	.byte $ff,$0d
	.word @ref66
@ref84:
	.byte $86,$10,$85,$82,$11,$10,$85,$11,$86,$10,$85,$82,$11,$10,$85,$10
	.byte $81
	.byte $ff,$0d
	.word @ref84
	.byte $ff,$0d
	.word @ref84
@ref87:
	.byte $8a,$08,$a5,$82,$20,$85
	.byte $fd
	.word @song0ch3loop

@song0ch4:
@song0ch4loop:
@ref88:
	.byte $00,$ad
@ref89:
	.byte $af
@ref90:
	.byte $00,$ad
@ref91:
	.byte $af
@ref92:
	.byte $00,$ad
@ref93:
	.byte $af
@ref94:
	.byte $00,$ad
@ref95:
	.byte $af
@ref96:
	.byte $00,$ad
@ref97:
	.byte $af
@ref98:
	.byte $00,$ad
@ref99:
	.byte $af
@ref100:
	.byte $00,$ad
@ref101:
	.byte $af
@ref102:
	.byte $00,$ad
@ref103:
	.byte $af
@ref104:
	.byte $00,$ad
@ref105:
	.byte $af
@ref106:
	.byte $00,$ad
@ref107:
	.byte $af
@ref108:
	.byte $00,$ad
@ref109:
	.byte $af
	.byte $fd
	.word @song0ch4loop


@song1ch0:
	.byte $fb,$06
@song1ch0loop:
@ref110:
	.byte $87,$98,$22,$85,$00,$85,$22,$85,$00,$85,$22,$8d,$22,$85
@ref111:
	.byte $00,$85,$22,$8d,$22,$85,$00,$85,$22,$85,$00,$85,$22,$85
@ref112:
	.byte $87,$22,$8d,$22,$8d,$22,$8d,$22,$85
	.byte $ff,$09
	.word @ref112
@ref114:
	.byte $4b,$61,$5c,$8d,$4e,$85,$52,$54,$53,$3a,$95
@ref115:
	.byte $53,$23,$3a,$85,$57,$58,$56,$58,$85,$61,$63,$61,$5c,$89,$3a,$85
@ref116:
	.byte $3b,$49,$3b,$23,$31,$23,$3b,$31,$23,$31,$3b,$31,$23,$31,$3b,$32
	.byte $81
@ref117:
	.byte $31,$1f,$3a,$85,$4f,$57,$3b,$3e,$89,$3a,$8d,$3a,$85
@ref118:
	.byte $87,$22,$8c,$4a,$53,$00,$85,$52,$4e,$4a,$4e,$44,$85,$90,$5c,$8d
	.byte $60,$85
@ref119:
	.byte $87,$98,$60,$52,$5c,$58,$56,$52,$4e,$52,$54,$52,$8b,$90,$4e,$8d
	.byte $22,$85
@ref120:
	.byte $36,$8d,$2c,$8d,$94,$3a,$85,$98,$2c,$85,$94,$44,$85,$98,$2c,$85
@ref121:
	.byte $92,$32,$8d,$40,$85,$98,$2c,$85,$96,$2c,$85,$98,$2c,$8d,$2d,$4e
	.byte $4a
@ref122:
	.byte $2c,$32,$3a,$32,$2c,$32,$3a,$32,$2c,$32,$3a,$32,$2c,$32,$3a,$32
	.byte $2c,$32,$3a,$32,$2c,$32,$3a,$32,$30,$32,$36,$30,$30,$32,$36,$30
@ref123:
	.byte $32,$3a,$40,$3a,$32,$3a,$40,$3a,$32,$3a,$40,$32,$36,$3e,$44,$36
	.byte $3e,$44,$36,$3e,$44,$48,$40,$44,$48,$4a,$48,$4a,$48,$44,$83
@ref124:
	.byte $87,$23,$3a,$89,$23,$3a,$89,$23,$3a,$89,$23,$3a,$81
	.byte $ff,$0d
	.word @ref124
	.byte $fd
	.word @song1ch0loop

@song1ch1:
@song1ch1loop:
@ref126:
	.byte $83,$98,$15,$01,$2d,$01,$15,$01,$2c,$85,$15,$01,$2c,$85,$15,$01
	.byte $2c,$81
@ref127:
	.byte $83,$29,$01,$28,$85,$28,$85,$3e,$85,$22,$85,$22,$85,$23,$3f,$32
	.byte $81
@ref128:
	.byte $83,$14,$85,$2c,$85,$14,$85,$2c,$85,$14,$85,$2c,$85,$14,$85,$2c
	.byte $81
@ref129:
	.byte $83,$28,$85,$28,$85,$28,$85,$3e,$85,$22,$85,$22,$85,$23,$3f,$32
	.byte $81
@ref130:
	.byte $83,$2d,$15,$45,$15,$2c,$85,$44,$85,$2c,$85,$44,$85,$2c,$85,$44
	.byte $81
@ref131:
	.byte $83,$40,$85,$40,$85,$40,$85,$56,$85,$3a,$85,$3a,$85,$3b,$57,$4a
	.byte $81
@ref132:
	.byte $83,$2c,$85,$44,$85,$2c,$85,$44,$85,$2c,$85,$44,$85,$2c,$85,$44
	.byte $81
	.byte $ff,$11
	.word @ref131
@ref134:
	.byte $83,$15,$8c,$45,$98,$2d,$01,$15,$01,$2c,$85,$15,$01,$2c,$85,$15
	.byte $01,$2c,$81
@ref135:
	.byte $83,$29,$01,$28,$85,$28,$85,$3e,$85,$48,$85,$1e,$85,$23,$41,$32
	.byte $81
@ref136:
	.byte $36,$00,$1e,$00,$4e,$00,$36,$00,$36,$00,$1e,$00,$4e,$00,$36,$00
	.byte $36,$00,$1e,$00,$4e,$00,$36,$00,$36,$00,$1e,$00,$4e,$00,$36,$00
@ref137:
	.byte $4a,$00,$32,$00,$4a,$00,$32,$00,$4a,$00,$32,$00,$60,$00,$48,$00
	.byte $44,$00,$2d,$45,$2d,$45,$2d,$49,$3c,$81
	.byte $ff,$11
	.word @ref128
	.byte $ff,$11
	.word @ref129
@ref140:
	.byte $83,$15,$2d,$2d,$45,$15,$2d,$2d,$45,$15,$2d,$2d,$45,$15,$2d,$2c
	.byte $81
@ref141:
	.byte $45,$29,$41,$29,$41,$29,$41,$3f,$57,$23,$3b,$23,$3b,$23,$3f,$32
	.byte $81
	.byte $fd
	.word @song1ch1loop

@song1ch2:
@song1ch2loop:
@ref142:
	.byte $98,$15,$00,$85,$2d,$14,$85,$01,$11,$14,$89,$14,$00,$18,$89,$36
	.byte $81
@ref143:
	.byte $1a,$8d,$32,$85,$00,$85,$36,$85,$00,$85,$3e,$8d
@ref144:
	.byte $14,$89,$2d,$14,$89,$11,$14,$89,$15,$18,$89,$36,$81
@ref145:
	.byte $1a,$8d,$32,$8d,$36,$8d,$3e,$8d
@ref146:
	.byte $2d,$49,$4b,$45,$2c,$89,$29,$2c,$89,$2d,$30,$89,$4e,$81
@ref147:
	.byte $32,$8d,$4a,$8d,$4e,$8d,$56,$8d
@ref148:
	.byte $2c,$89,$45,$2c,$89,$29,$2c,$89,$2d,$30,$89,$4e,$81
	.byte $ff,$08
	.word @ref147
@ref150:
	.byte $15,$00,$85,$2d,$14,$85,$01,$11,$14,$89,$14,$00,$18,$89,$36,$81
@ref151:
	.byte $1a,$8d,$32,$85,$00,$85,$28,$85,$00,$85,$3e,$85,$34,$85
@ref152:
	.byte $1e,$89,$37,$1e,$89,$1b,$1e,$89,$1f,$22,$89,$40,$81
@ref153:
	.byte $24,$8d,$3c,$8d,$40,$8d,$48,$8d
@ref154:
	.byte $15,$5d,$4b,$2d,$15,$4b,$61,$11,$5c,$83,$4a,$83,$4f,$52,$89,$36
	.byte $81
@ref155:
	.byte $4a,$52,$58,$52,$4a,$52,$58,$52,$4a,$52,$58,$4a,$4e,$56,$5c,$4e
	.byte $56,$5c,$4e,$56,$5c,$60,$58,$5c,$60,$4a,$60,$4a,$60,$5c,$83
@ref156:
	.byte $15,$2d,$15,$2d,$15,$2d,$15,$11,$15,$2d,$15,$15,$19,$31,$19,$36
	.byte $81
@ref157:
	.byte $1b,$33,$1b,$33,$33,$4b,$33,$4b,$37,$4f,$37,$4f,$3f,$57,$3f,$56
	.byte $81
	.byte $fd
	.word @song1ch2loop

@song1ch3:
@song1ch3loop:
@ref158:
	.byte $82,$0e,$83,$12,$83,$0f,$88,$0a,$8d,$82,$08,$0a,$0e,$12,$83,$17
	.byte $8a,$06,$89,$82,$08,$0a
@ref159:
	.byte $0e,$83,$0e,$83,$11,$88,$12,$83,$82,$0a,$83,$04,$08,$0a,$83,$0a
	.byte $0e,$0a,$0e,$08,$8a,$06,$85,$88,$08,$0a,$0e,$0e
	.byte $ff,$11
	.word @ref158
	.byte $ff,$18
	.word @ref159
@ref162:
	.byte $82,$0e,$12,$04,$0a,$0e,$0a,$04,$0a,$0f,$05,$0f,$04,$04,$0f,$05
	.byte $0f,$05,$0f,$05,$0f,$04,$04
@ref163:
	.byte $0f,$05,$0f,$05,$0f,$05,$0f,$04,$04,$0e,$0e,$04,$12,$0e,$16,$04
	.byte $18,$0f,$05,$0f,$04,$81
@ref164:
	.byte $0e,$12,$04,$0a,$0e,$0a,$04,$0a,$0f,$05,$0f,$04,$04,$0f,$05,$0f
	.byte $05,$0f,$05,$0f,$04,$04
	.byte $ff,$16
	.word @ref163
@ref166:
	.byte $0e,$83,$12,$83,$0f,$88,$0a,$8d,$82,$08,$0a,$0e,$12,$83,$17,$8a
	.byte $06,$89,$82,$08,$0a
	.byte $ff,$18
	.word @ref159
	.byte $ff,$11
	.word @ref158
	.byte $ff,$18
	.word @ref159
	.byte $ff,$11
	.word @ref158
	.byte $ff,$18
	.word @ref159
	.byte $ff,$11
	.word @ref158
	.byte $ff,$18
	.word @ref159
	.byte $fd
	.word @song1ch3loop

@song1ch4:
@song1ch4loop:
@ref174:
	.byte $bf
@ref175:
	.byte $bf
@ref176:
	.byte $bf
@ref177:
	.byte $bf
@ref178:
	.byte $bf
@ref179:
	.byte $bf
@ref180:
	.byte $bf
@ref181:
	.byte $bf
@ref182:
	.byte $bf
@ref183:
	.byte $bf
@ref184:
	.byte $bf
@ref185:
	.byte $bf
@ref186:
	.byte $bf
@ref187:
	.byte $bf
@ref188:
	.byte $bf
@ref189:
	.byte $bf
	.byte $fd
	.word @song1ch4loop


@song2ch0:
	.byte $fb,$06
@song2ch0loop:
@ref190:
	.byte $98,$4a,$a1,$28,$99,$3a,$97,$30,$83,$1a,$9d
@ref191:
	.byte $3a,$8d,$4a,$8d,$44,$9d,$3a,$9d,$48,$9d
	.byte $fd
	.word @song2ch0loop

@song2ch1:
@song2ch1loop:
@ref192:
	.byte $98,$33,$4b,$32,$85,$32,$8b,$32,$83,$32,$95,$3d,$40,$8d,$4e,$8d
	.byte $52,$9d
@ref193:
	.byte $4a,$8d,$40,$87,$54,$83,$54,$8d,$52,$89,$4f,$4a,$85,$4e,$4a,$48
	.byte $89,$4a,$85,$4e,$95,$4a,$85
	.byte $fd
	.word @song2ch1loop

@song2ch2:
@song2ch2loop:
@ref194:
	.byte $98,$40,$a1,$32,$99,$40,$9d,$32,$9d
@ref195:
	.byte $40,$9d,$3c,$99,$41,$32,$95,$3c,$85,$40,$95,$4a,$85
	.byte $fd
	.word @song2ch2loop

@song2ch3:
@song2ch3loop:
@ref196:
	.byte $f9,$85
@ref197:
	.byte $f9,$85
	.byte $fd
	.word @song2ch3loop

@song2ch4:
@song2ch4loop:
@ref198:
	.byte $f9,$85
@ref199:
	.byte $f9,$85
	.byte $fd
	.word @song2ch4loop
