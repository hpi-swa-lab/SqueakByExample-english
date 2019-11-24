saving
doesNotUnderstand: aMessage

	| prolongedArgs prolongedSelector |
	(self class buildingSelectorPattern matches: aMessage selector)
		ifFalse: [^ super doesNotUnderstand: aMessage].
	prolongedSelector := (#writeTo: , aMessage selector) asSymbol.
	(self respondsTo: prolongedSelector)
		ifFalse: [^ super doesNotUnderstand: aMessage].
	prolongedArgs := aMessage arguments copyWithFirst: '<dummy path>'.
	^ (Message selector: prolongedSelector arguments: prolongedArgs)
		sendTo: self