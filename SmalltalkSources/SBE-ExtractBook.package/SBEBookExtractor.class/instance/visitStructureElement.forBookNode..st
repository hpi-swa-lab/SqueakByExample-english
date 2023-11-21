visiting - nodes
visitStructureElement: node forBookNode: bookNodeClass

	| bookNode title oldNode |
	self assert: node children first sbeType isNil.
	title := self contentsIn: node children second.
	bookNode := bookNodeClass new.
	bookNode title: title.
	"bookNode labels: labels."
	
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
	nodeStack push:
		(nodeStack top addChild: bookNode).
	
	(node children allButFirst: 2) do: [:child |
		self visit: child].
	
	^ bookNode