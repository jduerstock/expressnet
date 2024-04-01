; da65 V2.18 - Ubuntu 2.19-1
; Created:    2024-03-31 11:54:45
; Input file: netupdt.cmd
; Page:	  1


	.setcpu "6502"

L000A		 := $000A
L2020		 := $2020
L3212		 := $3212
L3218		 := $3218
L322A		 := $322A
L329C		 := $329C
L329F		 := $329F
L4225		 := $4225
L5245		 := $5245
L5525		 := $5525
L6FEC		 := $6FEC
L6FF8		 := $6FF8
L9281		 := $9281
L9291		 := $9291
L929A		 := $929A
LA0FC		 := $A0FC
LC2FC		 := $C2FC
LD8E6		 := $D8E6
LD9AA		 := $D9AA
LE456		 := $E456

	.SEGMENT "S_UPDT_HDR"

	.word	$FFFF
	.word	$7000
	.word	$83ED

	.SEGMENT "S_UPDT_CODE"

	jmp	L8358

	bpl	L700A
	ora	($58,x)
	brk
	.byte	$70,$EE

L700A:  .byte   $83
	.byte   $02
	brk

sub_700D:
	ldx	#$FF
	stx	$A6
	ldy	#$0C
	bne	L701F
L7015:  sty	$A6
	ldy	#$0B
	bne	L701F
L701B:  sty	$A6
	ldy	#$05
L701F:  stx	$A5
	ldx	#$00
	stx	$A3
L7025:  asl	a
	asl	a
	asl	a
	asl	a
	tax
	tya
	sta	$0342,x
	lda	$A3
	beq	L703C
	sta	$034A,x
	lda	$A4
	sta	$034B,x
	lda	#$00
L703C:  tay
	sta	$0349,x
	lda	($A5),y
	sta	$0348,x
	beq	L7059
	clc
	lda	$A5
	adc	#$01
	sta	$0344,x
	lda	$A6
	adc	#$00
	sta	$0345,x
	jmp	LE456

L7059:  rts

L705A:  stx	$A5
	sty	$A6
	ldy	#$03
	jmp	L7025

L7063:  stx	$A5
	sty	$A6
	ldx	#$00
	stx	$A3
	ldy	#$09
	jsr	L7025
	bne	L707C
	lda	#$0B
	sta	$0342,x
	lda	#$9B
	jmp	LE456

L707C:  rts

L707D:  brk
L707E:  .byte   $4C
L707F:  .byte   $81
L7080:  .byte   $70
L7081:  sta	L707D
	jmp	(L000A)

	.byte   $13
	ora	($01),y
	.byte   $83
L708B:  tsx
	stx	$04C1
	ldy	#$80
	tya
	jmp	L707E

	ldy	$84
	beq	L70A3
	stx	$85
L709B:  asl	a
	rol	$85
	dey
	bne	L709B
	ldx	$85
L70A3:  rts

	ldy	$84
	beq	L70B2
	stx	$85
L70AA:  lsr	$85
	ror	a
	dey
	bne	L70AA
	ldx	$85
L70B2:  rts

L70B3:  ldy	$D3
	bpl	L70C7
L70B7:  sta	$86
	stx	$87
	sec
	lda	#$00
	sbc	$86
	tay
	lda	#$00
	sbc	$87
	tax
	tya
L70C7:  rts

L70C8:  stx	$D3
	cpx	#$00
	bpl	L70D1
	jsr	L70B7
L70D1:  sta	$82
	stx	$83
	lda	$85
	bpl	L70E7
	tax
	eor	$D3
	sta	$D3
	lda	$84
	jsr	L70B7
	sta	$84
	stx	$85
L70E7:  lda	#$00
	sta	$87
	rts

L70EC:  beq	L7109
	dex
	stx	$C7
	tax
	beq	L7109
	stx	$C6
	lda	#$00
	ldx	#$08
L70FA:  asl	a
	asl	$C6
	bcc	L7101
	adc	$C7
L7101:  dex
	bne	L70FA
	clc
	adc	$87
	sta	$87
L7109:  lda	$86
	ldx	$87
	rts

L710E:  jsr	L70C8
	ldx	$82
	beq	L7130
	stx	$C6
	ldx	$84
	beq	L7130
	dex
	stx	$C7
	ldx	#$08
L7120:  asl	a
	rol	$87
	asl	$C6
	bcc	L712D
	adc	$C7
	bcc	L712D
	inc	$87
L712D:  dex
	bne	L7120
L7130:  sta	$86
	lda	$82
	ldx	$85
	jsr	L70EC
	lda	$83
	ldx	$84
	jsr	L70EC
	jmp	L70B3

sub_7143:
	jsr	L70C8
	lda	$85
	beq	L7171
	ldx	#$08
L714C:  rol	$82
	rol	$83
	rol	$87
	sec
	lda	$83
	sbc	$84
	tay
	lda	$87
	sbc	$85
	bcc	L7162
	sta	$87
	sty	$83
L7162:  dex
	bne	L714C
	lda	$82
	rol	a
	ldx	#$00
	ldy	$83
	sty	$86
	jmp	L70B3

L7171:  ldx	#$10
L7173:  rol	$82
	rol	$83
	rol	a
	bcs	L717E
	cmp	$84
	bcc	L7181
L717E:  sbc	$84
	sec
L7181:  dex
	bne	L7173
	rol	$82
	rol	$83
	sta	$86
	lda	$82
	ldx	$83
	jmp	L70B3

L7191:  jsr	sub_7143
	lda	$86
	ldx	$87
	rts

	sta	$A0
	stx	$A1
	sty	$A2
	clc
	pla
	sta	$84
	adc	#$03
	tay
	pla
	sta	$85
	adc	#$00
	pha
	tya
	pha
	ldy	#$01
	lda	($84),y
	sta	$82
	iny
	lda	($84),y
	sta	$83
	iny
	lda	($84),y
	tay
L71BD:  lda	$A0,y
	sta	($82),y
	dey
	bpl	L71BD
	lda	$11
	bne	L71D8
	inc	$11
	jmp	L708B

	php
	.byte   $63
	ora	#$11
	ora	$1318,y
	and	($23,x)
	.byte   $33
L71D8:  rts

L71D9:  bpl	L71F1
	cpy	#$88
	beq	L71E7
	tya
	cpy	#$80
	beq	L71F6
	jmp	L707E

L71E7:  txa
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	tax
	tya
	sta	$05C0,x
L71F1:  rts

	ldx	#$01
	stx	$11
L71F6:  pha
	jsr	L708B
	pla
	tay
	rts

