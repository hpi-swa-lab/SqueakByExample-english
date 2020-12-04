tests - scenario
testScenario1

	emptyHistory
		goTo: 1; goTo: 2; goTo: 3; goTo: 4.
	self assert: emptyHistory goBackward = 3.
	self assert: emptyHistory canGoForward.
	self assert: emptyHistory goBackward = 2.
	self assert: emptyHistory goForward = 3.
	self assert: emptyHistory goBackward = 2.
	emptyHistory goTo: 5.
	self deny: emptyHistory canGoForward.
	self assert: emptyHistory goBackward = 2.
	self assert: emptyHistory goBackward = 1.
	self deny: emptyHistory canGoBackward.
	self assert: emptyHistory goForward = 2.
	self assert: emptyHistory goForward = 5.
	self deny: emptyHistory canGoForward.