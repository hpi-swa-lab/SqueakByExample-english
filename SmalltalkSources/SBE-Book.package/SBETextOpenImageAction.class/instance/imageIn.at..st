private
imageIn: aParagraph at: aPoint

	| index |
	index := (aParagraph characterBlockAtPoint: aPoint) stringIndex.
	^ ((aParagraph text attributesAt: index)
		detect: [:attr | attr isKindOf: SBETextAnchor])
			image