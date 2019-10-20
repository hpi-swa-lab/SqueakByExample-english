matching
dialogWindow

	^ world
		findDeepSubmorphThat: [:morph | morph isKindOf: DialogWindow]
		ifAbsent: [self error: 'no dialog window currently in world']