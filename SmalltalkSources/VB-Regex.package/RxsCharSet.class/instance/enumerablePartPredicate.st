privileged
enumerablePartPredicate
	| enumeration |
	enumeration := self optimalSet.
	^negated
		ifTrue: [[:char | (enumeration includes: char) not]]
		ifFalse: [[:char | enumeration includes: char]]