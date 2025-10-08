visiting - commands
commandDoThis: arguments
	<command: 'dothis'>

	self assert: arguments size = 1.
	
	self emitDoThisDuring:
		[self visit: arguments first].