documentation
readFromFile

	| book |
	book := FileStream readOnlyFileNamed: 'sbe.sbebook' do: [:stream |
		SBEBook readFrom: stream].
	book inspect.