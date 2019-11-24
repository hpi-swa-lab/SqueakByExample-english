screenshots
writeTo: aString fromForm: aFormBlock

	self flag: #deprecated. "ct: Use SBEScreenshotRecorder instead"
	^ SBEScreenshotRecorder
		writeTo: aString
		buildingForm: aFormBlock