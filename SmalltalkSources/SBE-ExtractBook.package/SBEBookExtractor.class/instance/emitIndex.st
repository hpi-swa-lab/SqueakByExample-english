visiting - commands
emitIndex

	self
		emitStructureElement: nil
		forBookNode: SBEBookChapter
		type: #chapter
		title: 'Index'.
	^ super emitIndex