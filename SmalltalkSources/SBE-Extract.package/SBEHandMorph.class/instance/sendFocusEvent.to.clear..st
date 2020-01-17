private
sendFocusEvent: anEvent to: focusHolder clear: aBlock
	"Send the event to the morph currently holding the focus"

	self activateWithEvent: anEvent during: [
		^ focusHolder processFocusEvent:
			(anEvent transformedBy: (focusHolder transformedFrom: self))]