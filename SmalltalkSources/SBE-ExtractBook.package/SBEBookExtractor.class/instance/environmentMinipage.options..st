visiting - environments
environmentMinipage: contentBlock options: options
	<environment: 'minipage'>

	parseStack push:
		(Generator on: [:gen |
			self assert: gen next isNil. "whyever"
			
			1 timesRepeat:
				[[gen peek sbeType = #linebreak or: [gen peek sbeType isNil and: [gen peek contents isAllSeparators]]] whileTrue:
					[gen next]].
			
			"ignore first argument"
			
			self visit: gen peek]).
	
	^ self environmentFigure: contentBlock options: #()