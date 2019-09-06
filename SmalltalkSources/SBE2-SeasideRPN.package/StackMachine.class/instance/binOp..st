private
binOp: op
	| result |
	self assert: contents size >= 2.
	self assert: contents first isNumber.
	self assert: contents second isNumber.
	(op = #/) ifTrue: [ self assert: contents second isZero not ].
	result := contents first perform: op with: contents second.
	self
		pop;
		pop;
		push: result.