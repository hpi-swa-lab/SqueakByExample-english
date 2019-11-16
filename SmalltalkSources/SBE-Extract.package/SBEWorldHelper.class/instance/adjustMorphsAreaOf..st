screenshots
adjustMorphsAreaOf: morphs

	| morphsArea delta |
	frameSpecifier isRectangle ifTrue: [^ self].
	morphsArea := self morphsAreaOf: morphs.
	delta := world center - morphsArea center.
	delta isZero ifTrue: [^ self].
	morphs do: [:morph | morph position: morph position + delta].