*SBE-Extract-accessing
setDefault: aClassOrNil during: aBlock

	| previousDefault |
	previousDefault := self default.
	self default: aClassOrNil.
	^ aBlock ensure: [
		self default: previousDefault]