utils
useWorldAndHandDuring: aBlock

	| priorHand priorWorld |
	priorWorld := ActiveWorld.
	priorHand := ActiveHand.
	ActiveWorld := self world.
	ActiveHand := self hand.
	^ aBlock ensure: [
		ActiveWorld := priorWorld.
		ActiveHand := priorHand]