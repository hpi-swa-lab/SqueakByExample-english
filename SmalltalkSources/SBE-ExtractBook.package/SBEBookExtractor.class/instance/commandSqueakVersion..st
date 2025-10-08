visiting - commands
commandSqueakVersion: arguments
	<command: 'SQUEAKVERSION'>

	self assert: arguments isEmpty.
	self basicVisitText: self squeakVersionString.