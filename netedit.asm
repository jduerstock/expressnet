; da65 V2.18 - Ubuntu 2.19-1
; Created:    2024-03-31 11:54:29
; Input file: netedit.cmd
; Page:       1


	.setcpu "6502"

L200C           := $200C
L2012           := $2012
L2017           := $2017
L2018           := $2018
L2019           := $2019
L2020           := $2020
L2023           := $2023
L202D           := $202D
L203A           := $203A
L2046           := $2046
L2051           := $2051
L2053           := $2053
L2057           := $2057
L2065           := $2065
L2165           := $2165
L2804           := $2804
L3028           := $3028
L3200           := $3200
L3203           := $3203
L3209           := $3209
L320C           := $320C
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
L3306           := $3306
L3A20           := $3A20
L3A3F           := $3A3F
L3A6C           := $3A6C
L3D31           := $3D31
L4143           := $4143
L4225           := $4225
L4242           := $4242
L4313           := $4313
L4317           := $4317
L4319           := $4319
L4520           := $4520
L4D1B           := $4D1B
L4E0F           := $4E0F
L4F4C           := $4F4C
L5218           := $5218
L5320           := $5320
L540C           := $540C
L5420           := $5420
L554F           := $554F
L5912           := $5912
L5B0A           := $5B0A
L5B0E           := $5B0E
L5B11           := $5B11
L5B18           := $5B18
L5B1F           := $5B1F
L5B20           := $5B20
L5F20           := $5F20
L6144           := $6144
L614C           := $614C
L614E           := $614E
L6162           := $6162
L6163           := $6163
L6165           := $6165
L6170           := $6170
L6177           := $6177
L6220           := $6220
L6465           := $6465
L654D           := $654D
L6557           := $6557
L656D           := $656D
L6572           := $6572
L6620           := $6620
L666F           := $666F
L6874           := $6874
L6966           := $6966
L6974           := $6974
L6E65           := $6E65
L6E6F           := $6E6F
L6F63           := $6F63
L6F68           := $6F68
L6F74           := $6F74
LD800           := $D800
LD8E6           := $D8E6
LD9AA           := $D9AA
LD9D2           := $D9D2
LDADB           := $DADB
LDDB6           := $DDB6
LE456           := $E456

	.SEGMENT "S_EDIT_HDR"

	.word	$FFFF
	.word	$7000
	.word	$871F

	.SEGMENT "S_EDIT_CODE"

	jmp     L7040

	.byte   $12
	asl     a
	.byte   $02
	cli
	.byte   $43
	and     $3536
	bit     L5420
	pla
	adc     $20
	.byte   $43
	jsr     L7243
	.byte   $6F
	.byte   $73
	.byte   $73
	and     $6F43
	adc     $6970
L701E:  jmp     (L7265)

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
	.byte	$20,$53,$79 ; jsr     L7953
	.byte   $73
	.byte   $74
	adc     $6D
	.byte   $73
	ora     ($60,x)
L7040:  lda     #$20
	ldx     #$87
	sta     $A0
	stx     $A1
	lda     #$79
	ldx     #$70
	sta     $A2
	stx     $A3
	jsr     L849B
	lda     $3EEF
	ldx     #$00
	jsr     L834F
	lda     #$02
	ldx     #$00
	jsr     L8363
	lda     #$20
	ldx     #$87
	jsr     L835E
	jsr     L8354
	jsr     L8384
	jsr     L81E7
	jsr     L7095
	jsr     L8267
	rts

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
L7095:  lda     #$01
	ldx     #$00
	sta     a:$94
	stx     a:$95
	ora     a:$95
	bne     L70A7
	jmp     L7165

L70A7:  jsr     L716C
	lda     #$66
	ldx     #$71
	sta     $A0
	stx     $A1
	lda     #$02
	ldx     #$00
	sta     $A2
	stx     $A3
	lda     #$00
	ldx     #$00
	sta     $A4
	stx     $A5
	lda     #$00
	ldx     #$00
	sta     $A6
	stx     $A7
	jsr     L8604
	jsr     L8601
	lda     #$01
	ldx     #$00
	jsr     L8363
	lda     #$66
	ldx     #$71
	jsr     L8373
	sta     a:$94
	stx     a:$95
	lda     #$71
	ldx     #$00
	jsr     L839C
	beq     L710D
	lda     #$01
	ldx     #$00
	jsr     L8363
	lda     #$66
	ldx     #$71
	jsr     L8373
	sta     a:$94
	stx     a:$95
	lda     #$51
	ldx     #$00
	jsr     L839C
	beq     L710D
	jmp     L710E

L710D:  rts

L710E:  lda     #$66
	ldx     #$71
	sta     $A0
	stx     $A1
	jsr     L84B0
	sta     L716B
	lda     L716B
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L839C
	cmp     #$01
	beq     L7135
	jmp     L7162

L7135:  lda     L716B
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$1B
	ldx     #$00
	jsr     L839C
	bmi     L714C
	jmp     L7162

L714C:  lda     L716B
	ldx     #$00
	jsr     L8359
	lda     #$01
	ldx     #$00
	jsr     L84F0
	sta     $A0
	stx     $A1
	jsr     L72E3
L7162:  jmp     L7095

L7165:  rts

	brk
	brk
	brk
	brk
	brk
L716B:  brk
L716C:  lda     #$7D
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
	jsr     L8601
	lda     #$90
	ldx     #$72
	sta     $A0
	stx     $A1
	jsr     L8672
	jsr     L8601
	lda     #$01
	ldx     #$00
	sta     L728E
