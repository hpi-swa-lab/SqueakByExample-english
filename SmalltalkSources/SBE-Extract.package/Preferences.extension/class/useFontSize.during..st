*SBE-Extract-prefs - fonts
useFontSize: pointSize during: aBlock
	"< Squeak 6.0"

	| currentDelta |
	currentDelta := Preferences standardSystemFont pointSize - 9.
	currentDelta isZero ifTrue: [^ aBlock value].
	^ [[self changeFontSize: 0]
		valueSuppressingMessages: #('*apply*').
	aBlock value]
		ensure: [self changeFontSize: currentDelta]