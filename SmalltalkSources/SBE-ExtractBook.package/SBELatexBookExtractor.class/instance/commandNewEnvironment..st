visiting - commands - macros
commandNewEnvironment: arguments
	<command: 'newenvironment'>

	| argsStream name count begin end |
	argsStream := (arguments reject: [:arg | arg sbeType = #linebreak or: [arg sbeType isNil and: [arg contents isAllSeparators]]]) readStream.
	self assert: argsStream atEnd not.
	
	name := argsStream next.
	name := (self fullContentsInGroup: name optionalBrackets: true) asString.
	self assert: name notEmpty.
	
	self assert: argsStream atEnd not.
	count := argsStream next.
	count := count sbeType = #brackGroupArgc
		ifTrue:
			[(self fullContentsInGroup: count brackets: '[]') asNumber]
		ifFalse:
			[argsStream back.
			0].
	
	self assert: argsStream atEnd not.
	begin := argsStream next.
	self assert: (#(curlyGroup curlyGroupImpl) includes: begin sbeType).
	self assert: begin children size >= 2.
	self assert: (begin children first sbeType isNil and: [begin children first contents = '{']).
	self assert: (begin children last sbeType isNil and: [begin children last contents = '}']).
	
	self assert: argsStream atEnd not.
	end := argsStream next.
	self assert: (#(curlyGroup curlyGroupImpl) includes: end sbeType).
	self assert: end children size >= 2.
	self assert: (end children first sbeType isNil and: [end children first contents = '{']).
	self assert: (end children last sbeType isNil and: [end children last contents = '}']).
	
	self assert: argsStream atEnd.
	
	self flag: #todo. "resolve arguments"
	environmentHandlers
		at: name
		ifPresent: [:handler | self notify: ('environment already defined: {1}' format: {name})].
	^ environmentHandlers
		at: name
		put: [:extractor :contentBlock :options | | generator |
			(extractor instVarNamed: 'parseStack') push:
				(generator := Generator on: [:gen |
					| allOptions |
					allOptions := OrderedCollection withAll: options.
					
					self assert: gen next isNil. "whyever"
					[allOptions size < count] whileTrue:
						[[gen atEnd not and: [(#(linebreak lineComment) includes: gen peek sbeType) or: [gen peek sbeType isNil and: [gen peek contents isAllSeparators]]]] whileTrue:
							[gen next].
						allOptions addLast: gen next].
					
					extractor
						withCommandArguments:
							(allOptions collect: [:option | {option. extractor commandArguments}])
						do:
							[begin children allButFirst allButLast do: [:child |
								self assert: (extractor instVarNamed: 'parseStack') pop == gen.
								extractor visit: child.
								(extractor instVarNamed: 'parseStack') push: gen]].
					self assert: (extractor instVarNamed: 'parseStack') pop == gen.
					[gen peek] whileNotNil:
						[extractor visit: gen next].
					extractor
						withCommandArguments:
							(allOptions collect: [:option | {option. extractor commandArguments}])
						do:
							[end children allButFirst allButLast do: [:child |
								extractor visit: child]].
					
					"todo?"]).
			contentBlock value.
			generator yield: nil]