sub_71FD:
	pha
	stx	$A1
	sty	$A2
	tay
	lda	#$00
	sta	$05C0,y
	tay
	lda	($A1),y
	sta	$0500
	tay
	iny
	lda	#$9B
	bne	L7216
L7214:  lda	($A1),y
L7216:  sta	$0500,y
	dey
	bne	L7214
	pla
	ldx	#$00
	ldy	#$05
	jsr	L705A
	jmp	L71D9

L7227:  stx	$A1
	tax
	ldy	$A1
	lda	$B7
	jsr	L7063
	jmp	L71D9

sub_7234:
	jsr	sub_700D
	jmp	L71D9

L723A:  stx	$A1
	tax
	ldy	$A1
	lda	$B7
	jsr	L7015
	jmp	L71D9

L7247:  jsr	L701B
	sty	$A0
	lda	$0348,x
	beq	L7254
	sec
	sbc	#$01
L7254:  ldy	#$00
	sta	($A5),y
	ldy	$A0
	rts

	stx	$A2
	tax
	ldy	$A2
	lda	$B7
	pha
	lda	#$FF
	sta	$A3
	pla
	pha
	stx	$A1
	sty	$A2
	ldy	#$00
	lda	$A3
	sta	($A1),y
	pla
	ldy	$A2
L7276:  jsr	L7247
	jmp	L71D9

L727C:  ldx	#$07
L727E:  stx	$A3
	asl	a
	asl	a
	asl	a
	asl	a
	tax
	lda	$A3
	sta	$0342,x
	lda	#$00
	sta	$0348,x
	sta	$0349,x
	tya
	jsr	LE456
	sta	$A0
	jmp	L71D9

L729B:  lda	#$9B
L729D:  tax
	lda	$B7
L72A0:  stx	$A1
	ldy	$A1
L72A4:  ldx	#$0B
	jmp	L727E

L72A9:  ldy	#$9B
	bne	L72A4
L72AD:  jsr	L7025
	jmp	L71D9

L72B3:  sta	$D4
	stx	$D5
	jsr	LD9AA
	jsr	LD8E6
	ldy	#$FF
	ldx	#$00
L72C1:  iny
	inx
	lda	($F3),y
	sta	$0550,x
	bpl	L72C1
	eor	#$80
	sta	$0550,x
	stx	$0550
	rts

	ldx	#$00
L72D5:  jsr	L72B3
	lda	$B7
L72DA:  ldx	#$50
	ldy	#$05
	jsr	L7015
	jmp	L71D9

	ldx	#$00
	jsr	L72D5
	jmp	L729B

	ldy	#$00
L72EE:  sta	$A0
	txa
	sty	$A2
	ldx	$A2
	jsr	L72B3
	lda	$A0
	jmp	L72DA

	ldy	#$00
	jsr	L72EE
	lda	$A0
	jmp	L72A9

L7307:  stx	$A2
	tax
	ldy	$A2
	lda	$B7
L730E:  cpy	#$00
	bpl	L7328
	pha
	stx	$A1
	sty	$A2
	ldy	#$2D
	jsr	L72A4
	sec
	lda	#$00
	sbc	$A1
	tax
	lda	#$00
	sbc	$A2
	tay
	pla
L7328:  jmp	L72EE

	jsr	L7307
	jmp	L729B

	jsr	L730E
	lda	$A0
	jmp	L72A9

	stx	$A2
	sty	$A3
	ldx	#$00
	ldy	$A2
L7341:  sty	$A2
	jsr	L72B3
	iny
L7347:  lda	$0550,y
	sta	($A2),y
	dey
	bpl	L7347
	rts

	cpx	#$00
	bpl	L7341
	sta	$A0
	stx	$A1
	sty	$A2
	sec
	lda	#$00
	sbc	$A0
	tay
	lda	#$00
	sbc	$A1
	tax
	tya
	jsr	L72B3
	inx
	txa
	tay
L736C:  lda	$054F,y
	sta	($A2),y
	dey
	bne	L736C
	txa
	sta	($A2),y
	iny
	lda	#$2D
	sta	($A2),y
	rts

	lda	$B7
	ldx	#$13
	stx	$0550
	ldx	#$50
	ldy	#$05
	jsr	L7276
	lda	#$50
	ldx	#$05
	sta	$A4
	stx	$A5
	ldy	#$00
	sty	$A0
	sty	$A1
	sty	$A2
	lda	($A4),y
	sta	$A3
	inc	$A3
	lda	#$20
	iny
L73A4:  cmp	($A4),y
	bne	L73AD
	iny
	cpy	$A3
	bmi	L73A4
L73AD:  lda	($A4),y
	cmp	#$2D
	bne	L73B6
	sta	$A2
	iny
L73B6:  cpy	$A3
	bpl	L73F0
L73BA:  lda	($A4),y
	cmp	#$30
	bmi	L73F0
	cmp	#$3A
	bpl	L73F0
	sec
	sbc	#$30
	tax
	lda	$A1
	pha
	lda	$A0
	asl	a
	rol	$A1
	asl	a
	rol	$A1
	clc
	adc	$A0
	sta	$A0
	pla
	adc	$A1
	sta	$A1
	asl	$A0
	rol	$A1
	clc
	txa
	adc	$A0
	sta	$A0
	bcc	L73EB
	inc	$A1
L73EB:  iny
	cpy	$A3
	bmi	L73BA
L73F0:  lda	$A2
	beq	L7401
	sec
	lda	#$00
	sbc	$A0
	sta	$A0
	lda	#$00
	sbc	$A1
	sta	$A1
L7401:  rts

L7402:  sta	$A4
	stx	$A5
	lda	#$04
	sta	$A6
	lda	#$24
	jsr	L729D
L740F:  lda	#$00
	ldx	#$04
L7413:  asl	$A4
	rol	$A5
	rol	a
	dex
	bne	L7413
	adc	#$30
	cmp	#$3A
	bmi	L7423
	adc	#$06
L7423:  jsr	L729D
	dec	$A6
	bne	L740F
L742A:  rts

L742B:  sta	$C0
	stx	$C1
	sty	$05F0
	ldy	#$00
	lda	($C0),y
	sta	$C2
	inc	$C2
	ldx	#$0D
L743C:  lda	$A2,x
	sta	$05F0,x
	dex
	bne	L743C
	stx	$8B
	stx	$8A
L7448:  inc	$8A
	ldy	$8A
	cpy	$C2
	bcs	L742A
	lda	($C0),y
	cmp	#$25
	bne	L7465
	inc	$8A
	iny
	lda	($C0),y
	cmp	#$25
	beq	L7465
	cmp	#$45
	bne	L746B
	lda	#$9B
L7465:  jsr	L729D
	jmp	L7448

