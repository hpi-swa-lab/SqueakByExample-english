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
		[self deny: newSymbol identical: newString asSymbol].
	self deny: newSymbol identical: newString asSymbol.
	
	self assert: #test42 identical: 'test42' asSymbol.
	helper forgetSymbol: #test42 during:
		[self deny: #test42 identical: 'test42' asSymbol].
	self assert: #test42 identical: 'test42' asSymbol.