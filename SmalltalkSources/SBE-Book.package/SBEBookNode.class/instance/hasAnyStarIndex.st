testing
hasAnyStarIndex

	^ self hasStarIndex or:
		[self parent notNil and: [self parent hasAnyStarIndex]]