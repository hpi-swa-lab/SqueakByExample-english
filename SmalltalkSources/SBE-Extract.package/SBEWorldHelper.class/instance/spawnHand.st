utils
spawnHand

	self world addMorph: (self hand imageForm asMorph
		position: self hand position;
		yourself).