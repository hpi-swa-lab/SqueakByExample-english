export
saveAs: aFileReference

	aFileReference parent ensureDirectory.
	[self picture writePNGfileNamed: aFileReference fullName]
		ifCurtailed: [
			Transcript showln: thisContext stack.
			"ToolSet debugException: (Halt new searchFrom: thisContext)."
			Smalltalk logSqueakError: 'just a test' inContext: thisContext; flag: #debug].