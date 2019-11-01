export
saveAs: aFileReference

	| picture |
	picture := self create.
	aFileReference parent ensureDirectory.
	picture writePNGfileNamed: aFileReference fullName.