L718F:  lda     L728E
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$1B
	ldx     #$00
	jsr     L839C
	bmi     L71A6
	jmp     L727F

L71A6:  lda     L728E
	ldx     #$00
	jsr     L8359
	lda     #$01
	ldx     #$00
	jsr     L84F0
	sta     $A0
	stx     $A1
	jsr     L8141
	lda     L728E
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$0A
	ldx     #$00
	jsr     L839C
	bmi     L71D3
	jmp     L71DE

L71D3:  lda     #$20
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
L71DE:  lda     L728E
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L8675
	lda     #$20
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
	lda     $94FE
	ldx     #$00
	sta     L728F
	lda     L728F
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L839C
	beq     L7214
	jmp     L7222

L7214:  lda     #$B2
	ldx     #$72
	sta     $A0
	stx     $A1
	jsr     L85FE
	jmp     L7255

L7222:  lda     #$FE
	ldx     #$94
	sta     $A0
	stx     $A1
	jsr     L85FE
L722D:  lda     L728F
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$10
	ldx     #$00
	jsr     L839C
	bmi     L7244
	.byte   $4C
	.byte   $55
L7243:  .byte   $72
L7244:  lda     #$20
L7246:  ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
L724F:  inc     L728F
	jmp     L722D

L7255:  lda     L728E
	ldx     #$00
	jsr     L8359
	lda     #$01
	ldx     #$00
	.byte   $20
	.byte   $2B
L7263:  sta     $8D
L7265:  sty     $00,x
	stx     a:$95
	lda     #$00
	ldx     #$00
	.byte   $20
L726F:  .byte   $9C
	.byte   $83
	beq     L7276
	.byte   $4C
L7274:  .byte   $79
	.byte   $72
L7276:  .byte   $20
L7277:  ora     ($86,x)
L7279:  inc     L728E
	jmp     L718F

L727F:  jsr     L8601
	lda     #$C3
	ldx     #$72
	sta     $A0
	stx     $A1
	jsr     L85FE
	rts

L728E:  brk
L728F:  brk
	and     ($20,x)
	jsr     L2020
	jsr     L5F20
	.byte   $5F
	eor     $78
	bvs     L730F
	adc     $73
	.byte   $73
	lsr     $5445
	and     ($20,x)
	.byte   $43
	adc     ($6C,x)
	jmp     (L4520)

	.byte   $64
	adc     #$74
	.byte   $6F
	.byte   $72
	.byte   $5F
	.byte   $5F
	bpl     L72F9
	adc     L7470
	adc     L2020,y
	jsr     L2020
	jsr     L2020
	jsr     L2020
	.byte   $1F
	jsr     L2051
	.byte   $74
	.byte   $6F
	jsr     L7571
	adc     #$74
	jsr     L726F
	jsr     L6E65
	.byte   $74
	.byte   $72
	adc     $2320,y
	jsr     L6F74
	jsr     L6465
	adc     #$74
	.byte   $3A
	.byte   $20
L72E3:  lda     $A0
	sta     L78FB
	lda     L78FB
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L8141
L72F4:  lda     #$01
	ldx     #$00
	.byte   $8D
L72F9:  sty     $00,x
	stx     a:$95
	ora     a:$95
	bne     L7306
	jmp     L78EE

L7306:  jsr     L7AD7
	jsr     L8651
	sta     $A0
	.byte   $86
L730F:  lda     ($20,x)
	.byte   $8F
	sta     $8D
	.byte   $FC
	sei
	lda     L78FC
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
	jsr     L8601
	jsr     L8601
	lda     L78FC
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$51
	ldx     #$00
	jsr     L839C
	beq     L733F
	jmp     L7345

L733F:  jmp     L78EE

	jmp     L78EB

L7345:  lda     #$54
	ldx     #$00
	jsr     L839C
	beq     L7351
	jmp     L738D

L7351:  lda     #$00
	ldx     #$00
	jsr     L834F
	lda     #$00
	ldx     #$00
	jsr     L8363
	lda     #$FE
L7361:  ldx     #$94
	.byte   $20
	.byte   $5E
L7365:  .byte   $83
	jsr     L8354
	jsr     L8384
	lda     #$00
	ldx     #$00
	jsr     L834F
	lda     #$00
L7375:  ldx     #$00
	jsr     L8363
	lda     #$0E
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
	jmp     L78EE

	jmp     L78EB

L738D:  lda     #$41
	ldx     #$00
	jsr     L839C
	beq     L7399
	jmp     L73CD

L7399:  lda     #$05
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$FE
	ldx     #$94
	sta     $A0
	stx     $A1
	lda     #$0F
	ldx     #$00
	sta     $A2
	stx     $A3
	lda     #$00
	ldx     #$00
	sta     $A4
	stx     $A5
	lda     #$00
	ldx     #$00
	sta     $A6
	stx     $A7
	jsr     L8604
	jsr     L8601
	jmp     L78EB

L73CD:  lda     #$42
	ldx     #$00
	jsr     L839C
	beq     L73D9
	jmp     L743B

L73D9:  lda     #$0C
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$00
	ldx     #$00
	sta     $9582
	jsr     L86A4
	sta     a:$94
	stx     a:$95
	lda     #$4E
	ldx     #$00
	jsr     L839C
	beq     L7400
	jmp     L7407

