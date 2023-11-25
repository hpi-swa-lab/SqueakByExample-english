visiting - nodes
basicVisitLineBreak: lineBreak

	verbatim ifTrue: [^ self stream cr].
	
	previousLineBreaks ifNil:
		[previousLineBreaks := 1.
		^ self].
	previousLineBreaks = 0
		ifTrue: [self stream space]
		ifFalse:
			[previousLineBreaks = 1 ifTrue:
				[| attrs |
				attrs := self stream sbeLastAttributes.
				self stream position: self stream position - 1.
				attrs
					ifEmpty: [self emitLineBreak: lineBreak isNil]
					ifNotEmpty:
						[self stream withAttributes: attrs do:
							[self emitLineBreak: lineBreak isNil]]]].
	previousLineBreaks := previousLineBreaks + 1.