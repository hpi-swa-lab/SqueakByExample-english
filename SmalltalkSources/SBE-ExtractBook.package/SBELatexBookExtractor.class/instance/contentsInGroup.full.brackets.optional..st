private
contentsInGroup: node full: full brackets: brackets optional: optionalBrackets

	(optionalBrackets and: [node children size = 1]) ifTrue:
		[^ node children first contents].
	
	self assert: node children size = 3.
	self assert: (node children first sbeType isNil and: [node children first contents = brackets first asString]).
	self assert: (node children last sbeType isNil and: [node children last contents = brackets second asString]).
	^ full
		ifTrue: [self contentsIn: node children second]
		ifFalse: [node children second contents]