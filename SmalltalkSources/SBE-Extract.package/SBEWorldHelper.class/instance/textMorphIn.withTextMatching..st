matching
textMorphIn: aMorph withTextMatching: aMatcher

	^ aMorph
		findDeepSubmorphThat: [:morph |
			morph isTextView and: [
				aMatcher matches: morph text]]
		ifAbsent: [self error: 'No text morph found']