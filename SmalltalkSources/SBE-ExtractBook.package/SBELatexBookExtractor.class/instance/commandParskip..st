visiting - commands
commandParskip: arguments
	<command: 'parskip'>

	self assert: arguments isEmpty.
	parseStack push:
		(Generator on: [:gen |
			self assert: gen next isNil. "whyever"
			
			[gen peek sbeType isNil and: [gen peek contents isAllSeparators]] whileTrue:
				[gen next].
			
			self assert: gen peek notNil "ignore"]).