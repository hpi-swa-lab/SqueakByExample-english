event handling
processEvents
	"Process user input events from the local input devices. Copied from base class, but we don't use EventSensor but our own event query. Also, we don't update z-order here if ActiveEvent is present." <flag: #ct "Is this a problem?">

	| evt hadAny |
	hadAny := false.
	[self hasQueuedEvents] whileTrue: 
			[evt := self dequeueEvent.	"for unknown event types"
			self handleEvent: evt.
			hadAny := true.
			"For better user feedback, return immediately after a mouse event has been processed."
			evt isMouse ifTrue: [^ self]].
	"note: if we come here we didn't have any mouse events"
	mouseClickState notNil 
		ifTrue: 
			["No mouse events during this cycle. Make sure click states time out accordingly"
			mouseClickState handleEvent: lastMouseEvent asMouseMove from: self].
	hadAny 
		ifFalse: 
			["No pending events. Make sure z-order is up to date"
			self mouseOverHandler processMouseOver: lastMouseEvent]