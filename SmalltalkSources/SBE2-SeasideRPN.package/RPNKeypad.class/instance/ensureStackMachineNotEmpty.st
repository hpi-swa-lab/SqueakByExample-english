stackOperations
ensureStackMachineNotEmpty
	stackMachine isEmpty
		ifTrue: [
			stackMachine push: 0.
			self setTypingMode ]