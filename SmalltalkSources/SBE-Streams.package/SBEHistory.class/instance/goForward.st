actions
goForward

	self canGoForward ifFalse: [self error: 'Already on the last element'].
	^ stream next