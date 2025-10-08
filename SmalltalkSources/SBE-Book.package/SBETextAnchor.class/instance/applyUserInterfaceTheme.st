updating
applyUserInterfaceTheme

	super applyUserInterfaceTheme.
	
	scaledImage := nil.
	morph ifNotNil:
		[self flag: #knownBug. "Resized morphs might appear at the wrong position until their actual anchor position is scrolled into the view. Looks like a Morphic bug??"
		morph updateExtent].