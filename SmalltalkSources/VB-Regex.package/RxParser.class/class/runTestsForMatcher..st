test suite
runTestsForMatcher: matcherClass
	"Run the whole suite of tests for the given matcher class. May blow up
	if something goes wrong with the matcher or the parser. Since this is a 
	developer's tool, who cares?"
	"self runTestsForMatcher: RxMatcher"
	self
		runRegexTestsForMatcher: matcherClass;
		runProtocolTestsForMatcher: matcherClass