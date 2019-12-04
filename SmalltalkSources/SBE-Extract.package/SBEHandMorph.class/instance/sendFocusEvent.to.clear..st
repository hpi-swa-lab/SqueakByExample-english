private events
sendFocusEvent: anEvent to: focusHolder clear: aBlock
	"Send the event to the morph currently holding the focus"

	self activateWithEvent: anEvent during: [
		^ focusHolder handleFocusEvent:
			(anEvent transformedBy: (focusHolder transformedFrom: self))]