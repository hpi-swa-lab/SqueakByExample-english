matching
foregroundWindow

	^ self foregroundMorph
		in: [:morph | self assert: [morph isSystemWindow]];
		yourself