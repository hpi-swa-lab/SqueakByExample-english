visiting - commands - macros
commandLet: arguments
	<command: 'let'>

	| handler name value |
	self assert: (arguments size = 2 or: [arguments size = 3 and: [arguments second contents = '=']]).
	
	name := self contentsIn: arguments first.
	self assert: (name notEmpty and: [name first = $\]).
	name := name allButFirst.
	value := self contentsIn: arguments last.
	handler := self commandHandlerFor: value.
	commandHandlers at: name put: handler.