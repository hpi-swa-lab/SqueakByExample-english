utils
spawnMorph: aMorph

	| imageMorph |
	imageMorph := aMorph imageForm asMorph
		topLeft: aMorph fullBounds topLeft;
		yourself.
	
	imageMorph morphicLayerNumber: Morph frontmostLayer.
	self world addMorphFrontInLayer: imageMorph.