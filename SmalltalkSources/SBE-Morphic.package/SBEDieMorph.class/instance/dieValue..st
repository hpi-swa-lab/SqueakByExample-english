accessing
dieValue: aNumber

	self assert: (aNumber isInteger and: [aNumber between: 1 and: self faces]).
	dieValue := aNumber.
	self changed.