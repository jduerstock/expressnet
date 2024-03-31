; da65 V2.18 - Ubuntu 2.19-1
; Created:    2024-03-31 11:54:36
; Input file: netprep.cmd
; Page:       1


        .setcpu "6502"

L000A           := $000A
L2020           := $2020
L209C           := $209C
L3212           := $3212
L321B           := $321B
L321E           := $321E
L3221           := $3221
L3224           := $3224
L324E           := $324E
L3266           := $3266
L328D           := $328D
L329C           := $329C
L329F           := $329F
L4225           := $4225
L5245           := $5245
L5525           := $5525
L6F4E           := $6F4E
L6FC3           := $6FC3
L6FCF           := $6FCF
L9281           := $9281
L9291           := $9291
L929A           := $929A
LA0FC           := $A0FC
LC2FC           := $C2FC
LD8E6           := $D8E6
LD9AA           := $D9AA
LE456           := $E456

	.SEGMENT "S_PREP_HDR"

	.word	$FFFF
	.word	$7000
        .word   $81C4

	.SEGMENT "S_PREP_CODE"

	jmp	L817F

	.byte	$10
        ora     $01
        cli
        brk
        .byte	$70,$C5
        sta     ($02,x)
        brk
L700D:  ldx     #$FF
        stx     $A6
        ldy     #$0C
        bne     L701F
L7015:  sty     $A6
        ldy     #$0B
        bne     L701F
L701B:  sty     $A6
        ldy     #$05
L701F:  stx     $A5
        ldx     #$00
        stx     $A3
L7025:  asl     a
        asl     a
        asl     a
        asl     a
        tax
        tya
        sta     $0342,x
        lda     $A3
        beq     L703C
        sta     $034A,x
        lda     $A4
        sta     $034B,x
        lda     #$00
L703C:  tay
        sta     $0349,x
        lda     ($A5),y
        sta     $0348,x
        beq     L7059
        clc
        lda     $A5
        adc     #$01
        sta     $0344,x
        lda     $A6
        adc     #$00
        sta     $0345,x
        jmp     LE456

L7059:  rts

L705A:  stx     $A5
        sty     $A6
        ldy     #$03
        jmp     L7025

L7063:  stx     $A5
        sty     $A6
        ldx     #$00
        stx     $A3
        ldy     #$09
        jsr     L7025
        bne     L707C
        lda     #$0B
        sta     $0342,x
        lda     #$9B
        jmp     LE456

L707C:  rts

L707D:  brk
L707E:  .byte   $4C
L707F:  .byte   $81
L7080:  .byte   $70
L7081:  sta     L707D
        jmp     (L000A)

        .byte   $13
        ora     ($01),y
        .byte   $83
L708B:  tsx
        stx     $04C1
        ldy     #$80
        tya
        jmp     L707E

        ldy     $84
        beq     L70A3
        stx     $85
L709B:  asl     a
        rol     $85
        dey
        bne     L709B
        ldx     $85
L70A3:  rts

        ldy     $84
        beq     L70B2
        stx     $85
L70AA:  lsr     $85
        ror     a
        dey
        bne     L70AA
        ldx     $85
L70B2:  rts

L70B3:  ldy     $D3
        bpl     L70C7
L70B7:  sta     $86
        stx     $87
        sec
        lda     #$00
        sbc     $86
        tay
        lda     #$00
        sbc     $87
        tax
        tya
L70C7:  rts

L70C8:  stx     $D3
        cpx     #$00
        bpl     L70D1
        jsr     L70B7
L70D1:  sta     $82
        stx     $83
        lda     $85
        bpl     L70E7
        tax
        eor     $D3
        sta     $D3
        lda     $84
        jsr     L70B7
        sta     $84
        stx     $85
L70E7:  lda     #$00
        sta     $87
        rts

L70EC:  beq     L7109
        dex
        stx     $C7
        tax
        beq     L7109
        stx     $C6
        lda     #$00
        ldx     #$08
L70FA:  asl     a
        asl     $C6
        bcc     L7101
        adc     $C7
L7101:  dex
        bne     L70FA
        clc
        adc     $87
        sta     $87
L7109:  lda     $86
        ldx     $87
        rts

L710E:  jsr     L70C8
        ldx     $82
        beq     L7130
        stx     $C6
        ldx     $84
        beq     L7130
        dex
        stx     $C7
        ldx     #$08
L7120:  asl     a
        rol     $87
        asl     $C6
        bcc     L712D
        adc     $C7
        bcc     L712D
        inc     $87
L712D:  dex
        bne     L7120
L7130:  sta     $86
        lda     $82
        ldx     $85
        jsr     L70EC
        lda     $83
        ldx     $84
        jsr     L70EC
        jmp     L70B3

L7143:  jsr     L70C8
        lda     $85
        beq     L7171
        ldx     #$08
L714C:  rol     $82
        rol     $83
        rol     $87
        sec
        lda     $83
        sbc     $84
        tay
        lda     $87
        sbc     $85
        bcc     L7162
        sta     $87
        sty     $83
L7162:  dex
        bne     L714C
        lda     $82
        rol     a
        ldx     #$00
        ldy     $83
        sty     $86
        jmp     L70B3

L7171:  ldx     #$10
L7173:  rol     $82
        rol     $83
        rol     a
        bcs     L717E
        cmp     $84
        bcc     L7181
L717E:  sbc     $84
        sec
L7181:  dex
        bne     L7173
        rol     $82
        rol     $83
        sta     $86
        lda     $82
        ldx     $83
        jmp     L70B3

L7191:  jsr     L7143
        lda     $86
        ldx     $87
        rts

        sta     $A0
        stx     $A1
        sty     $A2
        clc
        pla
        sta     $84
        adc     #$03
        tay
        pla
        sta     $85
        adc     #$00
        pha
        tya
        pha
        ldy     #$01
        lda     ($84),y
        sta     $82
        iny
        lda     ($84),y
        sta     $83
        iny
        lda     ($84),y
        tay
