visiting - commands
commandNewBoolean: arguments
	<command: 'newboolean'>

	| name |
	self assert: arguments size = 1.
	
	name := (self contentsIn: arguments first) asString.
	
	booleans
		at: name
			ifPresent: [self notify: 'boolean already exists: ' , name];
		at: name put: {false}.