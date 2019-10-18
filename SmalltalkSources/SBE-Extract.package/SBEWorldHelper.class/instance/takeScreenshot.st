screenshots
takeScreenshot

	| topMorph |
	picture ifNotNil: [^ self].
	topMorph := self world firstSubmorph.
	(topMorph respondsTo: #lookFocused) ifTrue: [
		topMorph lookFocused].
	^ picture := self world imageFormForRectangle: (self screenRectangleUsingArea: [self morphsArea])