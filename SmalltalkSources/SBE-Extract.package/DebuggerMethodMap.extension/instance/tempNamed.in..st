*SBE-Extract-accessing
tempNamed: aString in: aContext
	"Return the value of the temporary variable in aContext with that name.  Slow and unclean, but very useful."

	^ self
		namedTempAt: (self
			tempIndexFor: aString asString
			in: aContext
			ifAbsent: [self error: 'no such temp'])
		in: aContext