*SBE-ExtractBook-converting
sbeFromAlph

	| zeroChar |
	self assert: self size = 1.
	self first isLowercase ifTrue: [^ self asUppercase sbeFromAlph].
	zeroChar := Character value: $A asciiValue - 1.
	self assert: (self first between: zeroChar and: $Z).
	^ self first asciiValue - $A asciiValue + 1