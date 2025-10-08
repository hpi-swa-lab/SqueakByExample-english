visiting - commands
commandParBox: arguments
	<command: 'parbox'>

	self assert: arguments size = 2.
	^ self visit: arguments second