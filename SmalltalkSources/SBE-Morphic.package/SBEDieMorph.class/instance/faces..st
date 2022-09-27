accessing
faces: aNumber
	"Set the number of faces"

	self assert: (aNumber isInteger and: [aNumber between: 1 and: 9]).
	faces := aNumber.