private events
sendFocusEvent: anEvent to: focusHolder clear: aBlock
	"Send the event to the morph currently holding the focus"

	thisContext
		wrap: [:block | self world becomeActiveDuring: block];
		wrap: [:block | self becomeActiveDuring: block];
		wrap: [:block | anEvent becomeActiveDuring: block].
	^ focusHolder handleFocusEvent:
		(anEvent transformedBy: (focusHolder transformedFrom: self))