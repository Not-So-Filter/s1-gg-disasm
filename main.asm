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
	DB	"Developed By (C) 1991 Ancient - S", $A5, "Hayashi."
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
	JP	NZ,$1B4
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