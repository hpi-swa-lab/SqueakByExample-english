*SBE-Extract-special context creation
contextWrap: executeAroundBlock
	"executeAroundBlock is expected to receive one block as an argument and must evaluate it exactly one time"

	| ctxt chain |
	ctxt := thisContext.
	executeAroundBlock value: [
		chain := thisContext sender cut: ctxt.
		ctxt push: ctxt.
		ctxt jump].
	^ chain