events
mouseEnterDragging: aWidget
	self
		simulateMouseEvent: #mouseEnter
		at: aWidget center
		buttons: #(left)
		start: 0@0
		morph: aWidget