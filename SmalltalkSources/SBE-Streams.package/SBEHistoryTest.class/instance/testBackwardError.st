tests - errors
testBackwardError
	self should: [emptyHistory goBackward] raise: Error.
	emptyHistory goTo: $a.
	self should: [emptyHistory goBackward] raise: Error.
	emptyHistory goTo: $a.
	self shouldnt: [emptyHistory goBackward] raise: Error.
	self should: [emptyHistory goBackward] raise: Error.