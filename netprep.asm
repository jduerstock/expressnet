; da65 V2.18 - Ubuntu 2.19-1
; Created:    2024-03-31 11:54:36
; Input file: netprep.cmd
; Page:	  1


	.setcpu "6502"

L000A		 := $000A
L2020		 := $2020
L209C		 := $209C
L3212		 := $3212
L321B		 := $321B
L321E		 := $321E
L3221		 := $3221
L3224		 := $3224
L324E		 := $324E
L3266		 := $3266
L328D		 := $328D
L329C		 := $329C
L329F		 := $329F
L4225		 := $4225
L5245		 := $5245
L5525		 := $5525
L6F4E		 := $6F4E
L6FC3		 := $6FC3
L6FCF		 := $6FCF
L9281		 := $9281
L9291		 := $9291
L929A		 := $929A
LA0FC		 := $A0FC
LC2FC		 := $C2FC
FASC		 := $D8E6
IFP		 := $D9AA
CIOV		 := $E456

	.SEGMENT "S_PREP_HDR"

	.word	$FFFF
	.word	$7000
	.word   $81C4

	.SEGMENT "S_PREP_CODE"

	jmp	L817F

	.byte	$10
	ora	$01
	cli
	brk
	.byte	$70,$C5
	sta	($02,x)
	brk

.include	"common1.asm"

L7732:  brk
L7733:  brk
L7734:  brk
L7735:  brk
L7736:  brk
	dey
	and	$02A0,y
L773B:  .byte   $09
L773C:  .byte   $70
L773D:  brk
L773E:  .byte   $A0
L773F:  .byte   $1D
L7740:  ldy	#$18
	.byte   $A1
L7743:  .byte   $13
L7744:  .byte   $A2
L7745:  .byte   $0E
L7746:  .byte   $A3
	ora	#$A4
	.byte   $04
	lda	$FF
	lda	$FA
	ldx	$F5
	.byte   $A7
	.byte	$F0,$A8
	.byte   $EB
	lda	#$01
	tax
L7757:  brk
L7758:  .byte   $AB
L7759:  .byte   $96
L775A:  .byte   $AB
	brk
	.byte   $01
L775D:  .byte   $96
L775E:  ldy	$0898
	.byte   $2E
	.byte   $B5
L7763:  brk
	.byte   $4C
L7765:  .byte   $67
L7766:  .byte   $77
L7767:  sta	L7763
	lda	L7763
	sta	L7732
	rts

L7771:  brk
L7772:  brk
L7773:  jmp	L7776

L7776:  stx	L7772
	sta	L7771
	lda	#$01
	jsr	sub_7234
	lda	#$04
	jsr	sub_7234
	lda	#$06
	jsr	sub_7234
	ldx	L7772
	lda	L7771
	jsr	sub_7227
	ldx	L773B
	txs
	rts

	rts

L779A:  brk
L779B:  brk
	brk
L779D:  brk
L779E:  brk
L779F:  brk
L77A0:  brk
L77A1:  brk
L77A2:  brk
L77A3:  brk
L77A4:  jmp	L77A7

L77A7:  sta	L779A
	clc
	lda	L773F
	adc	L779A
	sta	$AE
	lda	L7740
	adc	#$00
	sta	$AF
	ldy	#$00
	lda	($AE),y
	sta	L779B
	sty	L779F
	lda	#$0A
	sta	L779E
	iny
	sty	L779D
	sec
	lda	L779B
	sbc	#$01
	sta	L77E1
L77D6:  lda	L77E1
	cmp	L779D
	bcs	L77E2
	jmp	L77FA

L77E1:  brk
L77E2:  clc
	lda	L779E
	adc	$A015
	sta	L779E
	lda	L779F
	adc	#$00
	sta	L779F
	inc	L779D
	jmp	L77D6

L77FA:  lda	#$25
	sta	$0382
	ldy	#$00
	sty	$038C
	lda	L779E
	and	#$FF
	sta	$038D
	lda	#$01
	sta	$85
	lda	#$00
	sta	$84
	lda	L779F
	tax
	lda	L779E
	jsr	sub_7143
	sta	$038E
	ldx	#$40
	lda	#$00
	jsr	CIOV
	lda	#$7F
	cmp	$0383
	bcc	L7832
	jmp	L7842

