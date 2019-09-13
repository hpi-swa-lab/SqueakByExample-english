testing
atBeginningOfWord
	^(self isWordChar: lastChar) not
		and: [self isWordChar: stream peek]