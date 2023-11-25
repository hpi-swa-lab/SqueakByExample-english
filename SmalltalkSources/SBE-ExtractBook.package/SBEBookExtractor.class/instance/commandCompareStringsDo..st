visiting - commands
commandCompareStringsDo: arguments
	<command: 'compareStringsDo'>

	| first second |
	self assert: arguments size = 4.
	
	first := self contentsIn: arguments first.
	second := self contentsIn: arguments second.
	self visit:
		(first = second
			ifTrue: [arguments third]
			ifFalse: [arguments fourth]).