accessing
anchorLabels

	self text ifNil: [^ #()].
	^ cachedAnchorLabels ifNil: [cachedAnchorLabels :=
		(self text sbeAllAttributes
			select: [:attr | attr isKindOf: SBETextLabelAnchor]
			thenCollect: [:attr | attr label])
				withoutDuplicates]