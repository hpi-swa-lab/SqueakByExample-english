documentation
readFromFile

	| book |
	book := FileStream readOnlyFileNamed: 'sbe.sbebook' do: [:stream |
		SBEBook readFrom: stream].
	self assert: book asHelpTopic allInvalidLinks isEmpty.
	book inspect.