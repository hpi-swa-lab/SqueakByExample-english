visiting - nodes
visitPath: node

	(node contents beginsWith: '#') ifTrue: [^ self visitPlaceholder: node].
	^ self basicVisitAny: node