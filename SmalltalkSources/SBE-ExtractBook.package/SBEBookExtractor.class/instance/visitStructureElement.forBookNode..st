visiting - nodes
visitStructureElement: node forBookNode: bookNodeClass

	| bookNode title oldNode incrementer |
	self assert: node children first sbeType isNil.
	title := self contentsIn: node children second.
	bookNode := bookNodeClass new.
	bookNode title: title.
	"bookNode labels: labels."
	bookNode parseNode: node.
	
	oldNode := nodeStack top.
	self resolveRefs.
	self stream contents withBlanksTrimmed ifNotEmpty: [:text |
		self assert: oldNode text isNil.
		oldNode text: text withBlanksTrimmed].
	pendingLabels ifNotEmpty:
		[oldNode addExtraLabels: pendingLabels copy.
		pendingLabels removeAll].
	
	self resetStream.
	
	[nodeStack top mayContain: bookNode] whileFalse:
		[nodeStack pop].
	nodeStack top
		addChild: bookNode;
		updateStarIndexes.
	nodeStack push: bookNode.
	self structureElementOrder
		detect: [:type |
			type = node type
				ifFalse:
					[counters at: type put:
						((appendix and: [type = #chapter])
							ifTrue: ['@']
							ifFalse: [0])];
				yourself].	
	
	incrementer := [:count | count + 1].
	(appendix and: [node sbeType = #chapter]) ifTrue:
		[| oldIncrementer |
		bookNode typeName: #appendix.
		oldIncrementer := incrementer.
		incrementer := [:count | (oldIncrementer value: count sbeFromAlph) sbePrintStringAlph]].
	bookNode index:
		(counters at: node sbeType put:
			(incrementer value: (counters at: node sbeType ifAbsent: [0]))).
	
	(node children allButFirst: 2) do: [:child |
		self visit: child].
	
	^ bookNode