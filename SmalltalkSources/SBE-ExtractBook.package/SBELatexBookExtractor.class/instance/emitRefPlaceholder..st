emitting
emitRefPlaceholder: key

	self stream
		nextPut: self refPlaceholderStart;
		nextPutAll: key;
		nextPut: self refPlaceholderStop.
	previousLineBreaks := 0.