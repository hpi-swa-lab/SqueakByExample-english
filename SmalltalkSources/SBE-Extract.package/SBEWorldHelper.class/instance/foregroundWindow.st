matching
foregroundWindow

	^ self foregroundMorph
		in: [:morph |
			self assert: [morph isSystemWindow] descriptionBlock: [
				'Foreground morph should be a system window but is {1}' format: {morph}]];
		yourself