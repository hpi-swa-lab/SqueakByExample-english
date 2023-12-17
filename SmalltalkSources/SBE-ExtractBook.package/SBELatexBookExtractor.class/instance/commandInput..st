visiting - commands
commandInput: arguments
	<command: 'input'>

	| inputFile inputFileName |
	self assert: arguments size = 1.
	
	inputFileName := self contentsInGroup: arguments first.
	inputFile := self tryResolveSourceFile: inputFileName.
	^ self extractFromFile: inputFile