L746B:  ldy	$8B
	inc	$8B
	inc	$8B
	sta	$A0
	lda	$05F0,y
	ldx	$05F1,y
	ldy	$A0
	cpy	#$43
	beq	L7465
	cpy	#$53
	bne	L7489
	jsr	L723A
	jmp	L7448

L7489:  cpy	#$49
	bne	L7493
	jsr	L7307
	jmp	L7448

L7493:  cpy	#$48
	bne	L749D
	jsr	L7402
	jmp	L7448

L749D:  jsr	L72D5
	jmp	L7448

	stx	$A1
	sty	$A2
	asl	a
	asl	a
	asl	a
	asl	a
	tax
	lda	#$26
	sta	$0342,x
	jsr	LE456
	jsr	L71D9
	ldy	#$00
	lda	$034E,x
	sta	($A3),y
	lda	$034C,x
	sta	($A1),y
	lda	$034D,x
	iny
	sta	($A1),y
	rts

	stx	$A1
	asl	a
	asl	a
	asl	a
	asl	a
	tax
	tya
	sta	$034D,x
	lda	$A1
	sta	$034C,x
	lda	$A3
	sta	$034E,x
	lda	#$25
	sta	$0342,x
	jsr	LE456
	jmp	L71D9

L74EA:
	.byte   $02,"S:"
L74ED:	.word	L74EA
L74EF:
	.byte   $02,"E:"
L74F2:	.word	L74EF
	pha
	lda	#$00
	jsr	sub_7234
	lda	#$0C
	sta	$A3
	lda	#$00
	ldx	L74F2
	ldy	L74F2+1
	jsr	sub_71FD
	lda	#$06
	jsr	sub_7234
	pla
	sta	$A4
	and	#$30
	eor	#$1C
	sta	$A3
	lda	#$06
	ldx	L74ED
	ldy	L74ED+1
	jmp	sub_71FD

L7522:  sta	$5B
	stx	$5C
	sty	$5A
L7528:  sta	$55
	stx	$56
	sty	$54
	rts

L752F:  jsr	L7528
	lda	$02FD
	sta	$02FB
	lda	L74ED
	sta	$A5
	lda	L74ED+1
	sta	$A6
	lda	#$00
	sta	$A3
	sta	$A4
	lda	#$06
	rts

	jsr	L752F
	ldy	#$11
	jmp	L72AD

	jsr	L7522
	lda	#$06
	jmp	L727C

	jsr	L7528
	lda	#$06
	ldx	$02FD
	jmp	L72A0

	cmp	#$05
	bpl	L7580
	sta	$A0
	tya
	and	#$0F
	sta	$A2
	txa
	asl	a
	asl	a
	asl	a
	asl	a
	ora	$A2
	ldx	$A0
	sta	$02C4,x
	sta	$D016,x
L7580:  rts

	jsr	L752F
	ldy	#$12
	jmp	L72AD

	ldx	$D20A
	cmp	#$00
	beq	L7599
	stx	$84
	ldx	#$00
	stx	$85
	jsr	L710E
L7599:  stx	$A0
	rts

	asl	a
	sty	$A2
	tay
	cmp	#$07
	bmi	L75A9
	ldy	#$64
	jsr	L707E
L75A9:  txa
	sta	$D200,y
	lda	$A2
	asl	a
	asl	a
	asl	a
	asl	a
	ora	$A3
	sta	$D201,y
	rts

	lda	$0232
	and	#$EF
	sta	$0232
	sta	$D20F
	lda	#$00
	ldx	#$08
L75C8:  sta	$D200,x
	dex
	bpl	L75C8
	rts

	tax
	lda	$0270,x
	sta	$A0
	rts

	ldx	#$00
	cmp	#$04
	bmi	L75DF
	inx
	and	#$03
L75DF:  tay
	lda	$D300,x
	and	L75E9,y
	sta	$A0
	rts

L75E9:  .byte   $04
	php
	rti

	.byte   $80
	ldx	#$00
	cmp	#$02
	bmi	L75F6
	inx
	and	#$01
L75F6:  tay
	lda	$D300,x
	dey
	bne	L7601
	lsr	a
	lsr	a
	lsr	a
	lsr	a
L7601:  and	#$0F
	sta	$A0
	rts

	tax
	lda	$D010,x
	sta	$A0
	rts

	sta	$A2
	stx	$A3
	ldy	#$00
	lda	($A2),y
	sta	$A0
	iny
	lda	($A2),y
	sta	$A1
	rts

L761D:  sta	$A0
	stx	$A1
	tya
	ldy	#$00
	sta	($A0),y
	rts

	jsr	L761D
	iny
	lda	$A3
	sta	($A0),y
	rts

	pha
	lda	#$00
	sta	$A4
	pla
	sta	$A0
	stx	$A1
	sty	$A2
	ldy	#$00
	lda	$A4
	ldx	$A3
	beq	L7654
L7644:  sta	($A0),y
	iny
	bne	L7644
	inc	$A1
	dec	$A3
	bne	L7644
	beq	L7654
L7651:  sta	($A0),y
	iny
L7654:  cpy	$A2
	bne	L7651
	rts

	sta	$A0
	stx	$A1
	sty	$A2
	ldy	#$00
	lda	$A5
	beq	L767B
L7665:  lda	($A2),y
	sta	($A0),y
	iny
	bne	L7665
	inc	$A1
	inc	$A3
	dec	$A5
	bne	L7665
	beq	L767B
L7676:  lda	($A2),y
	sta	($A0),y
	iny
L767B:  cpy	$A4
	bne	L7676
	rts

	sta	$A4
	stx	$A5
	sty	$A2
	ldy	#$00
	sty	$A0
	sty	$A1
	lda	($A4),y
	cmp	($A2),y
	beq	L7695
	jsr	L76A8
L7695:  cmp	#$00
	bne	L769A
	rts

L769A:  sta	$A6
L769C:  iny
	lda	($A4),y
	cmp	($A2),y
	bne	L76A8
	cpy	$A6
	bcc	L769C
	rts

L76A8:  ldx	#$FF
	stx	$A0
	bcc	L76B1
	lda	($A2),y
	inx
L76B1:  stx	$A1
	rts

	sta	$A0
	stx	$A1
	sty	$A2
	ldy	#$00
	lda	($A2),y
L76BE:  sta	($A0),y
	beq	L76CA
L76C2:  tay
L76C3:  lda	($A2),y
	sta	($A0),y
	dey
	bne	L76C3
L76CA:  rts

	sta	$A0
	stx	$A1
	sty	$A2
	ldy	#$00
	lda	($A2),y
	cmp	$A5
	bcs	L76DB
	sta	$A5
