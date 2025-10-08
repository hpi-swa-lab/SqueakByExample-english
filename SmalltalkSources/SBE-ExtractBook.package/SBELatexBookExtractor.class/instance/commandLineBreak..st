visiting - commands - characters and spacing
commandLineBreak: arguments
	<command: '\'>

	self assert: arguments isEmpty.
	parseStack push:
		(Generator on: [:gen |
			| unit |
			self assert: gen next isNil. "whyever"
			
			gen peek contents = '['
				ifTrue:
					[gen next.
					unit := gen next.
					self assert: gen peek contents = ']'.
				
					self stream cr.
					previousLineBreaks := nil]
				ifFalse:
					[self stream cr.
					previousLineBreaks := nil.
					
					#back.
					parseStack pop.
					self basicVisit: gen peek.
					gen next]]).