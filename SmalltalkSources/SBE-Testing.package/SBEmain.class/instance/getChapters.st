initialize-release
getChapters
	"Find the chapters in the main file, and create an SBEchapter object for each file."

	| stream re |
	re := '\\input{(\w+)/(\w+.tex)}' asRegex.
	stream := self getSBEstream.
	[stream atEnd] whileFalse: 
			[(re matches: stream nextLine) 
				ifTrue: 
					[chapters 
						addLast: (SBEchapter dir: (re subexpression: 2) file: (re subexpression: 3))]]