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
	(aMorph respondsTo: #defaultHaloDispatcher)
		ifTrue: [aMorph defaultHaloDispatcher invokeHaloOrMove: event on: aMorph]
		ifFalse: ["<Morphic-mt.1732" aMorph invokeHaloOrMove: event].
	^ self hand halo