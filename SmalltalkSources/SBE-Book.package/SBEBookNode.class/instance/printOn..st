printing
printOn: aStream

	super printOn: aStream.
	
	self title ifNotNil:
		[aStream
			nextPut: $<;
			nextPutAll: self title;
			nextPut: $>].