; da65 V2.18 - Ubuntu 2.19-1
; Created:    2024-03-29 17:08:43
; Input file: nethost.cmd
; Page:	  1


	.setcpu "6502"

EchoS		:= $3203
Cr_Lf		:= $3209
Suspend		:= $320F
MIOsuspend	:= $3212
Resume		:= $3215
MIOresume	:= $3218
Open_Ulog	:= $321B
Close_Ulog	:= $321E
Read_User	:= $3221
Ck_Range	:= $3227
Chain		:= $322A
L322D		:= $322D
L3230		:= $3230
L3233		:= $3233
L3236		:= $3236
L3239		:= $3239
L323C		:= $323C
L323F		:= $323F
L3257		:= $3257
L325A		:= $325A
L325D		:= $325D
L3260		:= $3260
L3263		:= $3263
L3269		:= $3269
L326C		:= $326C
L326F		:= $326F
L3272		:= $3272
L3275		:= $3275
L3278		:= $3278
L327B		:= $327B
L327E		:= $327E
L3281		:= $3281
L3284		:= $3284
L3287		:= $3287
L328A		:= $328A
L3290		:= $3290
L3293		:= $3293
L3296		:= $3296
L3299		:= $3299
L32A2		:= $32A2
Bytes_In	:= $32A5
L32A8		:= $32A8
L32AB		:= $32AB
L32B1		:= $32B1
L32B4		:= $32B4
L32BA		:= $32BA
L32BD		:= $32BD
L32C6		:= $32C6
L32C9		:= $32C9
L32CC		:= $32CC
L32CF		:= $32CF
L32D2		:= $32D2
L32D5		:= $32D5
L32D8		:= $32D8

t_name		:= $3422
t_pswd		:= $3437

Invoker		:= $3EF5
Trans		:= $3EF6

Parm_1		:= $404F

L7CC2		:= $7CC2

AFP		:= $D800
FASC		:= $D8E6
IFP		:= $D9AA
FPI		:= $D9D2
FMUL		:= $DADB
FLD0R		:= $DD89
FMOVE		:= $DDB6

CIOV		 := $E456

	.SEGMENT	"S_HOST_HDR"

	.word	$ffff
	.word	$7000
	.word	$7cc1

	.SEGMENT	"S_HOST_CODE"

	jmp	L7040

	.byte	$10,$09,$1e
	.byte	"XC-65, The C Cross-Compiler"

	.byte   $9B

	.byte	"(c) 1988 Orion Micro Systems"
	
	.byte	$01,$60

L7040:  lda	#$EA
	ldx	#$7C
	sta	$A0
	stx	$A1
	lda	#<L70C4
	ldx	#>L70C4
	sta	$A2
	stx	$A3
	jsr	L7A51
	lda	$3EEF
	ldx	#$00
	jsr	L772C
	lda	#$02
	ldx	#$00
	jsr	sub_7740
	lda	#$EA
	ldx	#$7C
	jsr	L773B
	jsr	L7731
	jsr	L7756
	lda	#<L70D7
	ldx	#>L70D7
	sta	$A0
	stx	$A1
	lda	#$7D
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_7795
	jsr	L711D
	sta	a:$94
	stx	a:$95
	ora	a:$95
	bne	L7093
	jmp	L70B8

L7093:  lda	#$C0
	ldx	#$00
	sta	Invoker
	lda	#<Parm_1
	ldx	#>Parm_1
	sta	$A0
	stx	$A1
	lda	#$EA
	ldx	#$7C
	sta	$A2
	stx	$A3
	jsr	L7A51
	lda	#<L710B
	ldx	#>L710B
	sta	$A0
	stx	$A1
	jsr	j_Chain
L70B8:  lda	#<L7114
	ldx	#>L7114
	sta	$A0
	stx	$A1
	jsr	j_Chain
	rts

L70C4:
	.byte   $12,"Dx:>PRO>NETWORK>X_"

L70D7:
	.byte   $33,"%c%e%e%e%e%e     __ExpressNET! Host Activated__%e%e"

