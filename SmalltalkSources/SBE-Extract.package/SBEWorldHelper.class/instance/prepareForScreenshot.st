screenshots
prepareForScreenshot

	self world firstSubmorph in: [:topMorph |
		(topMorph respondsTo: #lookFocused) ifTrue: [
			topMorph lookFocused]].