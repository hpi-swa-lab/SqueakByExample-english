visiting - nodes
basicVisitText: aStringOrText

	| text |
	text := (verbatim ifFalse: [self specialCharacters] ifTrue: [self verbatimSpecialCharacters]) associations
		inject: aStringOrText
		into: [:tmp :assoc |
			tmp copyReplaceAll: assoc key with: assoc value].
	
	text withIndexDo: [:char :index |
		| block |
		block := [(char isSeparator and: [verbatim not])
			ifFalse: [self stream nextPut: char]
			ifTrue:
				[(self stream position > 0 and: [self stream peekLast isSeparator]) ifFalse:
					[self stream space]]].
		((self stream respondsTo: #withAttributes:do:) and: [text isText])
			ifFalse: block
			ifTrue:
				[self stream
					withAttributes: (text attributesAt: index)
					do: block]].
	previousLineBreaks := 0.