L7832:  jmp	L783B

	ora	$50
	.byte   $4F
	eor	#$4E
	.byte   $54
L783B:  ldx	#$78
	lda	#$35
	jsr	L7773
L7842:  lda	#$01
L7844:  sta	$85
	lda	#$00
	sta	$84
	lda	$A015
	ldx	#$00
	jsr	L710E
	sta	L77A0
	txa
	sta	L77A1
	lda	L77A1
	sta	$A4
	lda	L77A0
	sta	$A3
	ldy	L7758
	ldx	L7757
	lda	#$04
	jsr	L329C
	lda	$A1
	sta	L77A3
	lda	$A0
	sta	L77A2
	lda	L77A2
	eor	L77A0
	bne	L7886
	ora	L77A3
	eor	L77A1
L7886:  bne	L788B
	jmp	L78BD

L788B:  jmp	L789F

	bpl	L78E2
	eor	$41
	.byte   $44
	jsr	L5245
	.byte   $52
	.byte   $4F
	.byte   $52
	.byte   $3A
	jsr	L5525
	and	$45
L789F:  lda	L77A3
	sta	$A3
	ldy	L77A2
	ldx	#$78
	lda	#$8E
	jsr	sub_742B
	jmp	L78B6

	.byte   $04
	.byte   $52
	eor	$41
	.byte   $44
L78B6:  ldx	#$78
	lda	#$B1
	jsr	L7773
L78BD:  rts

L78BE:  brk
L78BF:  brk
L78C0:  brk
L78C1:  brk
L78C2:  brk
L78C3:  brk
L78C4:  jmp	L78C7

L78C7:  lda	L775E
	sta	L78C3
	lda	L775D
	sta	L78C2
	ldy	#$01
	sty	L78C0
	lda	$AB5F
	sta	L78E9
L78DE:  lda	L78E9
	.byte   $CD
L78E2:  cpy	#$78
	bcs	L78EA
	jmp	L7920

L78E9:  brk
L78EA:  lda	L78C2
	sta	$AE
	lda	L78C3
	sta	$AF
	ldy	#$00
	lda	($AE),y
	sta	L78C1
	clc
	lda	L78C2
	adc	L78C1
	sta	$AE
	lda	L78C3
	adc	#$00
	sta	$AF
	clc
	lda	$AE
	adc	#$01
	sta	L78C2
	lda	$AF
	adc	#$00
	sta	L78C3
	inc	L78C0
	jmp	L78DE

L7920:  sec
	lda	L78C2
	sbc	L775D
	sta	L78BE
	lda	L78C3
	sbc	L775E
	sta	L78BF
	lda	L78BF
	sta	$A1
	lda	L78BE
	sta	$A0
	rts

L793E:  brk
L793F:  brk
L7940:  brk
L7941:  jmp	L7944

L7944:  stx	L793F
	sta	L793E
	lda	$AB60
	eor	L793E
	bne	L7958
	ora	$AB61
	eor	L793F
L7958:  beq	L795D
	jmp	L7962

L795D:  lda	#$01
	sta	$A0
	rts

L7962:  ldy	#$00
	sty	L7940
L7967:  lda	#$7F
	cmp	L7940
	bcs	L7971
	jmp	L79CB

L7971:  lda	L7940
	asl	a
	php
	clc
	adc	L7759
	sta	$AE
	lda	#$00
	rol	a
	plp
	adc	L775A
	sta	$AF
	ldy	#$00
	lda	($AE),y
	iny
	ora	($AE),y
	beq	L7991
	jmp	L7999

L7991:  lda	#$00
	sta	$A0
	rts

	jmp	L79C5

L7999:  lda	L7940
	asl	a
	php
	clc
	adc	L7759
	sta	$AE
	lda	#$00
	rol	a
	plp
	adc	L775A
	sta	$AF
	dey
	lda	($AE),y
	eor	L793E
	bne	L79BB
	iny
	ora	($AE),y
	eor	L793F
L79BB:  beq	L79C0
	jmp	L79C5

L79C0:  lda	#$01
	sta	$A0
	rts

L79C5:  inc	L7940
	jmp	L7967

L79CB:  lda	#$00
	sta	$A0
	rts

L79D0:  brk
L79D1:  brk
L79D2:  brk
L79D3:  brk
L79D4:  jmp	L79D7

