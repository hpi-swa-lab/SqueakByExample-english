testing
testYield

	| result |
	result := builder executeSafely: [
		Processor yield.
		6 * 7].
	self assert: 42 equals: result.