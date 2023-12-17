visiting - commands
commandCt: arguments
	<command: 'ct'>

	arguments size >= 1 ifTrue:
		[self emitCodeDuring:
			[self visit: arguments first].
		
		arguments allButFirstDo: [:arg |
			self visit: arg].
		^ self].
	
	self assert: arguments isEmpty.
	parseStack push:
		(Generator on: [:gen |
			| content contents end endIndex |
			self assert: gen next isNil. "whyever"
			
			contents := '' writeStream.
			content := self contentsIn: gen next.
			end := content first.
			content := content allButFirst.
			endIndex := content indexOf: end.
			endIndex > 0 ifFalse:
				[contents nextPutAll: content.
				[:exit |
				[content := self contentsIn: gen peek.
				endIndex := content indexOf: end.
				endIndex > 0 ifTrue: exit.
				contents nextPutAll: content.
				gen next] repeat] valueWithExit].
			contents nextPutAll: (content first: endIndex - 1).
			self emitCode: contents contents.
			
			self basicVisitText: (content allButFirst: endIndex)]).