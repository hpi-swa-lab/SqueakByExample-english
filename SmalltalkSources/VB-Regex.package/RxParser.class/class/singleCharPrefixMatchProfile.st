profiling
singleCharPrefixMatchProfile
	"
	TimeProfiler profile: [self singleCharPrefixMatchProfile]
	Time millisecondsToRun: [self singleCharPrefixMatchProfile]
	"
	| stream matcher count |
	stream := self bigHonkingStream.
	count := 0.
	matcher := 'm(e|a)th' asRegex.
	[
		[matcher searchStream: stream] whileTrue: [count := count + 1].
	]
	valueNowOrOnUnwindDo: [stream close].
	^count