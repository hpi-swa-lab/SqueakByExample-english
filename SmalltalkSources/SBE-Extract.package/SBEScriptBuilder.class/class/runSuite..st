building (convenience)
runSuite: aSuite
	"Return a boolean for whether all tests passed"

	| runner |
	runner := TestRunner newForSuite: aSuite.
	runner runSuite: aSuite.
	^ runner result hasPassed
		ifFalse: [ToolBuilder open: runner];
		yourself