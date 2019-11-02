screenshots
displayForegroundWindowFocused

	self foregroundMorph in: [:topMorph |
		(topMorph respondsTo: #lookFocused) ifTrue: [
			topMorph lookFocused]].