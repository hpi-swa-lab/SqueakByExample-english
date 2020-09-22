private
simulateMouseEvent: aSymbol at: aPoint buttons: someMouseButtons start: aStartPoint morph: aMorph

	self flag: #deprecate.
	^ self simulateMouseEvent: aSymbol at: aPoint buttons: someMouseButtons start: aStartPoint