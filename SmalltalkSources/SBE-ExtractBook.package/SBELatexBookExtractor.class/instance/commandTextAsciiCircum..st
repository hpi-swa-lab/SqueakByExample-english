visiting - commands - characters and spacing
commandTextAsciiCircum: arguments
	<command: 'textasciicircum'>

	self assert: arguments isEmpty.
	self stream nextPut: $^.