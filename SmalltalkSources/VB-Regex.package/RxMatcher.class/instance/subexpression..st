accessing
subexpression: subIndex
	| originalPosition start end reply |
	originalPosition := stream position.
	start := self subBeginning: subIndex.
	end := self subEnd: subIndex.
	(start isNil or: [end isNil]) ifTrue: [^String new].
	reply := (String new: end - start) writeStream.
	stream position: start.
	start to: end - 1 do: [:ignored | reply nextPut: stream next].
	stream position: originalPosition.
	^reply contents