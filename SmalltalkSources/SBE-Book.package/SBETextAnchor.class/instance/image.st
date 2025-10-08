accessing
image

	self hasCompressedImage ifFalse: [^ self basicImage].
	^ PNGReadWriter formFromStream: self basicImage readStream