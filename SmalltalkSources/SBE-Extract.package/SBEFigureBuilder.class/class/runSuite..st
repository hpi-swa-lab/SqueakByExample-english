building
runSuite: aSuite
	"Return a boolean for whether all tests passed"

	^ self isCiImage
		ifTrue: [self runSuiteOnSci: aSuite]
		ifFalse: [self runSuiteLocally: aSuite]