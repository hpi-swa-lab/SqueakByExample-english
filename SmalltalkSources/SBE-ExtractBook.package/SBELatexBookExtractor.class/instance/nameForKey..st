emitting
nameForKey: key

	(key beginsWith: 'ind:') ifTrue: [^ ((key copyAfter: $:) splitBy: '!') asCommaString].
	^ key