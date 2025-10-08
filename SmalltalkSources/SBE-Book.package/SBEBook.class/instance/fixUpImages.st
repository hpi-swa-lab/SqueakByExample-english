as yet unclassified
fixUpImages
	"Reduce memory consumption of the book from 900 MB to 500 MB."

	self flag: #workaround. "Whoah! We should really read, preferably even store this efficiently! Currently, each image is stored twice - 400 MB redundant ..."
	self fullText runs withStartStopAndValueDo: [:start :stop :attrs |
		attrs do: [:attr |
			(attr isKindOf: SBETextOpenImageAction) ifTrue:
				[attrs
					detect: [:othr | othr isKindOf: SBETextAnchor]
					ifFound: [:othr |
						"a) Eliminate duplicate images"
						self assert: othr image bits = attr image bits.
						"othr image becomeForward: attr image"
						attr image: nil "see SBETextOpenImageAction>>#imageIn:at:".
						
						"b) Compress images"
						othr compressImage "assumption: every problematically large image is clickable"]
					ifNone: [self error]]].
		false].