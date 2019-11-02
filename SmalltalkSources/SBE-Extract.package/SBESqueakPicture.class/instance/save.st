export
save

	| picture |
	picture := self create.
	self filePath parent ensureDirectory.
	picture writePNGfileNamed: self filePath fullName.