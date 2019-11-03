utils
codePaneOfBrowser: aWindow

	^ aWindow
		findDeepSubmorphThat: [:morph | (morph respondsTo: #okToStyle) and: [morph in: #okToStyle]]
		ifAbsent: [self error: 'Did not found code pane']