*SBE-ExtractBook
sbeVisit: extractor

	| selector |
	selector := ('visit{1}:' format: {self sbeType capitalized})
		asSymbol.
	(extractor respondsTo: selector) ifFalse:
		[selector := #basicVisitAny:].
	^ extractor
		perform: selector
		with: self