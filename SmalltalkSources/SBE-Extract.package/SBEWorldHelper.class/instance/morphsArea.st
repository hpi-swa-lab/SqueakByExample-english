screenshots
morphsArea

	self world hasSubmorphs ifFalse: [self error: 'World did not contain any morphs'].
	^ self morphsAreaOf: self world submorphs