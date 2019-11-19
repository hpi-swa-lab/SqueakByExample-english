*SBE-Extract-accessing
changeDirectory: aPath during: aBlock

	| latestPath |
	latestPath := self workingDirectoryPath.
	self changeDirectory: aPath.
	^ aBlock ensure: [
		self changeDirectory: latestPath]