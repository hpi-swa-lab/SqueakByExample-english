profiling
rareMatchProfile
	"
	TimeProfiler profile: [self rareMatchProfile]
	Time millisecondsToRun: [self rareMatchProfile]
	"
	| stream matcher count |
	stream := self bigHonkingStream.
	count := 0.
	matcher := 'foo' asRegex.
	[
		[matcher searchStream: stream] whileTrue: [count := count + 1].
	]
	valueNowOrOnUnwindDo: [stream close].
	^count