L79D7:  sta	L79D0
	lda	L79D0
	jsr	L77A4
	ldx	L7734
	lda	L7733
	jsr	L7941
	lda	$A0
	bne	L79F0
	jmp	L79F1

L79F0:  rts

L79F1:  jmp	L7A15

	.byte	$20,$9C,"        Node %U/Base %B/Msg %B "

L7A15:  lda	L7734
	sta	$A3
	lda	#$00
	sta	$A5
	lda	L773C
	sta	$A4
	lda	#$00
	sta	$A7
	lda	L79D0
	sta	$A6
	ldy	L7733
	ldx	#$79
	lda	#$F4
	jsr	sub_742B
	jsr	L78C4
	lda	$A1
	sta	L79D3
	lda	$A0
	sta	L79D2
	clc
	lda	L79D2
	adc	#$96
	sta	L79D2
	lda	L79D3
	adc	#$01
	sta	L79D3
	ldx	#$4D
	lda	#$06
	jsr	sub_72A0
	lda	L79D2
	and	#$FF
	sta	$A1
	ldx	$A1
	lda	#$06
	jsr	sub_72A0
	lda	#$01
	sta	$85
	lda	#$00
	sta	$84
	lda	L79D3
	tax
	lda	L79D2
	jsr	sub_7143
	sta	$A1
	ldx	$A1
	lda	#$06
	jsr	sub_72A0
	ldx	L773C
	lda	#$06
	jsr	sub_72A0
	lda	#$19
	cmp	$AB62
	bcc	L7A96
	jmp	L7A9E

L7A96:  ldy	#$00
	sty	$AB61
	sty	$AB60
L7A9E:  lda	#$19
	cmp	$AB7C
	bcc	L7AA8
	jmp	L7AB0

L7AA8:  ldy	#$00
	sty	$AB61
	sty	$AB60
L7AB0:  lda	$AB60
	ora	$AB61
	beq	L7ABB
	jmp	L7AE1

L7ABB:  lda	$3C7D
	sta	$AB61
	lda	$3C7C
	sta	$AB60
	lda	#$3C
	sta	$A3
	ldy	#$7E
	ldx	#$AB
	lda	#$62
	jsr	sub_76B4
	lda	#$3C
	sta	$A3
	ldy	#$98
	ldx	#$AB
	lda	#$7C
	jsr	sub_76B4
L7AE1:  lda	L79D3
	sta	$A4
	lda	L79D2
	sta	$A3
	ldy	L7758
	ldx	L7757
	lda	#$06
	jsr	L329F
	lda	$A0
	sta	L79D1
	lda	#$7F
	cmp	L79D1
	bcc	L7B05
	jmp	L7B38

L7B05:  jmp	L7B1A

	.byte	$11,"WRITE ERROR: %U%E"

L7B1A:  lda	#$00
	sta	$A3
	ldy	L79D1
	ldx	#$7B
	lda	#$08
	jsr	sub_742B
	jmp	L7B31

	.byte	$05,"WRITE"

L7B31:  ldx	#$7B
	lda	#$2B
	jsr	L7773
L7B38:  rts

L7B39:  brk
L7B3A:  brk
L7B3B:  brk
L7B3C:  jmp	L7B3F

L7B3F:  ldy	#$01
	sty	L7B39
	lda	$A019
	sta	L7B55
L7B4A:  lda	L7B55
	cmp	L7B39
	bcs	L7B56
	jmp	L7BD8

L7B55:  brk
L7B56:  clc
	lda	L7743
	adc	L7B39
	sta	$AE
	lda	L7744
	adc	#$00
	sta	$AF
	clc
	lda	L7745
	adc	L7B39
	sta	$AC
	lda	L7746
	adc	#$00
	sta	$AD
	lda	#$00
	sta	$85
	ldy	#$00
	lda	($AC),y
	sta	$84
	lda	#$01
	tax
	lda	#$00
	jsr	L710E
	sta	$AA
	txa
	sta	$AB
	clc
	ldy	#$00
	lda	($AE),y
	adc	$AA
	sta	L7B3A
	lda	#$00
	adc	$AB
	sta	L7B3B
	lda	$34B8
	cmp	L7B3A
	lda	$34B9
	sbc	L7B3B
	bcc	L7BAF
	jmp	L7BD2

