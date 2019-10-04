events
mousePress: aWidget at: aPoint buttons: aButtonsCollection
	self
		simulateMouseEvent: #mouseDown
		at: aPoint
		buttons: aButtonsCollection
		start: 0@0
		morph: aWidget