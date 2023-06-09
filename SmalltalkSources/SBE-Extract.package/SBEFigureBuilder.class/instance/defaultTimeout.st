nil
defaultTimeout

	^ Smalltalk isLowerPerformance
		ifTrue: [60]
		ifFalse: [20] "seconds"