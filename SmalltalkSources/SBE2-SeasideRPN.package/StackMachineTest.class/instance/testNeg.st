tests
testNeg
	stack
		push: 1;
		neg.
	self assert: stack top = -1.