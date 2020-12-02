event handling
mouseDown: anEvent

	anEvent redButtonPressed
		ifTrue: [self color: Color red].
	anEvent yellowButtonPressed
		ifTrue: [self color: Color yellow].
	self changed.