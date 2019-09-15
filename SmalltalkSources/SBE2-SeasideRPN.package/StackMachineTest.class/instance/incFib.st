tests
incFib
	self assert: stack size = 2.
	stack
		dup;
		rotUp;
		add.
	self assert: stack size = 2