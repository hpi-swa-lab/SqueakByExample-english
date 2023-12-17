emitting
emitRef: key

	^ self stream
		withAttribute: (SBETextLabelLink to: key)
		do: [super emitRef: key]