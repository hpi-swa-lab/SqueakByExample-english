testing
okToAdjustMorphsAreaOf: morphs

	^ morphs allSatisfy: [:morph |
		(morph respondsTo: #updatePosition) not]