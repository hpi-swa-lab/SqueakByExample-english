as yet unclassified
writeTo: aPathString frame: aSymbolOrRectangle using: aBlock

	| world picture |
	world := (PasteUpMorph newWorldForProject: nil)
		extent: self worldSize;
		viewBox: (0 @ 0 extent: self worldSize);
		yourself.
	
	(world instVarNamed: #worldState)
		instVarNamed: #canvas
		put: (Form extent: self worldSize depth: 32) getCanvas.
	
	world becomeActiveDuring: aBlock.
	
	aSymbolOrRectangle = #morphs ifTrue: [
		world hasSubmorphs ifFalse: [self error: 'World did not contain any morphs'].
		picture := world imageFormForRectangle: (Rectangle merging: (world submorphs collect: #bounds))].
	
	aSymbolOrRectangle isRectangle ifTrue: [
		picture := world imageFormForRectangle: aSymbolOrRectangle].
	
	picture ifNil: [self error: 'Invalid frame specified: ', aSymbolOrRectangle printString].
	picture writePNGfileNamed: (self currentDirectory resolve: aPathString) fullName