L710B:
	.byte	$08,"NETMODEM"

L7114:
	.byte	$08,"WAITCALL"

L711D:  lda	#$00
	ldx	#$00
	sta	Trans
	lda	#<L7601
	ldx	#>L7601
	sta	$A0
	stx	$A1
	jsr	sub_7795
	lda	#$00
	ldx	#$00
	sta	$3F10
	lda	#$00
	ldx	#$00
	sta	L75F0
	jsr	L7707
L7140:  jsr	j_Bytes_In
	sta	a:$94
	stx	a:$95
	ora	a:$95
	bne	L7151
	jmp	L715F

L7151:  lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	jsr	L78DF
	sta	L75F0
L715F:  lda	L75F0
        ldx     #$00
	sta	a:$94
	stx	a:$95
	lda	#$FD
	ldx	#$00
	jsr	sub_776E
	bne	L7176
	jmp	L7190

L7176:  lda	$3F10
	ldx	#$00
	sta	a:$94
	stx	a:$95
	lda	#$14
	ldx	#$00
	jsr	sub_776E
	bmi	L718D
	jmp	L7190

L718D:  jmp	L7140

L7190:  lda	L75F0
	ldx	#$00
	sta	a:$94
	stx	a:$95
	lda	#$FD
	ldx	#$00
	jsr	sub_776E
	bne	L71A7
	jmp	L71AC

L71A7:  lda	#$00
	ldx	#$00
	rts

L71AC:  lda	#$00
	ldx	#$00
	sta	$3F10
	lda	#$00
	ldx	#$00
	sta	L75EF
	lda	#$00
	ldx	#$00
	sta	L75FC
L71C1:  inc	L75FC
	jsr	L7707
	lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$18
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_78CD
	lda	#$00
	ldx	#$00
	sta	L75EE
	lda	#$00
	ldx	#$00
	sta	L75FB
L71E8:  lda	L75FB
	ldx	#$00
	sta	a:$94
	stx	a:$95
	lda	#$15
	ldx	#$00
	jsr	sub_776E
	bmi	L7205
	jmp	L7241

L71FF:  inc	L75FB
	jmp	L71E8

L7205:  lda	#$03
	ldx	#$00
	sta	$A0
	stx	$A1
	jsr	L76B3
	jsr	L772C
	lda	L75FB
	ldx	#$00
	jsr	sub_7740
	lda	#<L7CC2
	ldx	#>L7CC2
	jsr	L773B
	jsr	L7731
	jsr	L7756
	lda	$7D14
	ldx	#$00
	sta	a:$94
	stx	a:$95
	ora	a:$95
	bne	L723B
	jmp	L723E

L723B:  jmp	L7241

L723E:  jmp	L71FF

L7241:  .byte   $AD
	.byte   $14
L7243:  adc	a:$A2,x
	sta	a:$94
	stx	a:$95
	lda	#$00
	ldx	#$00
	jsr	sub_776E
	beq	L7258
	jmp	L7415

L7258:  lda	#$00
	ldx	#$00
	sta	L75EE
	lda	#$00
	ldx	#$00
        sta     L75FB
L7266:  lda	L75FB
	ldx	#$00
	sta	a:$94
	stx	a:$95
	lda	#$14
	ldx	#$00
	jsr	sub_776E
	bmi	L7283
	jmp	L72A3

L727D:  inc	L75FB
	jmp	L7266

L7283:  lda	L75EE
	ldx	#$00
	jsr	L7736
	lda	L75FB
	ldx	#$00
	jsr	sub_7740
	lda	#<L7CC2
	ldx	#>L7CC2
	jsr	L7745
	jsr	L7B16
	sta	L75EE
	jmp	L727D

L72A3:  lda	L75EE
	ldx	#$00
	sta	a:$94
	stx	a:$95
	lda	#$14
	ldx	#$00
	jsr	sub_7740
	lda	#<L7CC2
	ldx	#>L7CC2
	jsr	L7745
	jsr	sub_776E
	beq	L72C4
	jmp	L7415

