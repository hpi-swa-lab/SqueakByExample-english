accessing
matchesStreamPrefix: theStream
	"Match thyself against a positionable stream."
	stream := theStream.
	lastChar := nil.
	^self tryMatch