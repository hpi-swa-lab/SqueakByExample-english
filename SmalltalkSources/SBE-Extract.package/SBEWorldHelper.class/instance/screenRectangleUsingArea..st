screenshots
screenRectangleUsingArea: area

	frameSpecifier = #morphs ifTrue: [
		^ area].
	frameSpecifier isRectangle ifTrue: [
		^ frameSpecifier].
	^ frameSpecifier cull: area