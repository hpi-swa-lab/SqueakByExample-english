visiting - nodes
visitInlineFormula: node

	self assert: node children size > 2.
	self assert: node children first contents = '$'.
	self assert: node children last contents = '$'.
	
	node children from: 2 to: node children size - 1 do: [:ea |
		self visit: ea].