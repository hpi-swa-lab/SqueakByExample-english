visiting - commands - macros
commandEqual: arguments
	<command: 'equal'>

	| first second |
	self assert: arguments size = 2.
	
	first := self contentsIn: arguments first.
	second := self contentsIn: arguments second.
	
	ifstack push: first = second.