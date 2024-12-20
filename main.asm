; =============================================================
; Sonic The Hedgehog Game Gear Disassembly
;
; Lead Disassembler: Filter
; =============================================================

START:
	DI
	IM	1
	
_LOOP:
	IN	A,($7E)
	CP	$B0
	JR	NZ,_LOOP
	JP	$0296
	
	ALIGN	$18
	
	JP	$02E2
	
	ALIGN	$08
	
	JP	$02F8
	
	ALIGN	$08
	
	JP	$0309
	
	ALIGN	$38
	
VINT:
	JP	VINT_JUMP
	
	; Header information, removed in the international release
	DB	"Developed By (C) 1991 Ancient - S", $A5, "Hayashi."
	DB	$00
	
	DI
	PUSH	AF
	LD	A,(IY+$07)
	XOR	$08
	LD	(IY+$07),A
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
	BIT	7,(IY+$06)
	JR	Z,LOC_AC
	LD	A,($D241)
	AND	A
	JP	NZ,$01B4
	LD	A,($D2DC)
	AND	A
	JR	Z,LOC_AC
	CP	$FF
	JR	Z,LOC_AC
	LD	($D242),A
	LD	A,$0A
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
	BIT	0,(IY+$00)
	CALL	NZ,$0180
	BIT	0,(IY+$00)
	CALL	Z,$00F0
	EI
	LD	A,3
	LD	($FFFE),A
	LD	($D22F),A
	CALL	$4000
	CALL	$0602
	BIT	4,(IY+3)
	CALL	Z,$00EB
	CALL	$0688
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