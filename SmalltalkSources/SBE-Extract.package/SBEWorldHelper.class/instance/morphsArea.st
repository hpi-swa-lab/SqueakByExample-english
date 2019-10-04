accessing
morphsArea

	self world hasSubmorphs ifFalse: [self error: 'World did not contain any morphs'].
	^ Rectangle merging: (self world submorphs collect: #bounds)