L71BD:  lda     $A0,y
        sta     ($82),y
        dey
        bpl     L71BD
        lda     $11
        bne     L71D8
        inc     $11
        jmp     L708B

        php
        .byte   $63
        ora     #$11
        ora     $1318,y
        and     ($23,x)
        .byte   $33
L71D8:  rts

L71D9:  bpl     L71F1
        cpy     #$88
        beq     L71E7
        tya
        cpy     #$80
        beq     L71F6
        jmp     L707E

L71E7:  txa
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        tax
        tya
        sta     $05C0,x
L71F1:  rts

        ldx     #$01
        stx     $11
L71F6:  pha
        jsr     L708B
        pla
        tay
        rts

L71FD:  pha
        stx     $A1
        sty     $A2
        tay
        lda     #$00
        sta     $05C0,y
        tay
        lda     ($A1),y
        sta     $0500
        tay
        iny
        lda     #$9B
        bne     L7216
L7214:  lda     ($A1),y
L7216:  sta     $0500,y
        dey
        bne     L7214
        pla
        ldx     #$00
        ldy     #$05
        jsr     L705A
        jmp     L71D9

L7227:  stx     $A1
        tax
        ldy     $A1
        lda     $B7
        jsr     L7063
        jmp     L71D9

L7234:  jsr     L700D
        jmp     L71D9

L723A:  stx     $A1
        tax
        ldy     $A1
        lda     $B7
        jsr     L7015
        jmp     L71D9

L7247:  jsr     L701B
        sty     $A0
        lda     $0348,x
        beq     L7254
        sec
        sbc     #$01
L7254:  ldy     #$00
        sta     ($A5),y
        ldy     $A0
        rts

        stx     $A2
        tax
        ldy     $A2
        lda     $B7
L7262:  pha
        lda     #$FF
        sta     $A3
        pla
        pha
        stx     $A1
        sty     $A2
        ldy     #$00
        lda     $A3
        sta     ($A1),y
        pla
        ldy     $A2
L7276:  jsr     L7247
        jmp     L71D9

L727C:  ldx     #$07
L727E:  stx     $A3
        asl     a
        asl     a
        asl     a
        asl     a
        tax
        lda     $A3
        sta     $0342,x
        lda     #$00
        sta     $0348,x
        sta     $0349,x
        tya
        jsr     LE456
        sta     $A0
        jmp     L71D9

L729B:  lda     #$9B
L729D:  tax
        lda     $B7
L72A0:  stx     $A1
        ldy     $A1
L72A4:  ldx     #$0B
        jmp     L727E

L72A9:  ldy     #$9B
        bne     L72A4
L72AD:  jsr     L7025
        jmp     L71D9

L72B3:  sta     $D4
        stx     $D5
        jsr     LD9AA
        jsr     LD8E6
        ldy     #$FF
        ldx     #$00
L72C1:  iny
        inx
        lda     ($F3),y
        sta     $0550,x
        bpl     L72C1
        eor     #$80
        sta     $0550,x
        stx     $0550
        rts

        ldx     #$00
L72D5:  jsr     L72B3
        lda     $B7
L72DA:  ldx     #$50
        ldy     #$05
        jsr     L7015
        jmp     L71D9

        ldx     #$00
        jsr     L72D5
        jmp     L729B

        ldy     #$00
L72EE:  sta     $A0
        txa
        sty     $A2
        ldx     $A2
        jsr     L72B3
        lda     $A0
        jmp     L72DA

        ldy     #$00
        jsr     L72EE
        lda     $A0
        jmp     L72A9

L7307:  stx     $A2
        tax
        ldy     $A2
        lda     $B7
L730E:  cpy     #$00
        bpl     L7328
        pha
        stx     $A1
        sty     $A2
        ldy     #$2D
        jsr     L72A4
        sec
        lda     #$00
        sbc     $A1
        tax
        lda     #$00
        sbc     $A2
        tay
        pla
L7328:  jmp     L72EE

        jsr     L7307
        jmp     L729B

        jsr     L730E
        lda     $A0
        jmp     L72A9

        stx     $A2
        sty     $A3
        ldx     #$00
        ldy     $A2
L7341:  sty     $A2
        jsr     L72B3
        iny
L7347:  lda     $0550,y
        sta     ($A2),y
        dey
        bpl     L7347
        rts

        cpx     #$00
        bpl     L7341
        sta     $A0
        stx     $A1
        sty     $A2
        sec
        lda     #$00
        sbc     $A0
        tay
        lda     #$00
        sbc     $A1
        tax
        tya
        jsr     L72B3
        inx
        txa
        tay
L736C:  lda     $054F,y
        sta     ($A2),y
        dey
        bne     L736C
        txa
        sta     ($A2),y
        iny
        lda     #$2D
        sta     ($A2),y
        rts

        lda     $B7
        ldx     #$13
        stx     $0550
        ldx     #$50
        ldy     #$05
        jsr     L7276
        lda     #$50
        ldx     #$05
L738F:  sta     $A4
        stx     $A5
        ldy     #$00
        sty     $A0
        sty     $A1
        sty     $A2
        lda     ($A4),y
        sta     $A3
        inc     $A3
        lda     #$20
        iny
L73A4:  cmp     ($A4),y
        bne     L73AD
        iny
        cpy     $A3
        bmi     L73A4
L73AD:  lda     ($A4),y
        cmp     #$2D
        bne     L73B6
        sta     $A2
        iny
L73B6:  cpy     $A3
        bpl     L73F0
