visiting - commands
commandRef: arguments
	<command: 'ref'>

	| key |
	self assert: arguments size = 1.
	
	key := (self fullContentsInGroup: arguments first) asString.
	self emitRefPlaceholder: key.