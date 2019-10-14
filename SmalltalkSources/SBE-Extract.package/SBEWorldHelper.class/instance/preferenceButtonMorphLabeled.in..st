matching
preferenceButtonMorphLabeled: aString in: aMorph

	^ aMorph
		findDeepSubmorphThat: [:morph | (morph isKindOf: PBPreferenceButtonMorph) and: [aString matches: morph label contents]]
		ifAbsent: [self error: 'no preference button with label ', aString]