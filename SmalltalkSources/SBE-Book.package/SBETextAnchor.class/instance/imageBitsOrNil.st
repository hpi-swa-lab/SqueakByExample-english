private
imageBitsOrNil

	self hasCompressedImage ifTrue: [^ nil].
	^ self basicImage