L7400:  lda     #$01
	ldx     #$00
	sta     $9582
L7407:  lda     #$19
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$0E
	ldx     #$95
	sta     $A0
	stx     $A1
	lda     #$28
	ldx     #$00
	sta     $A2
L7420:  stx     $A3
	lda     #$00
	ldx     #$00
	sta     $A4
	stx     $A5
	lda     #$00
	ldx     #$00
	sta     $A6
	stx     $A7
	jsr     L8604
	jsr     L8601
	jmp     L78EB

L743B:  lda     #$43
	ldx     #$00
	jsr     L839C
	beq     L7447
	jmp     L745B

L7447:  lda     #$26
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L8659
	sta     $953A
	jmp     L78EB

L745B:  lda     #$44
	ldx     #$00
	jsr     L839C
	beq     L7467
	jmp     L747B

L7467:  lda     #$4C
	ldx     #$79
	sta     $A0
	stx     $A1
	.byte   $20
L7470:  inc     $2085,x
	eor     $8D86,y
	.byte   $3B
	sta     $4C,x
	.byte   $EB
	sei
L747B:  lda     #$45
	ldx     #$00
	jsr     L839C
	beq     L7487
	jmp     L74D2

L7487:  lda     #$5C
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L8661
	sta     $953C
	stx     $953D
	jsr     L8601
	lda     #$6F
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$3E
	ldx     #$95
	sta     $A0
	stx     $A1
	lda     #$0F
	ldx     #$00
	sta     $A2
	stx     $A3
	lda     #$00
	ldx     #$00
	sta     $A4
	stx     $A5
	lda     #$00
	ldx     #$00
	sta     $A6
	stx     $A7
	jsr     L8604
	jsr     L8601
	jmp     L78EB

L74D2:  lda     #$46
	ldx     #$00
	jsr     L839C
	beq     L74DE
	jmp     L76CB

L74DE:  lda     #$00
	ldx     #$00
	sta     L78FD
	stx     L78FE
L74E8:  lda     L78FD
	ldx     L78FE
	sta     a:$94
	stx     a:$95
	lda     #$07
	ldx     #$00
	jsr     L839C
	bmi     L750B
	jmp     L752B

L7500:  inc     L78FD
	bne     L7508
	inc     L78FE
L7508:  jmp     L74E8

L750B:  lda     #$00
	ldx     #$00
	jsr     L834F
	lda     L78FD
	ldx     L78FE
	jsr     L8363
	lda     #$57
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
	jmp     L7500

L752B:  lda     #$82
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L86A4
	sta     a:$94
	stx     a:$95
	lda     #$59
	ldx     #$00
	jsr     L839C
	beq     L754B
	jmp     L7566

L754B:  lda     #$01
	ldx     #$00
	jsr     L834F
	.byte   $A9
L7553:  brk
	ldx     #$00
	jsr     L8363
	lda     #$57
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
L7566:  lda     #$9C
	ldx     #$79
	sta     $A0
	stx     $A1
L756E:  jsr     L85FE
L7571:  jsr     L86A4
	sta     a:$94
	stx     a:$95
	lda     #$59
	ldx     #$00
	jsr     L839C
	beq     L7586
	jmp     L75A1

L7586:  lda     #$01
	ldx     #$00
	jsr     L834F
	lda     #$01
	ldx     #$00
	jsr     L8363
	lda     #$57
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
L75A1:  lda     #$B6
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L86A4
	sta     a:$94
	stx     a:$95
	lda     #$59
	ldx     #$00
	jsr     L839C
	beq     L75C1
	jmp     L75DC

L75C1:  lda     #$01
	ldx     #$00
	jsr     L834F
	lda     #$02
	ldx     #$00
	jsr     L8363
	lda     #$57
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
L75DC:  lda     #$D0
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L86A4
	sta     a:$94
	stx     a:$95
	lda     #$59
	ldx     #$00
	jsr     L839C
	beq     L75FC
	jmp     L7617

L75FC:  lda     #$01
	ldx     #$00
	jsr     L834F
	lda     #$03
	ldx     #$00
	jsr     L8363
	lda     #$57
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
L7617:  lda     #$EA
	ldx     #$79
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L86A4
	sta     a:$94
	stx     a:$95
	lda     #$59
	ldx     #$00
	jsr     L839C
	beq     L7637
	jmp     L7652

L7637:  lda     #$01
	ldx     #$00
	jsr     L834F
	lda     #$04
	ldx     #$00
	jsr     L8363
	lda     #$57
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
L7652:  lda     #$04
	ldx     #$7A
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L86A4
	sta     a:$94
	stx     a:$95
	lda     #$59
	ldx     #$00
	jsr     L839C
	beq     L7672
	jmp     L768D

L7672:  lda     #$01
	ldx     #$00
	jsr     L834F
	lda     #$05
	ldx     #$00
	jsr     L8363
	lda     #$57
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
L768D:  lda     #$1E
	ldx     #$7A
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L86A4
	sta     a:$94
	stx     a:$95
	lda     #$59
	ldx     #$00
	jsr     L839C
	beq     L76AD
	jmp     L76C8

L76AD:  lda     #$01
	ldx     #$00
	jsr     L834F
	lda     #$06
	ldx     #$00
	jsr     L8363
	lda     #$57
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
L76C8:  jmp     L78EB

L76CB:  lda     #$47
	ldx     #$00
	jsr     L839C
	beq     L76D7
	jmp     L773A

