events
mouseWheel: aMorph direction: aSymbol
	self
		simulateMouseEvent: (
			MouseWheelEvent new
				setType: #mouseWheel
				position: aMorph center
				delta: 0 @ (aSymbol == #up ifTrue: [120] ifFalse: [-120])
				direction: 0 "Will be computed in hand morph."
				buttons: 2r000
				hand: hand
				stamp: 0)
		morph: aMorph.