; da65 V2.18 - Ubuntu 2.19-1
; Created:    2024-03-31 11:54:21
; Input file: netcall.cmd
; Page:       1


	.setcpu "6502"

L3203           := $3203
L3209           := $3209
L320F           := $320F
L3212           := $3212
L3215           := $3215
L3218           := $3218
L321E           := $321E
L3227           := $3227
L322A           := $322A
L322D           := $322D
L3230           := $3230
L3233           := $3233
L3236           := $3236
L3239           := $3239
L323C           := $323C
L323F           := $323F
L3257           := $3257
L325A           := $325A
L325D           := $325D
L3260           := $3260
L3263           := $3263
L3269           := $3269
L326C           := $326C
L326F           := $326F
L3272           := $3272
L3275           := $3275
L3278           := $3278
L327B           := $327B
L327E           := $327E
L3281           := $3281
L3284           := $3284
L3287           := $3287
L328A           := $328A
L3290           := $3290
L3293           := $3293
L3296           := $3296
L3299           := $3299
L32A2           := $32A2
L32A5           := $32A5
L32A8           := $32A8
L32AB           := $32AB
L32B1           := $32B1
L32B4           := $32B4
L32BA           := $32BA
L32BD           := $32BD
L32C6           := $32C6
L32C9           := $32C9
L32CC           := $32CC
L32CF           := $32CF
L32D2           := $32D2
L32D5           := $32D5
L32D8           := $32D8
L4143           := $4143
L4F4C           := $4F4C
L5F5F           := $5F5F
L6163           := $6163
L616D           := $616D
L6341           := $6341
L6373           := $6373
L6469           := $6469
L6572           := $6572
L6966           := $6966
L6974           := $6974
L6977           := $6977
L6E55           := $6E55
L6E69           := $6E69
L6F66           := $6F66
L6F6E           := $6F6E
L6F74           := $6F74
L6F79           := $6F79
L6FE8           := $6FE8
LD8E6           := $D8E6
LD9AA           := $D9AA
LD9D2           := $D9D2
LDADB           := $DADB
LDD89           := $DD89
LDDB6           := $DDB6
LE456           := $E456

	.SEGMENT "S_CALL_HDR"

	.word	$FFFF
	.word	$7000
	.word	$84E9

	.SEGMENT "S_CALL_CODE"

	jmp	L7040

	.byte	$11

	asl     a
	.byte   $02
	cli
	.byte   $43
	and     $3536
	bit     $5420
	pla
	adc     $20
	.byte   $43
	jsr     L7243
L7015:  .byte   $6F
	.byte   $73
	.byte   $73
	and     $6F43
	adc     $6970
	jmp     (L7265)

	.byte   $9B
	plp
	.byte   $63
	and     #$20
	and     ($39),y
	sec
	sec
	jsr     L724F
	adc     #$6F
	ror     $4D20
	adc     #$63
	.byte   $72
	.byte   $6F
	jsr     L7953
	.byte   $73
	.byte   $74
	adc     $6D
	.byte   $73
	ora     ($60,x)

L7040:
	lda     #$EC
	ldx     #$84
	sta     $A0
	stx     $A1
	lda     #$D0
	ldx     #$74
	sta     $A2
	stx     $A3
	jsr     L831C
	lda     $3EEF
	ldx     #$00
	jsr     L7F69
	lda     #$02
	ldx     #$00
	jsr     L7F7D
	lda     #$EC
	ldx     #$84
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
L706F:  jsr     L7D9D
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L7FAB
	beq     L7084
	jmp     L7085

L7084:  rts

L7085:  lda     #$EC
	ldx     #$74
	sta     $A0
	stx     $A1
	lda     #$7D
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L7FD2
	lda     #$00
	ldx     #$00
	sta     L74CD
	lda     #$00
	ldx     #$00
	sta     L84EA
	stx     L84EA+1
L70A9:  lda     $D01F
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$06
	ldx     #$00
	jsr     L7FAB
	bne     L70C0
	jmp     L7499

L70C0:  lda     #$00
	ldx     #$00
	sta     a:$4D
	lda     #$00
	ldx     #$00
	sta     L74CE
	lda     #$00
	ldx     #$00
	sta     L74CD
L70D5:  lda     L74CD
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$1A
	ldx     #$00
	jsr     L7FAB
	bmi     L70F2
	jmp     L747C

L70EC:  inc     L74CD
	jmp     L70D5

L70F2:  lda     $D01F
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$06
	ldx     #$00
	jsr     L7FAB
	beq     L7109
	jmp     L710C

L7109:  jmp     L747C

L710C:  lda     L74CD
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L7CF7
	lda     $92DA
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L7FAB
	beq     L712F
	jmp     L7132

L712F:  jmp     L70EC

L7132:  jsr     L8445
	lda     #$25
	ldx     #$75
	sta     $A0
	stx     $A1
	lda     #$CA
	ldx     #$92
	sta     $A2
	stx     $A3
	jsr     L7FD2
	lda     #$35
	ldx     #$75
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     $3F35
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L7F7D
	lda     #$1D
	ldx     #$93
	jsr     L7F82
	jsr     L7FAB
	beq     L7174
	jmp     L71C4

L7174:  lda     $3F36
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$01
	ldx     #$00
	jsr     L7F7D
	lda     #$1D
	ldx     #$93
	jsr     L7F82
	jsr     L7FAB
	beq     L7195
	jmp     L71C4

