emitting
emitEmphasisDuring: aBlock

	^ self stream
		withAttribute: TextEmphasis italic
		do: aBlock