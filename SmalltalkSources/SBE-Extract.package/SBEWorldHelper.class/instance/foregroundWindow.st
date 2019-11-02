matching
foregroundWindow

	^ world submorphs first
		in: [:morph | self assert: [morph isSystemWindow]];
		yourself