L7BAF:  lda	L7B39
	jsr	L79D4
	lda	L7735
	cmp	L7B3A
	lda	L7736
	sbc	L7B3B
	bcc	L7BC6
	jmp	L7BD2

L7BC6:  lda	L7B3B
	sta	L7736
	lda	L7B3A
	sta	L7735
L7BD2:  inc	L7B39
	jmp	L7B4A

L7BD8:  rts

L7BD9:  brk

L7BDA:
	.byte   $19,"Dx:>PRO>BASES>BASE_xx.DAT"

L7BF4:  brk
L7BF5:  brk
L7BF6:  jmp	L7BF9

L7BF9:  sta	L7BD9
	sec
	lda	L7BD9
	sbc	#$01
	sta	$AE
	ldx	$AE
	lda	$37A3,x
	sta	L7BDA+2
	lda	#$00
	sta	$85
	lda	#$0A
	sta	$84
	lda	L7BD9
	ldx	#$00
	jsr	sub_7143
	sta	$AE
	clc
	lda	$AE
	adc	#$30
	sta	L7BDA+20
	lda	#$00
	sta	$85
	lda	#$0A
	sta	$84
	lda	L7BD9
	ldx	#$00
	jsr	L7191
	sta	$AE
	clc
	lda	$AE
	adc	#$30
	sta	L7BDA+21
	lda	#$04
	jsr	sub_7234
	ldy	#$00
	sty	L7732
	lda	#$04
	sta	$A3
	lda	#$00
	sta	$A4
	ldy	#$7B
	ldx	#$DA
	lda	#$04
	jsr	sub_71FD
	lda	#$00
	cmp	L7732
	bcc	L7C65
	jmp	L7C6A

L7C65:  lda	#$00
	sta	$A0
	rts

L7C6A:  lda	#$0A
	sta	$A4
	lda	#$00
	sta	$A3
	ldy	L773E
	ldx	L773D
	lda	#$04
	jsr	L329C
	lda	$A1
	sta	L7BF5
	lda	$A0
	sta	L7BF4
	lda	L7BF4
	eor	#$00
	bne	L7C93
	ora	L7BF5
	eor	#$0A
L7C93:  bne	L7C98
	jmp	L7C9D

L7C98:  lda	#$00
	sta	$A0
	rts

L7C9D:  lda	L7BD9
	sta	L773C
	lda	#$01
	sta	$A0
	rts

L7CA8:  brk
L7CA9:  brk
	ora	#$70
L7CAC:  plp
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
	ora	#$70
	asl	a
	brk
	brk
	brk
	brk
	brk
	brk
	brk
L7CDC:  brk
L7CDD:  jmp	L7CE0

L7CE0:  stx	L7CA9
	sta	L7CA8
	jmp	L7CFC

	.byte   $12,"Dx:>PRO>NETWORK>X_"

L7CFC:  lda	#$7C
	sta	$A3
	ldy	#$E9
	ldx	#$7C
	lda	#$AA
	jsr	sub_76B4
	lda	L7CA9
	sta	L7734
	lda	L7CA8
	sta	L7733
	lda	$3EEF
	sta	L7CAC
	lda	#$7C
	sta	$A3
	ldy	#$D2
	ldx	L7CA9
	lda	L7CA8
	jsr	L7341
	lda	#$7C
	sta	$A3
	ldy	#$AA
	ldx	#$7C
	lda	#$D2
	jsr	L324E
	jmp	L7D3F

	.byte   $04,".DAT"

L7D3F:  lda	#$7C
	sta	$A3
	ldy	#$AA
	ldx	#$7D
	lda	#$3A
	jsr	L324E
	lda	#$06
	jsr	sub_7234
	ldy	#$00
	sty	L7732
	lda	#$09
	sta	$A3
	lda	#$00
	sta	$A4
	ldy	#$7C
	ldx	#$AA
	lda	#$06
	jsr	sub_71FD
	lda	#$00
	cmp	L7732
	bcc	L7D71
	jmp	L7D72

L7D71:  rts

L7D72:  ldy	#$01
	sty	L7CDC
L7D77:  lda	#$1F
	cmp	L7CDC
	bcs	L7D81
	jmp	L7DBC

