*SBE-Extract-transforming-override
pointAtFraction: relativePoint

	| result |
	result := self origin + (self extent * relativePoint).
	^ self isIntegerRectangle
		ifTrue: [result rounded]
		ifFalse: [result]