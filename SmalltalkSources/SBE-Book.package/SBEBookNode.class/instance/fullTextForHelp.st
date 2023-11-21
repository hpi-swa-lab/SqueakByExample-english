converting
fullTextForHelp

	| helpText |
	helpText := self textForHelp.
	helpText isEmptyOrNil ifTrue: [^ helpText].
	
	^ Text streamContents: [:stream |
		stream withAttribute: TextEmphasis bold do:
			[stream nextPutAll: self title].
		stream nextPutAll: self titleSeparatorForHelp.
		stream nextPutAll: helpText]