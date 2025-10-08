visiting - nodes
visitCurlyGroup: node

	self assert: node children size >= 2.
	self assert: node children first contents = '{'.
	self assert: node children last contents = '}'.
	2 to: node children size - 1 do: [:index |
		self visit: (node children at: index)].