L7D81:  sec
	lda	L7CDC
	sbc	#$01
	sta	$AE
	lda	#$00
	ldx	$AE
	cmp	$37A3,x
	bcc	L7D95
	jmp	L7DB6

L7D95:  ldy	L7CDC
	ldx	#$34
	lda	#$CC
	jsr	L3266
	lda	$A0
	bne	L7DA6
	jmp	L7DB6

L7DA6:  lda	L7CDC
	jsr	L7BF6
	lda	$A0
	bne	L7DB3
	jmp	L7DB6

L7DB3:  jsr	L7B3C
L7DB6:  inc	L7CDC
	jmp	L7D77

L7DBC:  rts

	.byte   $1B
	.byte   $44
L7DBF:  sei
	.byte   $3A
	rol	$5250,x
	.byte   $4F
	rol	$454E,x
	.byte   $54
	.byte   $57
	.byte   $4F
	.byte   $52
	.byte   $4B
	rol	$4345,x
	pha
	.byte   $4F
	lsr	$5445
	rol	$4144
	.byte   $54
	ora	#$70
	.byte   $64
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
	ora	#$70
	asl	a:$00,x
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
	ora	#$70
	asl	a:$00,x
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
	ora	#$70
	.byte   $3C
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
	brk
	brk
	brk
	brk
	brk
	brk
	brk
L7EB5:  brk
L7EB6:  brk
L7EB7:  brk
L7EB8:  brk
L7EB9:  brk
L7EBA:  jmp	L7EBD

L7EBD:  lda	#$02
	jsr	sub_7234
	ldy	#$00
	sty	L7732
	lda	$3EEF
	sta	L7DBF
	lda	#$04
	sta	$A3
	lda	#$00
	sta	$A4
	ldy	#$7D
	ldx	#$BD
	lda	#$02
	jsr	sub_71FD
	lda	#$00
	cmp	L7732
	bcc	L7EE8
	jmp	L7EE9

L7EE8:  rts

L7EE9:  lda	$05C2
	beq	L7EF1
	jmp	L7FEA

L7EF1:  ldy	#$7D
	ldx	#$D9
	lda	#$02
	jsr	L7262
	lda	#$00
	cmp	L7732
	bcc	L7F04
	jmp	L7F07

L7F04:  jmp	L7FEA

L7F07:  lda	#$7E
	sta	$A3
	lda	#$7E
	sta	$A5
	lda	#$5B
	sta	$A4
	lda	#$7E
	sta	$A7
	lda	#$79
	sta	$A6
	ldy	#$3D
	ldx	#$7D
	lda	#$D9
	jsr	L328D
	ldx	#$7E
	lda	#$3D
	jsr	sub_738F
	lda	$A1
	sta	L7EB6
	lda	$A0
	sta	L7EB5
	ldx	#$7E
	lda	#$5B
	jsr	sub_738F
	lda	$A1
	sta	L7EB8
	lda	$A0
	sta	L7EB7
	lda	#$00
	cmp	L7EB5
	lda	#$00
	sbc	L7EB6
	bcc	L7F55
	jmp	L7FE7

L7F55:  lda	#$00
	cmp	L7EB7
	lda	#$00
	sbc	L7EB8
	bcc	L7F64
	jmp	L7FE7

L7F64:  jsr	L321B
	lda	#$7F
	cmp	$A0
	bcc	L7F70
	jmp	L7F7F

L7F70:  jmp	L7F78

	.byte   $04
	.byte   $4F
	bvc	L7FBC
	.byte   $4E
L7F78:  ldx	#$7F
	lda	#$73
	jsr	L7773
L7F7F:  ldx	L7EB8
	lda	L7EB7
	jsr	L3221
	lda	$A0
	cmp	#$80
	bcc	L7F91
	jmp	L7FDF

L7F91:  jsr	L321E
	lda	$A0
	sta	L7EB9
	lda	$34B9
	sta	L7736
	lda	$34B8
	sta	L7735
	ldx	L7EB6
	lda	L7EB5
	jsr	L7CDD
	lda	L7736
	sta	$34B9
	lda	L7735
	sta	$34B8
	.byte   $20
	.byte   $1B
L7FBC:  .byte   $32
	lda	$A0
	cmp	#$80
	bcc	L7FC6
	jmp	L7FD4

