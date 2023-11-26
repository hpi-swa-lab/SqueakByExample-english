visiting - commands - characters and spacing
commandTextDollar: arguments
	<command: 'textdollar'>

	self stream nextPut: $$.
	
	arguments do: [:child |
		self visit: child].