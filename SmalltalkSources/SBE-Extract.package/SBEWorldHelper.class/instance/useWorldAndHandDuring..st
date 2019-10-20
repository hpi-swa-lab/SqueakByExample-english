utils
useWorldAndHandDuring: aBlock

	| priorHand priorWorld priorOpenAttached |
	priorWorld := ActiveWorld.
	priorHand := ActiveHand.
	priorOpenAttached := UIManager openToolsAttachedToMouseCursor.
	ActiveWorld := self world.
	ActiveHand := self hand.
	UIManager openToolsAttachedToMouseCursor: false.
	
	^ aBlock ensure: [
		UIManager openToolsAttachedToMouseCursor: priorOpenAttached.
		ActiveWorld = self world ifTrue: [ActiveWorld := priorWorld].
		ActiveHand = self hand ifTrue: [ActiveHand := priorHand]]