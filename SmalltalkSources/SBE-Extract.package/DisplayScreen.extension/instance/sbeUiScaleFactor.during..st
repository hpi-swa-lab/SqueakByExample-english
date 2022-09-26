*SBE-Extract-scale factor
sbeUiScaleFactor: aFloat during: aBlock
	">= Squeak 6.0"

	| old |
	(old := self uiScaleFactor) = aFloat ifTrue: [^ aBlock value].
	
	self uiScaleFactor: aFloat.
	^ aBlock ensure:
		[self uiScaleFactor: old]