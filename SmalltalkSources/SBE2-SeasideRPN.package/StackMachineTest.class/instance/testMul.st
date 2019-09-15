tests
testMul
	stack
		push: 3;
		push: 4;
		mul.
	self assert: stack size = 1.
	self assert: stack top = 12.