L7195:  lda     $3F37
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$02
	ldx     #$00
	jsr     L7F7D
	lda     #$1D
	ldx     #$93
	jsr     L7F82
	jsr     L7FAB
	beq     L71B6
	jmp     L71C4

L71B6:  lda     #$3F
	ldx     #$75
	sta     $A0
	stx     $A1
	jsr     L7FD2
	jmp     L70EC

L71C4:  lda     $3F3B
	ldx     #$00
	jsr     L7F7D
	lda     #$23
	ldx     #$93
	jsr     L7F82
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L7FAB
	beq     L71E5
	jmp     L71F3

L71E5:  lda     #$5A
	ldx     #$75
	sta     $A0
	stx     $A1
	jsr     L7FD2
	jmp     L70EC

L71F3:  lda     $3F38
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     $932A
	ldx     #$00
	jsr     L7FAB
	bmi     L7220
	lda     $3F38
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     $932B
	ldx     #$00
	jsr     L7FAB
	bpl     L7220
	jmp     L722E

L7220:  lda     #$75
	ldx     #$75
	sta     $A0
	stx     $A1
	jsr     L7FD2
	jmp     L70EC

L722E:  lda     $3F35
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L7F7D
	lda     #$1A
	.byte   $A2
L7243:  .byte   $93
	jsr     L7F82
	jsr     L7FAB
	bne     L728B
	lda     $3F36
L724F:  ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$01
	ldx     #$00
	jsr     L7F7D
	lda     #$1A
	ldx     #$93
	jsr     L7F82
L7265:  jsr     L7FAB
	bne     L728B
	lda     $3F37
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$02
L7277:  ldx     #$00
	jsr     L7F7D
	lda     #$1A
	ldx     #$93
	jsr     L7F82
	jsr     L7FAB
	bne     L728B
	jmp     L72FC

L728B:  lda     #$00
	ldx     #$00
	sta     $932D
	lda     $3F35
	ldx     #$00
	jsr     L7F69
	lda     #$00
	ldx     #$00
	jsr     L7F7D
	lda     #$1A
	ldx     #$93
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     $3F36
	ldx     #$00
	jsr     L7F69
	lda     #$01
	ldx     #$00
	jsr     L7F7D
	lda     #$1A
	ldx     #$93
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     $3F37
	ldx     #$00
	jsr     L7F69
	lda     #$02
	ldx     #$00
	jsr     L7F7D
	lda     #$1A
	ldx     #$93
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     L74CD
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L7D4A
	lda     #$01
	ldx     #$00
	sta     L84EA
	stx     L84EA+1
L72FC:  lda     $932D
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     $932C
	ldx     #$00
	jsr     L7FAB
	bpl     L7314
	jmp     L7322

L7314:  lda     #$8D
	ldx     #$75
	sta     $A0
	stx     $A1
	jsr     L7FD2
	jmp     L70EC

L7322:  lda     #$AA
	.byte   $A2
L7325:  adc     $85,x
	ldy     #$86
	lda     ($20,x)
	.byte   $D2
	.byte   $7F
	inc     L74CE
	inc     $932D
	lda     L74CD
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L7D4A
	lda     #$01
	ldx     #$00
	sta     L84EA
	stx     L84EA+1
	jsr     L760C
	sta     a:$94
	stx     a:$95
	ora     a:$95
	bne     L735A
	jmp     L7479

L735A:  jsr     L8404
	lda     $3F35
	ldx     #$00
	jsr     L7F69
	lda     #$00
	ldx     #$00
L7369:  jsr     L7F7D
	lda     #$1D
	ldx     #$93
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     $3F36
	ldx     #$00
	jsr     L7F69
	lda     #$01
	ldx     #$00
	jsr     L7F7D
	lda     #$1D
	ldx     #$93
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     $3F37
	ldx     #$00
	jsr     L7F69
	lda     #$02
	ldx     #$00
	jsr     L7F7D
	lda     #$1D
	ldx     #$93
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     L74CD
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L7D4A
	lda     #$01
	ldx     #$00
	sta     L84EA
	stx     L84EA+1
	jsr     L7956
	sta     L74CF
	lda     L74CF
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L7FAB
	cmp     #$01
	beq     L73E6
	jmp     L7479

L73E6:  lda     L74CF
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$02
	ldx     #$00
	jsr     L7FAB
	beq     L73FD
	jmp     L740B

L73FD:  lda     #$C6
	ldx     #$75
	sta     $A0
	stx     $A1
	jsr     L7FD2
	jmp     L7479

L740B:  lda     $3F35
	ldx     #$00
	jsr     L7F69
	lda     #$00
	ldx     #$00
	jsr     L7F7D
	lda     #$20
	ldx     #$93
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     $3F36
	ldx     #$00
	jsr     L7F69
	lda     #$01
	ldx     #$00
	jsr     L7F7D
	lda     #$20
	ldx     #$93
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     $3F37
	ldx     #$00
	jsr     L7F69
	lda     #$02
	ldx     #$00
	jsr     L7F7D
	lda     #$20
	ldx     #$93
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     L74CD
	ldx     #$00
	.byte   $85
L7465:  ldy     #$86
	lda     ($20,x)
	lsr     a
	adc     $01A9,x
	ldx     #$00
