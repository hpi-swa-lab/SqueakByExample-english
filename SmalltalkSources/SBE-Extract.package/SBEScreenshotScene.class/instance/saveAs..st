export
saveAs: aFileReference

	aFileReference parent ensureDirectory.
	self picture writePNGfileNamed: aFileReference fullName.