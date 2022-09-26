*SBE-Extract-accessing
selection

	| listMorph |
	listMorph := self
		findDeepSubmorphThat: [:m | m knownName = #list]
		ifAbsent: [
			"buttons (e.g., UIManager>>#chooseOptionFrom:* >= Squeak 6.0)"
			^ self selectedButton label].
	"list (e.g., UIManager>>#chooseFrom:*)"
	^ listMorph selection