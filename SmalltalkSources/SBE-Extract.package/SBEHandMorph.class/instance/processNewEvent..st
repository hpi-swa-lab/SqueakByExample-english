event simulation
processNewEvent: anEvent

	self queueEvent: anEvent.
	self processEvents.