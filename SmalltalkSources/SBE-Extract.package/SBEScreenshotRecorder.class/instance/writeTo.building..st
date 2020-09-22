saving
writeTo: aFileString building: aBuildBlock

	^ self
		writeScene: (SBEScreenshotScene building: aBuildBlock)
		to: aFileString