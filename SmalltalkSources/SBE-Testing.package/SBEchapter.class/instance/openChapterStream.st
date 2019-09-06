initialize-release
openChapterStream
	"Open the chapter file so we can find the tests."
	| subdir |
	
	subdir := FileDirectory default directoryNamed: self dir.
	
	self
		assert: [ subdir exists ]
		descriptionBlock: [ 'Could not open ', self dir, '!'].

	stream := subdir oldFileOrNoneNamed: self file.

	self
		assert: [ stream notNil ]
		descriptionBlock: [ 'Could not open ', self filePath, '!' ].

	stream converter: Latin1TextConverter new. "Else nextLine pukes on 8-bit characters"
	stream wantsLineEndConversion: true.

	lineNumber := 0.