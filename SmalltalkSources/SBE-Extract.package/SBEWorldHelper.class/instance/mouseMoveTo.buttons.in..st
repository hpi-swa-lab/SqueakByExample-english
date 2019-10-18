events
mouseMoveTo: aPoint buttons: aButtonsCollection in: aWidget
	self
		simulateMouseEvent: #mouseMove
		at: aPoint
		buttons: aButtonsCollection
		start: self hand position
		morph: aWidget