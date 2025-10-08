visiting - commands - macros
commandBoolean: arguments
	<command: 'boolean'>

	| name |
	self assert: arguments size = 1.
	
	name := (self contentsIn: arguments first) asString.
	
	ifstack push: (booleans at: name) first.