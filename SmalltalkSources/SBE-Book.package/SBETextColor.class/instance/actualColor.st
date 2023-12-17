accessing
actualColor

	^ actualColor ifNil:
		[| color |
		color := self userInterfaceTheme theme get: self property for: self scope.
		color isArray ifTrue: [color := color first].
		actualColor := color]