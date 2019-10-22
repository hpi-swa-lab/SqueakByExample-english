screenshots
morphsArea

	| morphsBounds tightArea |
	self world hasSubmorphs ifFalse: [self error: 'World did not contain any morphs'].
	morphsBounds := self world submorphs collect: [:morph |
		morph hasDropShadow
			ifTrue: [morph bounds] "Ignore drop shadows by default"
			ifFalse: [morph fullBounds]].
	tightArea := self cutFrame: (Rectangle merging: morphsBounds).
	tightArea allAreasOutsideList: morphsBounds do: [:anyFragment |
		"Overlapping windows, now respect possible drop shadows"
		^ self cutFrame: (Rectangle merging: (
			self world submorphs collect: #fullBounds))].
	^ tightArea