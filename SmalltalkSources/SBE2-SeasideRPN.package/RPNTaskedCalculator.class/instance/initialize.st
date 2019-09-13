initialize-release
initialize
	super initialize.
	display := RPNDisplayTask new.
	display setStackMachine: stackMachine.