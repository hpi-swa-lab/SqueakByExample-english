screenshots
morphsAreaOf: morphs

	| morphsBounds tightArea |
	morphs ifEmpty: [self error: 'No morphs specified'].
	morphsBounds := morphs collect: [:morph |
		morph hasDropShadow
			ifTrue: [morph bounds] "Ignore drop shadows by default"
			ifFalse: [morph fullBounds]].
	tightArea := self cutFrame: (Rectangle merging: morphsBounds).
	tightArea allAreasOutsideList: morphsBounds do: [:anyFragment |
		"Overlapping windows, now respect possible drop shadows"
		^ self cutFrame: (Rectangle merging: (
			morphs collect: #fullBounds))].
	^ tightArea