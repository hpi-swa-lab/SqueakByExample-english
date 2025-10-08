*SBE-BookCompatibility-Squeak60-private
htmlEscapeNumber: aString

	| number |
	number := aString first = $x
		ifTrue: ['16r', aString allButFirst]
		ifFalse: [aString].
	^ number asNumber asCharacter
	