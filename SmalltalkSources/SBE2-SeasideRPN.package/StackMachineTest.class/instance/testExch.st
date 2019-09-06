tests
testExch
	self assert: stack isEmpty.
	stack
		push: 1;
		push: 2;
		exch.
	self assert: stack top = 1