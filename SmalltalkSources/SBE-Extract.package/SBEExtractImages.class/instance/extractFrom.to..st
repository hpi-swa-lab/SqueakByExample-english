as yet unclassified
extractFrom: aFSReference to: anOutputFileDirectory
	" note: not thread-safe, as we override globals in SBESqueakPicture "

	| texFiles commands |
	(UIManager default confirm: 'Careful, this will run all code matching the pattern below in this image, without any safety checks. Proceed?') ~= true ifTrue: [^ false].
	
	texFiles := aFSReference allFiles select: [:file | file extension = 'tex'].
	
	commands := Array streamContents: [:stream |
		texFiles do: [:texFile |
			FileStream concreteStream readOnlyFileNamed: texFile fullName do: [:file |
				file contents regex: '%%{SBESqueakPicture[\s\S]+%%]}' matchesDo: [:command | stream nextPut: {texFile parent. ((command lines collect: [:line | line allButFirst: 2]) joinSeparatedBy: String cr) allButFirst allButLast}]]]].
	
	commands do: [:command |
		SBESqueakPicture currentDirectory: command first.
		Compiler evaluate: command second]