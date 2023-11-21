emitting
emitCode: aStringOrText

	^ self emitCodeDuring:
		[self stream nextPutAll: aStringOrText.
		previousLineBreaks := 0]