L76DB:  dec	$A4
	clc
	lda	$A2
	adc	$A4
	sta	$A2
	bcc	L76E8
	inc	$A3
L76E8:  sec
	lda	$A5
	sbc	$A4
	bcs	L76F1
	lda	#$00
L76F1:  jmp	L76BE

	sta	$A0
	stx	$A1
	sty	$A2
	ldy	#$00
L76FC:  lda	($A2),y
	beq	L770D
	sta	$A6
	dec	$A4
	sec
	lda	$A5
	sbc	$A4
	beq	L770D
	bcs	L770E
L770D:  rts

L770E:  tax
	cmp	$A6
	bcc	L771B
	clc
	lda	$A6
	tax
	adc	$A4
	sta	$A5
L771B:  lda	$A5
	cmp	($A0),y
	bcc	L7724
	sta	($A0),y
	clc
L7724:  lda	$A0
	adc	$A4
	sta	$A0
	bcc	L772E
	inc	$A1
L772E:  txa
	jmp	L76C2

L7732:  brk
	brk
	brk
	brk
	brk
L7737:  brk
	dey
	and	$02A0,y
L773C:  .byte   $09
L773D:  .byte   $70
L773E:  brk
L773F:  .byte   $A0
L7740:  .byte   $1D
L7741:  .byte   $A0
L7742:  clc
L7743:  .byte   $A1
L7744:  .byte   $13
L7745:  .byte   $A2
L7746:  .byte   $0E
L7747:  .byte   $A3
L7748:  .byte   $09
L7749:  .byte   $A4
L774A:  .byte   $04
L774B:  .byte   $A5
L774C:  .byte   $FF
L774D:  .byte   $A5
L774E:  .byte   $FA
L774F:  .byte   $A6
L7750:  .byte   $F5
L7751:  .byte   $A7
L7752:  .byte   $F0
L7753:  tay
	.byte   $EB
	lda	#$01
	tax
L7758:  brk
L7759:  .byte   $AB
L775A:  .byte   $96
L775B:  .byte   $AB
	brk
	ora	($96,x)
	ldy	$0898
	.byte   $2E
	.byte   $B5
L7764:  brk
	.byte   $4C
L7766:  pla
L7767:  .byte   $77
L7768:  sta	L7764
	lda	L7764
	sta	L7732
	rts

L7772:  brk
L7773:  brk
L7774:  jmp	L7777

L7777:  stx	L7773
	sta	L7772
	lda	#$01
	jsr	sub_7234
	lda	#$04
	jsr	sub_7234
	lda	#$06
	jsr	sub_7234
	ldx	L7773
	lda	L7772
	jsr	L7227
	ldx	L773C
	txs
	rts

	rts

L779B:  brk
L779C:  brk
L779D:  brk
L779E:  jmp	L77A1

L77A1:  stx	L779C
	sta	L779B
	lda	$AB60
	eor	L779B
	bne	L77B5
	ora	$AB61
	eor	L779C
L77B5:  beq	L77BA
	jmp	L77BF

L77BA:  lda	#$01
	sta	$A0
	rts

L77BF:  ldy	#$00
	sty	L779D
L77C4:  lda	#$7F
	cmp	L779D
	bcs	L77CE
	jmp	L7828

L77CE:  lda	L779D
	asl	a
	php
	clc
	adc	L775A
	sta	$AE
	lda	#$00
	rol	a
	plp
	adc	L775B
	sta	$AF
	ldy	#$00
	lda	($AE),y
	iny
	ora	($AE),y
	beq	L77EE
	jmp	L77F6

L77EE:  lda	#$00
	sta	$A0
	rts

	jmp	L7822

L77F6:  lda	L779D
	asl	a
	php
	clc
	adc	L775A
	sta	$AE
	lda	#$00
	rol	a
	plp
	adc	L775B
	sta	$AF
	dey
	lda	($AE),y
	eor	L779B
	bne	L7818
	iny
	ora	($AE),y
	eor	L779C
L7818:  beq	L781D
	jmp	L7822

L781D:  lda	#$01
	sta	$A0
	rts

L7822:  inc	L779D
	jmp	L77C4

L7828:  lda	#$00
	sta	$A0
	rts

L782D:  brk
L782E:  brk
L782F:  brk
L7830:  jmp	L7833

L7833:  stx	L782E
	sta	L782D
	ldy	#$00
	sty	L782F
L783E:  lda	#$7F
	cmp	L782F
	.byte   $B0
L7844:  .byte   $03
	jmp	L788E

L7848:  lda	L782F
	asl	a
	php
	clc
	adc	L775A
	sta	$AE
	lda	#$00
	rol	a
	plp
	adc	L775B
	sta	$AF
	ldy	#$00
	lda	($AE),y
	iny
	ora	($AE),y
	beq	L7868
	jmp	L7888

L7868:  lda	L782F
	asl	a
	php
	clc
	adc	L775A
	sta	$AE
	lda	#$00
	rol	a
	plp
	adc	L775B
	sta	$AF
	lda	L782E
	sta	($AE),y
	lda	L782D
	dey
	sta	($AE),y
	rts

L7888:  inc	L782F
	jmp	L783E

L788E:  lda	#$7F
	asl	a
	php
	clc
	adc	L775A
	sta	$AE
	lda	#$00
	rol	a
	plp
	adc	L775B
	sta	$AF
	lda	L782E
	ldy	#$01
	sta	($AE),y
	lda	L782D
	dey
	sta	($AE),y
	rts

L78AF:  brk
	brk
	brk
L78B2:  brk
L78B3:  brk
L78B4:  brk
L78B5:  brk
L78B6:  brk
L78B7:  jmp	L78BA

L78BA:  sta	L78AF
	ldy	#$00
	sty	L78B4
	lda	#$0A
	sta	L78B3
	iny
	sty	L78B2
	sec
	lda	L78AF
	sbc	#$01
	sta	L78DF
L78D4:  lda	L78DF
	cmp	L78B2
	bcs	L78E0
	jmp	L78F8

L78DF:  brk
L78E0:  clc
	lda	L78B3
	adc	$A015
	sta	L78B3
	lda	L78B4
	adc	#$00
	sta	L78B4
	inc	L78B2
	jmp	L78D4

L78F8:  lda	#$25
	sta	$0382
	ldy	#$00
	sty	$038C
	lda	L78B3
	and	#$FF
	sta	$038D
	lda	#$01
	sta	$85
	lda	#$00
	sta	$84
	lda	L78B4
	tax
	lda	L78B3
	jsr	sub_7143
	sta	$038E
	ldx	#$40
	lda	#$00
	jsr	LE456
	lda	#$7F
	cmp	$0383
	bcc	L7930
	jmp	L7940

