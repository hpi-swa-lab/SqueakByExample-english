visiting - commands
commandToday: arguments
	<command: 'today'>

	self assert: arguments isEmpty.
	self basicVisitText: self buildDate asDate yyyymmdd.