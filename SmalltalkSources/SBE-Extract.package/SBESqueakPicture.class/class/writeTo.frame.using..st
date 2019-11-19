screenshots
writeTo: aString frame: aFrameSpecifier using: aBlock

	| picture |
	picture := self
		filePath: (FSPath from: aString delimiter: $/)
		frame: aFrameSpecifier
		buildBlock: aBlock.
	^ picture save