initialization
popUpAt: point orientation: orientation
	"Copied and adjusted from super!"
	
	| w h pointWithOffset |	
	self balloonOwner ifNil: [^ self].
	self balloonOwner isInWorld ifFalse: [^ self].
	
	w := self balloonOwner world.
	h := w activeHand.
	
	self hasTail: true.
		
	self orientation: orientation.
	pointWithOffset := point + self tailOffset.
	self move: pointWithOffset.
	self bounds: (self bounds translatedToBeWithin: w bounds).
	self bounds perform: self orientation	.
	
	w activeHand addBalloonHelp: self.
	self openInWorld.