testing
testSimple

	| result |
	result := builder executeSafely: [6 * 7].
	self assert: 42 equals: result.