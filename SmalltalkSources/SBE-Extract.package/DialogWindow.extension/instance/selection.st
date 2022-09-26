*SBE-Extract-accessing
selection

	| listMorph |
	listMorph := self
		findDeepSubmorphThat: [:m | m knownName = #list]
		ifAbsent: [^ self error: 'list not found'].
	^ listMorph selection