visiting - commands
commandParskip: arguments
	<command: 'parskip'>

	self assert: arguments isEmpty.
	parseStack push:
		(Generator on: [:gen |
			| nodes |
			self assert: gen next isNil. "whyever"
			
			nodes := Generator on: [:nodeStream |
				nodeStream
					nextPut: gen next;
					nextPutAll: gen next children].
			
			[nodes peek sbeType isNil and: [nodes peek contents isAllSeparators]] whileTrue:
				[nodes next].
			
			self assert: nodes next type = #word "ignore".
			
			nodes := nodes upToEnd.
			parseStack pop.
			nodes do: [:ea | self visit: ea].
			gen next]).