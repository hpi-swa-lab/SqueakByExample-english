*SBE-BookCompatibility-Squeak60-private
htmlEscapes: aString

	| lastIndex nextIndex |
	nextIndex := aString indexOf: $& startingAt: (lastIndex := 1) ifAbsent: [^ aString].
	^ String new: aString size * 11 // 10 "+10%" streamContents: [:tmpStream |
		[tmpStream next: nextIndex - lastIndex putAll: aString startingAt: lastIndex.
		nextIndex := aString indexOf: $; startingAt: (lastIndex := nextIndex) ifAbsent: [^ aString].
		tmpStream nextPut: (self htmlEscape: (aString copyFrom: lastIndex to: nextIndex))]
			doWhileTrue: [(nextIndex := aString indexOf: $& startingAt: (lastIndex := nextIndex + 1)) > 0].
		tmpStream next: aString size - lastIndex + 1 putAll: aString startingAt: lastIndex]