L73BA:  lda     ($A4),y
        cmp     #$30
        bmi     L73F0
        cmp     #$3A
        bpl     L73F0
        sec
        sbc     #$30
        tax
        lda     $A1
        pha
        lda     $A0
        asl     a
        rol     $A1
        asl     a
        rol     $A1
        clc
        adc     $A0
        sta     $A0
        pla
        adc     $A1
        sta     $A1
        asl     $A0
        rol     $A1
        clc
        txa
        adc     $A0
        sta     $A0
        bcc     L73EB
        inc     $A1
L73EB:  iny
        cpy     $A3
        bmi     L73BA
L73F0:  lda     $A2
        beq     L7401
        sec
        lda     #$00
        sbc     $A0
        sta     $A0
        lda     #$00
        sbc     $A1
        sta     $A1
L7401:  rts

L7402:  sta     $A4
        stx     $A5
        lda     #$04
        sta     $A6
        lda     #$24
        jsr     L729D
L740F:  lda     #$00
        ldx     #$04
L7413:  asl     $A4
        rol     $A5
        rol     a
        dex
        bne     L7413
        adc     #$30
        cmp     #$3A
        bmi     L7423
        adc     #$06
L7423:  jsr     L729D
        dec     $A6
        bne     L740F
L742A:  rts

L742B:  sta     $C0
        stx     $C1
        sty     $05F0
        ldy     #$00
        lda     ($C0),y
        sta     $C2
        inc     $C2
        ldx     #$0D
L743C:  lda     $A2,x
        sta     $05F0,x
        dex
        bne     L743C
        stx     $8B
        stx     $8A
L7448:  inc     $8A
        ldy     $8A
        cpy     $C2
        bcs     L742A
        lda     ($C0),y
        cmp     #$25
        bne     L7465
        inc     $8A
        iny
        lda     ($C0),y
        cmp     #$25
        beq     L7465
        cmp     #$45
        bne     L746B
        lda     #$9B
L7465:  jsr     L729D
        jmp     L7448

L746B:  ldy     $8B
        inc     $8B
        inc     $8B
        sta     $A0
        lda     $05F0,y
        ldx     $05F1,y
        ldy     $A0
        cpy     #$43
        beq     L7465
        cpy     #$53
        bne     L7489
        jsr     L723A
        jmp     L7448

L7489:  cpy     #$49
        bne     L7493
        jsr     L7307
        jmp     L7448

L7493:  cpy     #$48
        bne     L749D
        jsr     L7402
        jmp     L7448

L749D:  jsr     L72D5
        jmp     L7448

        stx     $A1
        sty     $A2
        asl     a
        asl     a
        asl     a
        asl     a
        tax
        lda     #$26
        sta     $0342,x
        jsr     LE456
        jsr     L71D9
        ldy     #$00
        lda     $034E,x
        sta     ($A3),y
        lda     $034C,x
        sta     ($A1),y
        lda     $034D,x
        iny
        sta     ($A1),y
        rts

        stx     $A1
        asl     a
        asl     a
        asl     a
        asl     a
        tax
        tya
        sta     $034D,x
        lda     $A1
        sta     $034C,x
        lda     $A3
        sta     $034E,x
        lda     #$25
        sta     $0342,x
        jsr     LE456
        jmp     L71D9

        .byte   $02
        .byte   $53
        .byte   $3A
L74ED:  nop
L74EE:  .byte   $74
        .byte   $02
        eor     $3A
L74F2:  .byte   $EF
L74F3:  .byte   $74
        pha
        lda     #$00
        jsr     L7234
        lda     #$0C
        sta     $A3
        lda     #$00
        ldx     L74F2
        ldy     L74F3
        jsr     L71FD
        lda     #$06
        jsr     L7234
        pla
        sta     $A4
        and     #$30
        eor     #$1C
        sta     $A3
        lda     #$06
        ldx     L74ED
        ldy     L74EE
        jmp     L71FD

L7522:  sta     $5B
        stx     $5C
        sty     $5A
L7528:  sta     $55
        stx     $56
        sty     $54
        rts

L752F:  jsr     L7528
        lda     $02FD
        sta     $02FB
        lda     L74ED
        sta     $A5
        lda     L74EE
        sta     $A6
        lda     #$00
        sta     $A3
        sta     $A4
        lda     #$06
        rts

        jsr     L752F
        ldy     #$11
        jmp     L72AD

        jsr     L7522
        lda     #$06
        jmp     L727C

        jsr     L7528
        lda     #$06
        ldx     $02FD
        jmp     L72A0

        cmp     #$05
        bpl     L7580
        sta     $A0
        tya
        and     #$0F
        sta     $A2
        txa
        asl     a
        asl     a
        asl     a
        asl     a
        ora     $A2
        ldx     $A0
        sta     $02C4,x
        sta     $D016,x
L7580:  rts

        jsr     L752F
        ldy     #$12
        jmp     L72AD

        ldx     $D20A
        cmp     #$00
        beq     L7599
        stx     $84
        ldx     #$00
        stx     $85
        jsr     L710E
L7599:  stx     $A0
        rts

        asl     a
        sty     $A2
        tay
        cmp     #$07
        bmi     L75A9
        ldy     #$64
        jsr     L707E
L75A9:  txa
        sta     $D200,y
        lda     $A2
        asl     a
        asl     a
        asl     a
        asl     a
        ora     $A3
        sta     $D201,y
        rts

        lda     $0232
        and     #$EF
        sta     $0232
        sta     $D20F
        lda     #$00
        ldx     #$08
L75C8:  sta     $D200,x
        dex
        bpl     L75C8
        rts

        tax
        lda     $0270,x
        sta     $A0
        rts

        ldx     #$00
        cmp     #$04
        bmi     L75DF
        inx
        and     #$03
L75DF:  tay
        lda     $D300,x
        and     L75E9,y
        sta     $A0
        rts