L76D7:  lda     #$38
	ldx     #$7A
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L8659
	sta     $955E
	jsr     L8601
	lda     $955E
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$17
	ldx     #$00
	jsr     L839C
	cmp     #$01
	beq     L7704
	jmp     L7707

L7704:  jmp     L76D7

L7707:  lda     #$50
	ldx     #$7A
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L8659
	sta     $955F
	jsr     L8601
	lda     $955F
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$18
	ldx     #$00
	jsr     L839C
	cmp     #$01
	beq     L7734
	jmp     L7737

L7734:  jmp     L7707

L7737:  jmp     L78EB

L773A:  lda     #$48
	ldx     #$00
	jsr     L839C
	beq     L7746
	jmp     L775A

L7746:  lda     #$68
	ldx     #$7A
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L8659
	sta     $9560
	jmp     L78EB

L775A:  lda     #$49
	ldx     #$00
	jsr     L839C
	beq     L7766
	jmp     L7810

L7766:  lda     #$84
	ldx     #$7A
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L86A4
	sta     a:$94
	stx     a:$95
	lda     #$59
	ldx     #$00
	jsr     L839C
	beq     L7786
	jmp     L780D

L7786:  lda     #$00
	ldx     #$00
	sta     L7903
	stx     L7904
L7790:  lda     L7903
	ldx     L7904
	sta     a:$94
	stx     a:$95
	lda     #$03
	ldx     #$00
	jsr     L839C
	bmi     L77B3
	jmp     L780D

L77A8:  inc     L7903
	bne     L77B0
	inc     L7904
L77B0:  jmp     L7790

L77B3:  lda     #$00
	ldx     #$00
	jsr     L834F
	lda     L7903
	ldx     L7904
	jsr     L8363
	lda     #$4E
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
	lda     #$00
	ldx     #$00
	jsr     L834F
	lda     L7903
	ldx     L7904
	jsr     L8363
	lda     #$51
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
	lda     #$00
	ldx     #$00
	jsr     L834F
	lda     L7903
	ldx     L7904
	jsr     L8363
	lda     #$54
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
	jmp     L77A8

L780D:  jmp     L78EB

L7810:  lda     #$4A
	ldx     #$00
	jsr     L839C
	beq     L781C
	jmp     L78EB

L781C:  lda     #$98
	ldx     #$7A
	sta     $A0
	stx     $A1
	jsr     L8672
	jsr     L8601
L782A:  lda     #$B1
	ldx     #$7A
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L8659
	sta     L78FF
	stx     L7900
	jsr     L8601
	lda     L78FF
	ldx     L7900
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L839C
	bmi     L7870
	lda     L78FF
	ldx     L7900
	sta     a:$94
	stx     a:$95
	lda     #$1F
	ldx     #$00
	jsr     L839C
	cmp     #$01
	beq     L7870
	jmp     L7873

L7870:  jmp     L782A

L7873:  dec     L78FF
	ldy     L78FF
	cpy     #$FF
	bne     L7880
	dec     L7900
L7880:  lda     #$C4
	ldx     #$7A
	sta     $A0
	stx     $A1
	jsr     L85FE
	jsr     L8659
	sta     L7901
	stx     L7902
	jsr     L8601
	lda     L7901
	ldx     L7902
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L839C
	bmi     L78C6
	lda     L7901
	ldx     L7902
	sta     a:$94
	stx     a:$95
	lda     #$1F
	ldx     #$00
	jsr     L839C
	cmp     #$01
	beq     L78C6
	jmp     L78C9

L78C6:  jmp     L7880

L78C9:  lda     L7901
	ldx     L7902
	jsr     L834F
	lda     L78FF
	ldx     L7900
	jsr     L8363
	lda     #$62
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
	jmp     L78EB

L78EB:  jmp     L72F4

L78EE:  lda     L78FB
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L8194
	rts

L78FB:  brk
L78FC:  brk
L78FD:  brk
L78FE:  brk
L78FF:  brk
L7900:  brk
L7901:  brk
L7902:  brk
L7903:  brk
L7904:  brk

	.byte	$06,"Name: "
	.byte	$0C,"Tone dial?: "
	.byte	$0C,"    Number: "
	.byte	$25,"Baud (0=300, 1=1200, 2=2400, 3=9600: "
	.byte	$0F,"New wait time: "
	.byte	$12,"Your user number: "
	.byte	$12,"     password   : "
	.byte	$19,"Call this BBS on Sunday? "
	.byte	$19,"                 Monday? "
	.byte	$19,"                Tuesday? "
	.byte	$19,"              Wednesday? "
	.byte	$19,"               Thursday? "
	.byte	$19,"                 Friday? "
	.byte	$19,"               Saturday? "
	.byte	$17,"Call from hour (0-23): "
	.byte	$17,"    until hour (0-24): "
	.byte	$1B,"Maximum number of retries: "
	.byte	$13,"Clear these dates? "
	.byte	$18,"Redirect messages coming"
	.byte   $12,"from base (1-31): "
	.byte	$12,"  to base (1-31): "

L7AD7:  lda     #$7D
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
	lda     #$D2
	ldx     #$7E
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$FE
	ldx     #$94
	sta     $A0
	stx     $A1
	jsr     L8672
	lda     #$E1
	ldx     #$7E
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     $9582
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L839C
	beq     L7B1A
	jmp     L7B28

