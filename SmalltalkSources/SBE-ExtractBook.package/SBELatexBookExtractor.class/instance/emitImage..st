emitting
emitImage: aForm

	self stream withAttribute: aForm asSbeTextAnchor do:
		[self stream nextPut: Character home].
	previousLineBreaks := 0.