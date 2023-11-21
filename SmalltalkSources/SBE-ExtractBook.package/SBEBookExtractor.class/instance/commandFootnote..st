visiting - commands
commandFootnote: arguments
	<command: 'footnote'>

	self assert: arguments size = 1.
	
	self
		basicVisitText: ' (';
		basicVisitText: (self contentsIn: arguments first);
		basicVisitText: ')'.