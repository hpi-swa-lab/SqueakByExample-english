emitting
emitImage: aForm

	| scaledForm |
	scaledForm := figure
		ifNotNil: [aForm scaledToSize: ((aForm extent / self imageScaleFactor) roundTo: 8)]
		ifNil: [aForm scaledToHeight: TextStyle defaultFont height].
	self stream
		withAttribute: (SBETextOpenImageAction for: aForm initialExtent: scaledForm extent)
		do:
			[super emitImage: scaledForm].