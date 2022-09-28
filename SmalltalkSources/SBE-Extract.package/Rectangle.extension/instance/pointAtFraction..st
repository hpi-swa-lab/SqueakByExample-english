*SBE-Extract-rectangle functions-override
pointAtFraction: relativePoint
	"For values between 0.0 and 1.0, answers a point that lies within the receiver.
	This method is a more general form of #center (meaning 0.5@0.5), #topLeft
	(meaning 0.0@0.0), #bottomCenter (meaning 0.5@1.0), etc.
	NOTE THAT for proportions that equal 1.0, the resulting point will NOT lie
	within the receiver, i.e., #containsPoint: will answer false."
	
	| result |
	result := self origin + (self extent * relativePoint).
	^ self isIntegerRectangle
		ifTrue: [result floor]
		ifFalse: [result]