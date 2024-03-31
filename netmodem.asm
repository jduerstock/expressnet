; da65 V2.18 - Ubuntu 2.19-1
; Created:    2024-03-30 01:02:20
; Input file: ../bbse2/PRO/COMMANDS/C/NETMODEM.CMD
; Page:	  1


	.setcpu "6502"

L000A		:= $000A

Cr_Lf		:= $3209
MIOsuspend	:= $3212
MIOresume	:= $3218
Chain		:= $322A
Pause		:= $3239
Concat		:= $324E
BlockRead	:= $329C
BlockWrite	:= $329F
File_Stat	:= $32A2
Bytes_In	:= $32A5
Calc_Sum	:= $32AB
Calc_CRC	:= $32AE
L32C3		:= $32C3

CONSOL		:= $D01F

FASC		:= $D8E6
IFP		:= $D9AA

CIOV		:= $E456

	.SEGMENT "S_MODEM_HDR"

	.word	$ffff
	.word	$7000
	.word	$85ce

	.SEGMENT "S_MODEM_CODE"


L7000:
	jmp	L84B5

	ora	($0B),y
	.byte   $13
	cli
	brk
	.byte	$70,$CF
	sta	$02,y
L700D:  ldx	#$FF
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

L7063:  stx	$A5
	sty	$A6
	ldx	#$00
	stx	$A3
	ldy	#$09 ; put text line
	jsr	sub_7025
	bne	L707C
	lda	#$0B
	sta	$0342,x
	lda	#$9B
	jmp	CIOV

L707C:  rts

L707D:  brk
L707E:  jmp	L7081

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

L70A4:  ldy	$84
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
	jsr	sub_70EC
	lda	$83
	ldx	$84
	jsr	sub_70EC
	jmp	L70B3

L7143:  jsr	L70C8
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

L7191:  jsr	L7143
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

L71FD:  pha
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
	jsr	L7063
	jmp	L71D9

L7234:  jsr	L700D
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
L724F:  beq	L7254
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
L7263:  lda	#$FF
	sta	$A3
	pla
	pha
	stx	$A1
	sty	$A2
	ldy	#$00
	lda	$A3
	sta	($A1),y
	pla
L7274:  ldy	$A2
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
L729D:  tax
	lda	$B7

sub_72A0:
	stx	$A1
	ldy	$A1
L72A4:  ldx	#$0B
	jmp	L727E

L72A9:  ldy	#$9B
	bne	L72A4

L72AD:  jsr	sub_7025
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
L72D5:  jsr	L72B3
	lda	$B7
L72DA:  ldx	#$50
	ldy	#$05
	jsr	L7015
	jmp	L71D9

	ldx	#$00
	jsr	L72D5
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
	.byte   $C6
L7427:  ldx	$D0
	.byte   $E5
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

	.byte   $02
	.byte   $53
	.byte   $3A
L74ED:  nop
L74EE:  .byte   $74
	.byte   $02
	eor	$3A
L74F2:  .byte   $EF
L74F3:  .byte   $74
	pha
	lda	#$00
	jsr	L7234
	lda	#$0C
	sta	$A3
	lda	#$00
	ldx	L74F2
	ldy	L74F3
	jsr	L71FD
	lda	#$06
	jsr	L7234
	pla
	sta	$A4
	and	#$30
	eor	#$1C
	sta	$A3
	lda	#$06
	ldx	L74ED
	ldy	L74EE
	jmp	L71FD

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
	lda	L74EE
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

L7732:  .byte   $CF
L7733:  sta	$00
	.byte   $14
L7736:  brk
	dey
	and	$02A0,y
L773B:  brk
L773C:  brk
L773D:  brk
L773E:  brk
L773F:  brk
L7740:  brk
L7741:  brk
L7742:  brk
L7743:  brk
L7744:  brk
L7745:  brk
L7746:  brk
L7747:  brk
L7748:  brk
L7749:  brk
L774A:  brk
L774B:  brk
L774C:  brk
L774D:  brk
L774E:  brk
L774F:  brk
L7750:  jmp	:+

:	sta	L774E
	ldy	#$00
	sty	L773E
	sty	$3F10
	lda	#$0A
	sta	L774F
L7763:  lda	CONSOL	; read console keys
	eor	#$06	; is START pressed?
	beq	L776D
	jmp	L7779

L776D:  ldy	#$01	; yes
	sty	$3EFE
	sty	L773E
	rts

	jmp	L77A0

L7779:  lda	$3F10
	eor	L774F
	beq	L7784
	jmp	L77A0

L7784:  jsr	L32C3
	lda	$A0
	bne	L778E
	jmp	L7797

L778E:  ldy	#$01
	sty	$3EFE
	sty	L773E
	rts

