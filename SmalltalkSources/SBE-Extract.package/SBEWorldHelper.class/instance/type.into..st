events
type: aString into: aWidget

	self focus: aWidget.
	aString do: [:character |
		self basicKeyStroke: aWidget key: character modifiers: #()].
	aWidget allMorphsDo: [:morph |
		(morph respondsTo: #updateStyleNow)
			ifTrue: [morph updateStyleNow]].