private - parsing
nameOfCommand: node

	| commandName |
	commandName := node children first contents.
	self assert: commandName first = $\.
	^ commandName allButFirst