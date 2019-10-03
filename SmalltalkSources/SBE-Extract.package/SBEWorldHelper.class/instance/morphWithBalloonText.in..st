matching
morphWithBalloonText: aString in: aMorph

	^ aMorph
		findDeepSubmorphThat: [:morph | aString matches: morph balloonText]
		ifAbsent: [self error: 'no morph with ballonText ', aString]