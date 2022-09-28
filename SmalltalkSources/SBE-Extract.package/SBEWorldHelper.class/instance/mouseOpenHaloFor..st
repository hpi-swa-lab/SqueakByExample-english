events
mouseOpenHaloFor: aMorph

	| event |
	event := MouseButtonEvent new
		setType: #mouseDown
		position: aMorph center
		which: (self mapButton: #middle)
		buttons: (self mapButtons: #(middle))
		hand: self hand
		stamp: 0.
	aMorph defaultHaloDispatcher invokeHaloOrMove: event on: aMorph.
	^ self hand halo