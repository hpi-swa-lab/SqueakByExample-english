accessing
atPath: path putKey: key label: label

	| localKey |
	path size > 1 ifTrue:
		[^ (self assureSubindexAt: path first)
			atPath: path allButFirst putKey: key label: label].
	
	localKey := path first.
	^ entries
		at: localKey
		ifPresent: [:entry |
			entry key: key; label: label]
		ifAbsentPut:
			[self makeEntryForKey: key label: label]