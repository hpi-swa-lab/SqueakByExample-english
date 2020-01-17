event simulation
processEvent: anEvent in: aMorph

	| result |
	self activateWithEvent: anEvent during: [
		result := aMorph processEvent: anEvent].
	^ result == #rejected ifTrue: [anEvent] ifFalse: [result "filtered event"]