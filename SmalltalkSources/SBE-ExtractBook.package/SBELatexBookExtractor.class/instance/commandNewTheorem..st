visiting - commands
commandNewTheorem: arguments
	<command: 'newtheorem'>

	| environmentName |
	self assert: arguments size = 2.
	environmentName := self contentsIn: arguments first.
	environmentHandlers
		at: environmentName
		put: [:extractor :contentBlock :options | contentBlock value].