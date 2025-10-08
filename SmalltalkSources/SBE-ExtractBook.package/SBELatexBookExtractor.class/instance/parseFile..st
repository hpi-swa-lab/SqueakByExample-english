extracting
parseFile: aFSReference

	| source |
	source := self preprocessedContentsFromFile: aFSReference.
	^ self parseString: source