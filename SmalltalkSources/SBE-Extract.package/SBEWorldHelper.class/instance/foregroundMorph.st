matching
foregroundMorph

	^ world submorphThat: #visible ifNone: [self error: 'World is empty']