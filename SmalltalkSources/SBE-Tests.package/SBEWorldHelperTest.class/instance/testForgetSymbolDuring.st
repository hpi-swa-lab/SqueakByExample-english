testing
testForgetSymbolDuring

	| newString newSymbol |
	newString := UUID new asString.
	newSymbol := (String new: newString size)
		copyFrom: newString;
		yourself.
	(newSymbol respondsTo: #beReadOnlyObject) ifTrue: [">= Squeak 6.0"
		newSymbol beReadOnlyObject].
	helper forgetSymbol: newSymbol during:
		[self deny: newString asSymbol == newSymbol].
	self deny: newString asSymbol == newSymbol.
	
	self assert: #test42 identical: 'test42' asSymbol.
	helper forgetSymbol: #test42 during:
		[self deny: 'test42' asSymbol == #test42].
	self assert: #test42 identical: 'test42' asSymbol.