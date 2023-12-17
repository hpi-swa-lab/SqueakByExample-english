emitting
emitBoldDuring: aBlock

	^ self stream
		withAttribute: TextEmphasis bold
		do: aBlock