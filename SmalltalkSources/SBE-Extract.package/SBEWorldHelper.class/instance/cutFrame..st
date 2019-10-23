screenshots
cutFrame: area

	frameSpecifier
		caseOf: {
			[#morphs] -> [^ area].
			[#fullScreen] -> [^ self world bounds] }
		otherwise: [].
	frameSpecifier isRectangle ifTrue: [^ frameSpecifier].
	^ frameSpecifier cull: area