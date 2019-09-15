test suite
compileRegex: regexSource into: matcherClass
	"Compile the regex and answer the matcher, or answer nil if compilation fails."
	| syntaxTree |
	syntaxTree := self safelyParse: regexSource.
	syntaxTree == nil ifTrue: [^nil].
	^matcherClass for: syntaxTree