*SBE-Book-emphasis
sbeAllAttributes

	self flag: #moveUpstream.
	^ OrderedCollection streamContents: [:stream |
		self runs do: [:attributes |
			attributes do: [:attribute |
				stream nextPut: attribute]]]