examples
exampleText
	"SBEFileStreams exampleText"

	| string |
	FileStream
		forceNewFileNamed: 'test.txt'
		do: [:stream |
			stream
				nextPutAll: 'This text is written in a file named ';
				print: stream localName].
	string := FileStream
		readOnlyFileNamed: 'test.txt'
		do: [:stream | stream contents].
	^ string