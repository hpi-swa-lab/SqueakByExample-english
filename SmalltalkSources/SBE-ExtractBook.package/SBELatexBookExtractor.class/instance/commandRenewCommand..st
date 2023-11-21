visiting - commands - macros
commandRenewCommand: arguments
	<command: 'renewcommand'>

	| argsStream name count value |
	argsStream := arguments readStream.
	self assert: argsStream atEnd not.
	
	name := argsStream next.
	self assert: name sbeType = #curlyGroupCommandName.
	name := self contentsInGroup: name optionalBrackets: true.
	self assert: (name size > 1 and: [name first = $\]).
	name := name allButFirst.
	
	self assert: argsStream atEnd not.
	count := argsStream next.
	count := count sbeType = #brackGroupArgc
		ifTrue:
			[(self contentsInGroup: count brackets: '[]') asNumber]
		ifFalse:
			[argsStream back.
			0].
	
	self assert: argsStream atEnd not.
	value := argsStream next.
	
	self assert: argsStream atEnd.
	
	self flag: #todo. "resolve arguments"
	commandHandlers
		at: name
		put: [:extractor :args | extractor visit: value].