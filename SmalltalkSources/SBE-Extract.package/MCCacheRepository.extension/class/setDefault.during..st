*SBE-Extract-accessing
setDefault: aRepository during: aBlock

	| original |
	original := default.
	default := aRepository.
	^ aBlock ensure: [
		default := original]