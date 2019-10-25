utils
useScreenshotSettingsDuring: aBlock

	thisContext
		wrap: [:block | Preferences
			setPreference: #(UIManager >> #openToolsAttachedToMouseCursor) join asSymbol
			toValue: false
			during: block];
		wrap: [:block |
			| priorHand priorWorld |
			priorWorld := ActiveWorld.
			priorHand := ActiveHand.
			ActiveWorld := self world.
			ActiveHand := self hand.
			block value.
			ActiveWorld = self world ifTrue: [ActiveWorld := priorWorld].
			ActiveHand = self hand ifTrue: [ActiveHand := priorHand]];
		wrap: [:block | ToolSet setDefault: StandardToolSet during: block].
	
	^ aBlock value