toc
removeToc
	self 
		assert: [ webDir fileExists: self tocFileName ]
		descriptionBlock: [ 'no TOC to delete' ].
	webDir deleteFileNamed: self tocFileName