screenshots
openFrame: aFrameSpecifier using: aBlock
	"Shorthand to open your screenshot directly. Resets font size while creating the screenshot."
	"SBESqueakPicture openFrame: #morphs using: [:helper | Browser open]"

	self deprecated: 'ct: #writeTo:frame:using: now returns an instance of SBESqueakPicture. So to view the result, just inspect this expression and then perform #open or #openInLowDpi on it.'.
	^ 'DEPRECATED' openAsMorph