L7B1A:  lda     #$F0
	ldx     #$7E
	sta     $A0
	stx     $A1
	jsr     L85FE
	jmp     L7B33

L7B28:  lda     #$F5
	ldx     #$7E
	sta     $A0
	stx     $A1
	jsr     L85FE
L7B33:  lda     #$0E
	ldx     #$95
	sta     $A0
	stx     $A1
	jsr     L8672
	lda     #$FA
	ldx     #$7E
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     $953A
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$00
	ldx     #$00
	jsr     L839C
	beq     L7B60
	jmp     L7B6E

L7B60:  lda     #$05
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	jmp     L7BAD

L7B6E:  lda     #$01
	ldx     #$00
	jsr     L839C
	beq     L7B7A
	jmp     L7B88

L7B7A:  lda     #$0C
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	jmp     L7BAD

L7B88:  lda     #$02
	ldx     #$00
	jsr     L839C
	beq     L7B94
	jmp     L7BA2

L7B94:  lda     #$13
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	jmp     L7BAD

L7BA2:  lda     #$1A
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
L7BAD:  lda     $953B
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$0F
	ldx     #$00
	jsr     L839C
	bmi     L7BC4
	jmp     L7BCB

L7BC4:  lda     #$0F
	ldx     #$00
	sta     $953B
L7BCB:  lda     #$21
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     $953B
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L8675
	jsr     L8601
	lda     #$34
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     $953C
	ldx     $953D
	sta     $A0
	stx     $A1
	jsr     L8678
	lda     #$2F
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
	lda     #$3E
	ldx     #$95
	sta     $A0
	stx     $A1
	jsr     L8672
	lda     #$46
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L8672
	lda     #$66
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$00
	ldx     #$00
	sta     L7EC7
L7C30:  lda     L7EC7
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$07
	ldx     #$00
	jsr     L839C
	bmi     L7C4D
	jmp     L7C86

L7C47:  inc     L7EC7
	jmp     L7C30

L7C4D:  lda     L7EC7
	ldx     #$00
	jsr     L8363
	lda     #$57
	ldx     #$95
	jsr     L8373
	sta     a:$94
	stx     a:$95
	ora     a:$95
	bne     L7C6A
	jmp     L7C78

L7C6A:  lda     #$79
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	jmp     L7C83

L7C78:  lda     #$7C
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
L7C83:  jmp     L7C47

L7C86:  jsr     L8601
	lda     #$7F
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     $955E
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L8675
	lda     #$9A
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     $955F
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L8675
	jsr     L8601
	lda     #$9E
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     $9560
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L8675
	jsr     L8601
	lda     #$B9
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$4E
	ldx     #$95
	sta     $A0
	stx     $A1
	jsr     L8069
	lda     #$D2
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$51
	ldx     #$95
	sta     $A0
	stx     $A1
	jsr     L8069
	lda     #$EB
	ldx     #$7F
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$54
	ldx     #$95
	sta     $A0
	stx     $A1
	jsr     L8069
	lda     #$04
	ldx     #$80
	sta     $A0
	stx     $A1
	jsr     L8672
	lda     #$25
	ldx     #$80
	sta     $A0
	stx     $A1
	jsr     L8672
	lda     #$49
	ldx     #$80
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$00
	ldx     #$00
	sta     L7EC7
L7D3E:  lda     L7EC7
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$1F
	ldx     #$00
	jsr     L839C
	bmi     L7D5B
	jmp     L7E1E

L7D55:  inc     L7EC7
	jmp     L7D3E

L7D5B:  lda     L7EC7
	ldx     #$00
	jsr     L8363
	lda     #$62
	ldx     #$95
	jsr     L8373
	sta     a:$94
	stx     a:$95
	lda     #$01
	ldx     #$00
	jsr     L839C
	bmi     L7D9C
	lda     L7EC7
	ldx     #$00
	jsr     L8363
	lda     #$62
	ldx     #$95
	jsr     L8373
	sta     a:$94
	stx     a:$95
	lda     #$1F
	ldx     #$00
	jsr     L839C
	cmp     #$01
	beq     L7D9C
	jmp     L7DC3

L7D9C:  lda     L7EC7
	ldx     #$00
	jsr     L8359
	lda     #$01
	ldx     #$00
	jsr     L84DD
	jsr     L834F
	lda     L7EC7
	ldx     #$00
	jsr     L8363
	lda     #$62
	ldx     #$95
	jsr     L835E
	jsr     L8354
	jsr     L8384
L7DC3:  lda     L7EC7
	ldx     #$00
	jsr     L8363
	lda     #$62
	ldx     #$95
	jsr     L8373
	sta     $A0
	stx     $A1
	lda     #$C8
	ldx     #$7E
	sta     $A2
	stx     $A3
	jsr     L85AE
	lda     L7EC8
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$01
	ldx     #$00
	jsr     L839C
	beq     L7DF8
	jmp     L7E06

L7DF8:  lda     #$20
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
	jmp     L7E1B

L7E06:  lda     #$01
	ldx     #$00
	jsr     L8363
	lda     #$C8
	ldx     #$7E
	jsr     L8373
	sta     $A0
	stx     $A1
	jsr     L85FB
L7E1B:  jmp     L7D55

L7E1E:  jsr     L8601
	lda     #$4E
	ldx     #$80
	sta     $A0
	stx     $A1
	jsr     L85FE
	lda     #$00
	ldx     #$00
	sta     L7EC7
