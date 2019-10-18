events
mouseEnter: aWidget at: aPoint
	self
		simulateMouseEvent: #mouseEnter
		at: aPoint
		buttons: #()
		start: 0@0
		morph: aWidget