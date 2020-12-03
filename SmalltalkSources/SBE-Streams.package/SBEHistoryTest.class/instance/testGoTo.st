tests - actions
testGoTo

	emptyHistory
		goTo: 1;
		goTo: 2;
		goTo: 3.
	self assert: emptyHistory goBackward = 2.
	self assert: emptyHistory goBackward = 1.
	self assert: emptyHistory goForward = 2.
	self assert: emptyHistory goForward = 3.