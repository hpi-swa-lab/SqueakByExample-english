mouse events
openLabelIn: aHelpBrowser

	| book path |
	book := aHelpBrowser currentTopic book.
	path := book pathToLabel: self label.
	path ifNil: [^ self inform: ('{1} not found :(' format: {self label})].
	
	^ self openPath: path in: aHelpBrowser