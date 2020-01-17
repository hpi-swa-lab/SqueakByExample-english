private
simulateMouseEvent: aSymbol at: aPoint buttons: someMouseButtons start: aStartPoint

	| morphicEvent |
	morphicEvent := self
		generateMouseEvent: aSymbol
		at: aPoint
		buttons: someMouseButtons
		start: aStartPoint.
	self simulateMouseEvent: morphicEvent.