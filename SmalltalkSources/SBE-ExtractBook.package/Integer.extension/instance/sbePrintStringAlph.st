*SBE-ExtractBook-converting
sbePrintStringAlph

	(self between: 1 and: 26) ifTrue: [^ String value: $A asciiValue - 1 + self].
	^ String empty