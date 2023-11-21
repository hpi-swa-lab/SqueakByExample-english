visiting - commands
commandSetBoolean: arguments
	<command: 'setboolean'>

	| name value |
	self assert: arguments size = 2.
	
	name := (self contentsIn: arguments first) asString.
	value := (self contentsIn: arguments second) asString
		caseOf: {['true'] -> [true]. ['false'] -> [false]}.
	
	(booleans at: name)
		at: 1 put: value.