L72C4:  lda	#$11
	ldx	#$00
	jsr	sub_7740
	lda	#<L7CC2
	ldx	#>L7CC2
	jsr	L7745
	jsr	L7736
	lda	#$00
	ldx	#$01
	jsr	L7B29
	jsr	L7736
	lda	#$10
	ldx	#$00
	jsr	sub_7740
	lda	#<L7CC2
	ldx	#>L7CC2
	jsr	L7745
	jsr	L7B16
	sta	$7D12
	stx	$7D13
	lda	#$13
	ldx	#$00
	jsr	sub_7740
	lda	#<L7CC2
	ldx	#>L7CC2
	jsr	L7745
	jsr	L7736
	lda	#$00
	ldx	#$01
	jsr	L7B29
	jsr	L7736
	lda	#$12
	ldx	#$00
	jsr	sub_7740
	lda	#<L7CC2
	ldx	#>L7CC2
	jsr	L7745
	jsr	L7B16
	sta	L75FD
L7325:  stx	L75FE
	lda	#<L7625
	ldx	#>L7625
	sta	$A0
	stx	$A1
	lda	$7D12
	ldx	$7D13
	sta	$A2
	stx	$A3
	jsr	sub_7795
	lda	#<L7635
	ldx	#>L7635
	sta	$A0
	stx	$A1
	lda	L75FD
	ldx	L75FE
	sta	$A2
	stx	$A3
	jsr	sub_7795
	lda	#<L7641
        ldx     #>L7641
	sta	$A0
	stx	$A1
        lda     #<L7CC2
	ldx	#>L7CC2
	sta	$A2
	stx	$A3
	jsr	sub_7795
	jsr	j_MIOsuspend
	jsr	j_Open_Ulog
	sta	a:$94
	stx	a:$95
	lda	#$80
	ldx	#$00
	jsr	sub_776E
	bmi	L737D
	jmp	L740F

L737D:  lda	L75FD
	ldx	L75FE
	sta	$A0
	stx	$A1
	jsr	j_Read_User
	sta	a:$94
	stx	a:$95
	lda	#$80
	ldx	#$00
	jsr	sub_776E
	bmi	L739C
	jmp	L740F

L739C:  lda	#<t_pswd
	ldx	#>t_pswd
	sta	$A0
	stx	$A1
	lda	#<L7CC2
	ldx	#>L7CC2
	sta	$A2
	stx	$A3
	jsr	L7A66
	sta	a:$94
	stx	a:$95
	lda	#$00
	ldx	#$00
	jsr	sub_776E
	bne	L73C1
	jmp	L73CF

L73C1:  lda	#<L764D
	ldx	#>L764D
	sta	$A0
	stx	$A1
	jsr	sub_7795
	jmp	L740F

L73CF:  lda	#<t_name
	ldx	#>t_name
	sta	$A0
	stx	$A1
	jsr	L7AEC
	sta	L75FF
	stx	L7600
	lda	L75FF
	ldx	L7600
	sta	a:$94
	stx	a:$95
	lda	$7D12
	ldx	$7D13
	jsr	sub_776E
	beq	L73FA
	jmp	L7404

L73FA:  lda	#$01
	ldx	#$00
	sta	L75EF
	jmp	L740F

L7404:  lda	#<L7663
	ldx	#>L7663
	sta	$A0
	stx	$A1
	jsr	sub_7795
L740F:  jsr	j_Close_Ulog
	jsr	j_MIOresume
L7415:  lda	L75EF
	ldx	#$00
	sta	a:$94
	stx	a:$95
	lda	#$00
	ldx	#$00
	jsr	sub_776E
	beq	L742C
	jmp	L7446

L742C:  lda	L75FC
	ldx	#$00
	sta	a:$94
	stx	a:$95
	lda	#$0A
	ldx	#$00
	jsr	sub_776E
	bmi	L7443
	jmp	L7446

L7443:  jmp	L71C1

