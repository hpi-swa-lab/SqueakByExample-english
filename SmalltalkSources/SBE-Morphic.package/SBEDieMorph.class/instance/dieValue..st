die logic
dieValue: aNumber
   (aNumber isInteger and: [aNumber between: 1 and: faces]) ifTrue: [
		dieValue := aNumber.
         	self changed]