tests
testExchError
	self assert: stack isEmpty.
	stack push: 1.
	self should: [stack exch] raise: AssertionFailure