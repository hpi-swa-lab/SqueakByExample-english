screenshots
takeScreenshot

	| topMorph |
	picture ifNotNil: [^ self].
	topMorph := self world submorphs at: 1 ifAbsent: [nil].
	(topMorph respondsTo: #lookFocused) ifTrue: [
		topMorph lookFocused].
	^ picture := self world imageFormForRectangle: (self screenRectangleUsingArea: [self morphsArea])