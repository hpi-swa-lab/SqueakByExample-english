accessing
anchoredMorph
	"Quickly thrown together - we want to (i) uncompress + (ii) scale images (a) only on demand, (b) not preserve then longer than necessary, and (c) not free the cache between render cycles. SBETextAnchor seems to achieve this quite well, while for non-Morphic projects, we would currently reload the image on every tick."

	Smalltalk isMorphic ifTrue: [^ morph ifNil: [morph := SBETextAnchorMorph newFor: self]].
	^ self scaledImage