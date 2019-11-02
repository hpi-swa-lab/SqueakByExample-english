*SBE-Extract-printing
storeOn: aStream
	"Overridden for use in SBEFigureBuilder class >> #compileCommand"

	aStream nextPutAll: self decompile decompileString.