L7797:  clc
	lda	L774F
	adc	#$0A
	sta	L774F
L77A0:  jsr	Bytes_In
	lda	#$00
	cmp	$A0
	bcc	L77B4
	lda	L774E
	cmp	$3F10
	bcc	L77B4
	jmp	L7763

L77B4:  lda	L774E
	cmp	$3F10
	bcc	L77BF
	jmp	L77C7

L77BF:  ldy	#$01
	sty	L773E
	jmp	L77D1

L77C7:  lda	#$05
	jsr	L727C
	lda	$A0
	sta	L773C
L77D1:  rts

L77D2:  jmp	L77D5

L77D5:  jsr	L32C3
	lda	$A0
	bne	L77DF
	jmp	L77E5

L77DF:  ldy	#$01
	sty	$3EFE
	rts

L77E5:  lda	#$01
	jsr	L7750
	lda	#$00
	cmp	L773E
	bcc	L77F4
	jmp	L77E5

L77F4:  rts

L77F5:  brk

L77F6:  jmp	:+
:	sta	L77F5
L77FC:  lda	L7740
	eor	#$15
	beq	L780D
	lda	L7740
	eor	#$43
	beq	L780D
	jmp	L782C

L780D:  jsr	L77D2
	inc	L773F
	lda	#$0A
	cmp	L773F
	bcc	L781D
	jmp	L782C

L781D:  jsr	L77D2
	ldx	#$18
	lda	#$05
	jsr	sub_72A0
	lda	#$01
	sta	$A0
	rts

L782C:  lda	L7740
	eor	#$06
	beq	L7836
	jmp	L783B

L7836:  ldy	#$01
	sty	L773F
L783B:  jmp	L7850

L783E:
	.byte	$11,$9C,"Getting %U/%B/%U"

L7850:  lda	L7749
	sta	$A3
	lda	#$00
	sta	$A5
	lda	L773F
	sta	$A4
	lda	L774D
	sta	$A7
	lda	L774C
	sta	$A6
	ldy	L7748
	ldx	#>L783E
	lda	#<L783E
	jsr	sub_742B
	ldx	L7740
	lda	#$05
	jsr	sub_72A0
	lda	#$0A
	jsr	L7750
	lda	$3EFE
	bne	L7887
	jmp	L788F

L7887:  lda	#$01
	sta	$A0
	rts

	jmp	L7928

L788F:  lda	L773E
	bne	L7897
	jmp	L78C7

L7897:  lda	L77F5
	bne	L789F
	jmp	L78A7

L789F:  lda	#$15
	sta	L7740
	jmp	L78C4

L78A7:  lda	#$43
	sta	L7740
	lda	#$05
	cmp	L773F
	bcc	L78B6
	jmp	L78C4

L78B6:  ldy	#$01
	sty	L77F5
	dey
	sty	L7743
	lda	#$15
	sta	L7740
L78C4:  jmp	L7928

L78C7:  lda	L773C
	eor	#$18
	beq	L78D1
	jmp	L78D9

L78D1:  lda	#$01
	sta	$A0
	rts

	jmp	L7928

L78D9:  lda	L773C
	eor	#$04
	beq	L78E3
	jmp	L78EB

L78E3:  lda	#$02
	sta	$A0
	rts

	jmp	L7928

L78EB:  lda	L773C
	eor	#$01
	beq	L78F5
	jmp	L7907

L78F5:  ldy	#$00
	sty	L774D
	lda	#$80
	sta	L774C
	lda	#$00
	sta	$A0
	rts

	jmp	L7928

L7907:  lda	L773C
	eor	#$02
	beq	L7911
	jmp	L7923

L7911:  lda	#$04
	sta	L774D
	lda	#$00
	sta	L774C
	lda	#$00
	sta	$A0
	rts

	jmp	L7928

L7923:  lda	#$15
	sta	L7740
L7928:  jmp	L77FC

	lda	#$00
	sta	$A0
	rts

L7930:  jmp	L7933

L7933:  lda	#$01
	jsr	L7750
	lda	L773E
	bne	L7940
	jmp	L7945

L7940:  lda	#$02
	sta	$A0
	rts

L7945:  lda	L773C
	sta	L7741
	clc
	lda	L773B
	adc	#$01
	sta	$AE
L7953:  lda	L7741
	eor	$AE
	beq	L795D
	jmp	L7965

L795D:  lda	#$00
	sta	$A0
	rts

L7962:  jmp	L799B

L7965:  lda	L7741
	eor	L773B
	beq	L7970
	jmp	L7978

L7970:  lda	#$01
	sta	$A0
	rts

	jmp	L799B

L7978:  lda	#$04
	cmp	L773F
	bcc	L7982
	jmp	L799B

