visiting - commands
commandPrintIndex: arguments
	<command: 'printindex'>

	self assert: arguments isEmpty.
	self emitIndex.