L7930:  jmp	L7939

	ora	$50
	.byte   $4F
	eor	#$4E
	.byte   $54
L7939:  ldx	#$79
	lda	#$33
	jsr	L7774
L7940:  inc	$A019
	clc
	lda	L7744
	adc	$A019
	sta	$AE
	lda	L7745
	adc	#$00
	sta	$AF
	lda	$375F
	and	#$FF
	ldy	#$00
	sta	($AE),y
	clc
	lda	L7746
	adc	$A019
	sta	$AE
	lda	L7747
	adc	#$00
	sta	$AF
	lda	#$01
	sta	$85
	lda	#$00
	sta	$84
	lda	$3760
	tax
	lda	$375F
	jsr	sub_7143
	ldy	#$00
	sta	($AE),y
	sec
	lda	L773D
	sbc	#$01
	sta	$AE
	lda	$375F
	and	#$FF
	ldx	$AE
	sta	$3F67,x
	sec
	lda	L773D
	sbc	#$01
	sta	$AE
	lda	#$01
	sta	$85
	lda	#$00
	sta	$84
	lda	$3760
	tax
	lda	$375F
	jsr	sub_7143
	ldx	$AE
	sta	$3F87,x
	inc	$375F
	bne	L79BB
	inc	$3760
L79BB:  clc
	lda	L7740
	adc	$A019
	sta	$AE
	lda	L7741
	adc	#$00
	sta	$AF
	lda	L78AF
	ldy	#$00
	sta	($AE),y
	clc
	lda	L774C
	adc	$A019
	sta	$AE
	lda	L774D
	adc	#$00
	sta	$AF
	lda	#$00
	sta	($AE),y
	clc
	lda	L774E
	adc	$A019
	sta	$AE
	lda	L774F
	adc	#$00
	sta	$AF
	lda	#$00
	sta	($AE),y
	clc
	lda	L7748
	adc	$A019
	sta	$AE
	lda	L7749
	adc	#$00
	sta	$AF
	lda	#$00
	sta	($AE),y
	clc
	lda	L774A
	adc	$A019
	sta	$AE
	lda	L774B
	adc	#$00
	sta	$AF
	lda	#$00
	sta	($AE),y
	clc
	lda	L7750
	adc	$A019
	sta	$AE
	lda	L7751
	adc	#$00
	sta	$AF
	lda	#$00
	sta	($AE),y
	clc
	lda	L7752
	adc	$A019
	sta	$AE
	lda	L7753
	adc	#$00
	sta	$AF
	lda	#$00
	sta	($AE),y
	clc
	lda	L7742
	adc	$A019
	sta	$AE
	lda	L7743
	adc	#$00
	sta	$AF
	lda	#$00
	sta	($AE),y
	inc	$A01A
	bne	L7A66
	inc	$A01B
L7A66:  lda	#$01
	sta	$85
	lda	#$00
	sta	$84
	lda	$A015
	ldx	#$00
	jsr	L710E
	sta	$A3
	txa
	sta	$A4
	ldy	L7759
	ldx	L7758
	lda	#$04
	jsr	L329F
	lda	#$00
	sta	L78B6
	lda	$A0
	sta	L78B5
	lda	#$7F
	cmp	L78B5
	lda	#$00
	sbc	L78B6
	bcc	L7A9F
	jmp	L7AD3

L7A9F:  jmp	L7AB4

	.byte	$11,"WRITE ERROR: %U%E"

L7AB4:  lda	L78B6
	sta	$A3
	ldy	L78B5
	ldx	#$7A
	lda	#$A2
	jsr	L742B
	jmp	L7ACC

	ora	$57
	.byte   $52
	eor	#$54
	.byte   $45
L7ACC:  ldx	#$7A
	lda	#$C6
	jsr	L7774
L7AD3:  lda	#$25
	sta	$0382
	ldy	#$00
	sty	$038C
	sty	$038D
	sty	$038E
	ldx	#$40
	lda	#$00
	jsr	LE456
	lda	#$7F
	cmp	$0383
	bcc	L7AF4
	jmp	L7B04

L7AF4:  jmp	L7AFD

	ora	$50
	.byte   $4F
	eor	#$4E
	.byte   $54
L7AFD:  ldx	#$7A
	lda	#$F7
	jsr	L7774
L7B04:  lda	#$0A
	sta	$A4
	lda	#$00
	sta	$A3
	ldy	L773F
	ldx	L773E
	lda	#$04
	jsr	L329F
	lda	#$00
	sta	L78B6
	lda	$A0
	sta	L78B5
	lda	#$7F
	cmp	L78B5
	lda	#$00
	sbc	L78B6
	bcc	L7B30
	jmp	L7B64

L7B30:  jmp	L7B45

	ora	($49),y
	lsr	$4544
	cli
	jsr	L5245
	.byte   $52
	.byte   $4F
	.byte   $52
	.byte   $3A
	jsr	L5525
	and	$45
L7B45:  lda	L78B6
	sta	$A3
	ldy	L78B5
	ldx	#$7B
	lda	#$33
	jsr	L742B
	jmp	L7B5D

	ora	$49
	lsr	$4544
	cli
L7B5D:  ldx	#$7B
	lda	#$57
	jsr	L7774
L7B64:  rts

L7B65:  brk
L7B66:  jmp	L7B69

L7B69:  ldy	#$01
	sty	L7B65
	lda	$A019
	sta	L7B7F
L7B74:  lda	L7B7F
	cmp	L7B65
	bcs	L7B80
	jmp	L7BAB

L7B7F:  brk
L7B80:  clc
	lda	L7742
	adc	L7B65
	sta	$AE
	lda	L7743
	adc	#$00
	sta	$AF
	ldy	#$00
	lda	($AE),y
	and	#$01
	sta	$AC
	lda	$AC
	beq	L7B9F
	jmp	L7BA5

L7B9F:  lda	L7B65
	sta	$A0
	rts

L7BA5:  inc	L7B65
	jmp	L7B74

L7BAB:  lda	#$01
	sta	$A0
	rts

L7BB0:  brk
L7BB1:  brk
L7BB2:  brk
L7BB3:  brk
L7BB4:  jmp	L7BB7

L7BB7:  sta	L7BB0
	lda	L7BB0
	cmp	$A019
	bcc	L7BC5
	jmp	L7DC2

