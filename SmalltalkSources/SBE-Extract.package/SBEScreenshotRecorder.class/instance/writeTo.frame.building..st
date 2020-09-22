saving
writeTo: aFileString frame: aFrameSpecifier building: aBuildBlock

	| scene |
	scene := SBEScreenshotScene
		frame: aFrameSpecifier
		building: aBuildBlock.
	^ self
		writeScene: scene
		to: aFileString