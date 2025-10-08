visiting - commands
commandMenu: arguments
	<command: 'menu'>

	self assert: arguments size = 1.
	self emitMenuDuring:
		[self visit: arguments first].