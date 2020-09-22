accessing
shouldntMessUpProcesses: aBlock
	
	| newProcessMetrics oldProcessMetrics processAnalyzer result |
	processAnalyzer := [ | processes |
		processes := Process allSubInstances reject: [:each | each isTerminated].
		{processes size. processes count: [:process | process isSuspended]}]. 
	oldProcessMetrics := processAnalyzer value.
	result := aBlock value.
	newProcessMetrics := processAnalyzer value.
	self assert: oldProcessMetrics equals: newProcessMetrics.
	^ result