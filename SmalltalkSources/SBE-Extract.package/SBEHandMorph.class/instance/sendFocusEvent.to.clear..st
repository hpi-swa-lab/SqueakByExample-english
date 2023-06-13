private
sendFocusEvent: anEvent to: focusHolder clear: aBlock
	"Send the event to the morph currently holding the focus"

	focusHolder ifNotNil:[^super sendFocusEvent: anEvent to: focusHolder clear: aBlock].
	self activateWithEvent: anEvent during: [
		^ focusHolder processFocusEvent:
			(anEvent transformedBy: (focusHolder transformedFrom: self))]