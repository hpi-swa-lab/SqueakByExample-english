private
tryMatch
	"Match thyself against the current stream."
	markerPositions := Array new: markerCount.
	startOptimizer == nil
		ifTrue: [lastResult := matcher matchAgainst: self]
		ifFalse: [lastResult := (startOptimizer canStartMatch: stream peek in: self)
									and: [matcher matchAgainst: self]].
	^lastResult