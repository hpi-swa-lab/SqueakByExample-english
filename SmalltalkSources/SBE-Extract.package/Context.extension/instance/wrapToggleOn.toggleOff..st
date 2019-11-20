*SBE-Extract-controlling
wrapToggleOn: aBlock toggleOff: anotherBlock

	aBlock value.
	self insertEnsure: anotherBlock.