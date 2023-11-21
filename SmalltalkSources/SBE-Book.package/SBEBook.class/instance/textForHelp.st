converting
textForHelp

	| helpText index |
	helpText := super textForHelp.
	
	index := helpText findString: self title.
	index = 0 ifTrue: [^ helpText].
	
	^ (helpText allButFirst: index + self title size) withBlanksTrimmed