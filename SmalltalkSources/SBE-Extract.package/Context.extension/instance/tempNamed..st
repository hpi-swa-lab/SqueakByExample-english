*SBE-Extract-accessing
tempNamed: aString
	"Return the value of the temporary variable in me with that name.  Slow and unclean, but very useful."

	^ self debuggerMap tempNamed: aString in: self