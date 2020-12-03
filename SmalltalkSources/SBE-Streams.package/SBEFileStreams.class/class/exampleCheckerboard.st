examples
exampleCheckerboard
	"SBEFileStreams exampleCheckerboard"

	FileStream
		forceNewFileNamed: 'test.pgm'
		do: [:stream |
			stream
				nextPutAll: 'P5'; cr;
				nextPutAll: '4 4'; cr;
				nextPutAll: '255'; cr;
				binary;
				nextPutAll: #[255 0 255 0];
				nextPutAll: #[0 255 0 255];
				nextPutAll: #[255 0 255 0];
				nextPutAll: #[0 255 0 255]
		]