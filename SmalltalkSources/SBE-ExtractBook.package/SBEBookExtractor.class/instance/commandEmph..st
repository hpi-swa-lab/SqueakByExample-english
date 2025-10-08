visiting - commands
commandEmph: arguments
	<command: 'emph'>

	self assert: arguments size = 1.
	self emitEmphasisDuring:
		[self visit: arguments first].