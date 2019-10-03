events
mouseLeaveDragging: aWidget
	self
		simulateMouseEvent: #mouseLeave
		at: aWidget center
		buttons: #(left)
		start: 0@0
		morph: aWidget