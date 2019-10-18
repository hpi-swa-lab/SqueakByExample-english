matching
morphOfClass: aClass in: aMorph

	^ aMorph
		findDeepSubmorphThat: [:morph | morph class = aClass]
		ifAbsent: [self error: 'no morph with class ', aClass name]