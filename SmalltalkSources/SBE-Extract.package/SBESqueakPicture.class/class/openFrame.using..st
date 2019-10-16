screenshots
openFrame: aFrameSpecifier using: aBlock
	"Shorthand to open your screenshot directly. Resets font size while creating the screenshot."
	"SBESqueakPicture openFrame: #morphs using: [:helper | Browser open]"

	| image |
	image := Preferences useFontSize: 9 during: [self createInFrame: aFrameSpecifier using: aBlock].
	^ image openAsMorph