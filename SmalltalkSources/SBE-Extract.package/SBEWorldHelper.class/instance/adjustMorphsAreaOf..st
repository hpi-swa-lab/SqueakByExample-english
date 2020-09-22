screenshots
adjustMorphsAreaOf: morphs

	| morphsArea |
	morphsArea := self morphsAreaOf: morphs.
	world extent: (scene frameSpecifier isRectangle
		ifFalse: [morphsArea]
		ifTrue: [morphsArea merge: scene frameSpecifier]) bottomRight.