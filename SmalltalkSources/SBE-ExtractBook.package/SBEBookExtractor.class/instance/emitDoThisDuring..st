emitting
emitDoThisDuring: aBlock

	"self basicVisitText: 'Do this:\\' withCRs."
	| result |
	self basicVisitLineBreak: aBlock; basicVisitLineBreak: aBlock.
	self stream
		withAttributes: {TextIndent tabs: 1. TextEmphasis italic}
		do:
			[self basicEmitImage: self doThisImage.
			self stream space.
			result := aBlock value].
	self basicVisitLineBreak: aBlock; basicVisitLineBreak: aBlock.
	^ result