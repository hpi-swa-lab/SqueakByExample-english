emitting
emitCaptionDuring: aBlock

	^ self stream
		withAttribute: SBETextFontReference smaller
		do: aBlock