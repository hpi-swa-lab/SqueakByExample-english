screenshots
openFrame: aFrameSpecifier using: aBlock
	"Shorthand to open your screenshot directly. Resets font size while creating the screenshot."
	"SBESqueakPicture openFrame: #morphs using: [:helper | Browser open]"

	| picture |
	picture := self
		filePath: nil
		frame: aFrameSpecifier
		buildBlock: aBlock.
	^ picture open