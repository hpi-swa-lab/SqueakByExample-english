match enumeration
matchesOnStream: aStream do: aBlock
	[self searchStream: aStream] whileTrue:
		[aBlock value: (self subexpression: 1)]