events
mouseLeave: aWidget
	self
		simulateMouseEvent: #mouseLeave
		at: aWidget center
		buttons: #()
		start: 0@0
		morph: aWidget