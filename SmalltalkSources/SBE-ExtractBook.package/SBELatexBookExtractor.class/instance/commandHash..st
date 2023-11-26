visiting - commands - characters and spacing
commandHash: arguments
	<command: '#'>

	self assert: arguments isEmpty.
	self stream nextPut: $#.