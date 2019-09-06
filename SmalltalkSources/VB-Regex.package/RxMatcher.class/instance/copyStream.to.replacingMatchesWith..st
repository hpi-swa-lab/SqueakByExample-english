match enumeration
copyStream: aStream to: writeStream replacingMatchesWith: aString
	"Copy the contents of <aStream> on the <writeStream>, except for the matches. Replace each match with <aString>."
	| searchStart matchStart matchEnd |
	stream := aStream.
	lastChar := nil.
	[searchStart := aStream position.
	self proceedSearchingStream: aStream] whileTrue:
		[matchStart := self subBeginning: 1.
		matchEnd := self subEnd: 1.
		aStream position: searchStart.
		searchStart to: matchStart - 1 do:
			[:ignoredPos | writeStream nextPut: aStream next].
		writeStream nextPutAll: aString.
		aStream position: matchEnd].
	aStream position: searchStart.
	[aStream atEnd] whileFalse: [writeStream nextPut: aStream next]