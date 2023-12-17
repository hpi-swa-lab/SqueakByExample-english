private - parsing
listFromGroup: node

	^ (node children
		reject: [:ea | ea sbeType isNil])
			collect: [:ea | (self contentsIn: ea) asString]