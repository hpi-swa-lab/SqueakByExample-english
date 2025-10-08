visiting - commands
commandLabel: arguments
	<command: 'label'>

	| key |
	self assert: arguments size = 1.
	
	self assert: arguments first sbeType = #curlyGroupText.
	key := (self contentsIn: arguments first) asString allButFirst allButLast.
	self emitLabel: key.