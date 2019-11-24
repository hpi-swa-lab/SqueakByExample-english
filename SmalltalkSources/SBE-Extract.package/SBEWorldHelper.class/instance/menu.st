matching
menu

	^ world
		findDeepSubmorphThat: [:morph | morph isKindOf: MenuMorph]
		ifAbsent: [self error: 'no menu currently in world']