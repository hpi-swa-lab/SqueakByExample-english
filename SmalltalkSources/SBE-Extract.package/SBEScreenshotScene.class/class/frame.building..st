instance creation
frame: aFrameSpecifier building: aBuildBlock

	^ self new
		initializeBuildBlock: aBuildBlock;
		frameSpecifier: aFrameSpecifier;
		yourself