L7982:  lda	L7741
	eor	#$01
	beq	L798C
	jmp	L799B

L798C:  lda	L773B
	eor	#$FF
	beq	L7996
	jmp	L799B

L7996:  lda	#$00
	sta	$A0
	rts

L799B:  lda	#$02
	sta	$A0
	rts

L79A0:  jmp	L79A3

L79A3:  lda	#$01
	jsr	L7750
	lda	L773E
	bne	L79B0
	jmp	L79B5

L79B0:  lda	#$01
	sta	$A0
	rts

L79B5:  sec
	lda	#$FF
	sbc	L7741
	sta	$AE
	lda	L773C
	eor	$AE
	beq	L79C7
	jmp	L79CC

L79C7:  lda	#$00
	sta	$A0
	rts

L79CC:  lda	#$01
	sta	$A0
	rts

L79D1:  brk
L79D2:  brk
L79D3:  brk
L79D4:  brk
L79D5:  brk

L79D6:  jmp	:+

:	ldy	#$00
	sty	L79D1
	sty	L7742
	lda	L7747
	sta	L7745
	lda	L7746
	sta	L7744
	sty	L773D
	sty	L774B
	sty	L774A
	clc
	lda	L7732
	adc	L7746
	sta	L79D2
	lda	L7733
	adc	L7747
	sta	L79D3
	sty	L79D5
	iny
	sty	L79D4
	lda	L774C
	sta	L7A2D
	lda	L774D
	sta	L7A2E
L7A1C:  lda	L7A2D
	cmp	L79D4
	lda	L7A2E
	sbc	L79D5
	bcs	L7A2F
	jmp	L7A87

L7A2D:  brk
L7A2E:  brk
L7A2F:  lda	#$01
	jsr	L7750
	lda	L773E
	bne	L7A3C
	jmp	L7A41

L7A3C:  lda	#$01
	sta	$A0
	rts

L7A41:  lda	L79D2
	sta	$AE
	lda	L79D3
	sta	$AF
	lda	L773C
	ldy	#$00
	sta	($AE),y
	inc	L79D2
	bne	L7A5A
	inc	L79D3
L7A5A:  inc	L7746
	bne	L7A62
	inc	L7747
L7A62:  lda	L773C
	eor	L79D1
	bne	L7A6D
	jmp	L7A76

L7A6D:  sec
	lda	L79D4
	sbc	#$01
	sta	L7742
L7A76:  lda	L773C
	sta	L79D1
	inc	L79D4
	bne	L7A1C
	inc	L79D5
	jmp	L7A1C

L7A87:  lda	L7743
	bne	L7A8F
	jmp	L7ABC

L7A8F:  clc
	lda	L7732
	adc	L7744
	sta	$A0
	lda	L7733
	adc	L7745
	sta	$A1
	lda	L774D
	sta	$A3
	ldy	L774C
	ldx	$A1
	lda	$A0
	jsr	Calc_CRC
	lda	$A1
	sta	L774B
	lda	$A0
	sta	L774A
	jmp	L7AD9

L7ABC:  clc
	lda	L7732
	adc	L7744
	sta	$A0
	lda	L7733
	adc	L7745
	sta	$A1
	ldx	$A1
	lda	$A0
	jsr	Calc_Sum
	lda	$A0
	sta	L773D
L7AD9:  lda	#$00
	sta	$A0
	rts

L7ADE:  brk
L7ADF:  brk
L7AE0:  brk
L7AE1:  brk

sub_7AE2:  
	jmp	:+
:	lda	L7747
	sta	L7745
	lda	L7746
	sta	L7744
	ldy	#$00
	sty	L773D
	sty	L774B
	sty	L774A
	clc
	lda	L7732
	adc	L7746
	sta	L7AE0
	lda	L7733
	adc	L7747
	sta	L7AE1
	sty	L7ADF
	iny
	sty	L7ADE
	lda	L774C
	sta	L7B33
	lda	L774D
	sta	L7B34
L7B22:  lda	L7B33
	cmp	L7ADE
	lda	L7B34
	sbc	L7ADF
	bcs	L7B35
	jmp	L7B67

L7B33:  brk
L7B34:  brk
L7B35:  lda	L7AE0
	sta	$AE
	lda	L7AE1
	sta	$AF
	ldy	#$00
	lda	($AE),y
	sta	$A1
	ldx	$A1
	lda	#$05
	jsr	sub_72A0
	inc	L7AE0
	bne	L7B54
	inc	L7AE1
L7B54:  inc	L7746
	bne	L7B5C
	inc	L7747
L7B5C:  inc	L7ADE
	bne	L7B22
	inc	L7ADF
	jmp	L7B22

L7B67:  lda	L7743
	bne	L7B6F
	jmp	L7BBB

