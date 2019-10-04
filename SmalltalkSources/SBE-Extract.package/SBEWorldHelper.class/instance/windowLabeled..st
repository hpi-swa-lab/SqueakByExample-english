matching
windowLabeled: aString

	^ world submorphs
		detect: [:morph | (morph isKindOf: SystemWindow) and: [aString matches: morph label]]
		ifNone: [self error: 'no window with label ', aString]