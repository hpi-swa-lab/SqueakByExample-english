tests
testFib
	stack
		push: 1;
		push: 1.
	self assert: stack size = 2.
	self assert: stack top = 1.
	self incFib.
	self assert: stack top = 2.
	self incFib.
	self assert: stack top = 3.
	self incFib.
	self assert: stack top = 5.
	self incFib.
	self assert: stack top = 8