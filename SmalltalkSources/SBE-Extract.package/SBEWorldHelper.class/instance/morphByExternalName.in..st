matching
morphByExternalName: aString in: aMorph

	^ aMorph
		findDeepSubmorphThat: [:morph | morph externalName matches: aString]
		ifAbsent: [self error: 'no morph with external name ', aString]