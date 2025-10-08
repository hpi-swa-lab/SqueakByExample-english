visiting
visit: node

	"Handle pending coroutines from previous visitors first."
	parseStack isEmpty ifFalse:
		[| generator result |
		generator := parseStack top.
		result := generator yield: node.
		generator atEnd ifTrue: [parseStack pop].
		result = #back ifFalse: [^ result].
		self isThisEverCalled].
	
	^ self basicVisit: node