L7446:  lda	L75FC
	ldx	#$00
	sta	a:$94
	stx	a:$95
	lda	#$09
	ldx	#$00
	jsr	sub_776E
	cmp	#$01
	beq	L745F
	jmp	L7464

L745F:  lda	#$00
	ldx	#$00
	rts

L7464:  lda	#<L767C
	ldx	#>L767C
	sta	$A0
	stx	$A1
	lda	$7D12
	ldx	$7D13
	sta	$A2
	stx	$A3
	jsr	sub_7795
	lda	$7D12
	ldx	$7D13
	sta	$A0
	stx	$A1
	lda	#$F1
	ldx	#$75
	sta	$A2
	stx	$A3
	jsr	L7B70
	lda	#$EA
	ldx	#$7C
	sta	$A0
	stx	$A1
	lda	#$F1
	ldx	#$75
	sta	$A2
	stx	$A3
	jsr	L7AA8
	lda	#$EA
	ldx	#$7C
	sta	$A0
	stx	$A1
	lda	#$93
	ldx	#$76
	sta	$A2
	stx	$A3
	jsr	L7AA8
	jsr	j_MIOsuspend
	lda	#$01
	ldx	#$00
	sta	L75ED
	lda	#$02
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$EA
	ldx	#$7C
	sta	$A2
	stx	$A3
	lda	#$04
	ldx	#$00
	sta	$A4
	stx	$A5
	lda	#$00
	ldx	#$00
	sta	$A6
	stx	$A7
	jsr	L78E7
	sta	a:$94
	stx	a:$95
	lda	#$01
	ldx	#$00
	jsr	sub_776E
	bne	L74F3
	jmp	L74FA

L74F3:  lda	#$00
	ldx	#$00
	sta	L75ED
L74FA:  lda	#$02
	ldx	#$00
	sta	$A0
	stx	$A1
	jsr	sub_792B
	jsr	j_MIOresume
	lda	L75ED
	ldx	#$00
	sta	a:$94
	stx	a:$95
	lda	#$00
	ldx	#$00
	jsr	sub_776E
	beq	L751F
	jmp	L759B

L751F:  lda	#$98
	ldx	#$76
	sta	$A0
	stx	$A1
	lda	$7D12
	ldx	$7D13
	sta	$A2
	stx	$A3
	jsr	sub_7795
	lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$04
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_78CD
	lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$04
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_78CD
	lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$04
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_78CD
	lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$04
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_78CD
	lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$04
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_78CD
	lda	#$00
	ldx	#$00
	rts

	jmp	L75EC

L759B:  lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$06
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_78CD
	lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$06
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_78CD
	lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$06
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_78CD
	lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	lda	#$06
	ldx	#$00
	sta	$A2
	stx	$A3
	jsr	sub_78CD
	lda	#$01
	ldx	#$00
	rts

L75EC:  rts

L75ED:  brk
L75EE:  brk
L75EF:  brk
L75F0:  brk
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
L75FB:  brk
L75FC:  brk
L75FD:  brk
L75FE:  brk
L75FF:  brk
L7600:  brk

L7601:
	.byte   $23,"%eHandshaking with remote caller..."

L7625:
	.byte   $0F,"%e%e Node: %d%e"

L7635:
	.byte   $0B," User: %d%e"

L7641:
	.byte   $0B,"Pword: %s%e"

L764D:
	.byte	$15,"%eInvalid password!%e"

L7663:
	.byte	$18,"%eInvalid node access!%e"

L767C:
	.byte	$16,"%e%eNode #%d online!%e"
	.byte   $04,".DAT"
	.byte   $1A,"%e%eNo packet to send...%e"

L76B3:  lda	$A0
	sta	L7706
	lda	#$00
        ldx     #$00
	sta	$7D14
	lda	#$00
	ldx	#$00
	sta	$3F10
L76C6:  jsr	j_Bytes_In
	sta	a:$94
	stx	a:$95
	ora	a:$95
	bne	L76D7
	jmp	L76E3

L76D7:  lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	jsr	L78DF
	rts

