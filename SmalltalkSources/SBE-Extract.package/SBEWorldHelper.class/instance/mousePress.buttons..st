events
mousePress: aWidget buttons: aButtonsCollection
	self
		simulateMouseEvent: #mouseDown
		at: aWidget center
		buttons: aButtonsCollection
		start: 0@0
		morph: aWidget