L746F:  sta     L84EA
	.byte   $8E
L7473:  .byte   $EB
	sty     $20
	.byte   $64
	.byte   $7C
	rts

L7479:  jmp     L70EC

L747C:  lda     L74CE
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L7FAB
	beq     L7493
	jmp     L7496

L7493:  jmp     L7499

L7496:  jmp     L70A9

L7499:  lda     #$EA
	ldx     #$75
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     L84EA
	ldx     L84EA+1
	sta     a:$94
	stx     a:$95
	ora     a:$95
	bne     L74B8
	jmp     L74BE

L74B8:  jsr     L7E86
	jmp     L74C9

L74BE:  lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L7C1F
L74C9:  jsr     L84E7
	rts

L74CD:  brk
L74CE:  brk
L74CF:  brk
	.byte   $1B
	.byte   $44
	sei
	.byte   $3A
	rol     $5250,x
	.byte   $4F
	rol     $454E,x
	.byte   $54
	.byte   $57
	.byte   $4F
	.byte   $52
	.byte   $4B
	rol     L4143,x
	jmp     L4F4C

	eor     $54,x
	rol     $4144
	.byte   $54
	sec
	and     $63
	and     $65
	and     $65
	and     $65
	and     $65
	and     $65
	and     $65
	and     $65
	.byte	"    __ExpressNET! Dialer Activated__%e%e"
	.byte   $0F,"%eEntry  : %s%e"
	.byte	$09,"Status : "
	.byte   $1A,"already connected today.%e"
	.byte   $1A,"not scheduled for today.%e"
	.byte   $17,"not time to call yet.%e"
	.byte   $1C,"exhausted maximum retries.%e"
	.byte   $1B,"placing ExpressNET! call.%e"
	.byte	$23,"%eNo file waiting for your node..%e"
	.byte	$21,"%eNetCALL: processing finished.%e"

L760C:  lda     #$1F
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     #$05
L7619:  ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L81F6
	jsr     L84D8
	lda     #$02
	ldx     #$00
L7629:  sta     $A0
	stx     $A1
	jsr     L7C1F
	lda     $9306
	ldx     #$00
	sta     $3EFC
	jsr     L84DE
	jsr     L84E4
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$0D
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     #$01
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L7C1F
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$41
	ldx     #$00
	sta     $A2
L766A:  stx     $A3
	jsr     L811C
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$54
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$4D
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$30
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$0D
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L7C1F
	lda     #$2D
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     #$34
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$41
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$54
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$44
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     $934E
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L7FAB
	beq     L772C
	jmp     L7742

L772C:  lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$54
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	jmp     L7755

L7742:  lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$50
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
L7755:  lda     #$01
	ldx     #$00
	sta     L791D
	stx     L791E
L775F:  lda     L791D
	ldx     L791E
	sta     a:$94
	stx     a:$95
	lda     $92DA
	ldx     #$00
	jsr     L7FAB
	beq     L7785
	bmi     L7785
	jmp     L77BE

L777A:  inc     L791D
	bne     L7782
	inc     L791E
L7782:  jmp     L775F

L7785:  lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     L791D
	ldx     L791E
	jsr     L7F7D
	lda     #$DA
	ldx     #$92
	jsr     L7F82
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     L791D
	ldx     L791E
	jsr     L7F7D
	lda     #$DA
	ldx     #$92
	jsr     L7F82
	sta     $A0
	stx     $A1
	jsr     L810A
	jmp     L777A

L77BE:  lda     #$3E
	ldx     #$79
	sta     $A0
	stx     $A1
	lda     $932D
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L7FD2
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$0D
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L7C1F
	lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L81F6
	lda     #$47
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     #$01
	ldx     #$00
	sta     $3F10
	lda     #$63
	ldx     #$00
	sta     L791B
	stx     L791C
L7817:  lda     $D01F
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$06
	ldx     #$00
	jsr     L7FAB
	beq     L782E
	jmp     L7836

L782E:  lda     $9307
	ldx     #$00
	sta     $3F10
L7836:  lda     L791B
	ldx     L791C
	sta     a:$94
	stx     a:$95
	lda     $3F10
L7845:  ldx     #$00
	jsr     L7FAB
	bne     L784F
	jmp     L78AB

L784F:  lda     $3F10
	ldx     #$00
	sta     L791B
	stx     L791C
	lda     #$1E
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L810A
	lda     #$1E
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L810A
	lda     L791B
	ldx     L791C
	sta     a:$94
	stx     a:$95
	lda     #$0A
	ldx     #$00
	jsr     L7FAB
	bmi     L7888
	jmp     L7893

L7888:  lda     #$20
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L810A
L7893:  lda     #$53
	ldx     #$79
	sta     $A0
	stx     $A1
	lda     L791B
	ldx     L791C
	sta     $A2
	stx     $A3
	jsr     L7FD2
	jsr     L84E1
L78AB:  lda     $02EB
	ldx     #$00
	jsr     L7F73
	lda     #$08
	ldx     #$00
	jsr     L836C
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L7FAB
	beq     L78CC
	jmp     L78E7

L78CC:  lda     $3F10
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     $9307
	ldx     #$00
	jsr     L7FAB
	bmi     L78E4
	jmp     L78E7

L78E4:  jmp     L7817

L78E7:  jsr     L83FB
	lda     $3F10
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     $9307
	ldx     #$00
	jsr     L7FAB
	bmi     L7902
	jmp     L7907

