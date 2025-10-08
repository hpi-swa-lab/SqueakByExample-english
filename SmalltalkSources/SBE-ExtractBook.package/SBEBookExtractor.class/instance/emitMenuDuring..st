emitting
emitMenuDuring: aBlock

	^ self stream
		withAttribute: TextEmphasis italic
		do: aBlock