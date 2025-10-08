visiting - commands
emitIndexForwardReference: forwardReference

	self emitEmphasisDuring:
		[self stream nextPutAll: forwardReference key , ' '].
	self emitRefPlaceholder: (self keyForIndexPath: forwardReference value).