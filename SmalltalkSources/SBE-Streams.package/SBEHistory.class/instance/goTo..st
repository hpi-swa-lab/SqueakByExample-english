actions
goTo: anObject

	stream nextPut: anObject.
	stream nextPut: nil.
	stream back.