L7B6F:  clc
	lda	L7732
	adc	L7744
	sta	$A0
	lda	L7733
	adc	L7745
	sta	$A1
	lda	L774D
	sta	$A3
	ldy	L774C
	ldx	$A1
	lda	$A0
	jsr	Calc_CRC
	lda	$A1
	sta	L774B
	lda	$A0
	sta	L774A
	lda	#$08
	sta	$84
	lda	L774B
	tax
	lda	L774A
	jsr	L70A4
	sta	$A1
	ldx	$A1
	lda	#$05
	jsr	sub_72A0
	ldx	L774A
	lda	#$05
	jsr	sub_72A0
	jmp	L7BE0

L7BBB:  clc
	lda	L7732
	adc	L7744
	sta	$A0
	lda	L7733
	adc	L7745
	sta	$A1
	ldx	$A1
	lda	$A0
	jsr	Calc_Sum
	lda	$A0
	sta	L773D
	ldx	L773D
	lda	#$05
	jsr	sub_72A0
L7BE0:  rts

L7BE1:  brk
L7BE2:  jmp	L7BE5

L7BE5:  ldy	#$00
	sty	L7BE1
	sty	L773C
	lda	#$9C
	jsr	L729D
	jmp	L7BF9

L7BF5:
	.byte   $03,"EOT"

L7BF9:  ldx	#>L7BF5
	lda	#<L7BF5
	jsr	sub_7227
L7C00:  ldx	#$04
	lda	#$05
	jsr	sub_72A0
	inc	L7BE1
	lda	#$0A
	jsr	L7750
	lda	L773C
	eor	#$06
	beq	L7C20
	lda	#$03
	cmp	L7BE1
	bcc	L7C20
	jmp	L7C00

L7C20:  rts

L7C21:  jmp	L7C24

L7C24:  jmp	L7C41

L7C27:
	.byte	$19,"Waiting for transfer...%E"

L7C41:  ldx	#>L7C27
	lda	#<L7C27
	jsr	sub_742B
	rts

L7C49:  brk
L7C4A:  brk
L7C4B:  brk
L7C4C:  brk
L7C4D:  brk
L7C4E:  brk
L7C4F:  brk
L7C50:  brk

L7C51:  jmp	L7C54

L7C54:  lda	#$15
	sta	L7740
	ldy	#$00
	sty	L7749
	iny
	sty	L7748
	dey
	sty	L773F
	sty	L7747
	sty	L7746
	sty	L773B
	sty	L7741
	sty	L7C4B
	jsr	MIOresume
	jsr	L7C21
	lda	L7743
	bne	L7C83
	jmp	L7C90

L7C83:  ldy	#$00
	sty	L7C4C
	lda	#$43
	sta	L7740
	jmp	L7C95

L7C90:  ldy	#$01
	sty	L7C4C
L7C95:  ldy	#$00
	sty	$4D
	lda	#$FA
	cmp	L7746
	lda	#$0F
	sbc	L7747
	bcc	L7CA8
	jmp	L7D3A

L7CA8:  jsr	MIOsuspend
	sec
	lda	L7746
	sbc	L774C
	sta	$A3
	lda	L7747
	sbc	L774D
	sta	$A4
	ldy	L7733
	ldx	L7732
	lda	#$02
	jsr	BlockWrite
	lda	$A0
	sta	L7C49
	jsr	MIOresume
	ldy	#$00
	sty	$02EB
	lda	#$01
	cmp	L7C49
	bcc	L7CDE
	jmp	L7CEE

L7CDE:  ldx	#$18
	lda	#$05
	jsr	sub_72A0
	ldy	#$01
	sty	$3EFE
	jsr	sub_729B
	rts

L7CEE:  sec
	lda	#$00
	sbc	L774C
	sta	$AE
	lda	#$10
	sbc	L774D
	sta	$AF
	clc
	lda	L7732
	adc	$AE
	sta	$A2
	lda	L7733
	adc	$AF
	sta	$A3
	clc
	lda	L774C
	adc	#$02
	sta	$A4
	lda	L774D
	adc	#$00
	sta	$A5
	ldy	$A2
	ldx	L7733
	lda	L7732
	jsr	L7659
	lda	L774D
	sta	L7747
	lda	L774C
	sta	L7746
	ldy	#$00
	sty	L7745
	sty	L7744
L7D3A:  lda	L7C4C
	jsr	L77F6
	lda	$A0
	sta	L7C49
	ldy	#$01
	sty	L7C4C
	lda	$3EFE
	bne	L7D52
	jmp	L7D5D

L7D52:  jsr	L77D2
	ldx	#$18
	lda	#$05
	jsr	sub_72A0
	rts

L7D5D:  lda	L7C49
	eor	#$01
	beq	L7D67
	jmp	L7D70

