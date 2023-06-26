*SBE-Extract-morphic ui-override
answer: anObject
	(modalProcess notNil and: [modalProcess isTerminated])
		ifTrue: [^self inform: 'This modal dialog was interrupted, please close it'].
	modalValue := anObject.
	self close.