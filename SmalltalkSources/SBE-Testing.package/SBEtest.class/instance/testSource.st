initialize-release
testSource

	"What is exactly the convention? Should the last source line be a print it test?
	Can there be other tests interspersed? If so, where does the statement separator go?"

	| sourceStream re |
	
	re := '(.[\w\W]*)\s*-->\s*([\w\W]*)' asRegex. "Search for 'print it' annotations up to a comment"
	
	sourceStream := WriteStream on: String new.
	sourceStream nextPutAll: self testName.
	
	self sourceLines do: [ :line |
			sourceStream nextPut: Character cr.
			(re matches: line)
				ifTrue: [ sourceStream nextPutAll:
						'	self assert: [ ', (re subexpression: 2), ' ] value printString = ',
							(self removeTrailingComments: (re subexpression: 3)) printString, '.' ]
				ifFalse: [ sourceStream nextPutAll: '	', line ]
			].

	^ sourceStream contents
