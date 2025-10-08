visiting - nodes
basicVisitAny: node

	node children do: [:child |
		self visit: child].