L75E9:  .byte   $04
        php
        rti

        .byte   $80
        ldx     #$00
        cmp     #$02
        bmi     L75F6
        inx
        and     #$01
L75F6:  tay
        lda     $D300,x
        dey
        bne     L7601
        lsr     a
        lsr     a
        lsr     a
        lsr     a
L7601:  and     #$0F
        sta     $A0
        rts

        tax
        lda     $D010,x
        sta     $A0
        rts

        sta     $A2
        stx     $A3
        ldy     #$00
        lda     ($A2),y
        sta     $A0
        iny
        lda     ($A2),y
        sta     $A1
        rts

L761D:  sta     $A0
        stx     $A1
        tya
        ldy     #$00
        sta     ($A0),y
        rts

        jsr     L761D
        iny
        lda     $A3
        sta     ($A0),y
        rts

        pha
        lda     #$00
        sta     $A4
        pla
        sta     $A0
        stx     $A1
        sty     $A2
        ldy     #$00
        lda     $A4
        ldx     $A3
        beq     L7654
L7644:  sta     ($A0),y
        iny
        bne     L7644
        inc     $A1
        dec     $A3
        bne     L7644
        beq     L7654
L7651:  sta     ($A0),y
        iny
L7654:  cpy     $A2
        bne     L7651
        rts

        sta     $A0
        stx     $A1
        sty     $A2
        ldy     #$00
        lda     $A5
        beq     L767B
L7665:  lda     ($A2),y
        sta     ($A0),y
        iny
        bne     L7665
        inc     $A1
        inc     $A3
        dec     $A5
        bne     L7665
        beq     L767B
L7676:  lda     ($A2),y
        sta     ($A0),y
        iny
L767B:  cpy     $A4
        bne     L7676
        rts

        sta     $A4
        stx     $A5
        sty     $A2
        ldy     #$00
        sty     $A0
        sty     $A1
        lda     ($A4),y
        cmp     ($A2),y
        beq     L7695
        jsr     L76A8
L7695:  cmp     #$00
        bne     L769A
        rts

L769A:  sta     $A6
L769C:  iny
        lda     ($A4),y
        cmp     ($A2),y
        bne     L76A8
        cpy     $A6
        bcc     L769C
        rts

L76A8:  ldx     #$FF
        stx     $A0
        bcc     L76B1
        lda     ($A2),y
        inx
L76B1:  stx     $A1
        rts

L76B4:  sta     $A0
        stx     $A1
        sty     $A2
        ldy     #$00
        lda     ($A2),y
L76BE:  sta     ($A0),y
        beq     L76CA
L76C2:  tay
L76C3:  lda     ($A2),y
        sta     ($A0),y
        dey
        bne     L76C3
L76CA:  rts

        sta     $A0
        stx     $A1
        sty     $A2
        ldy     #$00
        lda     ($A2),y
        cmp     $A5
        bcs     L76DB
        sta     $A5
L76DB:  dec     $A4
        clc
        lda     $A2
        adc     $A4
        sta     $A2
        bcc     L76E8
        inc     $A3
L76E8:  sec
        lda     $A5
        sbc     $A4
        bcs     L76F1
        lda     #$00
L76F1:  jmp     L76BE

        sta     $A0
        stx     $A1
        sty     $A2
        .byte   $A0
L76FB:  brk
        lda     ($A2),y
        beq     L770D
        sta     $A6
        dec     $A4
        sec
        lda     $A5
        sbc     $A4
        beq     L770D
        bcs     L770E
L770D:  rts

L770E:  tax
        cmp     $A6
        bcc     L771B
        clc
        lda     $A6
        tax
        adc     $A4
        sta     $A5
L771B:  lda     $A5
        cmp     ($A0),y
        bcc     L7724
        sta     ($A0),y
        clc
L7724:  lda     $A0
        adc     $A4
        sta     $A0
        bcc     L772E
        inc     $A1
L772E:  txa
        jmp     L76C2

L7732:  brk
L7733:  brk
L7734:  brk
L7735:  brk
L7736:  brk
        dey
        and     $02A0,y
L773B:  .byte   $09
L773C:  .byte   $70
L773D:  brk
L773E:  .byte   $A0
L773F:  .byte   $1D
L7740:  ldy     #$18
        .byte   $A1
L7743:  .byte   $13
L7744:  .byte   $A2
L7745:  .byte   $0E
L7746:  .byte   $A3
        ora     #$A4
        .byte   $04
        lda     $FF
        lda     $FA
        ldx     $F5
        .byte   $A7
        beq     L76FB
        .byte   $EB
        lda     #$01
        tax
L7757:  brk
L7758:  .byte   $AB
L7759:  .byte   $96
L775A:  .byte   $AB
        brk
        .byte   $01
L775D:  .byte   $96
L775E:  ldy     $0898
        .byte   $2E
        .byte   $B5
L7763:  brk
        .byte   $4C
L7765:  .byte   $67
L7766:  .byte   $77
L7767:  sta     L7763
        lda     L7763
        sta     L7732
        rts

L7771:  brk
L7772:  brk
L7773:  jmp     L7776

L7776:  stx     L7772
        sta     L7771
        lda     #$01
        jsr     L7234
        lda     #$04
        jsr     L7234
        lda     #$06
        jsr     L7234
        ldx     L7772
        lda     L7771
        jsr     L7227
        ldx     L773B
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
L77A4:  jmp     L77A7

L77A7:  sta     L779A
        clc
        lda     L773F
        adc     L779A
        sta     $AE
        lda     L7740
        adc     #$00
        sta     $AF
        ldy     #$00
        lda     ($AE),y
        sta     L779B
        sty     L779F
        lda     #$0A
        sta     L779E
        iny
        sty     L779D
        sec
        lda     L779B
        sbc     #$01
        sta     L77E1