L7E33:  lda     L7EC7
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$1F
	ldx     #$00
	jsr     L839C
	bmi     L7E50
	jmp     L7EB5

L7E4A:  inc     L7EC7
	jmp     L7E33

L7E50:  lda     L7EC7
	ldx     #$00
	jsr     L8363
	lda     #$62
	ldx     #$95
	jsr     L8373
	sta     $A0
	stx     $A1
	lda     #$C8
	ldx     #$7E
	sta     $A2
	stx     $A3
	jsr     L85AE
	lda     L7EC8
	ldx     #$00
	sta     a:$94
	stx     a:$95
	lda     #$01
	ldx     #$00
	jsr     L839C
	beq     L7E85
	jmp     L7E9D

L7E85:  lda     #$01
	ldx     #$00
	jsr     L8363
	lda     #$C8
	ldx     #$7E
	jsr     L8373
	sta     $A0
	stx     $A1
	jsr     L85FB
	jmp     L7EB2

L7E9D:  lda     #$02
	ldx     #$00
	jsr     L8363
	lda     #$C8
	ldx     #$7E
	jsr     L8373
	sta     $A0
	stx     $A1
	jsr     L85FB
L7EB2:  jmp     L7E4A

L7EB5:  jsr     L8601
	jsr     L8601
	lda     #$53
	ldx     #$80
	sta     $A0
	stx     $A1
	jsr     L85FE
	rts

L7EC7:  brk
L7EC8:  brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	brk
	.byte	$0E,"[A] BBS Name: "
	.byte	$0E,"[B] Number  : "
	.byte   $04,"(T) "
	.byte   $04,"(P) "
	.byte	$0A,"[C] Baud: "
	.byte	$06,"300   "
	.byte	$06,"1200  "
	.byte	$06,"2400  "
	.byte	$06,"9600  "
	.byte   $12,"[D] Secs to wait: "
	.byte	$11,"[E] Unsernum/PW: "
	.byte	$1F,"[F] Days to call: S M T W T F S"
	.byte   $12,"                  "
	.byte   $02,"y "
	.byte   $02,"n "
	.byte	$1A,"[G] Call between hours  : "
	.byte   $03," - "
	.byte   $1A,"[H] Maximum # of retries: "
	.byte	$18,"[I] Last tried        : "
	.byte	$18,"    Last connected    : "
	.byte	$18,"    Last packet recv'd: "
	.byte	$20,"[J] Incoming Message Redirection"
	.byte	$23,"    ----+----1----+----2----+----3-"
	.byte   $04,"    "
	.byte   $04,"    "
	.byte	$15,"Q)uit, T)rash, A-L): "

L8069:  lda     $A0
	sta     L813F
	ldx     $A1
	stx     L8140
	lda     L813F
	ldx     L8140
	jsr     L8368
	sta     a:$94
	stx     a:$95
	lda     #$0A
	ldx     #$00
	jsr     L839C
	bmi     L808E
	jmp     L8099

L808E:  lda     #$20
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
L8099:  lda     L813F
	ldx     L8140
	jsr     L8368
	inc     L813F
	bne     L80AA
	inc     L8140
L80AA:  sta     $A0
	stx     $A1
	jsr     L8675
	lda     #$2F
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
	lda     L813F
	ldx     L8140
	jsr     L8368
	sta     a:$94
	stx     a:$95
	lda     #$0A
	ldx     #$00
	jsr     L839C
	bmi     L80D7
	jmp     L80E2

L80D7:  lda     #$30
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
L80E2:  lda     L813F
	ldx     L8140
	jsr     L8368
	inc     L813F
	bne     L80F3
	inc     L8140
L80F3:  sta     $A0
	stx     $A1
	jsr     L8675
	lda     #$2F
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
	lda     L813F
	ldx     L8140
	jsr     L8368
	sta     a:$94
	stx     a:$95
	lda     #$0A
	ldx     #$00
	jsr     L839C
	bmi     L8120
	jmp     L812B

L8120:  lda     #$30
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L85FB
L812B:  lda     L813F
	ldx     L8140
	jsr     L8368
	sta     $A0
	stx     $A1
	jsr     L8675
	jsr     L8601
	rts

L813F:  brk
L8140:  brk
L8141:  lda     $A0
	sta     L818F
	lda     L818F
	ldx     #$00
	jsr     L8359
	lda     #$87
	ldx     #$00
	jsr     L8503
	sta     L8192
	stx     L8193
	lda     #$48
	ldx     #$87
	jsr     L8359
	lda     L8192
	ldx     L8193
	jsr     L84DD
	sta     L8190
	stx     L8191
	lda     #$FE
	ldx     #$94
	sta     $A0
	stx     $A1
	lda     L8190
	ldx     L8191
	sta     $A2
	stx     $A3
	lda     #$87
	ldx     #$00
	sta     $A4
	stx     $A5
	jsr     L8563
	rts

L818F:  brk
L8190:  brk
L8191:  brk
L8192:  brk
L8193:  brk
L8194:  lda     $A0
	sta     L81E2
	lda     L81E2
	ldx     #$00
	jsr     L8359
	lda     #$87
	ldx     #$00
	jsr     L8503
	sta     L81E5
	stx     L81E6
	lda     #$48
	ldx     #$87
	jsr     L8359
	lda     L81E5
	ldx     L81E6
	jsr     L84DD
	sta     L81E3
	stx     L81E4
	lda     L81E3
	ldx     L81E4
	sta     $A0
	stx     $A1
	lda     #$FE
	ldx     #$94
	sta     $A2
	stx     $A3
	lda     #$87
	ldx     #$00
	sta     $A4
	stx     $A5
	jsr     L8563
	rts

