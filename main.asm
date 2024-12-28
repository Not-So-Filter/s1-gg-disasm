; =============================================================
; Sonic The Hedgehog Game Gear Disassembly
;
; Lead Disassembler: Filter
; Helpers: NaotoNTP (Helped out with compilation, thanks a bunch! -- Filter)
; =============================================================

START:
	DI
	IM	1
	
_LOOP:
	IN	A,($7E)
	CP	$B0
	JR	NZ,_LOOP
	JP	$296
	
	ALIGN	$18
	
	JP	$2E2
	
	ALIGN	8
	
	JP	$2F8
	
	ALIGN	8
	
	JP	$309
	
	ALIGN	$38
	
VINT:
	JP	VINT_JUMP
	
	; Header information, removed in the international release
	DB	"Developed By (C) 1991 Ancient - S",$A5,"Hayashi."
	DB	0
	
	; Uncertain
	DI
	PUSH	AF
	LD	A,(IY+7)
	XOR	8
	LD	(IY+7),A
	POP	AF
	EI
	RET
	
VINT_JUMP:
	DI
	PUSH	AF
	PUSH	HL
	PUSH	DE
	PUSH	BC
	IN	A,($BF)
	BIT	7,(IY+6)
	JR	Z,LOC_AC
	LD	A,($D241)
	AND	A
	JP	NZ,LOC_1B4
	LD	A,($D2DC)
	AND	A
	JR	Z,LOC_AC
	CP	$FF
	JR	Z,LOC_AC
	LD	($D242),A
	LD	A,$A
	OUT	($BF),A
	LD	A,$8A
	OUT	($BF),A
	LD	A,($D219)
	OR	$10
	OUT	($BF),A
	LD	A,$80
	OUT	($BF),A
	LD	A,3
	LD	($D241),A
	
LOC_AC:
	PUSH	IX
	PUSH	IY
	LD	HL,($D22F)
	PUSH	HL
	BIT	0,(IY+0)
	CALL	NZ,$180
	BIT	0,(IY+0)
	CALL	Z,$F0
	EI
	LD	A,3
	LD	($FFFE),A
	LD	($D22F),A
	CALL	$4000
	CALL	$602
	BIT	4,(IY+3)
	CALL	Z,SUB_EB
	CALL	$688
	POP	HL
	LD	($FFFE),HL
	LD	($D22F),HL
	POP	IY
	POP	IX
	POP	BC
	POP	DE
	POP	HL
	POP	AF
	RET
	
SUB_EB:
	RES	5,(IY+3)
	RET
	
SUB_F0:
	LD	A,($D21A)
	AND	$BF
	OUT	($BF),A
	LD	A,$81
	OUT	($BF),A
	LD	A,($D24B)
	NEG
	OUT	($BF),A
	LD	A,$88
	OUT	($BF),A
	LD	A,($D24C)
	OUT	($BF),A
	LD	A,$89
	OUT	($BF),A
	BIT	5,(IY+0)
	CALL	NZ,$83E
	CALL	$172
	LD	A,1
	LD	($FFFE),A
	LD	($D22F),A
	LD	A,2
	LD	($FFFF),A
	LD	($D230),A
	BIT	1,(IY+0)
	CALL	NZ,$33F
	LD	A,8
	LD	($FFFE),A
	LD	($D22F),A
	LD	A,9
	LD	($FFFF),A
	LD	($D230),A
	BIT	7,(IY+7)
	CALL	NZ,$31BC
	LD	A,1
	LD	($FFFE),A
	LD	($D22F),A
	LD	A,2
	LD	($FFFF),A
	LD	($D230),A
	LD	A,($D2AC)
	AND	$80
	CALL	Z,$3282
	LD	A,$FF
	LD	($D2AC),A
	LD	A,($D21A)
	OUT	($BF),A
	LD	A,$81
	OUT	($BF),A
	SET	0,(IY+0)
	RET
	
SUB_172:
	BIT	7,(IY+6)
	JR	NZ,LOC_17C
	
LOC_178:
	CALL	$586
	RET
	
LOC_17C:
	CALL	SUB_185
	RET
	
SUB_180:
	BIT	7,(IY+6)
	RET	Z
	
SUB_185:
	LD	A,($D2DC)
	AND	A
	JR	Z,LOC_178
	CP	$FF
	JR	NZ,LOC_178
	LD	HL,DATA_216
	BIT	4,(IY+7)
	JR	Z,LOC_19B
	LD	HL,DATA_256
	
LOC_19B:
	CALL	SUB_19F
	RET
	
SUB_19F:
	LD	B,$20
	LD	A,0
	OUT	($BF),A
	LD	A,$C0
	OUT	($BF),A
	
LOC_1A9:
	LD	A,(HL)
	OUT	($BE),A
	INC	HL
	LD	A,(HL)
	OUT	($BE),A
	INC	HL
	DJNZ	LOC_1A9
	RET
	
