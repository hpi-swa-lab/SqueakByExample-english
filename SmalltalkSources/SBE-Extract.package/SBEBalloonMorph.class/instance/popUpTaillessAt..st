initialization
popUpTaillessAt: point
	"Do not remove other balloon helps."
	
	| w h |	
	self balloonOwner ifNil: [^ self].
	self balloonOwner isInWorld ifFalse: [^ self].
	
	w := self balloonOwner world.
	h := w activeHand.
	
	self hasTail: false.
		
	#(bottomLeft topLeft bottomRight topRight) detect: [:nextOrientation |
		| pointWithOffset |
		self orientation: nextOrientation.
		pointWithOffset := point + self tailOffset.
		self center: pointWithOffset.
		self bounds: (self bounds translatedToBeWithin: w bounds).
		(self bounds perform: self orientation) = pointWithOffset] ifNone: ["Keep last try."].	
	
	w activeHand addBalloonHelp: self.
	self openInWorld.