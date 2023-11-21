emitting
emitEmphasis: aStringOrText

	^ self emitEmphasisDuring:
		[self stream nextPutAll: aStringOrText]