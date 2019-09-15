testing
atWordBoundary
	^(self isWordChar: lastChar)
		xor: (self isWordChar: stream peek)