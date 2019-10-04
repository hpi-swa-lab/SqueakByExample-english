events
mouseEnter: aWidget
	self
		simulateMouseEvent: #mouseEnter
		at: aWidget center
		buttons: #()
		start: 0@0
		morph: aWidget