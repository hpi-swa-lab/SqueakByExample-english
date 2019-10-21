screenshots
centerMorphs

	| morphsArea delta |
	frameSpecifier isRectangle ifTrue: [^ self].
	morphsArea := self morphsArea.
	delta := world center - morphsArea center.
	delta isZero ifFalse: [
		world submorphsDo: [:morph | morph position: morph position + delta]].