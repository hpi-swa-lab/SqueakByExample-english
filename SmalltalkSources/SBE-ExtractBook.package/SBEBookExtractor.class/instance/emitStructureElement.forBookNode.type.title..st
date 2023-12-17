emitting
emitStructureElement: parseNode forBookNode: bookNodeClass type: type title: title

	| bookNode oldNode incrementer |
	bookNode := bookNodeClass new.
	bookNode title: title.
	"bookNode labels: labels."
	bookNode parseNode: parseNode.
	
	oldNode := nodeStack top.
	self resolveRefs.
	self stream contents withBlanksTrimmed ifNotEmpty: [:text |
		self assert: oldNode text isNil.
		oldNode text: text].
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
		detect: [:eachType |
			eachType = type
				ifFalse:
					[counters at: eachType put:
						((appendix and: [eachType = #chapter])
							ifTrue: ['@']
							ifFalse: [0])];
				yourself].	
	
	incrementer := [:count | count + 1].
	(appendix and: [type = #chapter]) ifTrue:
		[| oldIncrementer |
		bookNode typeName: #appendix.
		oldIncrementer := incrementer.
		incrementer := [:count | (oldIncrementer value: count sbeFromAlph) sbePrintStringAlph]].
	bookNode index:
		(counters at: type put:
			(incrementer value: (counters at: type ifAbsent: [0]))).
	
	^ bookNode