*SBE-BookCompatibility-Squeak60-private
searchTag: aTag forAttribute: attributeName

	| startIndex stopIndex |
	startIndex := aTag findString: attributeName startingAt: 1 caseSensitive: false.
	startIndex = 0 ifTrue: [^ nil].
	
	startIndex := startIndex + attributeName size - 1.
	[(aTag at: (startIndex := startIndex + 1)) isSeparator] whileTrue.
	(aTag at: startIndex) = $= ifFalse: [^ nil].
	
	[(aTag at: (startIndex := startIndex + 1)) isSeparator] whileTrue.
	(aTag at: startIndex) = $"
		ifTrue: [
			startIndex := startIndex + 1.
			stopIndex := aTag indexOf: $" startingAt: startIndex + 1]
		ifFalse: [
			stopIndex := aTag indexOfAnyOf: ' >' startingAt: startIndex + 1].
	stopIndex = 0 ifTrue: [^ nil].
	^ self htmlEscapes: (aTag copyFrom: startIndex to: stopIndex - 1)