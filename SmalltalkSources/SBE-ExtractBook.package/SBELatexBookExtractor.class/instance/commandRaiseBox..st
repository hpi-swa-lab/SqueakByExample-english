visiting - commands
commandRaiseBox: arguments
	<command: 'raisebox'>

	arguments size = 2 ifTrue:
		[^ self visit: arguments second].
	
	parseStack push:
		(Generator on: [:gen |
			| unit |
			self assert: gen next isNil. "whyever"
			
			"ignore"
			(1 to: 2) allSatisfy: [:i |
				gen peek contents = '['
					ifTrue:
						[gen next.
						unit := gen next.
						self assert: gen next contents = ']'];
					yourself].
			self assert: gen peek sbeType = #curlyGroup.
			
			self visit: gen next]).