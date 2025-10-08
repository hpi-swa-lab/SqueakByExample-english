visiting - environments
environmentWrapFigure: contentBlock options: options
	<environment: 'wrapfigure'>

	parseStack push:
		(Generator on: [:gen |
			self assert: gen next isNil. "whyever"
			
			2 timesRepeat:
				[[gen peek sbeType = #linebreak or: [gen peek sbeType isNil and: [gen peek contents isAllSeparators]]] whileTrue:
					[gen next]].
			
			"ignore first two arguments"
			
			self visit: gen peek]).
	
	^ self environmentFigure: contentBlock options: #()