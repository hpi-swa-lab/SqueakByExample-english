utils
haloHandleFormFor: iconName

	| spec |
	spec := Preferences haloSpecifications detect: [:each | each iconSymbol = iconName].
	^ (HaloMorph new createHandleAt: 0 @ 0 color: spec color iconName: spec iconSymbol)
		imageForm