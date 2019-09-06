test suite
runProtocolTestsForMatcher: matcherClass
	| matcher |
	Transcript show: 'Testing matcher protocol...'.
	matcher := matcherClass forString: '\w+'.
	(matcher matchesIn: 'now is the time') asArray = #('now' 'is' 'the' 'time')
		ifFalse: [self error: 'matchesIn: test failed'].
	(matcher copy: 'now is  the   time    ' translatingMatchesUsing: [:s | s reverse])
		= 'won si  eht   emit    '
		ifFalse: [self error: 'copy:translatingMatchesWith: test failed'].
	"See that the match context is preserved while copying stuff between matches:"
	((matcherClass forString: '\<\d\D+') 
		copy: '9aaa1bbb 8ccc'
		replacingMatchesWith: 'foo') = 'foo1bbb foo'
			ifFalse: [self error: 'test failed'].
	Transcript show: 'OK'; cr