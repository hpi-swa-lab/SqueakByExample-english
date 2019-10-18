screenshots
takeScreenshot

	picture ifNotNil: [^ self].
	^ picture := self world imageFormForRectangle: (self screenRectangleUsingArea: [self morphsArea])