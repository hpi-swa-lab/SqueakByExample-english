extracting
extractFromFile: aFSReference

	| root previousFile |
	root := self parseFile: aFSReference.
	previousFile := file.
	file := aFSReference.
	^ [self basicVisitRoot: root]
		ensure: [file := previousFile]