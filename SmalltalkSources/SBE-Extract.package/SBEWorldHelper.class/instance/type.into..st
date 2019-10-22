events
type: aString into: aWidget
	aString do: [:character |
		self keyStroke: aWidget key: character].
	aWidget allMorphsDo: [:morph |
		(morph respondsTo: #updateStyleNow)
			ifTrue: [morph updateStyleNow]].