LOC_1B4:
	CP	1
	JR	Z,LOC_1D7
	CP	2
	JR	Z,LOC_1D0
	DEC	A
	LD	($D241),A
	IN	A,($7E)
	LD	C,A
	LD	A,($D242)
	SUB	C
	OUT	($BF),A
	LD	A,$8A
	OUT	($BF),A
	JP	LOC_210
	
LOC_1D0:
	DEC	A
	LD	($D241),A
	JP	LOC_210
	
LOC_1D7:
	DEC	A
	LD	($D241),A
	LD	A,0
	OUT	($BF),A
	LD	A,$C0
	OUT	($BF),A
	LD	B,$10
	LD	HL,DATA_216
	BIT	4,(IY+7)
	JR	Z,LOC_1F1
	LD	HL,DATA_256
	
LOC_1F1:
	LD	A,(HL)
	OUT	($BE),A
	INC	HL
	NOP
	LD	A,(HL)
	OUT	($BE),A
	INC	HL
	NOP
	LD	A,(HL)
	OUT	($BE),A
	INC	HL
	LD	A,(HL)
	INC	HL
	OUT	($BE),A
	DJNZ	LOC_1F1
	LD	A,($D219)
	AND	$EF
	OUT	($BF),A
	LD	A,$80
	OUT	($BF),A
	
LOC_210:
	POP	BC
	POP	DE
	POP	HL
	POP	AF
	EI
	RET
	
DATA_216:
	INCBIN	"levels/lz/palettes/underwaterA.bin"
DATA_256:
	INCBIN	"levels/lz/palettes/underwaterB.bin"
	
LOC_296:
	LD	A,$80
	LD	($FFFC),A
	LD	A,0
	LD	($FFFD),A
	LD	A,1
	LD	($FFFE),A
	LD	A,2
	LD	($FFFF),A
	LD	HL,$C000
	LD	DE,$C001
	LD	BC,$1FEF
	LD	(HL),L
	LDIR
	LD	SP,HL
	LD	HL,DATA_31C
	LD	DE,$D219
	LD	B,$B
	LD	C,$8B
	
LOC_2C1:
	LD	A,(HL)
	LD	(DE),A
	INC	HL
	INC	DE
	OUT	($BF),A
	LD	A,C
	SUB	B
	OUT	($BF),A
	DJNZ	LOC_2C1
	LD	HL,$3F00
	LD	BC,$40
	LD	A,$E0
	CALL	$5F0
	CALL	SUB_2F8
	LD	IY,$D200
	JP	$1356
	
SUB_2E2:
	DI
	PUSH	AF
	LD	A,3
	LD	($FFFE),A
	POP	AF
	LD	($D2D3),A
	CALL	$4012
	LD	A,($D22F)
	LD	($FFFE),A
	EI
	RET
	
SUB_2F8:
	DI
	LD	A,3
	LD	($FFFE),A
	CALL	$4006
	LD	A,($D22F)
	LD	($FFFE),A
	EI
	RET
	
SUB_309:
	DI
	PUSH	AF
	LD	A,3
	LD	($FFFE),A
	POP	AF
	CALL	$4015
	LD	A,($D22F)
	LD	($FFFE),A
	EI
	RET
	
DATA_31C:
	DB	$26
	DB	$A2
	DB	$FF
	DB	$FF
	DB	$FF
	DB	$FF
	DB	$FF
	DB	0
	DB	0
	DB	0
	DB	$FF
	
SUB_327:
	BIT	0,(IY+0)
	JR	Z,SUB_327
	RET
	
	SET	2,(IY+0)
	LD	($D226),HL
	LD	($D228),DE
	LD	($D22A),BC
	RET
	
	RET
	
SUB_33F:
	LD	A,0
	OUT	($BF),A
	LD	A,$3F
	OR	$40
	OUT	($BF),A
	LD	B,(IY+$A)
	LD	HL,$D001
	LD	DE,3
	LD	A,B
	AND	A
	JR	Z,LOC_35C
	
LOC_356:
	LD	A,(HL)
	OUT	($BE),A
	ADD	HL,DE
	DJNZ	LOC_356
	
LOC_35C:
	LD	A,($D2B5)
	LD	B,A
	LD	A,(IY+$A)
	LD	C,A
	CP	B
	JR	NC,LOC_370
	LD	A,B
	SUB	C
	LD	B,A
	
LOC_36A:
	LD	A,$E0
	OUT	($BE),A
	DJNZ	LOC_36A
	
LOC_370:
	LD	A,C
	AND	A
	RET	Z
	LD	HL,$D000
	LD	B,(IY+$A)
	LD	A,$80
	OUT	($BF),A
	LD	A,$3F
	OR	$40
	OUT	($BF),A
	
	ALIGN $8000-$10
	DB	"TMR SEGA"
	
	ALIGN $8000-$42
	DB	" & Game Gear Version.  '1991 (C)Ancient. (BANK0-4)",$A2,"SONIC THE HEDGE"