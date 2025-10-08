visiting - commands - characters and spacing
commandTilde: arguments
	<command: '~'>

	self assert: arguments isEmpty.
	self stream nextPut: $~.