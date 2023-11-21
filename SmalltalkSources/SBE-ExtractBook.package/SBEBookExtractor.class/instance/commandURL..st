visiting - commands
commandURL: arguments
	<command: 'url'>

	| url |
	self assert: arguments size = 1.
	url := (self contentsIn: arguments first) asString.
	self emitURL: url.
		