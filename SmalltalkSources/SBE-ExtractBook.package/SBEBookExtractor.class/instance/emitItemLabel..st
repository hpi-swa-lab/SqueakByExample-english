emitting
emitItemLabel: aString

	^ self emitBoldDuring:
		[super emitItemLabel: aString]