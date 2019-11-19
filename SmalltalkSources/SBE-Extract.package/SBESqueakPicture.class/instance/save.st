export
save

	| picture fileReference |
	picture := self create.
	fileReference := FileSystem disk workingDirectory resolve: self filePath.
	fileReference parent ensureDirectory.
	picture writePNGfileNamed: fileReference fullName.