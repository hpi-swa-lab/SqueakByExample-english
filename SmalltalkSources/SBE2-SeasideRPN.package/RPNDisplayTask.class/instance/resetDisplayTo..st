private
resetDisplayTo: DisplayClass
	display := DisplayClass new.
	display setStackMachine: stackMachine.
	^ self call: display