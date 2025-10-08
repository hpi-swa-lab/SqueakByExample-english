visiting - commands
commandIncludeGraphics: arguments
	<command: 'includegraphics'>

	| argumentStream graphicsFile path |
	argumentStream :=  (arguments reject: [:arg | arg sbeType = #linebreak or: [arg sbeType isNil and: [arg contents isAllSeparators]]]) readStream.
	argumentStream peek sbeType = #brackGroupKeyValue ifTrue:
		[argumentStream next.
		"maybe handle later"].
	
	self assert: argumentStream peek sbeType = #curlyGroupPath.
	path := (self fullContentsInGroup: argumentStream next) asString.
	
	graphicsFile := self tryResolveGraphicsFile: path.
	
	graphicsFile ifNil:
		[self notify: 'Figure does not exist: ' , path.
		^ self basicVisitText: 'Missing figure'].
	
	^ self basicVisitGraphicsFile: graphicsFile