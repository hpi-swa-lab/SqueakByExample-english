actions
goBackward

	self canGoBackward ifFalse: [self error: 'Already on the first element'].
	stream skip: -2.
	^ stream next