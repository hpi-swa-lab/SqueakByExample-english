screenshots
takeScreenshot

	| morphsArea rectangle |
	picture ifNotNil: [^ self].
	morphsArea := self adjustMorphsArea.
	self prepareForScreenshot.
	rectangle := self screenRectangleUsingArea: morphsArea.
	^ picture := self world imageFormForRectangle: rectangle