visiting - commands
commandDeclareGraphicsExtensions: arguments
	<command: 'DeclareGraphicsExtensions'>

	self assert: arguments size = 1.
	graphicsExtensions := self listFromGroup: arguments first.