L7D67:  ldy	#$01
	sty	$3EFE
	rts

	jmp	L7E48

L7D70:  lda	L7C49
	eor	#$02
	beq	L7D7A
	jmp	L7E48

L7D7A:  lda	#$9C
	jsr	L729D
	jmp	L7D86

L7D82:
	.byte	$03,"EOT"

L7D86:  ldx	#>L7D82
	lda	#<L7D82
	jsr	sub_7227
	jsr	MIOsuspend
	lda	L7748
	eor	#$01
	bne	L7D9C
	ora	L7749
	eor	#$00
L7D9C:  beq	L7DA1
	jmp	L7DAF

L7DA1:  lda	#$02
	jsr	L7234
	jsr	MIOresume
	ldy	#$01
	sty	$3EFE
	rts

L7DAF:  sec
	lda	L7746
	sbc	L774C
	sta	L7744
	lda	L7747
	sbc	L774D
	sta	L7745
	sec
	lda	L7746
	sbc	#$01
	sta	$AE
	lda	L7747
	sbc	#$00
	sta	$AF
	clc
	lda	L7732
	adc	$AE
	sta	$AC
	lda	L7733
	adc	$AF
	sta	$AD
	ldy	#$00
	lda	($AC),y
	eor	L7742
	beq	L7DEC
	jmp	L7E0F

L7DEC:  clc
	lda	L7744
	adc	L7742
	sta	$A3
	lda	L7745
	adc	#$00
	sta	$A4
	ldy	L7733
	ldx	L7732
	lda	#$02
	jsr	BlockWrite
	lda	$A0
	sta	L7C49
	jmp	L7E29

L7E0F:  lda	L7747
	sta	$A4
	lda	L7746
	sta	$A3
	ldy	L7733
	ldx	L7732
	lda	#$02
	jsr	BlockWrite
	lda	$A0
	sta	L7C49
L7E29:  lda	#$02
	jsr	L7234
	jsr	MIOresume
	lda	#$01
	cmp	L7C49
	bcc	L7E3B
	jmp	L7E40

L7E3B:  ldy	#$01
	sty	$3EFE
L7E40:  ldx	#$06
	lda	#$05
	jsr	sub_72A0
	rts

L7E48:  lda	L7741
	sta	L7C4A
	jsr	L7930
	lda	$A0
	sta	L7C49
	lda	L7C49
	eor	#$02
	beq	L7E60
	jmp	L7E68

L7E60:  lda	#$15
	sta	L7740
	jmp	L7FB5

L7E68:  lda	L7C49
	eor	#$01
	beq	L7E72
	jmp	L7E95

L7E72:  lda	L7745
	sta	L7747
	lda	L7744
	sta	L7746
	inc	L773F
	sec
	lda	L7748
	sbc	#$01
	sta	L7748
	lda	L7749
	sbc	#$00
	sta	L7749
	jmp	L7EA8

L7E95:  lda	L7C4A
	eor	L7741
	beq	L7EA0
	jmp	L7EA3

L7EA0:  jmp	L7EA8

L7EA3:  ldy	#$01
	sty	L773F
L7EA8:  jsr	L79A0
	lda	$A0
	beq	L7EB2
	jmp	L7FB0

L7EB2:  jsr	L79D6
	lda	$A0
	sta	L7C49
	lda	L7C49
	eor	#$01
	beq	L7EC4
	jmp	L7ED8

L7EC4:  lda	L7745
	sta	L7747
	lda	L7744
	sta	L7746
	lda	#$15
	sta	L7740
	jmp	L7FAD

L7ED8:  lda	#$05
	jsr	L7750
	lda	L773E
	sta	L7C4D
	lda	L773C
	sta	L7C4E
	lda	L7743
	bne	L7EF1
	jmp	L7F1B

L7EF1:  lda	#$05
	jsr	L7750
	lda	#$01
	sta	$85
	lda	#$00
	sta	$84
	lda	L7C4E
	ldx	#$00
	jsr	L710E
	sta	$AE
	txa
	sta	$AF
	clc
	lda	L773C
	adc	$AE
	sta	L7C4F
	lda	#$00
	adc	$AF
	sta	L7C50
L7F1B:  lda	#$00
	cmp	L773E
	bcc	L7F2C
	lda	#$00
	cmp	L7C4D
	bcc	L7F2C
	jmp	L7F40

L7F2C:  lda	#$15
	sta	L7740
	lda	L7745
	sta	L7747
	lda	L7744
	sta	L7746
	jmp	L7FAD

L7F40:  lda	L7743
	beq	L7F48
	jmp	L7F69

L7F48:  lda	L773C
	eor	L773D
	beq	L7F53
	jmp	L7F69

