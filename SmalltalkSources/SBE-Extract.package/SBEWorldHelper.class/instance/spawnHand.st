utils
spawnHand

	| imageMorph |
	imageMorph := self hand imageForm asMorph
		topLeft: self hand fullTopLeft;
		yourself.
	
	imageMorph morphicLayerNumber: Morph frontmostLayer.
	self world addMorphFrontInLayer: imageMorph.