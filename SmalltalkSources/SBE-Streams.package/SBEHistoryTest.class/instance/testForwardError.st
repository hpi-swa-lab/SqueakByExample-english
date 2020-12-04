tests - errors
testForwardError

	self should: [emptyHistory goForward] raise: Error.
	emptyHistory goTo: $a.
	self should: [emptyHistory goForward] raise: Error.
	emptyHistory goTo: $a.
	self should: [emptyHistory goForward] raise: Error.
	emptyHistory goBackward.
	self shouldnt: [emptyHistory goForward] raise: Error.