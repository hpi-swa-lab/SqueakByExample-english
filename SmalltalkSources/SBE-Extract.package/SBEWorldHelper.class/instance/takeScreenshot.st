events
takeScreenshot

	picture ifNotNil: [^ self].
	
	frameSpecifier isBlock ifTrue: [
		^ picture := self world imageFormForRectangle: (frameSpecifier value: self morphsArea)].
	frameSpecifier = #morphs ifTrue: [
		^ picture := self world imageFormForRectangle: self morphsArea].
	frameSpecifier isRectangle ifTrue: [
		^ picture := self world imageFormForRectangle: frameSpecifier].
	
	^ self error: 'invalid frame specifier: ', frameSpecifier