L7F53:  lda	#$06
	sta	L7740
	lda	L7741
	sta	L773B
	inc	L7748
	bne	L7F66
	inc	L7749
L7F66:  jmp	L7FAD

L7F69:  lda	#$00
	cmp	L7743
	bcc	L7F73
	jmp	L7F9C

L7F73:  lda	L7C4F
	eor	L774A
	bne	L7F81
	ora	L7C50
	eor	L774B
L7F81:  beq	L7F86
	jmp	L7F9C

L7F86:  lda	#$06
	sta	L7740
	lda	L7741
	sta	L773B
	inc	L7748
	bne	L7F99
	inc	L7749
L7F99:  jmp	L7FAD

L7F9C:  lda	#$15
	sta	L7740
	lda	L7745
	sta	L7747
	lda	L7744
	sta	L7746
L7FAD:  jmp	L7FB5

L7FB0:  lda	#$15
	sta	L7740
L7FB5:  jmp	L7C95

	rts

L7FB9:  brk
L7FBA:  jmp	L7FBD

L7FBD:  sta	L7FB9
L7FC0:  ldy	#$00
	sty	L773C
	lda	L7FB9
	jsr	L7750
	lda	#$0F
	cmp	L7FB9
	bcc	L7FDC
	lda	#$00
	cmp	L773E
	bcc	L7FDC
	jmp	L7FE0

L7FDC:  rts

	jmp	L7FF9

L7FE0:  lda	L773C
	eor	#$43
	beq	L7FEA
	jmp	L7FF8

L7FEA:  ldy	#$01
	sty	L7743
	lda	#$15
	sta	L773C
	rts

	jmp	L7FF9

L7FF8:  rts

L7FF9:  jmp	L7FC0

	rts

L7FFD:  brk
L7FFE:  brk
	brk
L8000:  brk
L8001:  brk
L8002:  brk
L8003:  jmp	L8006

L8006:  ldy	#$00
	sty	L8002
	jsr	L7C21
	ldy	#$00
	sty	L7749
	iny
	sty	L7748
	sty	L773B
	lda	#$14
	sta	L7747
	lda	#$00
	sta	L7746
	lda	#$14
	sta	L7745
	lda	#$00
	sta	L7744
	dey
	sty	L773F
	sty	L8000
	lda	#$0F
	sta	L8001
	jsr	L77D2
L803D:  ldy	#$00
	sty	$4D
	sty	L773C
	lda	L8001
	jsr	L7FBA
	lda	#$32
	sta	L8001
	lda	$3EFE
	bne	L8057
	jmp	L805F

L8057:  ldx	#$18
	lda	#$05
	jsr	sub_72A0
	rts

L805F:  lda	#$00
	cmp	L773E
	bcc	L8069
	jmp	L807B

L8069:  lda	L8000
	beq	L8071
	jmp	L807B

L8071:  ldy	#$00
	sty	L773E
	lda	#$15
	sta	L773C
L807B:  ldy	#$01
	sty	L8000
	lda	L773E
	bne	L8088
	jmp	L808C

L8088:  sty	$3EFE
	rts

L808C:  lda	L773C
	eor	#$18
	beq	L8096
	jmp	L809F

L8096:  ldy	#$01
	sty	$3EFE
	rts

	jmp	L812B

L809F:  lda	L773C
	eor	#$06
	beq	L80A9
	jmp	L80E0

L80A9:  inc	L773B
	inc	L7748
	bne	L80B4
	inc	L7749
L80B4:  ldy	#$01
	sty	L773F
	lda	L7746
	cmp	#$FF
	lda	L7747
	sbc	#$13
	bcc	L80C8
	jmp	L80DD

L80C8:  lda	L7746
	cmp	L7FFD
	lda	L7747
	sbc	L7FFE
	bcs	L80D9
	jmp	L80DD

L80D9:  jsr	L7BE2
	rts

L80DD:  jmp	L812B

L80E0:  lda	L773C
	eor	#$15
	bne	L80EA
	jmp	L80ED

L80EA:  jsr	L77D2
L80ED:  lda	L7745
	sta	L7747
	lda	L7744
	sta	L7746
	inc	L773F
	lda	#$09
	cmp	L773F
	bcc	L8106
	jmp	L8116

L8106:  ldy	#$01
	sty	$3EFE
	ldx	#$18
	lda	#$05
	jsr	sub_72A0
	rts

	jmp	L812B

L8116:  lda	#$05
	cmp	L773F
	bcc	L8120
	jmp	L812B

L8120:  lda	L773B
	beq	L8128
	jmp	L812B

L8128:  inc	L773B
L812B:  lda	#$FA
	cmp	L7746
	lda	#$13
	sbc	L7747
	bcc	L813A
	jmp	L81F2

