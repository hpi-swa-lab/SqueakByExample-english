emitting
emitURL: urlString

	self stream withAttribute: (TextURL url: urlString) do:
		[self stream nextPutAll: urlString].
	previousLineBreaks := 0.