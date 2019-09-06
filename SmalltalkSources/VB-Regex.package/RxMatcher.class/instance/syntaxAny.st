double dispatch
syntaxAny
	"Double dispatch from the syntax tree. 
	Create a matcher for any non-whitespace character."
	^RxmPredicate new
		predicate: [:char | (Cr = char or: [Lf = char]) not]