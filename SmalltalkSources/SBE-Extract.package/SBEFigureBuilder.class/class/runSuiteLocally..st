building
runSuiteLocally: aSuite

	| runner |
	runner := TestRunner newForSuite: aSuite.
	runner runSuite: aSuite.
	^ runner result hasPassed
		ifFalse: [ToolBuilder open: runner];
		yourself