screenshots
writeTo: aPathString frame: aFrameSpecifier using: aBlock

	| picture |
	picture := self createInFrame: aFrameSpecifier using: aBlock.
	picture ifNil: [^ false].
	picture writePNGfileNamed: (self currentDirectory resolve: aPathString) fullName.
	^ true