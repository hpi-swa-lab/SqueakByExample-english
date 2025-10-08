extracting
extractFromString: aString

	| root previousFile |
	root := self parseString: aString.
	previousFile := file.
	file := nil.
	^ [self basicVisitRoot: root]
		ensure: [file := previousFile]