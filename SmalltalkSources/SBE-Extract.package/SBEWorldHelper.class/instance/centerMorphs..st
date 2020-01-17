screenshots
centerMorphs: morphs

	| area delta |
	area := self morphsAreaOf: morphs.
	delta := self world center - area center.
	delta isZero ifTrue: [^ self].
	morphs do: [:morph |
		morph position: morph position + delta].