L77D6:  lda     L77E1
        cmp     L779D
        bcs     L77E2
        jmp     L77FA

L77E1:  brk
L77E2:  clc
        lda     L779E
        adc     $A015
        sta     L779E
        lda     L779F
        adc     #$00
        sta     L779F
        inc     L779D
        jmp     L77D6

L77FA:  lda     #$25
        sta     $0382
        ldy     #$00
        sty     $038C
        lda     L779E
        and     #$FF
        sta     $038D
        lda     #$01
        sta     $85
        lda     #$00
        sta     $84
        lda     L779F
        tax
        lda     L779E
        jsr     L7143
        sta     $038E
        ldx     #$40
        lda     #$00
        jsr     LE456
        lda     #$7F
        cmp     $0383
        bcc     L7832
        jmp     L7842

L7832:  jmp     L783B

        ora     $50
        .byte   $4F
        eor     #$4E
        .byte   $54
L783B:  ldx     #$78
        lda     #$35
        jsr     L7773
L7842:  lda     #$01
L7844:  sta     $85
        lda     #$00
        sta     $84
        lda     $A015
        ldx     #$00
        jsr     L710E
        sta     L77A0
        txa
        sta     L77A1
        lda     L77A1
        sta     $A4
        lda     L77A0
        sta     $A3
        ldy     L7758
        ldx     L7757
        lda     #$04
        jsr     L329C
        lda     $A1
        sta     L77A3
        lda     $A0
        sta     L77A2
        lda     L77A2
        eor     L77A0
        bne     L7886
        ora     L77A3
        eor     L77A1
L7886:  bne     L788B
        jmp     L78BD

L788B:  jmp     L789F

        bpl     L78E2
        eor     $41
        .byte   $44
        jsr     L5245
        .byte   $52
        .byte   $4F
        .byte   $52
        .byte   $3A
        jsr     L5525
        and     $45
L789F:  lda     L77A3
        sta     $A3
        ldy     L77A2
        ldx     #$78
        lda     #$8E
        jsr     L742B
        jmp     L78B6

        .byte   $04
        .byte   $52
        eor     $41
        .byte   $44
L78B6:  ldx     #$78
        lda     #$B1
        jsr     L7773
L78BD:  rts

L78BE:  brk
L78BF:  brk
L78C0:  brk
L78C1:  brk
L78C2:  brk
L78C3:  brk
L78C4:  jmp     L78C7

L78C7:  lda     L775E
        sta     L78C3
        lda     L775D
        sta     L78C2
        ldy     #$01
        sty     L78C0
        lda     $AB5F
        sta     L78E9
L78DE:  lda     L78E9
        .byte   $CD
L78E2:  cpy     #$78
        bcs     L78EA
        jmp     L7920

L78E9:  brk
L78EA:  lda     L78C2
        sta     $AE
        lda     L78C3
        sta     $AF
        ldy     #$00
        lda     ($AE),y
        sta     L78C1
        clc
        lda     L78C2
        adc     L78C1
        sta     $AE
        lda     L78C3
        adc     #$00
        sta     $AF
        clc
        lda     $AE
        adc     #$01
        sta     L78C2
        lda     $AF
        adc     #$00
        sta     L78C3
        inc     L78C0
        jmp     L78DE

L7920:  sec
        lda     L78C2
        sbc     L775D
        sta     L78BE
        lda     L78C3
        sbc     L775E
        sta     L78BF
        lda     L78BF
        sta     $A1
        lda     L78BE
        sta     $A0
        rts

L793E:  brk
L793F:  brk
L7940:  brk
L7941:  jmp     L7944

L7944:  stx     L793F
        sta     L793E
        lda     $AB60
        eor     L793E
        bne     L7958
        ora     $AB61
        eor     L793F
L7958:  beq     L795D
        jmp     L7962

L795D:  lda     #$01
        sta     $A0
        rts

L7962:  ldy     #$00
        sty     L7940
L7967:  lda     #$7F
        cmp     L7940
        bcs     L7971
        jmp     L79CB

L7971:  lda     L7940
        asl     a
        php
        clc
        adc     L7759
        sta     $AE
        lda     #$00
        rol     a
        plp
        adc     L775A
        sta     $AF
        ldy     #$00
        lda     ($AE),y
        iny
        ora     ($AE),y
        beq     L7991
        jmp     L7999

L7991:  lda     #$00
        sta     $A0
        rts

        jmp     L79C5

L7999:  lda     L7940
        asl     a
        php
        clc
        adc     L7759
        sta     $AE
        lda     #$00
        rol     a
        plp
        adc     L775A
        sta     $AF
        dey
        lda     ($AE),y
        eor     L793E
        bne     L79BB
        iny
        ora     ($AE),y
        eor     L793F
L79BB:  beq     L79C0
        jmp     L79C5

L79C0:  lda     #$01
        sta     $A0
        rts

L79C5:  inc     L7940
        jmp     L7967

L79CB:  lda     #$00
        sta     $A0
        rts

L79D0:  brk
L79D1:  brk
L79D2:  brk
L79D3:  brk
L79D4:  jmp     L79D7

L79D7:  sta     L79D0
        lda     L79D0
        jsr     L77A4
        ldx     L7734
        lda     L7733
        jsr     L7941
        lda     $A0
        bne     L79F0
        jmp     L79F1

L79F0:  rts

L79F1:  jmp     L7A15

        jsr     L209C
        jsr     L2020
        jsr     L2020
        jsr     L6F4E
        .byte   $64
        adc     $20
        and     $55
        .byte   $2F
        .byte   $42
        adc     ($73,x)
        adc     $20
        and     $42
        .byte   $2F
        eor     $6773
        jsr     L4225
        .byte   $20
