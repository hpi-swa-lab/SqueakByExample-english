initialize-release
sourceLines: anObject
	"Here we translate special characters in the LaTeX source. See comment in #escapeSequences."
	sourceLines := anObject collect: [:line |
		self escapeSequences
			inject: line
			into: [:result :escape |
				result copyWithRegex: escape key matchesReplacedWith: escape value]].
	self chapter generateTestMethod: self testSource.