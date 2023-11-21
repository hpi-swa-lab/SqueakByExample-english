mouse events
actOnClickFor: anObject

	| book |
	book := anObject currentTopic book.
	book openLabel: self label in: anObject.
	^ true