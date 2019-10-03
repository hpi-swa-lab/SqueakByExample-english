events
mouseRelease: aWidget at: aPoint buttons: aButtonsCollection
	self
		simulateMouseEvent: #mouseUp
		at: aPoint
		buttons: aButtonsCollection
		start: 0@0
		morph: aWidget