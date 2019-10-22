screenshots
adjustMorphsArea

	| morphsArea delta |
	frameSpecifier isRectangle ifTrue: [^ self].
	morphsArea := self morphsArea.
	delta := world center - morphsArea center.
	delta isZero ifTrue: [^ self].
	self world submorphsDo: [:morph | morph position: morph position + delta].