L7BC5:  clc
	lda	L7744
	adc	L7BB0
	sta	$AE
	lda	L7745
	adc	#$00
	sta	$AF
	ldy	#$00
	lda	($AE),y
	sta	L7BB2
	clc
	lda	L7746
	adc	L7BB0
	sta	$AE
	lda	L7747
	adc	#$00
	sta	$AF
	lda	($AE),y
	sta	L7BB3
	clc
	lda	L7BB0
	adc	#$01
	sta	L7BB1
	lda	$A019
	sta	L7C0B
L7C00:  lda	L7C0B
	cmp	L7BB1
	bcs	L7C0C
	jmp	L7DC2

L7C0B:  brk
L7C0C:  sec
	lda	L7BB1
	sbc	#$01
	sta	$AE
	clc
	lda	L7740
	adc	$AE
	sta	$AC
	lda	L7741
	adc	#$00
	sta	$AD
	clc
	lda	L7740
	adc	L7BB1
	sta	$AE
	lda	L7741
	adc	#$00
	sta	$AF
	ldy	#$00
	lda	($AE),y
	sta	($AC),y
	sec
	lda	L7BB1
	sbc	#$01
	sta	$AE
	clc
	lda	L7742
	adc	$AE
	sta	$AC
	lda	L7743
	adc	#$00
	sta	$AD
	clc
	lda	L7742
	adc	L7BB1
	sta	$AE
	lda	L7743
	adc	#$00
	sta	$AF
	lda	($AE),y
	sta	($AC),y
	sec
	lda	L7BB1
	sbc	#$01
	sta	$AE
	clc
	lda	L7744
	adc	$AE
	sta	$AC
	lda	L7745
	adc	#$00
	sta	$AD
	clc
	lda	L7744
	adc	L7BB1
	sta	$AE
	lda	L7745
	adc	#$00
	sta	$AF
	lda	($AE),y
	sta	($AC),y
	sec
	lda	L7BB1
	sbc	#$01
	sta	$AE
	clc
	lda	L7746
	adc	$AE
	sta	$AC
	lda	L7747
	adc	#$00
	sta	$AD
	clc
	lda	L7746
	adc	L7BB1
	sta	$AE
	lda	L7747
	adc	#$00
	sta	$AF
	lda	($AE),y
	sta	($AC),y
	sec
	lda	L7BB1
	sbc	#$01
	sta	$AE
	clc
	lda	L7748
	adc	$AE
	sta	$AC
	lda	L7749
	adc	#$00
	sta	$AD
	clc
	lda	L7748
	adc	L7BB1
	sta	$AE
	lda	L7749
	adc	#$00
	sta	$AF
	lda	($AE),y
	sta	($AC),y
	sec
	lda	L7BB1
	sbc	#$01
	sta	$AE
	clc
	lda	L774A
	adc	$AE
	sta	$AC
	lda	L774B
	adc	#$00
	sta	$AD
	clc
	lda	L774A
	adc	L7BB1
	sta	$AE
	lda	L774B
	adc	#$00
	sta	$AF
	lda	($AE),y
	sta	($AC),y
	sec
	lda	L7BB1
	sbc	#$01
	sta	$AE
	clc
	lda	L774C
	adc	$AE
	sta	$AC
	lda	L774D
	adc	#$00
	sta	$AD
	clc
	lda	L774C
	adc	L7BB1
	sta	$AE
	lda	L774D
	adc	#$00
	sta	$AF
	lda	($AE),y
	sta	($AC),y
	sec
	lda	L7BB1
	sbc	#$01
	sta	$AE
	clc
	lda	L774E
	adc	$AE
	sta	$AC
	lda	L774F
	adc	#$00
	sta	$AD
	clc
	lda	L774E
	adc	L7BB1
	sta	$AE
	lda	L774F
	adc	#$00
	sta	$AF
	lda	($AE),y
	sta	($AC),y
	sec
	lda	L7BB1
	sbc	#$01
	sta	$AE
	clc
	lda	L7750
	adc	$AE
	sta	$AC
	lda	L7751
	adc	#$00
	sta	$AD
	clc
	lda	L7750
	adc	L7BB1
	sta	$AE
	lda	L7751
	adc	#$00
	sta	$AF
	lda	($AE),y
	sta	($AC),y
	sec
	lda	L7BB1
	sbc	#$01
	sta	$AE
	clc
	lda	L7752
	adc	$AE
	sta	$AC
	lda	L7753
	adc	#$00
	sta	$AD
	clc
	lda	L7752
	adc	L7BB1
	sta	$AE
	lda	L7753
	adc	#$00
	sta	$AF
	lda	($AE),y
	sta	($AC),y
	inc	L7BB1
	jmp	L7C00

L7DC2:  sec
	lda	$A019
	sbc	#$01
	sta	$A019
	ldy	#$01
	sty	L7BB1
	lda	$A019
	sta	L7DE1
L7DD6:  lda	L7DE1
	cmp	L7BB1
	bcs	L7DE2
	jmp	L7E48

L7DE1:  brk
L7DE2:  clc
	lda	L7750
	adc	L7BB1
	sta	$AE
	lda	L7751
	adc	#$00
	sta	$AF
	ldy	#$00
	lda	($AE),y
	eor	L7BB2
	beq	L7DFE
	jmp	L7E42

L7DFE:  clc
	lda	L7752
	adc	L7BB1
	sta	$AE
	lda	L7753
	adc	#$00
	sta	$AF
	lda	($AE),y
	eor	L7BB3
	beq	L7E18
	jmp	L7E42

L7E18:  clc
	lda	L7750
	adc	L7BB1
	sta	$AE
	lda	L7751
	adc	#$00
	sta	$AF
	lda	#$00
	ldy	#$00
	sta	($AE),y
	clc
	lda	L7752
	adc	L7BB1
	sta	$AE
	lda	L7753
	adc	#$00
	sta	$AF
	lda	#$00
	sta	($AE),y
L7E42:  inc	L7BB1
	jmp	L7DD6

L7E48:  rts

L7E49:  brk
L7E4A:  brk
L7E4B:  brk
L7E4C:  jmp	L7E4F

L7E4F:  ldy	#$00
	sty	L7E49
L7E54:  inc	L7E49
	ldy	#$00
	sty	L7E4A
	sty	L7E4B
L7E5F:  inc	L7E4A
	clc
	lda	L7740
	adc	L7E4A
	sta	$AE
	lda	L7741
	adc	#$00
	sta	$AF
	ldy	#$00
	lda	($AE),y
	eor	L7E49
	beq	L7E7E
	jmp	L7E82

L7E7E:  iny
	sty	L7E4B
L7E82:  lda	L7E4B
	eor	#$01
	beq	L7E94
	lda	L7E4A
	cmp	$A019
	bcs	L7E94
	jmp	L7E5F

L7E94:  lda	L7E4B
	beq	L7E9C
	jmp	L7EA2

