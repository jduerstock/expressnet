
sub_700D:
	ldx	#$FF
	stx	$A6
	ldy	#$0C
	bne	L701F

sub_7015:
	sty	$A6
	ldy	#$0B
	bne	L701F
L701B:  sty	$A6
	ldy	#$05
L701F:  stx	$A5
	ldx	#$00
	stx	$A3

sub_7025:
	asl	a
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
	jmp	CIOV

L7059:  rts

L705A:  stx	$A5
	sty	$A6
	ldy	#$03 ; OPEN
	jmp	sub_7025

sub_7063:
	stx	$A5
	sty	$A6
	ldx	#$00
	stx	$A3
	ldy	#$09 ; put text line
	jsr	sub_7025
	bne	:+
	lda	#$0B
	sta	$0342,x
	lda	#$9B
	jmp	CIOV

:	rts

L707D:  brk
L707E:  jmp	L7081

L7081:  sta	L707D
	jmp	(L000A)

	.byte   $13
	ora	($01),y
	.byte   $83

sub_708B:
	tsx
	stx	$04C1
	ldy	#$80
	tya
	jmp	L707E

	ldy	$84
	beq	L70A3
	stx	$85
:	asl	a
	rol	$85
	dey
	bne	:-
	ldx	$85
L70A3:  rts

L70A4:  ldy	$84
	beq	L70B2
	stx	$85
:	lsr	$85
	ror	a
	dey
	bne	:-
	ldx	$85
L70B2:  rts

L70B3:  ldy	$D3
	bpl	L70C7

sub_70B7:
	sta	$86
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

sub_70C8:
	stx	$D3
	cpx	#$00
	bpl	L70D1
	jsr	sub_70B7
L70D1:  sta	$82
	stx	$83
	lda	$85
	bpl	L70E7
	tax
	eor	$D3
	sta	$D3
	lda	$84
	jsr	sub_70B7
	sta	$84
	stx	$85
L70E7:  lda	#$00
	sta	$87
	rts

sub_70EC:  
	beq	L7109
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

L710E:  jsr	sub_70C8
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
	bcc	:+
	adc	$C7
	bcc	:+
	inc	$87
:	dex
	bne	L7120
L7130:  sta	$86
	lda	$82
	ldx	$85
	jsr	sub_70EC
	lda	$83
	ldx	$84
	jsr	sub_70EC
	jmp	L70B3

sub_7143:
	jsr	sub_70C8
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
	bcc	:+
	sta	$87
	sty	$83
:	dex
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
	jmp	sub_708B

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
	jsr	sub_708B
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

sub_7227:
	stx	$A1
	tax
	ldy	$A1
	lda	$B7
	jsr	sub_7063
	jmp	L71D9

sub_7234:
	jsr	sub_700D
	jmp	L71D9

L723A:  stx	$A1
	tax
	ldy	$A1
	lda	$B7
	jsr	sub_7015
	jmp	L71D9

L7247:  jsr	L701B
	sty	$A0
	lda	$0348,x
	beq	:+
	sec
	sbc	#$01
:	ldy	#$00
	sta	($A5),y
	ldy	$A0
	rts

	stx	$A2
	tax
	ldy	$A2
	lda	$B7
L7262:  pha
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
	jsr	CIOV
	sta	$A0
	jmp	L71D9

sub_729B:
	lda	#$9B

sub_729D:
	tax
	lda	$B7

sub_72A0:
	stx	$A1
	ldy	$A1
L72A4:  ldx	#$0B
	jmp	L727E

L72A9:  ldy	#$9B
	bne	L72A4
sub_72AD:
	jsr	sub_7025
	jmp	L71D9

L72B3:  sta	$D4
	stx	$D5
	jsr	IFP
	jsr	FASC
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

sub_72D5:
	jsr	L72B3
	lda	$B7
L72DA:  ldx	#$50
	ldy	#$05
	jsr	sub_7015
	jmp	L71D9

	ldx	#$00
	jsr	sub_72D5
	jmp	sub_729B

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
	jmp	sub_729B

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

sub_738F:
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
	jsr	sub_729D
L740F:  lda	#$00
	ldx	#$04
L7413:  asl	$A4
	rol	$A5
	rol	a
	dex
	bne	L7413
	adc	#'0'
	cmp	#$3A
	bmi	L7423
	adc	#$06
L7423:  jsr	sub_729D
	dec	$A6
	bne	L740F
L742A:  rts

sub_742B:
	sta	$C0
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
	cmp	#'%'
	bne	L7465
	inc	$8A
	iny
	lda	($C0),y
	cmp	#'%'
	beq	L7465
	cmp	#'E'
	bne	L746B
	lda	#$9B
L7465:  jsr	sub_729D
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

L749D:  jsr	sub_72D5
	jmp	L7448

	stx	$A1
	sty	$A2
	asl	a
	asl	a
	asl	a
	asl	a
	tax
	lda	#$26 ; NOTE
	sta	$0342,x
	jsr	CIOV
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
	lda	#$25 ; POINT
	sta	$0342,x
	jsr	CIOV
	jmp	L71D9

L74EA:
	.byte   $02,"S:"
L74ED:	.word	L74EA
L74EF:	.byte   $02,"E:"
L74F2:  .word   L74EF

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

	.byte   $20
	.byte   $2F
L754D:  adc	$A0,x
	ora	($4C),y
	lda	$2072
	.byte   $22
	adc	$A9,x
	asl	$4C
	.byte   $7C
	.byte   $72
	jsr	L7528
	lda	#$06
	ldx	$02FD
	jmp	sub_72A0

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
	jmp	sub_72AD

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
L7636:  sta	$A0
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

L7659:  sta	$A0
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

sub_76B4:
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
	lda	($A2),y
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

