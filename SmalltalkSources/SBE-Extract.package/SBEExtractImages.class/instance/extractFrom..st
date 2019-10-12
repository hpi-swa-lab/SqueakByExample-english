as yet unclassified
extractFrom: aFSReference
	" note: not thread-safe, as we override globals in SBESqueakPicture "

	| texFiles commands |
	(UIManager default confirm: 'Careful, this will run all code matching the pattern below in this image, without any safety checks. Proceed?') ~= true ifTrue: [^ false].
	
	texFiles := aFSReference allFiles select: [:file | file extension = 'tex'].
	
	commands := Array streamContents: [:stream |
		texFiles do: [:texFile |
			FileStream concreteStream readOnlyFileNamed: texFile fullName do: [:fileStream |
				self commandsFrom: fileStream do: [:command | stream nextPut: {texFile parent. command}]]]].
	
	commands do: [:command |
		SBESqueakPicture currentDirectory: command first.
		Compiler evaluate: command second]