visiting - commands
commandExcludeComment: arguments
	<command: 'excludecomment'>

	| environmentName |
	self assert: arguments size = 1.
	environmentName := (self contentsIn: arguments first) asString.
	environmentHandlers
		at: environmentName
		put: [:extractor :contentBlock :options |].