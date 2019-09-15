event handling
mouseUp: anEvent
	(self containsPoint: Sensor mousePoint)  ifTrue: [mouseAction value]