L7902:  lda     #$01
	ldx     #$00
	rts

L7907:  jsr     L84D8
	lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L7C1F
	lda     #$00
	ldx     #$00
	rts

	rts

L791B:  brk
L791C:  brk
L791D:  brk
L791E:  brk

L791F:
	.byte	$0D,"%e%eConfig : "
	.byte	$06,"done%e"
	.byte	$09,"Dialing: "
	.byte	$08," (#%d)%e"
	.byte	$0B,"Waiting:  1"
L7953:  .byte   $02,"%d"

L7956:  lda     #$8F
	ldx     #$7A
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     #$00
	ldx     #$00
	sta     $3F10
	lda     #$00
	ldx     #$00
	sta     L7A8E
L796F:  jsr     L8497
	sta     a:$94
	stx     a:$95
	ora     a:$95
	bne     L7980
	jmp     L7991

L7980:  lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L812E
	sta     L7A8E
	jmp     L79AF

L7991:  lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$FD
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     #$03
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L7C1F
L79AF:  lda     L7A8E
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$18
	ldx     #$00
	jsr     L7FAB
	bne     L79C6
	jmp     L79E0

L79C6:  lda     $3F10
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$28
	ldx     #$00
	jsr     L7FAB
	bmi     L79DD
	jmp     L79E0

L79DD:  jmp     L796F

L79E0:  lda     L7A8E
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$18
	ldx     #$00
	jsr     L7FAB
	bne     L79F7
	jmp     L79FC

L79F7:  lda     #$00
	ldx     #$00
	rts

L79FC:  lda     #$00
	ldx     #$00
	sta     $3F10
L7A03:  jsr     L8497
	sta     a:$94
	stx     a:$95
	ora     a:$95
	bne     L7A14
	jmp     L7A6A

L7A14:  lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L812E
	sta     L7A8E
	lda     L7A8E
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$06
	ldx     #$00
	jsr     L7FAB
	beq     L7A39
	jmp     L7A41

L7A39:  lda     #$01
	ldx     #$00
	rts

	jmp     L7A6A

L7A41:  lda     #$18
	ldx     #$00
	jsr     L7FAB
	beq     L7A4D
	jmp     L7A53

L7A4D:  jsr     L7AB3
	jmp     L7A6A

L7A53:  lda     #$04
	ldx     #$00
	jsr     L7FAB
	beq     L7A5F
	jmp     L7A67

L7A5F:  lda     #$02
	ldx     #$00
	rts

	jmp     L7A6A

L7A67:  jsr     L7BFB
L7A6A:  lda     $3F10
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$2D
	ldx     #$00
	jsr     L7FAB
	bmi     L7A81
	jmp     L7A84

L7A81:  jmp     L7A03

L7A84:  lda     #$00
	ldx     #$00
	rts

	rts

	brk
	brk
	brk
	brk
L7A8E:  brk

	.byte   $23,"%eHandshaking with remote system..."

L7AB3:  lda     #$E0
	ldx     #$7B
	sta     $A0
	stx     $A1
	lda     #$0A
	ldx     #$93
	sta     $A2
	stx     $A3
	jsr     L831C
	lda     $3C7C
	ldx     $3C7D
	jsr     L7F73
	lda     #$FF
	ldx     #$00
	jsr     L836C
	jsr     L7F69
	lda     #$10
	ldx     #$00
	jsr     L7F7D
	lda     #$E0
	ldx     #$7B
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     $3C7C
	ldx     $3C7D
	jsr     L7F73
	lda     #$08
	ldx     #$00
	jsr     L837E
	jsr     L7F69
	lda     #$11
	ldx     #$00
	jsr     L7F7D
	lda     #$E0
	ldx     #$7B
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     $9308
	ldx     $9309
	jsr     L7F73
	lda     #$FF
	ldx     #$00
	jsr     L836C
	jsr     L7F69
	lda     #$12
	ldx     #$00
	jsr     L7F7D
	lda     #$E0
	ldx     #$7B
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     $9308
	ldx     $9309
	jsr     L7F73
	lda     #$08
	ldx     #$00
	jsr     L837E
	jsr     L7F69
	lda     #$13
	ldx     #$00
	jsr     L7F7D
	lda     #$E0
	ldx     #$7B
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     #$00
	ldx     #$00
	sta     L7BF9
	lda     #$00
	ldx     #$00
	sta     L7BFA
L7B70:  lda     L7BFA
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$14
	ldx     #$00
	jsr     L7FAB
	bmi     L7B8D
	jmp     L7BCB

L7B87:  inc     L7BFA
	jmp     L7B70

L7B8D:  lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     L7BFA
	ldx     #$00
	jsr     L7F7D
	lda     #$E0
	ldx     #$7B
	jsr     L7F82
	sta     $A2
	stx     $A3
	jsr     L811C
	lda     L7BF9
	ldx     #$00
	jsr     L7F73
	lda     L7BFA
	ldx     #$00
	jsr     L7F7D
	lda     #$E0
	ldx     #$7B
	jsr     L7F82
	jsr     L8331
	sta     L7BF9
	jmp     L7B87

L7BCB:  lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     L7BF9
	ldx     #$00
	sta     $A2
	stx     $A3
	jsr     L811C
	rts

	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
