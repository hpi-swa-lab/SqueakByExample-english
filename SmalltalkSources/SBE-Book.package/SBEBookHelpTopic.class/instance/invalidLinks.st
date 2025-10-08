debugging
invalidLinks

	^ ((self bookNode text ifNil: [^ #()]) sbeAllAttributes
		select: [:attr | attr isKindOf: SBETextLabelLink]
		thenCollect: [:attr | attr label])
			withoutDuplicates
				select: [:label | (self book pathToLabel: label) isNil]