L7A15:  lda     L7734
        sta     $A3
        lda     #$00
        sta     $A5
        lda     L773C
        sta     $A4
        lda     #$00
        sta     $A7
        lda     L79D0
        sta     $A6
        ldy     L7733
        ldx     #$79
        lda     #$F4
        jsr     L742B
        jsr     L78C4
        lda     $A1
        sta     L79D3
        lda     $A0
        sta     L79D2
        clc
        lda     L79D2
        adc     #$96
        sta     L79D2
        lda     L79D3
        adc     #$01
        sta     L79D3
        ldx     #$4D
        lda     #$06
        jsr     L72A0
        lda     L79D2
        and     #$FF
        sta     $A1
        ldx     $A1
        lda     #$06
        jsr     L72A0
        lda     #$01
        sta     $85
        lda     #$00
        sta     $84
        lda     L79D3
        tax
        lda     L79D2
        jsr     L7143
        sta     $A1
        ldx     $A1
        lda     #$06
        jsr     L72A0
        ldx     L773C
        lda     #$06
        jsr     L72A0
        lda     #$19
        cmp     $AB62
        bcc     L7A96
        jmp     L7A9E

L7A96:  ldy     #$00
        sty     $AB61
        sty     $AB60
L7A9E:  lda     #$19
        cmp     $AB7C
        bcc     L7AA8
        jmp     L7AB0

L7AA8:  ldy     #$00
        sty     $AB61
        sty     $AB60
L7AB0:  lda     $AB60
        ora     $AB61
        beq     L7ABB
        jmp     L7AE1

L7ABB:  lda     $3C7D
        sta     $AB61
        lda     $3C7C
        sta     $AB60
        lda     #$3C
        sta     $A3
        ldy     #$7E
        ldx     #$AB
        lda     #$62
        jsr     L76B4
        lda     #$3C
        sta     $A3
        ldy     #$98
        ldx     #$AB
        lda     #$7C
        jsr     L76B4
L7AE1:  lda     L79D3
        sta     $A4
        lda     L79D2
        sta     $A3
        ldy     L7758
        ldx     L7757
        lda     #$06
        jsr     L329F
        lda     $A0
        sta     L79D1
        lda     #$7F
        cmp     L79D1
        bcc     L7B05
        jmp     L7B38

L7B05:  jmp     L7B1A

        ora     ($57),y
        .byte   $52
        eor     #$54
        eor     $20
        eor     $52
        .byte   $52
        .byte   $4F
        .byte   $52
        .byte   $3A
        jsr     L5525
        and     $45
L7B1A:  lda     #$00
        sta     $A3
        ldy     L79D1
        ldx     #$7B
        lda     #$08
        jsr     L742B
        jmp     L7B31

        ora     $57
        .byte   $52
        eor     #$54
        .byte   $45
L7B31:  ldx     #$7B
        lda     #$2B
        jsr     L7773
L7B38:  rts

L7B39:  brk
L7B3A:  brk
L7B3B:  brk
L7B3C:  jmp     L7B3F

L7B3F:  ldy     #$01
        sty     L7B39
        lda     $A019
        sta     L7B55
L7B4A:  lda     L7B55
        cmp     L7B39
        bcs     L7B56
        jmp     L7BD8

L7B55:  brk
L7B56:  clc
        lda     L7743
        adc     L7B39
        sta     $AE
        lda     L7744
        adc     #$00
        sta     $AF
        clc
        lda     L7745
        adc     L7B39
        sta     $AC
        lda     L7746
        adc     #$00
        sta     $AD
        lda     #$00
        sta     $85
        ldy     #$00
        lda     ($AC),y
        sta     $84
        lda     #$01
        tax
        lda     #$00
        jsr     L710E
        sta     $AA
        txa
        sta     $AB
        clc
        ldy     #$00
        lda     ($AE),y
        adc     $AA
        sta     L7B3A
        lda     #$00
        adc     $AB
        sta     L7B3B
        lda     $34B8
        cmp     L7B3A
        lda     $34B9
        sbc     L7B3B
        bcc     L7BAF
        jmp     L7BD2

L7BAF:  lda     L7B39
        jsr     L79D4
        lda     L7735
        cmp     L7B3A
        lda     L7736
        sbc     L7B3B
        bcc     L7BC6
        jmp     L7BD2

L7BC6:  lda     L7B3B
        sta     L7736
        lda     L7B3A
        sta     L7735
L7BD2:  inc     L7B39
        jmp     L7B4A

L7BD8:  rts

L7BD9:  brk
        .byte   $19
        .byte   $44
L7BDC:  sei
        .byte   $3A
        rol     $5250,x
        .byte   $4F
        rol     $4142,x
        .byte   $53
        eor     $53
        rol     $4142,x
        .byte   $53
        eor     $5F
L7BEE:  sei
L7BEF:  sei
        rol     $4144
        .byte   $54
L7BF4:  brk
L7BF5:  brk
L7BF6:  jmp     L7BF9

L7BF9:  sta     L7BD9
        sec
        lda     L7BD9
        sbc     #$01
        sta     $AE
        ldx     $AE
        lda     $37A3,x
        sta     L7BDC
        lda     #$00
        sta     $85
        lda     #$0A
        sta     $84
        lda     L7BD9
        ldx     #$00
        jsr     L7143
        sta     $AE
        clc
        lda     $AE
        adc     #$30
        sta     L7BEE
        lda     #$00
        sta     $85
        lda     #$0A
        sta     $84
        lda     L7BD9
        ldx     #$00
        jsr     L7191
        sta     $AE
        clc
        lda     $AE
        adc     #$30
        sta     L7BEF
        lda     #$04
        jsr     L7234
        ldy     #$00
        sty     L7732
        lda     #$04
        sta     $A3
        lda     #$00
        sta     $A4
        ldy     #$7B
        ldx     #$DA
        lda     #$04
        jsr     L71FD
        lda     #$00
        cmp     L7732
        bcc     L7C65
        jmp     L7C6A

