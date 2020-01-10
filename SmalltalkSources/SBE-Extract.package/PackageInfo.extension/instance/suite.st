*SBE-Extract-SUnit
suite

	| suite |
	suite := TestSuite new.
	self classes
		select: [:class | class isTestClass]
		thenDo: [:class | class addToSuiteFromSelectors: suite].
	^ suite