L7E9C:  lda	L7E49
	sta	$A0
	rts

L7EA2:  lda	L7E49
	cmp	$A018
	bcs	L7EAD
	jmp	L7E54

L7EAD:  lda	#$00
	sta	$A0
	rts

	brk
L7EB3:  brk
L7EB4:  brk
	brk
	brk
L7EB7:  jmp	L7EBA

L7EBA:  ldx	$3C7D
	lda	$3C7C
	jsr	L779E
	lda	$A0
	bne	L7ECA
	jmp	L7ECE

L7ECA:  rts

	jmp	L7ED7

L7ECE:  ldx	$3C7D
	lda	$3C7C
	jsr	L7830
L7ED7:  lda	$A019
	cmp	$A018
	bcs	L7EE2
	jmp	L7EF0

L7EE2:  jsr	L7B66
	lda	$A0
	sta	L7EB4
	lda	L7EB4
	jsr	L7BB4
L7EF0:  jsr	L7E4C
	lda	$A0
	sta	L7EB3
	lda	#$00
	cmp	L7EB3
	bcc	L7F02
	jmp	L7F3F

L7F02:  jmp	L7F22

	.byte   $1C
	.byte   $9C
	jsr	L2020
	jsr	L2020
	jsr	L2020
	jsr	L2020
	.byte   $42
	adc	($73,x)
	adc	$20
	and	$42
	.byte   $2F
	eor	$6773
	jsr	L4225
	.byte   $20
L7F22:  lda	#$00
	sta	$A3
	lda	#$00
	sta	$A5
	lda	L7EB3
	sta	$A4
	ldy	L773D
	ldx	#$7F
	lda	#$05
	jsr	L742B
	lda	L7EB3
	jsr	L78B7
L7F3F:  rts

L7F40:  brk
	.byte   $19
	.byte   $44
L7F43:  sei
	.byte   $3A
	rol	$5250,x
	.byte   $4F
	rol	$4142,x
	.byte   $53
	eor	$53
	rol	$4142,x
	.byte   $53
	eor	$5F
L7F55:  sei
L7F56:  sei
	rol	$4144
	.byte   $54
L7F5B:  brk
L7F5C:  brk
L7F5D:  jmp	L7F60

L7F60:  sta	L7F40
	lda	L7737
	eor	L7F40
	beq	L7F6E
	jmp	L7F73

L7F6E:  lda	#$01
	sta	$A0
	rts

L7F73:  sec
	lda	L7F40
	sbc	#$01
	sta	$AE
	ldx	$AE
	lda	$37A3,x
	sta	L7F43
	lda	#$00
	sta	$85
	lda	#$0A
	sta	$84
	lda	L7F40
	ldx	#$00
	jsr	sub_7143
	sta	$AE
	clc
	lda	$AE
	adc	#$30
	sta	L7F55
	lda	#$00
	sta	$85
	lda	#$0A
	sta	$84
	lda	L7F40
	ldx	#$00
	jsr	L7191
	sta	$AE
	clc
	lda	$AE
	adc	#$30
	sta	L7F56
	lda	#$04
	jsr	sub_7234
	ldy	#$00
	sty	L7732
	lda	#$0C
	sta	$A3
	lda	#$00
	sta	$A4
	ldy	#$7F
	ldx	#$41
	lda	#$04
	jsr	sub_71FD
	lda	#$00
	cmp	L7732
	bcc	L7FDC
	jmp	L7FE1

L7FDC:  lda	#$00
	sta	$A0
	rts

L7FE1:  lda	#$0A
	sta	$A4
	lda	#$00
	sta	$A3
	ldy	L773F
	ldx	L773E
	lda	#$04
	jsr	L329C
	lda	$A1
	sta	L7F5C
	lda	$A0
	sta	L7F5B
	lda	L7F5B
	eor	#$00
	bne	L800A
	ora	L7F5C
	eor	#$0A
L800A:  bne	L800F
	jmp	L8014

L800F:  lda	#$00
	sta	$A0
	rts

L8014:  lda	L7F40
	sta	L773D
	lda	L7F40
	sta	L7737
	lda	#$01
	sta	$A0
	rts

	.byte   $1C
	.byte   $44
L8027:  sei
	.byte   $3A
	rol	$5250,x
	.byte   $4F
	rol	$454E,x
	.byte   $54
	.byte   $57
	.byte   $4F
	.byte   $52
	.byte   $4B
	rol	$4E49,x
	.byte   $43
	.byte   $4F
	eor	$4E49
	.byte   $47
	rol	$4144
	.byte   $54
L8042:  brk
L8043:  brk
L8044:  brk
L8045:  brk
L8046:  brk
L8047:  brk
L8048:  brk
L8049:  brk
L804A:  brk
L804B:  brk
L804C:  brk
L804D:  brk
L804E:  brk
L804F:  jmp	L8052

L8052:  lda	#$02
	jsr	sub_7234
	ldy	#$00
	sty	L7732
	lda	$3EEF
	sta	L8027
	lda	#$04
	sta	$A3
	lda	#$00
	sta	$A4
	ldy	#$80
	ldx	#$25
	lda	#$02
	jsr	sub_71FD
	lda	#$00
	cmp	L7732
	bcc	L807D
	jmp	L807E

L807D:  rts

L807E:  lda	#$02
	jsr	L727C
	lda	$A0
	sta	L804C
	lda	#$00
	cmp	$05C2
	bcc	L8092
	jmp	L8095

L8092:  jmp	L817B

L8095:  lda	#$02
	jsr	L727C
	lda	$A0
	sta	L8042
	lda	#$02
	jsr	L727C
	lda	$A0
	sta	L8043
	lda	#$00
	sta	$85
	lda	L8043
	sta	$84
	lda	#$01
	tax
	lda	#$00
	jsr	L710E
	sta	$AE
	txa
	sta	$AF
	clc
	lda	L8042
	adc	$AE
	sta	L8046
	lda	#$00
	adc	$AF
	sta	L8047
	lda	#$00
	cmp	$05C2
	bcc	L80D9
	jmp	L80DC

L80D9:  jmp	L817B

L80DC:  lda	#$02
	jsr	L727C
	lda	$A0
	sta	L804D
	lda	L8047
	sta	$A4
	lda	L8046
	sta	$A3
	ldy	L7759
	ldx	L7758
	lda	#$02
	jsr	L329C
	lda	$A1
	sta	L8045
	lda	$A0
	sta	L8044
	lda	L8044
	eor	L8046
	bne	L8113
	ora	L8045
	eor	L8047
L8113:  bne	L8118
	jmp	L811B

L8118:  jmp	L817B