L7C65:  lda     #$00
        sta     $A0
        rts

L7C6A:  lda     #$0A
        sta     $A4
        lda     #$00
        sta     $A3
        ldy     L773E
        ldx     L773D
        lda     #$04
        jsr     L329C
        lda     $A1
        sta     L7BF5
        lda     $A0
        sta     L7BF4
        lda     L7BF4
        eor     #$00
        bne     L7C93
        ora     L7BF5
        eor     #$0A
L7C93:  bne     L7C98
        jmp     L7C9D

L7C98:  lda     #$00
        sta     $A0
        rts

L7C9D:  lda     L7BD9
        sta     L773C
        lda     #$01
        sta     $A0
        rts

L7CA8:  brk
L7CA9:  brk
        ora     #$70
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
        ora     #$70
        asl     a
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7CDC:  brk
L7CDD:  jmp     L7CE0

L7CE0:  stx     L7CA9
        sta     L7CA8
        jmp     L7CFC

        .byte   $12
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
        rol     $5F58,x
L7CFC:  lda     #$7C
        sta     $A3
        ldy     #$E9
        ldx     #$7C
        lda     #$AA
        jsr     L76B4
        lda     L7CA9
        sta     L7734
        lda     L7CA8
        sta     L7733
        lda     $3EEF
        sta     L7CAC
        lda     #$7C
        sta     $A3
        ldy     #$D2
        ldx     L7CA9
        lda     L7CA8
        jsr     L7341
        lda     #$7C
        sta     $A3
        ldy     #$AA
        ldx     #$7C
        lda     #$D2
        jsr     L324E
        jmp     L7D3F

        .byte   $04
        rol     $4144
        .byte   $54
L7D3F:  lda     #$7C
        sta     $A3
        ldy     #$AA
        ldx     #$7D
        lda     #$3A
        jsr     L324E
        lda     #$06
        jsr     L7234
        ldy     #$00
        sty     L7732
        lda     #$09
        sta     $A3
        lda     #$00
        sta     $A4
        ldy     #$7C
        ldx     #$AA
        lda     #$06
        jsr     L71FD
        lda     #$00
        cmp     L7732
        bcc     L7D71
        jmp     L7D72

L7D71:  rts

L7D72:  ldy     #$01
        sty     L7CDC
L7D77:  lda     #$1F
        cmp     L7CDC
        bcs     L7D81
        jmp     L7DBC

L7D81:  sec
        lda     L7CDC
        sbc     #$01
        sta     $AE
        lda     #$00
        ldx     $AE
        cmp     $37A3,x
        bcc     L7D95
        jmp     L7DB6

L7D95:  ldy     L7CDC
        ldx     #$34
        lda     #$CC
        jsr     L3266
        lda     $A0
        bne     L7DA6
        jmp     L7DB6

L7DA6:  lda     L7CDC
        jsr     L7BF6
        lda     $A0
        bne     L7DB3
        jmp     L7DB6

L7DB3:  jsr     L7B3C
L7DB6:  inc     L7CDC
        jmp     L7D77

L7DBC:  rts

        .byte   $1B
        .byte   $44
L7DBF:  sei
        .byte   $3A
        rol     $5250,x
        .byte   $4F
        rol     $454E,x
        .byte   $54
        .byte   $57
        .byte   $4F
        .byte   $52
        .byte   $4B
        rol     $4345,x
        pha
        .byte   $4F
        lsr     $5445
        rol     $4144
        .byte   $54
        ora     #$70
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
        ora     #$70
        asl     a:$00,x
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
        ora     #$70
        asl     a:$00,x
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
        ora     #$70
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
L7EBA:  jmp     L7EBD

L7EBD:  lda     #$02
        jsr     L7234
        ldy     #$00
        sty     L7732
        lda     $3EEF
        sta     L7DBF
        lda     #$04
        sta     $A3
        lda     #$00
        sta     $A4
        ldy     #$7D
        ldx     #$BD
        lda     #$02
        jsr     L71FD
        lda     #$00
        cmp     L7732
        bcc     L7EE8
        jmp     L7EE9

L7EE8:  rts

L7EE9:  lda     $05C2
        beq     L7EF1
        jmp     L7FEA

L7EF1:  ldy     #$7D
        ldx     #$D9
        lda     #$02
        jsr     L7262
        lda     #$00
        cmp     L7732
        bcc     L7F04
        jmp     L7F07

L7F04:  jmp     L7FEA

L7F07:  lda     #$7E
        sta     $A3
        lda     #$7E
        sta     $A5
        lda     #$5B
        sta     $A4
        lda     #$7E
        sta     $A7
        lda     #$79
        sta     $A6
        ldy     #$3D
        ldx     #$7D
        lda     #$D9
        jsr     L328D
        ldx     #$7E
        lda     #$3D
        jsr     L738F
        lda     $A1
        sta     L7EB6
        lda     $A0
        sta     L7EB5
        ldx     #$7E
        lda     #$5B
        jsr     L738F
        lda     $A1
        sta     L7EB8
        lda     $A0
        sta     L7EB7
        lda     #$00
        cmp     L7EB5
        lda     #$00
        sbc     L7EB6
        bcc     L7F55
        jmp     L7FE7

L7F55:  lda     #$00
        cmp     L7EB7
        lda     #$00
        sbc     L7EB8
        bcc     L7F64
        jmp     L7FE7

L7F64:  jsr     L321B
        lda     #$7F
        cmp     $A0
        bcc     L7F70
        jmp     L7F7F

L7F70:  jmp     L7F78

        .byte   $04
        .byte   $4F
        bvc     L7FBC
        .byte   $4E
