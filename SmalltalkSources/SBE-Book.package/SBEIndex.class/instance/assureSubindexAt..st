private
assureSubindexAt: key

	^ entries
		at: key
		ifAbsentPut:
			[self makeSubindexForKey: key]