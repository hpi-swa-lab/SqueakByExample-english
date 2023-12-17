*SBE-BookCompatibility-Squeak60-private
htmlEscape: aString

	| escapeSequence |
	escapeSequence := aString copyFrom: 2 to: aString size - 1.
	escapeSequence first = $# ifTrue: [^ self htmlEscapeNumber: escapeSequence allButFirst].
	(String htmlEntities at: (aString copyFrom: 2 to: aString size - 1) ifAbsent: [])
		ifNotNil: [:char | ^ char].
	^ nil