L7BF9:  brk
L7BFA:  brk
L7BFB:  jsr     L8497
	sta     a:$94
	stx     a:$95
	ora     a:$95
	bne     L7C0C
	jmp     L7C1D

L7C0C:  lda     #$05
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L812E
	sta     L7C1E
	jmp     L7BFB

L7C1D:  rts

L7C1E:  brk
L7C1F:  lda     $A0
	sta     L7C62
	lda     $3F10
	ldx     #$00
	sta     L7C63
	lda     #$00
	ldx     #$00
	sta     $3F10
L7C33:  lda     $3F10
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     L7C62
	ldx     #$00
	jsr     L7FAB
	bmi     L7C4B
	jmp     L7C4E

L7C4B:  jmp     L7C33

L7C4E:  lda     L7C63
	ldx     #$00
	jsr     L7F73
	lda     L7C62
	ldx     #$00
	jsr     L8331
	sta     $3F10
	rts

L7C62:  brk
L7C63:  brk
L7C64:  jsr     L7E86
	lda     #$C1
	ldx     #$00
	sta     $3EF5
	lda     #$00
	ldx     #$00
	sta     L7CED
L7C75:  lda     L7CED
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$20
	ldx     #$00
	jsr     L7FAB
	bmi     L7C92
	jmp     L7CC6

L7C8C:  inc     L7CED
	jmp     L7C75

L7C92:  lda     L7CED
	ldx     #$00
	jsr     L7F7D
	lda     #$2E
	ldx     #$93
	jsr     L7F82
	jsr     L7F69
	lda     L7CED
	ldx     #$00
	jsr     L7F73
	lda     #$01
	ldx     #$00
	jsr     L8331
	jsr     L7F7D
	lda     #$4F
	ldx     #$40
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	jmp     L7C8C

L7CC6:  lda     #$20
	ldx     #$00
	jsr     L7F69
	lda     #$00
	ldx     #$00
	jsr     L7F7D
	lda     #$4F
	ldx     #$40
	jsr     L7F78
	jsr     L7F6E
	jsr     L7F93
	lda     #$EE
	ldx     #$7C
	sta     $A0
	stx     $A1
	jsr     L8415
	rts

L7CED:  brk
	php
	lsr     $5445
	eor     $444F
	eor     $4D
L7CF7:  lda     $A0
	sta     L7D45
	lda     L7D45
	ldx     #$00
	jsr     L7F73
	lda     #$87
	ldx     #$00
	jsr     L8344
	sta     L7D48
	stx     L7D49
	lda     #$14
	ldx     #$85
	jsr     L7F73
	lda     L7D48
	ldx     L7D49
	jsr     L8331
	sta     L7D46
	stx     L7D47
	lda     #$CA
	ldx     #$92
	sta     $A0
	stx     $A1
	lda     L7D46
	ldx     L7D47
	sta     $A2
	stx     $A3
	lda     #$87
	ldx     #$00
	sta     $A4
	stx     $A5
	jsr     L838F
	rts

L7D45:  brk
L7D46:  brk
L7D47:  brk
L7D48:  brk
L7D49:  brk
L7D4A:  lda     $A0
	sta     L7D98
	lda     L7D98
	ldx     #$00
	jsr     L7F73
	lda     #$87
	ldx     #$00
	jsr     L8344
	sta     L7D9B
	stx     L7D9C
	lda     #$14
	ldx     #$85
	jsr     L7F73
	lda     L7D9B
	ldx     L7D9C
	jsr     L8331
	sta     L7D99
	stx     L7D9A
	lda     L7D99
	ldx     L7D9A
	sta     $A0
	stx     $A1
	lda     #$CA
	ldx     #$92
	sta     $A2
	stx     $A3
	lda     #$87
	ldx     #$00
	sta     $A4
	stx     $A5
	jsr     L838F
	rts

L7D98:  brk
L7D99:  brk
L7D9A:  brk
L7D9B:  brk
L7D9C:  brk
L7D9D:  jsr     L8401
	lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$EC
	ldx     #$84
	sta     $A2
	stx     $A3
	lda     #$04
	ldx     #$00
	sta     $A4
	stx     $A5
	lda     #$00
	ldx     #$00
	sta     $A6
	stx     $A7
	jsr     L8136
	sta     a:$94
	stx     a:$95
	lda     #$01
	ldx     #$00
	jsr     L7FAB
	bne     L7DD5
	jmp     L7DE8

L7DD5:  jsr     L8407
	lda     #$4B
	ldx     #$7E
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     #$00
	ldx     #$00
	rts

L7DE8:  lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$14
	ldx     #$85
	sta     $A2
	stx     $A3
	lda     #$B6
	ldx     #$0D
	sta     $A4
	stx     $A5
	jsr     L817A
	sta     L7E48
	stx     L7E49
	lda     L7E48
	ldx     L7E49
	sta     a:$94
	stx     a:$95
	lda     #$B6
	ldx     #$0D
	jsr     L7FAB
	bne     L7E21
	jmp     L7E34

L7E21:  jsr     L8407
	lda     #$6C
	ldx     #$7E
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     #$00
	ldx     #$00
	rts

L7E34:  lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L81F6
	jsr     L8407
	lda     #$01
	ldx     #$00
	rts

	rts

L7E48:  brk
L7E49:  brk
	brk
	.byte	$20,"Unable to open CALLOUT.DAT file!"
	.byte	$19,"Invalid CALLOUT.DAT file!"

