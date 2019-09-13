stackOperations
stackOp: op
	[	stackMachine perform: op.
		self setPushMode.
	] on: AssertionFailure do: [
		self handleAssertionFailure
	].
	