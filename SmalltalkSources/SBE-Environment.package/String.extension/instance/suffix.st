*SBE-Environment
suffix 
	"assumes that I'm a ¼le name, and answers my suf¼x, the part after the last dot" 
	| dot dotPosition | 
	dot := FileDirectory dot asCharacter.
	dotPosition := (self size to: 1 by: -1) detect: [ :i | (self at: i) = dot ] ifNone: [ self size ].
	^ self copyFrom: dotPosition + 1 to: self size 
