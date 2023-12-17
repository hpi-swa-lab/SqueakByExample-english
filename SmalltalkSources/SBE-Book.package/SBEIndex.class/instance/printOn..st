printing
printOn: aStream

	super printOn: aStream.
	
	self key ifNotNil:
		[aStream
			nextPut: $<;
			nextPutAll: self key;
			nextPut: $>].
	self label ifNotNil:
		[aStream
			space;
			print: self label asString].