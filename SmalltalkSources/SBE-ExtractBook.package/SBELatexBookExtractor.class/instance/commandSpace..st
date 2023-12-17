visiting - commands - characters and spacing
commandSpace: arguments
	<command: 'space'>

	self assert: (arguments isEmpty or: [arguments size = 1 and: (arguments first sbeType = #curlyGroup and: [arguments first children size = 2])]). "empty"
	self basicVisitText: ' '.