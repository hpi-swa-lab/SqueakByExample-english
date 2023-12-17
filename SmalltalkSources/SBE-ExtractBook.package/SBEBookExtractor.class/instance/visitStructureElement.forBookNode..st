visiting - nodes
visitStructureElement: node forBookNode: bookNodeClass

	| bookNode title |
	self assert: node children first sbeType isNil.
	title := self contentsIn: node children second.
	
	bookNode := self
		emitStructureElement: node
		forBookNode: bookNodeClass
		type: node sbeType
		title: title.
	
	(node children allButFirst: 2) do: [:child |
		self visit: child].
	
	^ bookNode