L7E86:  jsr     L8401
	lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$EC
	ldx     #$84
	sta     $A2
	stx     $A3
	lda     #$0C
	ldx     #$00
	sta     $A4
	stx     $A5
	lda     #$00
	ldx     #$00
	sta     $A6
	stx     $A7
	jsr     L8136
	sta     a:$94
	stx     a:$95
	lda     #$01
	ldx     #$00
	jsr     L7FAB
	bne     L7EBE
	jmp     L7ED1

L7EBE:  jsr     L8407
	lda     #$27
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     #$00
	ldx     #$00
	rts

L7ED1:  lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$14
	ldx     #$85
	sta     $A2
	stx     $A3
	lda     #$B6
	ldx     #$0D
	sta     $A4
	stx     $A5
	jsr     L81BB
	sta     a:$94
	stx     a:$95
	lda     #$B6
	ldx     #$0D
	jsr     L7FAB
	bne     L7EFE
	jmp     L7F11

L7EFE:  jsr     L8407
	lda     #$48
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L7FD2
	lda     #$00
	ldx     #$00
	rts

L7F11:  lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L81F6
	jsr     L8407
	lda     #$01
	ldx     #$00
	rts

	rts

	brk
	brk

	.byte	$20,"Unable to open CALLOUT.DAT file!"
	.byte   $1F,"Error writing CALLOUT.DAT file!"

	rts

L7F69:  sta     $98
	stx     $99
	rts

L7F6E:  lda     $98
	ldx     $99
	rts

L7F73:  sta     $84
	stx     $85
	rts

L7F78:  sta     $80
	stx     $81
	rts

L7F7D:  sta     $82
	stx     $83
	rts

L7F82:  clc
	adc     $82
	sta     $80
	txa
	adc     $83
	sta     $81
	ldy     #$00
	lda     ($80),y
	ldx     #$00
	rts

L7F93:  pha
	jsr     L7F9D
	ldy     #$00
	pla
	sta     ($80),y
	rts

L7F9D:  lda     $80
	clc
	adc     $82
	sta     $80
	lda     $81
	adc     $83
	sta     $81
	rts

L7FAB:  sta     $96
	stx     $97
	lda     $95
	cmp     $97
	bcc     L7FC3
	beq     L7FB9
	bcs     L7FC6
L7FB9:  lda     $94
	cmp     $96
	bcc     L7FC3
	beq     L7FC9
	bcs     L7FC6
L7FC3:  lda     #$FF
	rts

L7FC6:  lda     #$01
	rts

L7FC9:  lda     #$00
	rts

L7FCC:  asl     a
	asl     a
	asl     a
	asl     a
	tax
	rts

L7FD2:  lda     #$00
	jmp     L7FD7

L7FD7:  sta     L80F2
	lda     $A0
	sta     $92
	lda     $A1
	sta     $93
	ldy     #$00
L7FE4:  lda     $A2,y
	sta     L80F6,y
	iny
	cpy     #$12
	bcc     L7FE4
	ldy     #$00
	sty     L80F5
	lda     ($92),y
	sta     L80F3
	iny
	sty     L80F4
L7FFD:  ldy     L80F4
	cpy     L80F3
	bcc     L800C
	beq     L800C
	lda     #$01
	ldx     #$00
	rts

L800C:  lda     ($92),y
	cmp     #$25
	beq     L8027
L8012:  sta     $A0
	ldx     L80F2
	jsr     L82EE
	bmi     L8022
L801C:  inc     L80F4
	jmp     L7FFD

L8022:  lda     #$00
	ldx     #$00
	rts

L8027:  iny
	sty     L80F4
	lda     ($92),y
	cmp     #$73
	beq     L8058
	cmp     #$64
	beq     L807C
	cmp     #$65
	beq     L804B
	cmp     #$63
	beq     L809D
	cmp     #$68
	beq     L80B0
	cmp     #$66
	bne     L8048
	jmp     L80D1

L8048:  jmp     L8012

L804B:  lda     #$9B
	ldx     L80F2
	jsr     L82EE
	bmi     L8022
	jmp     L801C

L8058:  lda     L80F5
	asl     a
	tay
	lda     L80F6,y
	sta     $A0
	lda     L80F7,y
	sta     $A1
	ldx     L80F2
	lda     $A0
	ldy     $A1
	jsr     L820E
	bmi     L8079
	inc     L80F5
	jmp     L801C

L8079:  jmp     L8022

L807C:  lda     L80F5
	asl     a
	tay
	lda     L80F6,y
	sta     $A0
	lda     L80F7,y
	sta     $A1
	ldx     L80F2
	lda     $A0
	ldy     $A1
	jsr     L8237
	bmi     L8079
	inc     L80F5
	jmp     L801C

L809D:  lda     L80F5
	asl     a
	tay
	lda     L80F6,y
	ldx     L80F2
	jsr     L82EE
	bmi     L8079
	jmp     L801C

L80B0:  lda     L80F5
	asl     a
	tay
	lda     L80F6,y
	sta     $A0
	lda     L80F7,y
	sta     $A1
	ldx     L80F2
	lda     $A0
	ldy     $A1
	jsr     L8294
	bmi     L8079
	inc     L80F5
	jmp     L801C

