tests
testRotUp
	stack
		push: 1;
		push: 2;
		push: 3.
	self assert: stack size = 3.
	stack rotUp.
	self assert: stack size = 3.
	self assert: stack top = 2.
	stack rotUp.
	self assert: stack size = 3.
	self assert: stack top = 1.
	stack rotUp.
	self assert: stack size = 3.
	self assert: stack top = 3.