*SBE-Extract-accessing
fullTopLeft

	^ self topLeft + (self hasSubmorphs
		ifTrue: [self targetOffset - self shadowOffset min: 0 asPoint]
		ifFalse: [0])