L76E3:  lda	$3F10
	ldx	#$00
	sta	a:$94
	stx	a:$95
	lda	L7706
	ldx	#$00
	jsr	sub_776E
	bmi	L76FB
	jmp	L76FE

L76FB:  jmp	L76C6

L76FE:  lda	#$01
	ldx	#$00
	.byte   $8D
L7703:  .byte   $14
	.byte   $7D
	rts

L7706:  brk
L7707:  jsr	j_Bytes_In
	sta	a:$94
	stx	a:$95
	ora	a:$95
	bne	L7718
	jmp	L7729

L7718:  lda	#$05
	ldx	#$00
	sta	$A0
	stx	$A1
	jsr	L78DF
	sta	L772A
	jmp	L7707

L7729:  rts

L772A:  brk
	rts

L772C:  sta	$98
	stx	$99
	rts

L7731:  lda	$98
	ldx	$99
	rts

L7736:  sta	$84
	stx	$85
	rts

L773B:  sta	$80
	stx	$81
	rts

sub_7740:
	sta	$82
	stx	$83
	rts

L7745:  clc
	adc	$82
	sta	$80
	txa
	adc	$83
	sta	$81
	ldy	#$00
	lda	($80),y
	ldx	#$00
	rts

L7756:  pha
	jsr	L7760
	ldy	#$00
	pla
	sta	($80),y
	rts

L7760:  lda	$80
	clc
	adc	$82
	sta	$80
	lda	$81
	adc	$83
	sta	$81
	rts

sub_776E:
	sta	$96
	stx	$97
	lda	$95
	cmp	$97
	bcc	L7786
	beq	L777C
	bcs	L7789
L777C:  lda	$94
	cmp	$96
	bcc	L7786
	beq	L778C
	bcs	L7789
L7786:  lda	#$FF
	rts

L7789:  lda	#$01
	rts

L778C:  lda	#$00
	rts

L778F:  asl	a
	asl	a
	asl	a
	asl	a
	tax
	rts

sub_7795:  
	lda	#$00
	jmp	L779A

L779A:  sta	L78B5
	lda	$A0
	sta	$92
	lda	$A0+1
	sta	$92+1
	ldy	#$00
L77A7:  lda	$A2,y
	sta	L78B9,y
	iny
	cpy	#$12
	bcc	L77A7
	ldy	#$00
	sty	L78B8
	lda	($92),y
	sta	L78B6
	iny
	sty	L78B7
L77C0:  ldy	L78B7
	cpy	L78B6
	bcc	L77CF
	beq	L77CF
	lda	#$01
	ldx	#$00
	rts

L77CF:  lda	($92),y
	cmp	#'%'
	beq	L77EA
L77D5:  sta	$A0
	ldx	L78B5
	jsr	sub_7A23
	bmi	L77E5
L77DF:  inc	L78B7
	jmp	L77C0

L77E5:  lda	#$00
	ldx	#$00
	rts

L77EA:  iny
	sty	L78B7
	lda	($92),y
	cmp	#'s'
	beq	L781B
	cmp	#'d'
	beq	L783F
	cmp	#'e'
	beq	L780E
	cmp	#'c'
	beq	L7860
	cmp	#'h'
	beq	L7873
	cmp	#'f'
	bne	L780B
	jmp	L7894

L780B:  jmp	L77D5

L780E:  lda	#$9B
	ldx	L78B5
	jsr	sub_7A23
	bmi	L77E5
	jmp	L77DF

L781B:  lda	L78B8
	asl	a
	tay
	lda	L78B9,y
	sta	$A0
	lda	L78BA,y
	sta	$A1
	ldx	L78B5
	lda	$A0
	ldy	$A1
	jsr	sub_7943
	bmi	L783C
	inc	L78B8
	jmp	L77DF

L783C:  jmp	L77E5

L783F:  lda	L78B8
	asl	a
	tay
	lda	L78B9,y
	sta	$A0
	lda	L78BA,y
	sta	$A1
	ldx	L78B5
	lda	$A0
	ldy	$A1
	jsr	sub_796C
	bmi	L783C
	inc	L78B8
	jmp	L77DF

