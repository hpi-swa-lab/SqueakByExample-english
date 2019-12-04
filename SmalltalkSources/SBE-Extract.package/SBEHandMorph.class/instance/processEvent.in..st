private events
processEvent: anEvent in: aMorph

	| result |
	aMorph world becomeActiveDuring: [
		self becomeActiveDuring: [
				anEvent becomeActiveDuring: [
					result := aMorph processEvent: anEvent]]].
	^ result == #rejected ifTrue: [anEvent] ifFalse: [result "filtered event"]