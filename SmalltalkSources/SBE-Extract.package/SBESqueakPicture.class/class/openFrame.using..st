screenshots
openFrame: aFrameSpecifier using: aBlock
	"Shorthand to open your screenshot directly. Resets font size while creating the screenshot."
	"SBESqueakPicture openFrame: #morphs using: [:helper | Browser open]"

	self flag: #deprecated. "ct: Use SBEScreenshotRecorder debugging instead"
	^ SBEScreenshotRecorder debugging building: aBlock