L7860:  lda	L78B8
	asl	a
	tay
	lda	L78B9,y
	ldx	L78B5
	jsr	sub_7A23
	bmi	L783C
	jmp	L77DF

L7873:  lda	L78B8
	asl	a
	tay
	lda	L78B9,y
	sta	$A0
	lda	L78BA,y
	sta	$A1
	ldx	L78B5
	lda	$A0
	ldy	$A1
	jsr	L79C9
	bmi	L783C
	inc	L78B8
	jmp	L77DF

L7894:  lda	L78B8
	asl	a
	tay
	lda	L78B9,y
	sta	$A0
	lda	L78BA,y
	sta	$A1
	ldx	L78B5
	lda	$A0
	ldy	$A1
	jsr	L799C
	bmi	L783C
	inc	L78B8
	jmp	L77DF

L78B5:  brk
L78B6:  brk
L78B7:  brk
L78B8:  brk
L78B9:  brk
L78BA:  brk
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

sub_78CD:
	ldx	$A0
	lda	$A2
	jsr	sub_7A23
	bpl	L78DA
	lda	#$00
	beq	L78DC
L78DA:  lda	#$01
L78DC:  ldx	#$00
	rts

L78DF:  ldx	$A0
	jsr	L7A3B
	ldx	#$00
	rts

L78E7:  jsr	sub_792B
	lda	$A2
	sta	$8A
	lda	$A3
	sta	$8B
	jsr	L7B94
	lda	$A0
	jsr	L778F
	lda	#$03 ; open channel
	sta	$0342,x
	lda	#$80
	sta	$0344,x
	lda	#$05
	sta	$0345,x
	lda	#$50
	sta	$0348,x
	lda	#$00
	sta	$0349,x
	lda	$A4
	sta	$034A,x
	lda	$A6
	sta	$034B,x
	jsr	CIOV
	bpl	L7926
	lda	#$00
	beq	L7928
L7926:  lda	#$01
L7928:  ldx	#$00
	rts

sub_792B:
	lda	$A0
	jsr	L778F
	lda	#$0C ; close channel
	sta	$0342,x
	jsr	CIOV
	bpl	L793E
	lda	#$00
	beq	L7940
L793E:  lda	#$01
L7940:  ldx	#$00
	rts

sub_7943:
	stx	L796B
	sta	$8A
	sty	$8B
	ldy	#$00
	lda	($8A),y
	sta	$A0
	iny
	sty	$A1
L7953:  ldy	$A1
	cpy	$A0
	bcc	L795C
	beq	L795C
	rts

L795C:  lda	($8A),y
	ldx	L796B
	jsr	sub_7A23
	bmi	L796A
	inc	$A1
	bne	L7953
L796A:  rts

L796B:  brk

sub_796C:  
	stx	L799A
	sta	$D4
	sty	$D5
	jsr	IFP
	jsr	FASC
	ldy	#$00
L797B:  lda	($F3),y
	sta	L799B
	and	#$7F
	ldx	L799A
	sty	L7999
	jsr	sub_7A23
	bmi	L7998
	ldy	L7999
	iny
	lda	L799B
	bpl	L797B
	lda	#$00
L7998:  rts

L7999:  brk
L799A:  brk
L799B:  brk
L799C:  stx	L79C7
	tax
	jsr	FLD0R
	jsr	FASC
	ldy	#$00
L79A8:  lda	($F3),y
	sta	L79C8
	and	#$7F
	ldx	L79C7
	sty	L79C6
	jsr	sub_7A23
	bmi	L79C5
	ldy	L79C6
	iny
	lda	L79C8
	bpl	L79A8
	lda	#$00
L79C5:  rts

L79C6:  brk
L79C7:  brk
L79C8:  brk
L79C9:  stx	L7A10
	sta	L7A11
	sty	L7A12
	lda	L7A12
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	jsr	L79F9
	lda	L7A12
	and	#$0F
	jsr	L79F9
	lda	L7A11
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	jsr	L79F9
	lda	L7A11
	and	#$0F
	jsr	L79F9
	lda	#$00
	rts

