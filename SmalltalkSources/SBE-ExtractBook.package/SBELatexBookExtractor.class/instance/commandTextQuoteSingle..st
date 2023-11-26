visiting - commands - characters and spacing
commandTextQuoteSingle: arguments
	<command: 'textquotesingle'>

	self stream nextPut: $'.
	
	arguments do: [:child |
		self visit: child].