visiting - commands
commandSubfigure: arguments
	<command: 'subfigure'>

	| name |
	self assert: arguments isEmpty.
	
	parseStack push:
		(Generator on: [:gen |
			| next |
			self assert: gen next isNil. "whyever"
			
			self assert: (gen peek sbeType isNil and: [gen next contents = '[']).
			
			name := gen next.
			self assert: name sbeType = #text.
			
			self assert: (gen peek sbeType isNil and: [gen next contents = ']']).
			
			next := gen peek.
			self assert: parseStack pop == gen.
			
			self visit: next.
			
			self basicVisitLineBreak: nil; basicVisitLineBreak: nil.
			self emitCaptionDuring:
				[self visit: name].
			
			parseStack push: gen]).