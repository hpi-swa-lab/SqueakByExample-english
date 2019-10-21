utils
useWorldAndHandDuring: aBlock

	| priorHand priorWorld |
	priorWorld := ActiveWorld.
	priorHand := ActiveHand.
	ActiveWorld := self world.
	ActiveHand := self hand.
	
	^ [Preferences
			setPreference: #(UIManager >> #openToolsAttachedToMouseCursor) join asSymbol
			toValue: false
			during: aBlock]
				ensure: [
					ActiveWorld = self world ifTrue: [ActiveWorld := priorWorld].
					ActiveHand = self hand ifTrue: [ActiveHand := priorHand]]