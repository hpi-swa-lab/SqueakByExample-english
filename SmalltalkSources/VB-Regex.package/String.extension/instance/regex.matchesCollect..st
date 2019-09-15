*vb-regex
regex: rxString matchesCollect: aBlock
	^rxString asRegex matchesIn: self collect: aBlock