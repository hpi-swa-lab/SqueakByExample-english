emitting
emitIndexEntry: label keys: keys forwardReference: referenceOrNil

	| key count entry referenceKey |
	key := self keyForIndexPath: keys.
	count := counters at: key put:
		(counters at: key ifAbsent: [0])
			+ 1.
	referenceKey := 'refto' , key , ':' , count.
	self emitLabel: referenceKey.
	entry := index atPath: keys putKey: key label: label.
	referenceOrNil ifNotNil:
		[entry forwardReference: referenceOrNil].
	entry addReferenceKey: referenceKey.