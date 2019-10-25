screenshots
writeTo: aPathString frame: aFrameSpecifier using: aBlock

	| picture path |
	picture := self createInFrame: aFrameSpecifier using: aBlock.
	path := (self currentDirectory resolve: aPathString) fullName.
	(FileDirectory on: path) containingDirectory assureExistence.
	picture writePNGfileNamed: path.