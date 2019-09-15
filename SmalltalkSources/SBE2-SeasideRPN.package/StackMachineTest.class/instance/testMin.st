tests
testMin
	stack
		push: 3;
		push: 4;
		min.
	self assert: stack size = 1.
	self assert: stack top = 1.