matching
morphByExternalName: aString in: aMorph

	^ aMorph
		findDeepSubmorphThat: [:morph | aString matches: morph externalName]
		ifAbsent: [self error: 'no morph with external name ', aString]