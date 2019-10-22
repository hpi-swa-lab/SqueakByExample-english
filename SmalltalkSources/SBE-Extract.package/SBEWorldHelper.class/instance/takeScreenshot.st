screenshots
takeScreenshot

	| rectangle |
	picture ifNotNil: [^ self].
	self prepareForScreenshot.
	rectangle := self morphsArea.
	^ picture := self world imageFormForRectangle: rectangle