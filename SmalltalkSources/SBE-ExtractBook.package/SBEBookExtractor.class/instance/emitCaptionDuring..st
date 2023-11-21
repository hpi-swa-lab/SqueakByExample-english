emitting
emitCaptionDuring: aBlock

	^ self stream
		withAttribute: TextFontChange font1
		do: aBlock