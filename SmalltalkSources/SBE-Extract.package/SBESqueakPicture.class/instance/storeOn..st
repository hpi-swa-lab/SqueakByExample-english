printing
storeOn: aStream

	aStream
		nextPut: $(;
		nextPutAll: self class name.
	(#filePath:frame:buildBlock: findTokens: $:)
		with: {self filePath. self frameSpecifier. self buildBlock}
		do: [:param :arg |
			aStream
				space;
				nextPutAll: param;
				nextPut: $:; space;
				store: arg].
	aStream nextPut: $).