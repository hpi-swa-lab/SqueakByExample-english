private utils
useWorldAndHandDuring: aBlock

	| priorHand priorWorld |
	thisContext
		wrapStrictlyToggleOn: [
			priorWorld := ActiveWorld.
			priorHand := ActiveHand.
			ActiveWorld := self world.
			ActiveHand := self hand]
		toggleOff: [
			ActiveWorld = self world ifTrue: [ActiveWorld := priorWorld].
			ActiveHand = self hand ifTrue: [ActiveHand := priorHand]].
	
	^ aBlock value