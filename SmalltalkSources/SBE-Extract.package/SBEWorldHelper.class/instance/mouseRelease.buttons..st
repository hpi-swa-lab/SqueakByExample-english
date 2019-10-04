events
mouseRelease: aWidget buttons: aButtonsCollection
	self
		simulateMouseEvent: #mouseUp
		at: aWidget center
		buttons: aButtonsCollection
		start: 0@0
		morph: aWidget