testing
okToCenterMorphs

	^ self world submorphs allSatisfy: [:morph |
		(morph respondsTo: #updatePosition) not]