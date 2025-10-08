visiting - nodes
basicVisitForParsing: node

	| oldParseStack |
	oldParseStack := parseStack.
	parseStack := Stack new.
	^ [ | result |
	
	result := self visit: node.
	
	"Handle pending coroutines from previous visitors."
	self flag: #duplicate.
	parseStack isEmpty ifFalse:
		[| generator |
		generator := parseStack top.
		generator yield: nil.
		generator atEnd ifTrue: [parseStack pop]].
	self assert: parseStack isEmpty.
	
	self resolveRefs.
	
	result]
		
		ensure: [parseStack := oldParseStack]