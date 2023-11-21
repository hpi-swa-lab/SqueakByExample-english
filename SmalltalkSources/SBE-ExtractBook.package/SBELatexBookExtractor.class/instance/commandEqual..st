visiting - commands - macros
commandEqual: arguments
	<command: 'equal'>

	self assert: arguments size = 2.
	
	self
		visit: arguments first;
		visit: arguments second.
	
	ifstack push: ifstack pop = ifstack pop.