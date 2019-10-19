screenshots
screenRectangleUsingArea: area

	frameSpecifier = #morphs ifTrue: [
		^ area value].
	frameSpecifier isRectangle ifTrue: [
		^ frameSpecifier].
	^ frameSpecifier cull: area