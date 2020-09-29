initialize-release
getNextTestWithInit: initLine
	| re lines line start end |
	re := '\\end\{(\w+)\}.*' asRegex.
	lines := OrderedCollection new.
	lines addLast: initLine.
	start := self lineNumber + 1.

	[ self atEnd] whileFalse:
		[	end := self lineNumber.
			line := self nextLine.
			(re matches: line)
				ifFalse:  [ lines addLast: line ]
				ifTrue: [ ^ SBEtest new
							chapter: self;
							start: start;
							end: end;
							sourceLines: lines ;
							yourself ] ]