L7FC6:  ldx	L7EB8
	lda	L7EB7
	jsr	L3224
	lda	$A0
	sta	L7EB9
L7FD4:  jsr	L321E
	lda	$A0
	sta	L7EB9
	jmp	L7FE7

L7FDF:  jsr	L321E
	lda	$A0
	sta	L7EB9
L7FE7:  jmp	L7EE9

L7FEA:  lda	#$02
	jsr	sub_7234
	rts

sub_7FF0:
	jmp	:+
:	lda	#$7D
	jsr	sub_729D
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
	jmp	L8033

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
L8033:  ldx	#$80
	lda	#$10
	jsr	sub_7227
	jmp	L8060

	.byte   $22
	.byte   $20
	.byte   $20
L8040:  jsr	L2020
	jsr	$FC20
	.byte   $C2
L8047:  .byte   $C2
	.byte   $D3
	ldy	#$C5
	sed
	beq	L8040
	sbc	$F3
	.byte   $F3
	lda	($A0,x)
	bne	L8047
	.byte   $EF
	inc	$E5
	.byte   $F3
	.byte   $F3
	sbc	#$EF
	inc	$ECE1
	.byte   $FC
L8060:  ldx	#$80
	lda	#$3D
	jsr	sub_7227
	jmp	L808D

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
L808D:  ldx	#$80
	lda	#$6A
	jsr	sub_7227
	jmp	L80BA

	.byte   $22
	jsr	L2020
L809B:  jsr	L2020
	jsr	LA0FC
	ldy	#$A0
	ldy	#$A0
	cmp	$F8
	beq	L809B
	sbc	$F3
	.byte   $F3
	dec	$D4C5
	ldy	#$A8
	.byte   $F4
	sbc	$A0A9
	ldy	#$A0
	ldy	#$A0
	.byte   $FC
L80BA:  ldx	#$80
	lda	#$97
	jsr	sub_7227
	jmp	L80E7

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
L80E7:  ldx	#$80
	lda	#$C4
	jsr	sub_7227
	.byte   $4C
L80EF:  .byte   $14
	sta	($22,x)
	jsr	L2020
	jsr	L2020
	jsr	LA0FC
	bne	L80EF
	sbc	$F0
	sbc	($F2,x)
	sbc	#$EE
	.byte   $E7
	ldy	#$E4
	sbc	($F4,x)
	sbc	($F3,x)
	sbc	$F4
	.byte   $F3
	ldy	#$E6
	.byte   $EF
	.byte   $F2
	ldy	#$A0
	.byte   $FC
L8114:  ldx	#$80
	lda	#$F1
	jsr	sub_7227
	jmp	L8141

	.byte   $22
	jsr	L2020
	jsr	L2020
	jsr	LA0FC
	inc	$F4E5
	.byte   $F7
	.byte   $EF
	.byte   $F2
	.byte   $EB
	ldy	#$F4
	.byte   $F2
	sbc	($EE,x)
	.byte   $F3
	sbc	$F3E9
	.byte   $F3
	sbc	#$EF
	inc	$AEAE
	ldy	#$A0
	.byte   $FC
L8141:  ldx	#$81
	lda	#$1E
	jsr	sub_7227
	jmp	L816E

	.byte   $22,"      "
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
L816E:  ldx	#$81
	lda	#$4B
	jsr	sub_7227
	jsr	sub_729B
	jsr	sub_729B
	jsr	sub_729B
	rts

L817F:
	jmp	L8182

L8182:  lda	L7766
	sta	L707E+2
	lda	L7765
	sta	L707E+1
	tsx
	stx	L773B
	jsr	L3212
	lda	#$00
	cmp	$3EEF
	bcc	L819F
	jmp	L81B4

L819F:  lda	#$00
	cmp	$3C7C
	lda	#$00
	sbc	$3C7D
	bcc	L81AE
	jmp	L81B4

L81AE:  jsr	sub_7FF0
	jsr	L7EBA
L81B4:  lda	#$01
	jsr	sub_7234
	lda	#$04
	jsr	sub_7234
	lda	#$06
	jsr	sub_7234
	rts

	rts

	.SEGMENT "S_PREP_LOAD"

	.word	$02E2
	.word	$02E3
	.word	L817F
