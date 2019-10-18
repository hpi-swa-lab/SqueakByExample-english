*SBE-Extract-evaluating
cullLazy: firstArgBlock
	"Send the message with these optional arguments and answer the return value"

	selector numArgs >= 1 ifTrue: [ ^self value: firstArgBlock value ].
	^self value