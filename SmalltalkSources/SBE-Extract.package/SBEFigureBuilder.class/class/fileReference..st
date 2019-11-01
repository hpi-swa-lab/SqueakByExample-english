accessing
fileReference: aReference

	(fileReference isNil or: [fileReference = aReference])
		ifFalse: [self notify: ('File reference for {1} changed' format: {self})].
	fileReference := aReference.