L79F9:  tay
	lda	L7A13,y
	ldx	L7A10
	jsr	sub_7A23
	bmi	L7A06
	rts

L7A06:  sty	L7A0F
	pla
	pla
	ldy	L7A0F
	rts

L7A0F:  brk
L7A10:  brk
L7A11:  brk
L7A12:  brk

L7A13:  .byte	"0123456789ABCDEF"

sub_7A23:
	pha
	txa
	asl	a
	asl	a
	asl	a
	asl	a
	tax
	lda	#$0B ; put binary record
	sta	$0342,x
	lda	#$00
	sta	$0348,x
	sta	$0349,x
	pla
	jmp	CIOV

L7A3B:  txa
	asl	a
	asl	a
	asl	a
	asl	a
	tax
	lda	#$07 ; get binary record
	sta	$0342,x
L7A46:  lda	#$00
	sta	$0348,x
	sta	$0349,x
	jmp	CIOV

L7A51:  jsr	L7B5F
	ldy	#$00
	lda	($8C),y
	tay
L7A59:  lda	($8C),y
	sta	($8A),y
	cpy	#$00
	beq	L7A65
	dey
	jmp	L7A59

L7A65:  rts

L7A66:  lda	#$00
	jmp	L7A6B

L7A6B:  sta	L7AA7
	jsr	L7B5F
	ldy	#$00
	lda	($8A),y
	sta	L7AA5
L7A78:  lda	($8A),y
	bit	L7AA7
	bmi	L7A82
	jsr	ToUpper
L7A82:  sta	L7AA6
	lda	($8C),y
	bit	L7AA7
	bmi	L7A8F
	jsr	ToUpper
L7A8F:  cmp	L7AA6
	bne	L7A9C
	cpy	L7AA5
	beq	L7AA0
	iny
	bne	L7A78
L7A9C:  lda	#$01
	bne	L7AA2
L7AA0:  lda	#$00
L7AA2:  ldx	#$00
	rts

L7AA5:  brk
L7AA6:  brk
L7AA7:  brk
L7AA8:  jsr	L7B5F
	ldy	#$00
	lda	($8C),y
	sta	L7AEB
	beq	L7ADE
	lda	($8A),y
	sta	L7AEA
	inc	L7AE9
	inc	L7AEA
	ldy	#$01
	sty	L7AE9
L7AC4:  ldy	L7AE9
	lda	($8C),y
	ldy	L7AEA
	sta	($8A),y
	lda	L7AE9
	cmp	L7AEB
	beq	L7ADE
	inc	L7AE9
	inc	L7AEA
	bne	L7AC4
L7ADE:  ldy	#$00
	lda	($8A),y
	clc
	adc	L7AEB
	sta	($8A),y
	rts

L7AE9:  .byte   $01
L7AEA:  .byte   $01
L7AEB:  .byte   $01
L7AEC:  lda	$A0
	sta	$8A
	lda	$A1
	sta	$8B
	jsr	L7B94
	lda	#$80
	sta	$F3
	lda	#$05
	sta	$F4
	lda	#$00
	sta	$F2
	jsr	AFP
	bcs	L7B12
	jsr	FPI
	bcs	L7B12
	lda	$D4
	ldx	$D5
	rts

L7B12:  lda	#$00
	tax
	rts

L7B16:  sta	$86
	stx	$87
	lda	$84
	clc
	adc	$86
	sta	$84
	lda	$85
	adc	$87
	tax
	lda	$84
	rts

L7B29:  sta	$86
	stx	$87
	lda	$84
	sta	$D4
	lda	$85
	sta	$D5
	jsr	IFP
	jsr	FMOVE
	lda	$86
	sta	$D4
	lda	$87
	sta	$D5
	jsr	IFP
	jsr	FMUL
	jsr	FPI
	lda	$D4
	ldx	$D5
	rts

