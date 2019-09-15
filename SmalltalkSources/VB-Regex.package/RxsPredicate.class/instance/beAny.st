initialize-release
beAny
	| cr lf |
	cr := Character cr.
	lf := Character lf.
	predicate := [:char | char ~= lf and: [char ~= cr]].
	negation := [:char | char = lf or: [char = cr]]