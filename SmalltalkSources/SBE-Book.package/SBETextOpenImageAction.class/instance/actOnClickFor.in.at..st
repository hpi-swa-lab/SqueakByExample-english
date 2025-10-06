mouse events
actOnClickFor: anObject in: aParagraph at: clickPoint

	| effectiveImage sketch |
	effectiveImage := self image ifNil:
		[self imageIn: aParagraph at: clickPoint].
	Smalltalk isMorphic ifFalse: [effectiveImage inspect. ^ true].
	sketch := SketchMorph withForm: effectiveImage.
	self initialExtent ifNotNil: [:extent |
		sketch extent: extent].
	sketch "openAsTool" openAsMorph.
	^ true