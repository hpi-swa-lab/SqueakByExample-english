emitting
emitIndexForwardReference: forwardReference

	self stream nextPutAll: forwardReference key , ' '.
	self emitRefPlaceholder: (self keyForIndexPath: forwardReference value).