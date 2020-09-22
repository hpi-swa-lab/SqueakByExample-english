*SBE-Extract-evaluating
value: firstArg cull: secondArg

	selector numArgs >= 2
		ifTrue: [^ self value: firstArg value: secondArg].
	^ self value: firstArg