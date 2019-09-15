tests
testPushPop
	self assert: stack isEmpty.
	stack push: 1.
	self assert: stack size = 1.
	self assert: stack top = 1.
	stack pop.
	self assert: stack isEmpty.
	self should: [stack top] raise: AssertionFailure