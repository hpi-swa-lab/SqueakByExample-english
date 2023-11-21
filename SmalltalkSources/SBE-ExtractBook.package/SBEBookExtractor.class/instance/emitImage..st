emitting
emitImage: aForm

	| extent |
	extent := figure
		ifNotNil: [(aForm extent / self imageScaleFactor) roundTo: 8]
		ifNil: [#inline].
	self stream
		withAttribute: (SBETextOpenImageAction for: aForm initialExtent: extent)
		do:
			[self emitImage: aForm extent: extent].