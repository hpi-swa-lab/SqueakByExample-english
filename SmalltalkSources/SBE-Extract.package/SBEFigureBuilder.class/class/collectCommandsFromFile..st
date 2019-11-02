code generation
collectCommandsFromFile: aFile

	| stream |
	stream := FileStream readOnlyFileNamed: aFile fullName.
	^ [self collectCommandsFromStream: stream]
		ensure: [stream close]