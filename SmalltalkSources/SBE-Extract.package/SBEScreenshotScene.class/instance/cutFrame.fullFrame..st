tools
cutFrame: frameArea fullFrame: fullArea

	self frameSpecifier isRectangle
		ifTrue: [^ self frameSpecifier].
	^ self frameSpecifier
		caseOf: {
			[#morphs] -> [frameArea].
			[#fullScreen] -> [fullArea] }
		otherwise: [self frameSpecifier cull: frameArea]