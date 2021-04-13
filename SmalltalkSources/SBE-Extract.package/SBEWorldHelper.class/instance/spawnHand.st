utils
spawnHand

	| imageMorph |
	imageMorph := self hand imageForm asMorph
		topLeft: self hand fullTopLeft;
		yourself.
	
	(self world respondsTo: #addMorphFrontInLayer:)
		ifFalse: ["< Morphic-mt.1726 (6.0)"
			self world addMorph: imageMorph.
			^ self].
	
	imageMorph morphicLayerNumber: Morph frontmostLayer.
	self world addMorphFrontInLayer: imageMorph.