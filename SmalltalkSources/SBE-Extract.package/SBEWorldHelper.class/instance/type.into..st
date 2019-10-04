events
type: aString into: aWidget
	aString do: [:character |
		self keyStroke: aWidget key: character]