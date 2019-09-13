profiling
frequentMatchProfile
	"
	TimeProfiler profile: [self frequentMatchProfile]
	Time millisecondsToRun: [self frequentMatchProfile]
	"
	| stream matcher count |
	stream := self bigHonkingStream.
	count := 0.
	matcher := '\<\w+' asRegex.
	[
		[matcher searchStream: stream] whileTrue: [count := count + 1].
	]
	valueNowOrOnUnwindDo: [stream close].
	^count