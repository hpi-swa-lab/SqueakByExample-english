initialize-release
initialize
	super initialize.
	self setStackMachine: StackMachine new.
	keypad := RPNKeypad new.
	keypad setStackMachine: stackMachine.
	display := RPNDisplay new.
	display setStackMachine: stackMachine.