accessing
typeName

	^ typeName ifNil:
		[self type
			, (self hasAnyStarIndex ifTrue: ['*'] ifFalse: [''])]