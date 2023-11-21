visiting - commands
commandSetCounter: arguments
	<command: 'setcounter'>

	self assert: arguments size = 2.
	counters
		at: (self contentsIn: arguments first) asString
		put: (self contentsIn: arguments second).