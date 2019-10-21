screenshots
takeScreenshot

	| rectangle |
	picture ifNotNil: [^ self].
	self prepareForScreenshot.
	rectangle := self screenRectangleUsingArea: self morphsArea.
	^ picture := self world imageFormForRectangle: rectangle