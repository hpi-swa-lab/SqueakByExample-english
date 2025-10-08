visiting - commands
commandShort: arguments
	"<command: 'short'>" "disabled!"

	self assert: arguments size = 1.
	self emitEmphasisDuring:
		[self visit: arguments first].