visiting - commands - macros
commandIfThenElse: arguments
	<command: 'ifthenelse'>

	self assert: arguments size = 3.
	
	self visit: arguments first.
	
	self visit: (ifstack pop ifTrue: [arguments second] ifFalse: [arguments third]).