L81E2:  brk
L81E3:  brk
L81E4:  brk
L81E5:  brk
L81E6:  brk
L81E7:  jsr     L8637
	lda     #$48
	ldx     #$87
	sta     $A0
	stx     $A1
	lda     #$B6
	ldx     #$0D
	sta     $A2
	stx     $A3
	lda     #$00
	ldx     #$00
	sta     $A4
	stx     $A5
	jsr     L853D
	lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$20
	ldx     #$87
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
	jsr     L83C3
	sta     a:$94
	stx     a:$95
	lda     #$01
	ldx     #$00
	jsr     L839C
	beq     L823A
	jmp     L8260

L823A:  lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$48
	ldx     #$87
	sta     $A2
	stx     $A3
	lda     #$B6
	ldx     #$0D
	sta     $A4
	stx     $A5
	jsr     L8407
	lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L8483
L8260:  jsr     L863D
	rts

	brk
	brk
	brk
L8267:  jsr     L8637
	lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$20
	ldx     #$87
	sta     $A2
	stx     $A3
	lda     #$08
	ldx     #$00
	sta     $A4
	stx     $A5
	lda     #$00
	ldx     #$00
	sta     $A6
	stx     $A7
	jsr     L83C3
	sta     a:$94
	stx     a:$95
	lda     #$01
	ldx     #$00
	jsr     L839C
	bne     L829F
	jmp     L82AE

L829F:  jsr     L863D
	lda     #$0B
	ldx     #$83
	sta     $A0
	stx     $A1
	jsr     L8672
	rts

L82AE:  lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	lda     #$48
	ldx     #$87
	sta     $A2
	stx     $A3
	lda     #$B6
	ldx     #$0D
	sta     $A4
	stx     $A5
	jsr     L8448
	sta     a:$94
	stx     a:$95
	lda     #$B6
	ldx     #$0D
	jsr     L839C
	bne     L82DB
	jmp     L82F5

L82DB:  lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L8483
	jsr     L863D
	lda     #$2E
	ldx     #$83
	sta     $A0
	stx     $A1
	jsr     L8672
	rts

L82F5:  lda     #$02
	ldx     #$00
	sta     $A0
	stx     $A1
	jsr     L8483
	jsr     L863D
	lda     #$01
	ldx     #$00
	rts

	rts

	brk
	brk
	.byte   $22
	eor     $6E,x
	adc     ($62,x)
	jmp     (L2065)

	.byte   $74
	.byte   $6F
	jsr     L7263
	adc     $61
	.byte   $74
	adc     $20
	.byte   $43
	eor     ($4C,x)
	jmp     L554F

	.byte   $54
	rol     $4144
	.byte   $54
	jsr     L6966
	jmp     (L2165)

	.byte   $1F
	eor     $72
	.byte   $72
	.byte   $6F
	.byte   $72
	jsr     L7277
	adc     #$74
	adc     #$6E
	.byte   $67
	jsr     L4143
	jmp     L4F4C

	eor     $54,x
	rol     $4144
	.byte   $54
	jsr     L6966
	jmp     (L2165)

	rts

L834F:  sta     $98
	stx     $99
	rts

L8354:  lda     $98
	ldx     $99
	rts

L8359:  sta     $84
	stx     $85
	rts

L835E:  sta     $80
	stx     $81
	rts

L8363:  sta     $82
	stx     $83
	rts

L8368:  sta     $80
	stx     $81
	ldy     #$00
	lda     ($80),y
	ldx     #$00
	rts

L8373:  clc
	adc     $82
	sta     $80
	txa
	adc     $83
	sta     $81
	ldy     #$00
	lda     ($80),y
	ldx     #$00
	rts

L8384:  pha
	jsr     L838E
	ldy     #$00
	pla
	sta     ($80),y
	rts

L838E:  lda     $80
	clc
	adc     $82
	sta     $80
	lda     $81
	adc     $83
	sta     $81
	rts

L839C:  sta     $96
	stx     $97
	lda     $95
	cmp     $97
	bcc     L83B4
	beq     L83AA
	bcs     L83B7
L83AA:  lda     $94
	cmp     $96
	bcc     L83B4
	beq     L83BA
	bcs     L83B7
L83B4:  lda     #$FF
	rts

L83B7:  lda     #$01
	rts

L83BA:  lda     #$00
	rts

L83BD:  asl     a
	asl     a
	asl     a
	asl     a
	tax
	rts

L83C3:  jsr     L8483
	lda     $A2
	sta     $8A
	lda     $A3
	sta     $8B
	jsr     L85D2
	lda     $A0
	jsr     L83BD
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
	bpl     L8402
	lda     #$00
	beq     L8404
L8402:  lda     #$01
L8404:  ldx     #$00
	rts

L8407:  lda     $A4
	ora     $A5
	bne     L8412
	ldy     #$00
	jmp     L843F

L8412:  lda     $A0
	jsr     L83BD
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
	bmi     L843F
L8435:  lda     $0348,x
	pha
	lda     $0349,x
	tax
	pla
	rts

L843F:  cpy     #$88
	beq     L8435
	lda     #$00
	ldx     #$00
	rts

L8448:  lda     $A4
	ora     $A5
	bne     L8451
	jmp     L847E

