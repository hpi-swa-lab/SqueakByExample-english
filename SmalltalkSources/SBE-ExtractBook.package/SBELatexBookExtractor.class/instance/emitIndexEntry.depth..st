emitting
emitIndexEntry: anIndexEntry depth: depth

	depth > 0 ifTrue:
		[self stream nextPutAll:
			((anIndexEntry label ifNil: ['']) species new: depth - 1 withAll: Character tab)].
	self flag: #bug. "Intermediate keys currently have an incomplete label here (i.e., BlockClosure instead of ind:BlockClosure). We would need to pass the full path to SBEIndex>>#makeSubindexForKey: to support this ... if we want it at all ..."
	self emitLabel: anIndexEntry key.
	depth > 0 ifTrue:
		[(anIndexEntry label ifNil: [anIndexEntry key]) ifNotNil: [:label |
			self basicVisitText: label]].
	
	anIndexEntry forwardReference
		ifNotNil: [:assoc |
			self stream nextPutAll: ', '.
			self emitIndexForwardReference: assoc]
		ifNil:
			[| previousName |
			anIndexEntry referenceKeys ifNotEmpty:
				[self stream nextPutAll: ', '].
			previousName := nil.
			anIndexEntry referenceKeys
				do: [:referenceKey |
					| name |
					name := self nameForKey: referenceKey.
					self stream
						withAttribute: (SBETextLabelLink to: referenceKey)
						do:
							[self stream nextPutAll:
								(name = previousName
									ifFalse: [name]
									ifTrue: ['ibid.'])].
					previousName := name]
				separatedBy: [self stream nextPutAll: ', ']].
	self emitLineBreak: true.
	
	^ anIndexEntry entriesDo: [:childEntry |
		self emitIndexEntry: childEntry depth: depth + 1].