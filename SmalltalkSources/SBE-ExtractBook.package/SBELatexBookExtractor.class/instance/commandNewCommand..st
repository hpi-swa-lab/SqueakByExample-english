visiting - commands
commandNewCommand: arguments
	<command: 'newcommand'>

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
		ifPresent: [:handler | self notify: ('command already defined: {1}' format: {name})]
		ifAbsentPut:
			[[:extractor :args | extractor
				withCommandArguments:
					(args collect: [:arg | {arg. extractor commandArguments}])
				do:
					[extractor visit: value]]].