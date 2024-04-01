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

FASC		 := $D8E6
IFP		 := $D9AA
CIOV		 := $E456

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

.include	"common1.asm"

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
	jsr	sub_7227
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
	jsr	CIOV
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
	jsr	sub_742B
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
	jsr	CIOV
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
	jsr	sub_742B
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
	jsr	sub_742B
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
	jsr	sub_729D
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
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
	jsr	sub_7227
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
	jsr	sub_7227
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
	jsr	sub_7227
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
	jsr	sub_7227
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
	jsr	sub_7227
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
	jsr	sub_7227
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
	jsr	sub_7227
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
	jsr	sub_7227
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
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
	jsr	sub_72AD
	jsr	L3218
	rts

L8357:  brk
L8358:  jmp	L835B

L835B:  lda	L7767
	sta	L707E+2
	lda	L7766
	sta	L707E+1
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

