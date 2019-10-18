*SBE-Extract-evaluating
cullLazy: firstArgBlock
	"Activate the receiver, with one or zero arguments."
	
	numArgs >= 1 ifTrue: [ ^self value: firstArgBlock value ].
	^self value