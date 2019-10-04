private
simulateMouseEvent: aSymbol at: aPoint buttons: someMouseButtons start: aStartPoint morph: aMorph
	| morphicEvent |
	morphicEvent := MorphicEvent readFrom: ('{1} {2} {3} {4} {5} {6} {7}' format: {
		aSymbol.
		0. "time"
		aPoint x. aPoint y.
		self mapButtons: someMouseButtons.
		aStartPoint x.
		aStartPoint y}) readStream.
	
	self simulateMouseEvent: morphicEvent morph: aMorph