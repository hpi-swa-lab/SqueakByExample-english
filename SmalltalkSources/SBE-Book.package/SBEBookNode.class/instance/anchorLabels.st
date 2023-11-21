accessing
anchorLabels

	self text ifNil: [^ #()].
	^ (self text sbeAllAttributes
		select: [:attr | attr isKindOf: SBETextLabelAnchor]
		thenCollect: [:attr | attr label])
			withoutDuplicates