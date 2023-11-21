visiting - nodes
basicVisitRoot: node

	| oldNode result |
	result := super basicVisitRoot: node.
	
	file = rootFile ifTrue:
		[oldNode := nodeStack top.
		self stream contents withBlanksTrimmed ifNotEmpty: [:text |
			self assert: oldNode text isNil.
			oldNode text: text withBlanksTrimmed]].
	self flag: #todo. "requires SOH to be not a separator!"
	
	^ result