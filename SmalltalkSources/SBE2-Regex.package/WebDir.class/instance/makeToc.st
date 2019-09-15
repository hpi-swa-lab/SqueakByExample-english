toc
makeToc
	| tocStream |
	self 
		assert: [ (webDir fileExists: self tocFileName) not ]
		descriptionBlock: [ 'TOC already exists' ].
	tocStream := webDir newFileNamed: self tocFileName.
	self printTocOn: tocStream.
	tocStream close.