L813A:  ldy	#$00
	sty	L7747
	sty	L7746
	jsr	MIOsuspend
	lda	#$14
	sta	$A4
	lda	#$00
	sta	$A3
	ldy	L7733
	ldx	L7732
	lda	#$02
	jsr	BlockRead
	lda	$A1
	sta	L7FFE
	lda	$A0
	sta	L7FFD
	lda	L7FFD
	cmp	#$00
	lda	L7FFE
	sbc	#$14
	bcc	L8171
	jmp	L81B8

L8171:  clc
	lda	L7732
	adc	L7FFD
	sta	$A0
	lda	L7733
	adc	L7FFE
	sta	$A1
	sec
	lda	#$00
	sbc	L7FFD
	sta	$A2
	lda	#$14
	sbc	L7FFE
	sta	$A3
	lda	#$00
	sta	$85
	lda	#$80
	sta	$84
	lda	L7FFE
	tax
	lda	L7FFD
	jsr	L7191
	sta	$A4
	ldy	$A2
	ldx	$A1
	lda	$A0
	jsr	L7636
	ldy	#$00
	sty	L774D
	lda	#$80
	sta	L774C
L81B8:  jsr	MIOresume
	ldy	#$00
	sty	$02EB
	lda	$0363
	eor	#$88
	bne	L81CA
	jmp	L81E3

L81CA:  lda	#$01
	cmp	$0363
	bcc	L81D4
	jmp	L81E3

L81D4:  iny
	sty	$3EFE
	ldx	#$18
	lda	#$05
	jsr	sub_72A0
	jsr	sub_729B
	rts

L81E3:  lda	L7FFD
	ora	L7FFE
	beq	L81EE
	jmp	L81F2

L81EE:  jsr	L7BE2
	rts

L81F2:  jmp	L8207

L81F5:
	.byte	$11,$9C,"Sending %U/%B/%U"

L8207:  lda	L7749
	sta	$A3
	lda	#$00
	sta	$A5
	lda	L773F
	sta	$A4
	lda	L774D
	sta	$A7
	lda	L774C
	sta	$A6
	ldy	L7748
	ldx	#>L81F5
	lda	#<L81F5
	jsr	sub_742B
	lda	L774C
	eor	#$80
	bne	L8235
	ora	L774D
	eor	#$00
L8235:  beq	L823A
	jmp	L8244

L823A:  ldx	#$01
	lda	#$05
	jsr	sub_72A0
	jmp	L824B

L8244:  ldx	#$02
	lda	#$05
	jsr	sub_72A0
L824B:  ldx	L773B
	lda	#$05
	jsr	sub_72A0
	sec
	lda	#$FF
	sbc	L773B
	sta	$A1
	ldx	$A1
	lda	#$05
	jsr	sub_72A0
	jsr	sub_7AE2
	jmp	L803D

	rts

sub_8269:
	jmp	:+
:	ldy	#$01
	sty	L7743
	dey
	sty	L774D
	lda	#$80
	sta	L774C
	rts

L827B:  brk
L827C:  brk

sub_827D:
	jmp	:+
:	stx	L827C
	sta	L827B
	ldx	L827C
	lda	L827B
	jsr	File_Stat
	jsr	sub_8269
	ldy	#$00
	sty	$3EFE
	jsr	MIOsuspend
	lda	#$02
	jsr	L7234
	ldy	#$00
	sty	L7736
	lda	#$08
	sta	$A3
	lda	#$00
	sta	$A4
	ldy	L827C
	ldx	L827B
	lda	#$02
	jsr	L71FD
	jsr	MIOresume
	lda	#$00
	cmp	L7736
	bcc	L82C4
	jmp	L82ED

L82C4:  ldy	#$01
	sty	$3EFE
	jmp	L82E5

L82CC:
	.byte	$18,"Unable to create file!%E"

L82E5:  ldx	#>L82CC
	lda	#<L82CC
	jsr	sub_7227
	rts

L82ED:  jsr	L7C51
	jsr	MIOsuspend
	lda	#$02
	jsr	L7234
	jsr	MIOresume
	lda	#$32
	jsr	Pause
	jsr	Cr_Lf
	jsr	Cr_Lf
	lda	$3EFE
	bne	L830E
	jmp	L8334

L830E:  jmp	L832A

L8311:
	.byte	$18,"File transfer aborted..."

L832A:  ldx	#>L8311
	lda	#<L8311
	jsr	sub_7227
	jmp	L8365

L8334:  inc	$33BD
	bne	L833C
	inc	$33BE
L833C:  jmp	L835E

L833F:
	.byte	$1e,"ExpressNET transfer completed!"

L835E:  ldx	#>L833F
	lda	#<L833F
	jsr	sub_7227
L8365:  rts

