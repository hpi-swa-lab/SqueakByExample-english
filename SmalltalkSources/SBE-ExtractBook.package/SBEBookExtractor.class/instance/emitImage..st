emitting
emitImage: aForm

	| extent |
	extent := (aForm extent / self imageScaleFactor) roundTo: 8.
	self stream
		withAttribute: (SBETextOpenImageAction for: aForm initialExtent: extent)
		do:
			[self emitImage: aForm extent: (figure ifNil: [#inline] ifNotNil: [extent])].