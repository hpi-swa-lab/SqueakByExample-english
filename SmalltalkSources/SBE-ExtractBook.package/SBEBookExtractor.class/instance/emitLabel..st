emitting
emitLabel: key

	| lastChar lastAttributes |
	super emitLabel: key.
	self stream position = 0 ifTrue: [^ pendingLabels addLast: key].
	lastChar := self stream last.
	lastChar isSeparator ifTrue: [^ pendingLabels addLast: key].
	lastAttributes := self stream sbeLastAttributes.
	self stream skip: -1.
	self stream withAttributes: (lastAttributes copyWith: (SBETextLabelAnchor label: key)) do:
		[self stream nextPut: lastChar].
	previousLineBreaks := 0.