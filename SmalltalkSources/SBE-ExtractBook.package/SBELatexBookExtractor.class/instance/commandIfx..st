visiting - commands - macros
commandIfx: arguments
	<command: 'ifx'>

	| hereArguments log |
	log := OrderedCollection new.
	self assert: arguments isEmpty.
	hereArguments := commandArguments.
	parseStack push:
		(Generator on: [:gen |
			| first second equal else fi next nodes |
			self assert: gen next isNil. "whyever"
			nodes := Generator on: [:nodeStream |
				| node |
				node := gen next.
				node sbeType = #genericCommand
					ifFalse: [nodeStream nextPutAll: node children]
					ifTrue:
						[nodeStream
							nextPut: node;
							nextPutAll: gen]].
			
			first := nodes next.
			second := nodes next.
			equal := first sbeType = #genericCommand
				& (second sbeType = #genericCommand)
				and: [(commandHandlers at: (self nameOfCommand: first) ifAbsent: [nil]) = (commandHandlers at: (self nameOfCommand: second) ifAbsent: [nil])].
			
			[(nodes atEnd or: [nodes peek isNil]) or:
				[else := nodes peek sbeType = #genericCommand and:
					[(self nameOfCommand: nodes peek) = #else]]]
				whileFalse:
					[next := nodes next.
					equal ifTrue:
						[self withCommandArguments: hereArguments do:
							[self basicVisitForParsing: next]]].
			(nodes atEnd not and: [else]) ifTrue:
				[log add: nodes next.
				
				[(nodes atEnd or: [nodes peek isNil]) or:
					[fi := nodes peek sbeType = #genericCommand and:
						[(self nameOfCommand: nodes peek) = #fi]]]
					whileFalse:
						[next := log add: nodes next.
						equal ifFalse:
							[self withCommandArguments: hereArguments do:
								[self basicVisitForParsing: next]]].
				self assert: (nodes atEnd not and: [fi])]]).