L8366:  brk
L8367:  brk
L8368:  jmp	L836B

L836B:  stx	L8367
	sta	L8366
	ldx	L8367
	lda	L8366
	jsr	File_Stat
	jsr	sub_8269
	ldy	#$00
	sty	$3EFE
	jsr	MIOsuspend
	lda	#$02
	jsr	L7234
	ldy	#$00
	sty	L7736
	lda	#$04
	sta	$A3
	lda	#$00
	sta	$A4
	ldy	L8367
	ldx	L8366
	lda	#$02
	jsr	L71FD
	jsr	MIOresume
	lda	#$00
	cmp	L7736
	bcc	L83AF
	jmp	L83D8

L83AF:  jmp	L83CB

L83B2:
	.byte	$18,"That file doesn't exist!"

L83CB:  ldx	#>L83B2
	lda	#<L83B2
	jsr	sub_7227
	ldy	#$01
	sty	$3EFE
	rts

L83D8:  jsr	L8003
	jsr	MIOsuspend
	lda	#$02
	jsr	L7234
	jsr	MIOresume
	lda	#$32
	jsr	Pause
	jsr	Cr_Lf
	jsr	Cr_Lf
	lda	$3EFE
	bne	L83F9
	jmp	L841F

L83F9:  jmp	L8415

L83FC:
	.byte	$18,"File transfer aborted..."

L8415:  ldx	#>L83FC
	lda	#<L83FC
	jsr	sub_7227
	jmp	L8448

L841F:  jmp	L8441

L8422:
	.byte	$1E,"ExpressNET transfer completed!"

L8441:  ldx	#>L8422
	lda	#<L8422
	jsr	sub_7227
L8448:  rts

L8449:  brk

L844A:
	jmp	L844D

L844D:  sta	L8449
	lda	L8449
	sta	L7736
	rts

L8457:  brk
L8458:  brk
L8459:  jmp	L845C

L845C:  stx	L8458
	sta	L8457
	jmp	L8467

	ora	($00,x)
L8467:  lda	L8458
	sta	$A3
	ldy	L8457
	ldx	#$84
	lda	#$65
	jsr	Concat
	jsr	MIOsuspend
	lda	#$00
	sta	$A3
	lda	#$00
	sta	$A4
	lda	L8458
	sta	$A6
	lda	L8457
	sta	$A5
	ldy	#$21
	ldx	#$00
	lda	#$02
	jsr	L72AD
	jsr	MIOresume
	rts

L8498:
	.byte	$1C,"Dx:>PRO>NETWORK>INCOMING.DAT"

L84B5:
	jmp	L84B8

L84B8:  lda	L844A+2
	sta	L707E+2
	lda	L844A+1
	sta	L707E+1
	lda	$3EEF
	sta	L8498+2
	jsr	sub_729B
	jmp	L84F6

L84D0:
	.byte	$25,"BBS Express! Pro        NETModem v1.0"

L84F6:  ldx	#>L84D0
	lda	#<L84D0
	jsr	sub_7227
	jmp	L8521

L8500:
	.byte	$20,"    (c) 1988 Orion Micro Systems"

L8521:  ldx	#>L8500
	lda	#<L8500
	jsr	sub_7227
	jsr	sub_729B
	lda	$3EF5
	eor	#$C0
	beq	L8535
	jmp	L8561

L8535:  ldx	#$40
	lda	#$4F
	jsr	L8368
	lda	$3EFE
	beq	L8544
	jmp	L854B

L8544:  ldx	#$40
	lda	#$4F
	jsr	L8459
L854B:  jmp	L8557

L854E:
	.byte	$08,"WAITCALL"

L8557:  ldx	#>L854E
	lda	#<L854E
	jsr	Chain
	jmp	L85CD

L8561:  lda	$3EF5
	eor	#$C1
	beq	L856B
	jmp	L85A4

L856B:  ldx	#>L8498
	lda	#<L8498
	jsr	sub_827D
	lda	$3EFE
	beq	L857A
	jmp	L858F

L857A:  jmp	L8585

L857D:
	.byte   $07,"NETUPDT"

L8585:  ldx	#>L857D
	lda	#<L857D
	jsr	Chain
	jmp	L85A1

L858F:  jmp	L859A

L8592:
	.byte   $07,"NETCALL"

L859A:  ldx	#>L8592
	lda	#<L8592
	jsr	Chain
L85A1:  jmp	L85CD

L85A4:  jmp	L85C6

L85A7:
	.byte	$1E,"Must be invoked by ExpressNET!"

L85C6:  ldx	#>L85A7
	lda	#<L85A7
	jsr	sub_7227
L85CD:  rts

	rts

	.SEGMENT "S_MODEM_LOAD"

	.word	$02E2
	.word	$02E3
	.word	$84B5
