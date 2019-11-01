building
runSuiteOnSci: aSuite

	| runner |
	runner := (Smalltalk at: #SmalltalkCI) testRunnerClass.
	runner runSuite: aSuite.
	^ runner isSuccessful