initialize-release
getSBEstream
	| stream |
	stream := (FileDirectory on: SBEScriptBuilder resourceDirectory asString)
		oldFileOrNoneNamed: self sbeFileName.	
	self
		assert: [ stream notNil ]
		descriptionBlock: [
			'Could not find ', self sbeFileName, '. ',
			'Please check that this image is in the SBE current directory.'
		].
	stream wantsLineEndConversion: true.
	^ stream