L8451:  lda     $A0
	jsr     L83BD
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
	bmi     L847E
	lda     $0348,x
	pha
	lda     $0349,x
	tax
	pla
	rts

L847E:  lda     #$00
	ldx     #$00
	rts

L8483:  lda     $A0
	jsr     L83BD
	lda     #$0C
	sta     $0342,x
	jsr     LE456
	bpl     L8496
	lda     #$00
	beq     L8498
L8496:  lda     #$01
L8498:  ldx     #$00
	rts

L849B:  jsr     L859D
	ldy     #$00
	lda     ($8C),y
	tay
L84A3:  lda     ($8C),y
	sta     ($8A),y
	cpy     #$00
	beq     L84AF
	dey
	jmp     L84A3

L84AF:  rts

L84B0:  jmp     L84B3

L84B3:  lda     $A0
	sta     $8A
	lda     $A1
	sta     $8B
	jsr     L85D2
	lda     #$80
	sta     $F3
	lda     #$05
	sta     $F4
	lda     #$00
	sta     $F2
	jsr     LD800
	bcs     L84D9
	jsr     LD9D2
	bcs     L84D9
	lda     $D4
	ldx     $D5
	rts

L84D9:  lda     #$00
	tax
	rts

L84DD:  sta     $86
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

L84F0:  sta     $86
	stx     $87
	lda     $84
	sec
	sbc     $86
	sta     $84
	lda     $85
	sbc     $87
	tax
	lda     $84
	rts

L8503:  sta     $86
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

L852B:  sta     $86
	stx     $87
	lda     $84
	and     $86
	sta     $84
	lda     $85
	and     $87
	tax
	lda     $84
	rts

L853D:  lda     $A0
	clc
	adc     $A2
	sta     $A2
	lda     $A1
	adc     $A3
	sta     $A3
	ldy     #$00
	lda     $A4
L854E:  sta     ($A0),y
	inc     $A0
	bne     L8556
	inc     $A1
L8556:  ldx     $A1
	cpx     $A3
	bne     L854E
	ldx     $A0
	cpx     $A2
	bcc     L854E
	rts

L8563:  lda     $A2
	clc
	adc     $A4
	sta     $A4
	lda     $A3
	adc     $A5
	sta     $A5
	ldy     #$00
L8572:  lda     ($A2),y
	sta     ($A0),y
	inc     $A2
	bne     L857C
	inc     $A3
L857C:  inc     $A0
	bne     L8582
	inc     $A1
L8582:  lda     $A3
	cmp     $A5
	bne     L8572
	lda     $A2
	cmp     $A4
	bcc     L8572
	rts

	cmp     #$61
	bcc     L859C
	cmp     #$7B
	beq     L859C
	bcs     L859C
	sec
	sbc     #$20
L859C:  rts

L859D:  lda     $A0
	sta     $8A
	lda     $A1
	sta     $8B
	lda     $A2
	sta     $8C
	lda     $A3
	sta     $8D
	rts

L85AE:  jmp     L85B1

L85B1:  lda     $A0
	sta     $D4
	lda     $A1
	sta     $D5
	jsr     LD9AA
	jsr     LD8E6
	ldy     #$00
L85C1:  lda     ($F3),y
	php
	and     #$7F
	iny
	sta     ($A2),y
	plp
	bpl     L85C1
	tya
	ldy     #$00
	sta     ($A2),y
	rts

L85D2:  ldy     #$00
	lda     ($8A),y
	sta     L85FA
	beq     L85F6
	iny
	inc     L85FA
L85DF:  lda     ($8A),y
	dey
	sta     $0580,y
	iny
	iny
	cpy     L85FA
	bne     L85DF
	ldy     L85FA
	dey
L85F0:  lda     #$9B
	sta     $0580,y
	rts

L85F6:  ldy     #$00
	beq     L85F0
L85FA:  .byte   $01
L85FB:  jmp     L3200

L85FE:  jmp     L3203

L8601:  jmp     L3209

L8604:  lda     $A0
	sta     L862F
	lda     $A1
	sta     L8630
	lda     $A2
	sta     L8631
	lda     $A4
	sta     L8632
	lda     $A6
	sta     $A4
	lda     L8632
	sta     $A3
	lda     L8631
	tay
	lda     L8630
	tax
	lda     L862F
	jmp     L320C

L862F:  brk
L8630:  brk
L8631:  brk
L8632:  brk
	brk
	jmp     L320F

L8637:  jmp     L3212

	jmp     L3215

L863D:  jmp     L3218

	jmp     L321E

	jsr     L3227
	lda     $A0
	ldx     #$00
	rts

	jmp     L322A

	jmp     L322D

L8651:  jsr     L3230
	lda     $A0
	ldx     #$00
	rts

L8659:  jsr     L3233
	lda     $A0
	ldx     #$00
	rts

L8661:  jsr     L3236
	lda     $A0
	ldx     $A1
	rts

	jmp     L3239

	jmp     L323C

	jmp     L323F

L8672:  jmp     L3284

L8675:  jmp     L3257

L8678:  jmp     L325A

	jmp     L325D

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

L86A4:  jsr     L3275
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

	jsr     L32A5
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

	jmp     L32C9

	jmp     L32CC

	jmp     L32CF

	jmp     L32D2

	jmp     L32D5

	jmp     L32D8

	.SEGMENT "S_EDIT_LOAD"

	.word	$02E0
	.word	$02E1
	.word	L7040