ToUpper:
	cmp	#'a'
	bcc	L7B5E
	cmp	#'z'+1
	beq	L7B5E
	bcs	L7B5E
	sec
	sbc	#$20
L7B5E:  rts

L7B5F:  lda	$A0
	sta	$8A
	lda	$A1
	sta	$8B
	lda	$A2
	sta	$8C
	lda	$A3
	sta	$8D
	rts

L7B70:  jmp	L7B73

L7B73:  lda	$A0
	sta	$D4
	lda	$A1
	sta	$D5
	jsr	IFP
	jsr	FASC
	ldy	#$00
L7B83:  lda	($F3),y
	php
	and	#$7F
	iny
	sta	($A2),y
	plp
	bpl	L7B83
	tya
	ldy	#$00
	sta	($A2),y
	rts

L7B94:  ldy	#$00
	lda	($8A),y
	sta	L7BBC
	beq	L7BB8
	iny
	inc	L7BBC
L7BA1:  lda	($8A),y
	dey
	sta	$0580,y
	iny
	iny
	cpy	L7BBC
	bne	L7BA1
	ldy	L7BBC
	dey
L7BB2:  lda	#$9B
	sta	$0580,y
	rts

L7BB8:  ldy	#$00
	beq	L7BB2
L7BBC:  ora	($4C,x)
	brk
	.byte   $32
	jmp	EchoS

	jmp	Cr_Lf

	jmp	Suspend

j_MIOsuspend:
	jmp	MIOsuspend

	jmp	Resume

j_MIOresume:  
	jmp	MIOresume

j_Open_Ulog:
	jsr	Open_Ulog
	lda	$A0
	ldx	#$00
	rts

j_Close_Ulog:
	jmp	Close_Ulog

j_Read_User:
	jsr	Read_User
	lda	$A0
	ldx	#$00
	rts

	jsr	Ck_Range
	lda	$A0
	ldx	#$00
	rts

j_Chain:
	jmp	Chain

	jmp	L322D

	jsr	L3230
	lda	$A0
	ldx	#$00
	rts

	jsr	L3233
	lda	$A0
	ldx	#$00
	rts

	jsr	L3236
	lda	$A0
	ldx	$A1
	rts

	jmp	L3239

	jmp	L323C

	jmp	L323F

	jmp	L3284

	jmp	L3257

	jmp	L325A

	jmp	L325D

	jmp	L3260

	jmp	L3263

	jsr	L3269
	lda	$A0
	ldx	$A1
	rts

	jsr	L326C
	lda	$A0
	ldx	$A1
	rts

	jsr	L326F
	lda	$A0
	ldx	$A1
	rts

	jsr	L3272
	lda	$A0
	ldx	$A1
	rts

	jsr	L3275
	lda	$A0
	ldx	#$00
	rts

	jmp	L3278

	jmp	L327B

	jmp	L327E

	jmp	L3281

	jmp	L3287

	jmp	L328A

	jmp	L3290

	jmp	L3293

	jmp	L3296

	jmp	L3299

	jmp	L32A2

j_Bytes_In:
	jsr	Bytes_In
	lda	$A0
	ldx	#$00
	rts

	jsr	L32A8
	lda	$A0
	ldx	#$00
	rts

	jsr	L32AB
	lda	$A0
	ldx	#$00
	rts

	ldy	$A2
	lda	$A1
	tax
	lda	$A0
	jmp	L32B1

	ldy	$A2
	lda	$A1
	tax
	lda	$A0
	jmp	L32B4

	ldy	$A4
	ldx	$A2
	lda	$A0
	jmp	L32BA

	ldy	$A4
	ldx	$A2
	lda	$A0
	jmp	L32BD

	jmp	L32C6

	jmp	L32C9

	jmp	L32CC

	jmp	L32CF

	jmp	L32D2

	jmp	L32D5

	jmp	L32D8

	.SEGMENT	"S_HOST_LOAD"

	.word	$02E0
	.word	$02E1
	.word	L7040
