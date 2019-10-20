matching
buttonLabeled: aString in: aMorph

	^ aMorph
		findDeepSubmorphThat: [:morph | (morph isKindOf: PluggableButtonMorph) and: [aString matches: morph label]]
		ifAbsent: [self error: 'no button with label ', aString]