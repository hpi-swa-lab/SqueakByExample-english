initialize-release
findTests
	| re |
	re := '\\begin\{(\w+)\}.*\{@TEST\s*(.*)\}' asRegex.
	[ self atEnd] whileFalse:
		[ (re matches: self nextLine)
			ifTrue:
				[ tests addLast: (self getNextTestWithInit: (re subexpression: 3)) ]
		].

