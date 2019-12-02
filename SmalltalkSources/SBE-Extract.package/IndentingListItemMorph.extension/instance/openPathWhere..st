*SBE-Extract-container protocol
openPathWhere: aPredicateArray 
	| found |
	aPredicateArray isEmpty
		ifTrue: [^ container setSelectedMorph: nil].
	found := nil.
	self
		withSiblingsDo: [:each | found
				ifNil: [(aPredicateArray first value: each complexContents)
						ifTrue: [found := each]]].
	found
		ifNotNil: [found isExpanded
				ifFalse: [found toggleExpandedState.
					container adjustSubmorphPositions].
			found changed.
			aPredicateArray size = 1
				ifTrue: [^ container setSelectedMorph: found].
			^ found firstChild
				ifNil: [container setSelectedMorph: nil]
				ifNotNil: [found firstChild openPathWhere: aPredicateArray allButFirst]].
	^ container setSelectedMorph: nil