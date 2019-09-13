tests
testDup
	stack
		push: 1;
		push: 2;
		push: 3;
		dup.
	self assert: stack pop = 3.
	self assert: stack pop = 3.
	self assert: stack pop = 2.
	self assert: stack pop = 1.
	self assert: stack isEmpty.