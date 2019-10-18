screenshots
screenRectangleUsingArea: areaBlock

	frameSpecifier = #morphs ifTrue: [
		^ areaBlock value].
	frameSpecifier isRectangle ifTrue: [
		^ frameSpecifier].
	^ frameSpecifier cullLazy: areaBlock