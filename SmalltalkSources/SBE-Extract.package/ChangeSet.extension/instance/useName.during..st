*SBE-Extract-accessing
useName: newName during: aBlock

	| oldName |
	oldName := name.
	self name: newName.
	^ aBlock ensure: [
		self name: oldName]