L7F78:  ldx     #$7F
        lda     #$73
        jsr     L7773
L7F7F:  ldx     L7EB8
        lda     L7EB7
        jsr     L3221
        lda     $A0
        cmp     #$80
        bcc     L7F91
        jmp     L7FDF

L7F91:  jsr     L321E
        lda     $A0
        sta     L7EB9
        lda     $34B9
        sta     L7736
        lda     $34B8
        sta     L7735
        ldx     L7EB6
        lda     L7EB5
        jsr     L7CDD
        lda     L7736
        sta     $34B9
        lda     L7735
        sta     $34B8
        .byte   $20
        .byte   $1B
L7FBC:  .byte   $32
        lda     $A0
        cmp     #$80
        bcc     L7FC6
        jmp     L7FD4

L7FC6:  ldx     L7EB8
        lda     L7EB7
        jsr     L3224
        lda     $A0
        sta     L7EB9
L7FD4:  jsr     L321E
        lda     $A0
        sta     L7EB9
        jmp     L7FE7

L7FDF:  jsr     L321E
        lda     $A0
        sta     L7EB9
L7FE7:  jmp     L7EE9

L7FEA:  lda     #$02
        jsr     L7234
        rts

L7FF0:  jmp     L7FF3

L7FF3:  lda     #$7D
        jsr     L729D
        jsr     L729B
        jsr     L729B
        jsr     L729B
        jsr     L729B
        jsr     L729B
        jsr     L729B
        jsr     L729B
        jmp     L8033

        .byte   $22
        jsr     L2020
        jsr     L2020
        jsr     L9291
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
L8033:  ldx     #$80
        lda     #$10
        jsr     L7227
        jmp     L8060

        .byte   $22
        .byte   $20
        .byte   $20
L8040:  jsr     L2020
        jsr     $FC20
        .byte   $C2
L8047:  .byte   $C2
        .byte   $D3
        ldy     #$C5
        sed
        beq     L8040
        sbc     $F3
        .byte   $F3
        lda     ($A0,x)
        bne     L8047
        .byte   $EF
        inc     $E5
        .byte   $F3
        .byte   $F3
        sbc     #$EF
        inc     $ECE1
        .byte   $FC
L8060:  ldx     #$80
        lda     #$3D
        jsr     L7227
        jmp     L808D

        .byte   $22
        jsr     L2020
        jsr     L2020
        jsr     L9281
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
L808D:  ldx     #$80
        lda     #$6A
        jsr     L7227
        jmp     L80BA

        .byte   $22
        jsr     L2020
L809B:  jsr     L2020
        jsr     LA0FC
        ldy     #$A0
        ldy     #$A0
        cmp     $F8
        beq     L809B
        sbc     $F3
        .byte   $F3
        dec     $D4C5
        ldy     #$A8
        .byte   $F4
        sbc     $A0A9
        ldy     #$A0
        ldy     #$A0
        .byte   $FC
L80BA:  ldx     #$80
        lda     #$97
        jsr     L7227
        jmp     L80E7

        .byte   $22
        jsr     L2020
        jsr     L2020
        jsr     LA0FC
        ldy     #$A0
        ldy     #$A0
        ldy     #$A0
        ldy     #$A0
        ldy     #$A0
        ldy     #$A0
        ldy     #$A0
        ldy     #$A0
        ldy     #$A0
        ldy     #$A0
        ldy     #$A0
        ldy     #$A0
        .byte   $FC
L80E7:  ldx     #$80
        lda     #$C4
        jsr     L7227
        .byte   $4C
L80EF:  .byte   $14
        sta     ($22,x)
        jsr     L2020
        jsr     L2020
        jsr     LA0FC
        bne     L80EF
        sbc     $F0
        sbc     ($F2,x)
        sbc     #$EE
        .byte   $E7
        ldy     #$E4
        sbc     ($F4,x)
        sbc     ($F3,x)
        sbc     $F4
        .byte   $F3
        ldy     #$E6
        .byte   $EF
        .byte   $F2
        ldy     #$A0
        .byte   $FC
L8114:  ldx     #$80
        lda     #$F1
        jsr     L7227
        jmp     L8141

        .byte   $22
        jsr     L2020
        jsr     L2020
        jsr     LA0FC
        inc     $F4E5
        .byte   $F7
        .byte   $EF
        .byte   $F2
        .byte   $EB
        ldy     #$F4
        .byte   $F2
        sbc     ($EE,x)
        .byte   $F3
        sbc     $F3E9
        .byte   $F3
        sbc     #$EF
        inc     $AEAE
        ldy     #$A0
        .byte   $FC
L8141:  ldx     #$81
        lda     #$1E
        jsr     L7227
        jmp     L816E

        .byte   $22
        jsr     L2020
        jsr     L2020
        jsr     L929A
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
L816E:  ldx     #$81
        lda     #$4B
        jsr     L7227
        jsr     L729B
        jsr     L729B
        jsr     L729B
        rts

L817F:
        jmp     L8182

L8182:  lda     L7766
        sta     L7080
        lda     L7765
        sta     L707F
        tsx
        stx     L773B
        jsr     L3212
        lda     #$00
        cmp     $3EEF
        bcc     L819F
        jmp     L81B4

L819F:  lda     #$00
        cmp     $3C7C
        lda     #$00
        sbc     $3C7D
        bcc     L81AE
        jmp     L81B4

L81AE:  jsr     L7FF0
        jsr     L7EBA
L81B4:  lda     #$01
        jsr     L7234
        lda     #$04
        jsr     L7234
        lda     #$06
        jsr     L7234
        rts

        rts

	.SEGMENT "S_PREP_LOAD"

	.word	$02E2
	.word	$02E3
	.word	L817F
