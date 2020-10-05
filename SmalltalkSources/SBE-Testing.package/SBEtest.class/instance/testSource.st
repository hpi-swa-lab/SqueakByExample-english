initialize-release
testSource

	"What is exactly the convention? Should the last source line be a print it test?
	Can there be other tests interspersed? If so, where does the statement separator go?"

	| sourceStream re |
	
	re := '(.[\w\W]*)\s*-->\s*([\w\W]*)' asRegex. "Search for 'print it' annotations up to a comment"
	
	sourceStream := WriteStream on: String new.
	sourceStream nextPutAll: self testName.
	
	self sourceLines do: [ :line |
		sourceStream
			crtab;
			nextPutAll: ((re matches: line)
				ifTrue: [ ('self assert: {1} equals: [ {2} ] value printString.' format: {
					(self removeTrailingComments: (re subexpression: 3)) printString.
					(re subexpression: 2) withBlanksTrimmed}) ]
				ifFalse: [ line ]) ].
	
	^ sourceStream contents