mouse events
actOnClickFor: anObject

	| sketch |
	sketch := SketchMorph withForm: self image.
	self initialExtent ifNotNil: [:extent |
		sketch extent: extent].
	sketch "openAsTool" openAsMorph.
	^ true