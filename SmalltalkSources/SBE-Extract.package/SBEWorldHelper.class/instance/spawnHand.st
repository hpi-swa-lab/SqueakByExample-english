utils
spawnHand

	self world addMorph: (self hand imageForm asMorph
		topLeft: self hand fullTopLeft;
		yourself).