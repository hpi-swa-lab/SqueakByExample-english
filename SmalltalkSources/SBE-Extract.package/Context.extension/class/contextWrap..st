*SBE-Extract-special context creation
contextWrap: aBlock
	"aBlock is expected to receive one block as an argument and must evaluate it exactly one time"

	| ctxt chain |
	ctxt := thisContext.
	aBlock value: [
		chain := thisContext sender cut: ctxt.
		ctxt push: chain.
		ctxt jump].
	^ chain