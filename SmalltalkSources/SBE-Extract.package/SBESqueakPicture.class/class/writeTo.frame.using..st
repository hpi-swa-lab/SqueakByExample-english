screenshots
writeTo: aPathString frame: aFrameSpecifier using: aBlock

	| picture |
	picture := self createInFrame: aFrameSpecifier using: aBlock.
	picture ifNil: [^ self].
	picture writePNGfileNamed: (self currentDirectory resolve: aPathString) fullName