L811B:  lda	L804D
	sta	L804E
	lda	$3EF5
	eor	#$C1
	beq	L812B
	jmp	L8134

L812B:  ldx	L804D
	lda	$404F,x
	sta	L804E
L8134:  lda	L804E
	jsr	L7F5D
	lda	$A0
	bne	L8141
	jmp	L8178

L8141:  lda	L8047
	sta	L8049
	lda	L8046
	sta	L8048
	lda	#$01
	sta	$85
	lda	#$00
	sta	$84
	lda	$A015
	ldx	#$00
	jsr	L710E
	sta	L804A
	txa
	sta	L804B
	lda	L804A
	cmp	L8048
	lda	L804B
	sbc	L8049
	bcs	L8175
	jmp	L8178

L8175:  jsr	L7EB7
L8178:  jmp	L807E

L817B:  lda	#$02
	jsr	sub_7234
	rts

L8181:  jmp	L8184

L8184:  lda	#$7D
	jsr	L729D
	jsr	L729B
	jsr	L729B
	jsr	L729B
	jsr	L729B
	jsr	L729B
	jsr	L729B
	jsr	L729B
	jmp	L81C4

	.byte   $22
	jsr	L2020
	jsr	L2020
	jsr	L9291
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $85
L81C4:  ldx	#$81
	lda	#$A1
	jsr	L7227
	jmp	L81F1

	.byte   $22
	.byte   $20
	.byte   $20
L81D1:  jsr	L2020
	jsr	$FC20
	.byte   $C2
L81D8:  .byte   $C2
	.byte   $D3
	ldy	#$C5
	sed
	beq	L81D1
	sbc	$F3
	.byte   $F3
	lda	($A0,x)
	bne	L81D8
	.byte   $EF
	inc	$E5
	.byte   $F3
	.byte   $F3
	sbc	#$EF
	inc	$ECE1
	.byte   $FC
L81F1:  ldx	#$81
	lda	#$CE
	jsr	L7227
	jmp	L821E

	.byte   $22
	jsr	L2020
	jsr	L2020
	jsr	L9281
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $84
L821E:  ldx	#$81
	lda	#$FB
	jsr	L7227
	jmp	L824B

	.byte   $22
	jsr	L2020
L822C:  jsr	L2020
	jsr	LA0FC
	ldy	#$A0
	ldy	#$A0
	cmp	$F8
	beq	L822C
	sbc	$F3
	.byte   $F3
	dec	$D4C5
	ldy	#$A8
	.byte   $F4
	sbc	$A0A9
	ldy	#$A0
	ldy	#$A0
	.byte   $FC
L824B:  ldx	#$82
	lda	#$28
	jsr	L7227
	jmp	L8278

	.byte   $22
	jsr	L2020
	jsr	L2020
	jsr	LA0FC
	ldy	#$A0
	ldy	#$A0
	ldy	#$A0
	ldy	#$A0
	ldy	#$A0
	ldy	#$A0
	ldy	#$A0
	ldy	#$A0
	ldy	#$A0
	ldy	#$A0
	ldy	#$A0
	ldy	#$A0
	.byte   $FC
L8278:  ldx	#$82
	lda	#$55
	jsr	L7227
	jmp	L82A5

	.byte   $22
	jsr	L2020
	jsr	L2020
	jsr	LA0FC
	cpy	$E7EF
	.byte   $E7
	sbc	#$EE
	.byte   $E7
	ldy	#$E9
	inc	$EFE3
	sbc	$EEE9
	.byte   $E7
	ldy	#$F0
	sbc	($E3,x)
	.byte   $EB
	sbc	$F4
	ldy	#$FC
L82A5:  ldx	#$82
	lda	#$82
	jsr	L7227
	jmp	L82D2

	.byte   $22
	jsr	L2020
	jsr	L2020
	jsr	LA0FC
	.byte   $F4
	.byte   $EF
	ldy	#$EC
	.byte   $EF
	.byte   $E3
	sbc	($EC,x)
	ldy	#$ED
	sbc	$F3
	.byte   $F3
	sbc	($E7,x)
	sbc	$A0
	.byte   $E2
	sbc	($F3,x)
	sbc	$F3
	ldx	$FCAE
L82D2:  ldx	#$82
	lda	#$AF
	jsr	L7227
	jmp	L82FF

	.byte   $22
	jsr	L2020
	jsr	L2020
	jsr	L929A
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $92
	.byte   $83
L82FF:  ldx	#$82
	lda	#$DC
	jsr	L7227
	jsr	L729B
	jsr	L729B
	jsr	L729B
	rts

L8311:
	.byte   $1D,"Dx:>PRO>NETWORK>INCOMING.DAT"

	brk

L832E:  jmp	L8331

L8331:  lda	$3EEF
	sta	L8311+2
	jsr	L3212
	lda	#$00
	sta	$A3
	lda	#$00
	sta	$A4
	lda	#$83
	sta	$A6
	lda	#$10
	sta	$A5
	ldy	#$21
	ldx	#$00
	lda	#$02
	jsr	L72AD
	jsr	L3218
	rts

L8357:  brk
L8358:  jmp	L835B

L835B:  lda	L7767
	sta	L7080
	lda	L7766
	sta	L707F
	tsx
	stx	L773C
	jsr	L3212
	ldy	#$00
	sty	L7737
	lda	$404F
	eor	#$20
	bne	L837D
	jmp	L839F

L837D:  iny
	sty	L8357
L8381:  lda	#$20
	cmp	L8357
	bcs	L838B
	jmp	L839A

L838B:  lda	L8357
	ldx	L8357
	sta	$404F,x
	inc	L8357
	jmp	L8381

L839A:  lda	#$20
	sta	$404F
L839F:  lda	#$00
	cmp	$3EEF
	bcc	L83A9
	jmp	L83C1

L83A9:  lda	#$00
	cmp	$3C7C
	lda	#$00
	sbc	$3C7D
	bcc	L83B8
	jmp	L83C1

L83B8:  jsr	L8181
	jsr	L804F
	jsr	L832E
L83C1:  lda	#$01
	jsr	sub_7234
	lda	#$04
	jsr	sub_7234
	lda	#$06
	jsr	sub_7234
	lda	$3EF5
	eor	#$C1
	beq	L83DA
	jmp	L83EC

L83DA:  jmp	L83E5

	.byte   $07
	lsr	$5445
	.byte   $43
	eor	($4C,x)
	.byte   $4C
L83E5:  ldx	#$83
	lda	#$DD
	jsr	L322A
L83EC:  rts

	rts

	.SEGMENT "S_UPDT_LOAD"

	.word	$02E2
	.word	$02E3
	.word	$8358

