matching
foregroundWindow

	^ self foregroundMorph
		in: [:morph |
			self flag: #debug. "Do not merge!"
			Transcript showln: morph.
			self assert: [morph isSystemWindow]];
		yourself