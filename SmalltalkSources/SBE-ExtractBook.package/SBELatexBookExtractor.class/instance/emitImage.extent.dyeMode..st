emitting
emitImage: aForm extent: extent dyeMode: dyeMode

	self stream withAttribute: (aForm asSbeTextAnchorWithExtent: extent dyeMode: dyeMode) do:
		[self stream nextPut: Character home].
	previousLineBreaks := 0.