L80D1:  lda     L80F5
	asl     a
	tay
	lda     L80F6,y
	sta     $A0
	lda     L80F7,y
	sta     $A1
	ldx     L80F2
	lda     $A0
	ldy     $A1
	jsr     L8267
	bmi     L8079
	inc     L80F5
	jmp     L801C

L80F2:  brk
L80F3:  brk
L80F4:  brk
L80F5:  brk
L80F6:  brk
L80F7:  brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
L810A:  lda     $A0
	ldx     #$00
	jsr     L82EE
	bpl     L8117
	lda     #$00
	beq     L8119
L8117:  lda     #$01
L8119:  ldx     #$00
	rts

L811C:  ldx     $A0
	lda     $A2
	jsr     L82EE
	bpl     L8129
	lda     #$00
	beq     L812B
L8129:  lda     #$01
L812B:  ldx     #$00
	rts

L812E:  ldx     $A0
	jsr     L8306
	ldx     #$00
	rts

L8136:  jsr     L81F6
	lda     $A2
	sta     $8A
	lda     $A3
	sta     $8B
	jsr     L83CC
	lda     $A0
	jsr     L7FCC
	lda     #$03
	sta     $0342,x
	lda     #$80
	sta     $0344,x
	lda     #$05
	sta     $0345,x
	lda     #$50
	sta     $0348,x
	lda     #$00
	sta     $0349,x
	lda     $A4
	sta     $034A,x
	lda     $A6
	sta     $034B,x
	jsr     LE456
	bpl     L8175
	lda     #$00
	beq     L8177
L8175:  lda     #$01
L8177:  ldx     #$00
	rts

L817A:  lda     $A4
	ora     $A5
	bne     L8185
	ldy     #$00
	jmp     L81B2

L8185:  lda     $A0
	jsr     L7FCC
	lda     #$07
	sta     $0342,x
	lda     $A2
	sta     $0344,x
	lda     $A3
	sta     $0345,x
	lda     $A4
	sta     $0348,x
	lda     $A5
	sta     $0349,x
	jsr     LE456
	bmi     L81B2
L81A8:  lda     $0348,x
	pha
	lda     $0349,x
	tax
	pla
	rts

L81B2:  cpy     #$88
	beq     L81A8
	lda     #$00
	ldx     #$00
	rts

L81BB:  lda     $A4
	ora     $A5
	bne     L81C4
	jmp     L81F1

L81C4:  lda     $A0
	jsr     L7FCC
	lda     #$0B
	sta     $0342,x
	lda     $A2
	sta     $0344,x
	lda     $A3
	sta     $0345,x
	lda     $A4
	sta     $0348,x
	lda     $A5
	sta     $0349,x
	jsr     LE456
	bmi     L81F1
	lda     $0348,x
	pha
	lda     $0349,x
	tax
	pla
	rts

L81F1:  lda     #$00
	ldx     #$00
	rts

L81F6:  lda     $A0
	jsr     L7FCC
	lda     #$0C
	sta     $0342,x
	jsr     LE456
	bpl     L8209
	lda     #$00
	beq     L820B
L8209:  lda     #$01
L820B:  ldx     #$00
	rts

L820E:  stx     L8236
	sta     $8A
	sty     $8B
	ldy     #$00
	lda     ($8A),y
	sta     $A0
	iny
	sty     $A1
L821E:  ldy     $A1
	cpy     $A0
	bcc     L8227
	beq     L8227
	rts

L8227:  lda     ($8A),y
	ldx     L8236
	jsr     L82EE
	bmi     L8235
	inc     $A1
	bne     L821E
L8235:  rts

L8236:  brk
L8237:  stx     L8265
	sta     $D4
	sty     $D5
	jsr     LD9AA
	jsr     LD8E6
	ldy     #$00
L8246:  lda     ($F3),y
	sta     L8266
	and     #$7F
	ldx     L8265
	sty     L8264
	jsr     L82EE
	bmi     L8263
	ldy     L8264
	iny
	lda     L8266
	bpl     L8246
	lda     #$00
L8263:  rts

L8264:  brk
L8265:  brk
L8266:  brk
L8267:  stx     L8292
	tax
	jsr     LDD89
	jsr     LD8E6
	ldy     #$00
L8273:  lda     ($F3),y
	sta     L8293
	and     #$7F
	ldx     L8292
	sty     L8291
	jsr     L82EE
	bmi     L8290
	ldy     L8291
	iny
	lda     L8293
	bpl     L8273
	lda     #$00
L8290:  rts

L8291:  brk
L8292:  brk
L8293:  brk
L8294:  stx     L82DB
	sta     L82DC
	sty     L82DD
	lda     L82DD
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	jsr     L82C4
	lda     L82DD
	and     #$0F
	jsr     L82C4
	lda     L82DC
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	jsr     L82C4
	lda     L82DC
	and     #$0F
	jsr     L82C4
	lda     #$00
	rts

L82C4:  tay
	lda     L82DE,y
	ldx     L82DB
	jsr     L82EE
	bmi     L82D1
	rts

L82D1:  sty     L82DA
	pla
	pla
	ldy     L82DA
	rts

L82DA:  brk
L82DB:  brk
L82DC:  brk
L82DD:  brk
L82DE:  bmi     L8311
	.byte   $32
	.byte   $33
	.byte   $34
	and     $36,x
	.byte   $37
	sec
	and     $4241,y
	.byte   $43
	.byte   $44
	eor     $46
