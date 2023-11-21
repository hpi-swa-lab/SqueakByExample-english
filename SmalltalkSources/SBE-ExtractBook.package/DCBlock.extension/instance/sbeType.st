*SBE-ExtractBook
sbeType

	^ (String streamContents: [:stream |
		self type first = $_ ifTrue:
			[stream nextPut: 'basic'].
		self type findFeatures do: [:ea |
			stream nextPutAll:
				(stream position > 0
					ifTrue: [ea capitalized]
					ifFalse: [ea])]])
		asSymbol