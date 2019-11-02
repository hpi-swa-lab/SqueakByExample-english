screenshots
writeTo: aString frame: aFrameSpecifier using: aBlock

	^ self
		filePath: (FSPath from: aString delimiter: $/)
		frame: aFrameSpecifier
		buildBlock: aBlock