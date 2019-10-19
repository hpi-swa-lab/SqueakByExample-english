screenshots
adjustMorphsArea: morphsArea

	| delta |
	frameSpecifier isRectangle ifTrue: [
		^ morphsArea].
	delta := world center - morphsArea center.
	delta isZero ifFalse: [
		world submorphsDo: [:morph | morph position: morph position + delta]].
	^ morphsArea translateBy: delta