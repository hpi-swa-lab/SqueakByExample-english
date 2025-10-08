visiting - commands
commandCaption: arguments
	<command: 'caption'>

	self assert: arguments size = 1.
	self basicVisitLineBreak: nil; basicVisitLineBreak: nil.
	^ self emitCaptionDuring:
		[self visit: arguments first]