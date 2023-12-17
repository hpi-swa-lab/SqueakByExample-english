emitting
emitLineBreak: single

	self stream cr.
	single ifFalse:
		[self stream cr].