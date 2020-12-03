tests - actions
testGoToErases

	emptyHistory 
		goTo: 1;
		goTo: 2;
		goTo: 3.
	self assert: emptyHistory goBackward = 2.
	self assert: emptyHistory goBackward = 1.
	emptyHistory goTo: 4.
	self deny: emptyHistory canGoForward 