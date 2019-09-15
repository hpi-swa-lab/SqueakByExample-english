test suite
runRegexTestsForMatcher: matcherClass
	"Run the whole suite of tests for the given matcher class. May blow up
	if anything goes wrong with the matcher or parser. Since this is a 
	developer's tool, who cares?"
	"self runRegexTestsForMatcher: RxMatcher"
	| failures |
	failures := 0.
	Transcript cr.
	self testSuite do: [:clause |
		| rxSource matcher isOK |
		rxSource := clause first.
		Transcript show: 'Testing regex: '; show: rxSource printString; cr.
		matcher := self compileRegex: rxSource into: matcherClass.
		matcher == nil
			ifTrue:
				[(clause at: 2) isNil
					ifTrue: 
						[Transcript tab; show: 'Compilation error as expected (ok)'; cr]
					ifFalse: 
						[Transcript tab; 
							show: 'Compilation error, UNEXPECTED -- FAILED'; cr.
						failures := failures + 1]]
			ifFalse:
				[(clause at: 2) == nil
					ifTrue: 
						[Transcript tab;
							show: 'Compilation succeeded, should have failed -- FAILED!';
							cr.
						failures := failures + 1]
					ifFalse:
						[2 to: clause size by: 3 do: 
							[:i |
							isOK := self
								test: matcher
								with: (clause at: i)
								expect: (clause at: i + 1)
								withSubexpressions: (clause at: i + 2).
							isOK ifFalse: [failures := failures + 1].
							Transcript 
								show: (isOK ifTrue: [' (ok).'] ifFalse: [' -- FAILED!']);
								cr]]]].
	failures = 0
		ifTrue: [Transcript show: 'PASSED ALL TESTS.'; cr]
		ifFalse: [Transcript show: failures printString, ' TESTS FAILED!'; cr]