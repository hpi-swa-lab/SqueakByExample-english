tests
testAdd
	stack
		push: 3;
		push: 4;
		add.
	self assert: stack size = 1.
	self assert: stack top = 7