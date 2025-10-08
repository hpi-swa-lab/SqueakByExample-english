visiting - commands
commandTextbf: arguments
	<command: 'textbf'>

	arguments size >= 1 ifTrue:
		[self emitBoldDuring:
			[self visit: arguments first].
		
		arguments allButFirstDo: [:arg |
			self visit: arg].
		^ self].
	
	parseStack push:
		(Generator on: [:gen |
			self assert: gen next isNil. "whyever"
			
			self emitBoldDuring:
				[self visit: gen next]]).