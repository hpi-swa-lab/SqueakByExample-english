matching
textMorphIn: aMorph withTextMatchedBy: aMatcher

	^ aMorph
		findDeepSubmorphThat: [:morph |
			morph isTextView and: [
				aMatcher matches: morph text asString]]
		ifAbsent: [self error: 'No text morph found']