code generation - constants
uniqueNameFrom: baseName orNumberedNameBy: numberedNameSelector lest: aPredicate

	| longName number |
	(aPredicate value: baseName) ifFalse: [^ baseName asSymbol].
	
	number := 0.
	[longName := (numberedNameSelector value: (number := number + 1)) asSymbol]
		doWhileTrue: [aPredicate value: longName].
	^ longName