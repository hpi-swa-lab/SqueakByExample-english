converting
textForHelp

	| helpText index |
	helpText := super textForHelp.
	
	self flag: #hacked. "There is too much ill-parsed nonsense before the actual title right now."
	index := helpText findString: self title.
	index = 0 ifTrue: [^ helpText].
	
	^ (helpText allButFirst: index + self title size) withBlanksTrimmed