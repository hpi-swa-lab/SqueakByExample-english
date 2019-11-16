*SBE-Extract-submorphs
forgetSubmorphs: morphs during: aBlock

	| myMorphs |
	myMorphs := self privateSubmorphs.
	self privateSubmorphs: (myMorphs copyWithoutAll: morphs).
	^ aBlock ensure: [
		self privateSubmorphs: myMorphs]