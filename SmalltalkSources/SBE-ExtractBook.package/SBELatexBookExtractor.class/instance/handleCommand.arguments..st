private - handling
handleCommand: name arguments: arguments

	| handler |
	(self ignoredCommands includes: name) ifTrue: [^ self].
	
	handler := self commandHandlerFor: name.
	handler ifNil:
		[self notify: ('unknown command: {1}' format: {name}).
		arguments do: [:child |
			self visit: child].
		^ self].
	^ handler value: arguments