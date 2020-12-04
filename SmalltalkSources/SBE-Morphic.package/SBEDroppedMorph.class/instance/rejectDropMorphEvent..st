dropping/grabbing
rejectDropMorphEvent: anEvent
	
	| hand |
	hand := anEvent hand.
	WorldState addDeferredUIMessage: [hand grabMorph: self].
	anEvent wasHandled: true.