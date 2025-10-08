visiting - commands - macros
commandDef: arguments
	<command: 'def'>

	| name value |
	self assert: arguments size = 2.
	
	name := self contentsIn: arguments first.
	self assert: (name notEmpty and: [name first = $\]).
	name := name allButFirst.
	value := self contentsIn: arguments last.
	commandHandlers
		at: name
		put: [:extractor :args | extractor handleCommand: name arguments: args]