*SBE-Extract-scale factor
sbeUiScaleFactor: aFloat during: aBlock

	| old |
	(old := self uiScaleFactor) = aFloat ifTrue: [^ aBlock value].
	
	thisContext wrap: [:block | | oldHostWindowSize |
		self flag: #hack. "#actualScreenSize and #hostWindowSize: are NO exact equivalents of each other, but this heuristic helps us to avoid the host window from shrinking extremely after each send to this message."
		oldHostWindowSize := DisplayScreen actualScreenSize.
		block ensure:
			[DisplayScreen actualScreenSize ~= oldHostWindowSize ifTrue:
				[DisplayScreen setNewScreenSize: oldHostWindowSize]]].
	
	self uiScaleFactor: aFloat.
	^ aBlock ensure:
		[self uiScaleFactor: old]