L82EE:  pha
	txa
	asl     a
	asl     a
	asl     a
	asl     a
	tax
	lda     #$0B
	sta     $0342,x
	lda     #$00
	sta     $0348,x
	sta     $0349,x
	pla
	jmp     LE456

L8306:  txa
	asl     a
	asl     a
	asl     a
	asl     a
	tax
	lda     #$07
	sta     $0342,x
L8311:  lda     #$00
	sta     $0348,x
	sta     $0349,x
	jmp     LE456

L831C:  jsr     L83BB
	ldy     #$00
	lda     ($8C),y
	tay
L8324:  lda     ($8C),y
	sta     ($8A),y
	cpy     #$00
	beq     L8330
	dey
	jmp     L8324

L8330:  rts

L8331:  sta     $86
	stx     $87
	lda     $84
	clc
	adc     $86
	sta     $84
	lda     $85
	adc     $87
	tax
	lda     $84
	rts

L8344:  sta     $86
	stx     $87
	lda     $84
	sta     $D4
	lda     $85
	sta     $D5
	jsr     LD9AA
	jsr     LDDB6
	lda     $86
	sta     $D4
	lda     $87
	sta     $D5
	jsr     LD9AA
	jsr     LDADB
	jsr     LD9D2
	lda     $D4
	ldx     $D5
	rts

L836C:  sta     $86
	stx     $87
	lda     $84
	and     $86
	sta     $84
	lda     $85
	and     $87
	tax
	lda     $84
	rts

L837E:  tay
	cpy     #$00
	beq     L838A
L8383:  lsr     $85
	ror     $84
	dey
	bne     L8383
L838A:  lda     $84
	ldx     $85
	rts

L838F:  lda     $A2
	clc
	adc     $A4
	sta     $A4
	lda     $A3
	adc     $A5
	sta     $A5
	ldy     #$00
L839E:  lda     ($A2),y
	sta     ($A0),y
	inc     $A2
	bne     L83A8
	inc     $A3
L83A8:  inc     $A0
	bne     L83AE
	inc     $A1
L83AE:  lda     $A3
	cmp     $A5
	bne     L839E
	lda     $A2
	cmp     $A4
	bcc     L839E
	rts

L83BB:  lda     $A0
	sta     $8A
	lda     $A1
	sta     $8B
	lda     $A2
	sta     $8C
	lda     $A3
	sta     $8D
	rts

L83CC:  ldy     #$00
	lda     ($8A),y
	sta     L83F4
	beq     L83F0
	iny
	inc     L83F4
L83D9:  lda     ($8A),y
	dey
	sta     $0580,y
	iny
	iny
	cpy     L83F4
	bne     L83D9
	ldy     L83F4
	dey
L83EA:  lda     #$9B
	sta     $0580,y
	rts

L83F0:  ldy     #$00
	beq     L83EA
L83F4:  ora     ($4C,x)
	brk
	.byte   $32
	jmp     L3203

L83FB:  jmp     L3209

	jmp     L320F

L8401:  jmp     L3212

L8404:  jmp     L3215

L8407:  jmp     L3218

	jmp     L321E

	jsr     L3227
	lda     $A0
	ldx     #$00
	rts

L8415:  jmp     L322A

	jmp     L322D

	jsr     L3230
	lda     $A0
	ldx     #$00
	rts

	jsr     L3233
	lda     $A0
	ldx     #$00
	rts

	jsr     L3236
	lda     $A0
	ldx     $A1
	rts

	jmp     L3239

	jmp     L323C

	jmp     L323F

	jmp     L3284

	jmp     L3257

	jmp     L325A

L8445:  jmp     L325D

	jmp     L3260

	jmp     L3263

	jsr     L3269
	lda     $A0
	ldx     $A1
	rts

	jsr     L326C
	lda     $A0
	ldx     $A1
	rts

	jsr     L326F
	lda     $A0
	ldx     $A1
	rts

	jsr     L3272
	lda     $A0
	ldx     $A1
	rts

	jsr     L3275
	lda     $A0
	ldx     #$00
	rts

	jmp     L3278

	jmp     L327B

	jmp     L327E

	jmp     L3281

	jmp     L3287

	jmp     L328A

	jmp     L3290

	jmp     L3293

	jmp     L3296

	jmp     L3299

	jmp     L32A2

L8497:  jsr     L32A5
	lda     $A0
	ldx     #$00
	rts

	jsr     L32A8
	lda     $A0
	ldx     #$00
	rts

	jsr     L32AB
	lda     $A0
	ldx     #$00
	rts

	ldy     $A2
	lda     $A1
	tax
	lda     $A0
	jmp     L32B1

	ldy     $A2
	lda     $A1
	tax
	lda     $A0
	jmp     L32B4

	ldy     $A4
	ldx     $A2
	lda     $A0
	jmp     L32BA

	ldy     $A4
	ldx     $A2
	lda     $A0
	jmp     L32BD

	jmp     L32C6

L84D8:  jmp     L32C9

	jmp     L32CC

L84DE:  jmp     L32CF

L84E1:  jmp     L32D2

L84E4:  jmp     L32D5

L84E7:  jmp     L32D8

L84EA:
	.SEGMENT "S_CALL_LOAD"

	.word	$02E0
	.word	$02E1
	.word	L7040

