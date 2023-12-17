visiting - commands - characters and spacing
commandLdots: arguments
	<command: 'ldots'>

	self assert: (arguments isEmpty or: [arguments size = 1 and: (arguments first sbeType = #curlyGroup and: [arguments first children size = 2])]). "empty"
	self basicVisitText: '...'.