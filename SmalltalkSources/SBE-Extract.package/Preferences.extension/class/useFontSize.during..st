*SBE-Extract
useFontSize: pointSize during: aBlock

	| currentDelta |
	currentDelta := Preferences standardSystemFont pointSize - 9.
	currentDelta isZero ifTrue: [^ aBlock value].
	^ [[self changeFontSize: 0]
		valueSuppressingMessages: #('*apply*').
	aBlock value]
		ensure: [self changeFontSize: currentDelta]