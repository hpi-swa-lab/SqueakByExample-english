saving
writeScene: aScene to: aFileString

	self isDebugging
		ifFalse: [^ super writeScene: aScene to: aFileString].
	^ self openScene: aScene