visiting - commands
commandImportant: arguments
	<command: 'important'>

	self basicVisitLineBreak: arguments; basicVisitLineBreak: arguments.
	
	self emitImportantDuring:
		[arguments do: [:arg |
			self visit: arg]].
	
	self basicVisitLineBreak: arguments; basicVisitLineBreak: arguments.