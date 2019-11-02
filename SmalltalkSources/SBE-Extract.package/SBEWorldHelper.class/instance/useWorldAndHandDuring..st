private utils
useWorldAndHandDuring: aBlock

	| priorHand priorWorld |
	priorWorld := ActiveWorld.
	priorHand := ActiveHand.
	ActiveWorld := self world.
	ActiveHand := self hand.
	^ aBlock ensure: [
		ActiveWorld = self world ifTrue: [ActiveWorld := priorWorld].
		ActiveHand = self hand ifTrue: [ActiveHand := priorHand]]