screenshots
takeScreenshotOfAll: morphs

	| rectangle picture |
	self prepareForScreenshotOf: morphs.
	rectangle := self morphsAreaOf: morphs.
	picture := self world
		forgetSubmorphs: (self world submorphs copyWithoutAll: morphs)
		during: [self world imageFormForRectangle: rectangle].
	scene picture: picture.
	^ picture