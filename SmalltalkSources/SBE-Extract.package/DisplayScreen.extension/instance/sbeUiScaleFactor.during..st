*SBE-Extract-scale factor
sbeUiScaleFactor: aFloat during: aBlock

	| old |
	(old := self uiScaleFactor) = aFloat ifTrue: [^ aBlock value].
	
	self uiScaleFactor: aFloat.
	^ aBlock ensure:
		[self uiScaleFactor: old]