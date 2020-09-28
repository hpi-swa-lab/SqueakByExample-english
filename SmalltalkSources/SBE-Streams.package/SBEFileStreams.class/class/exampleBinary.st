examples
exampleBinary
	"SBEFileStreams exampleBinary"

	FileStream
		forceNewFileNamed: 'test.bin'
		do: [:stream |
			stream
				binary;
				nextPutAll: #[145 250 139 98]].
	^ FileStream
		readOnlyFileNamed: 'test.bin'
		do: [:stream |
			stream binary.
			{
				stream size.
				stream next.
				stream upToEnd.
		}]