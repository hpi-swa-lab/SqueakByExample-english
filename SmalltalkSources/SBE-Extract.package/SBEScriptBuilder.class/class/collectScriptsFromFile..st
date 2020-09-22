code generation
collectScriptsFromFile: aFile

	| stream |
	stream := FileStream readOnlyFileNamed: aFile fullName.
	^ [(self collectScriptsFromStream: stream)
			, (self collectScriptsClassicFromStream: stream reset)]
		ensure: [stream close]