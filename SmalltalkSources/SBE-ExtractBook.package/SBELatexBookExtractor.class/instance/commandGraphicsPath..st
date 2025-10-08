visiting - commands
commandGraphicsPath: arguments
	<command: 'graphicspath'>

	self assert: arguments size = 1.
	graphicsPath := (self listFromGroup: arguments first)
		collect: [:path | file parent / path].