screenshots
writeTo: aString frame: aFrameSpecifier using: aBlock

	self flag: #deprecated. "ct: Use SBEScreenshotRecorder instead"
	^ SBEScreenshotRecorder
		writeTo: aString
		frame: aFrameSpecifier
		building: aBlock