testing
atEndOfWord
	^(self isWordChar: lastChar)
		and: [(self isWordChar: stream peek) not]