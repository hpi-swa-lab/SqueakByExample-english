initialize-release
setDir: dir home: path 
	self 
		assert: [ dir isKindOf: FileDirectory ]
		descriptionBlock: [ dir asString , ' is not a kind of FileDirectory' ].
	self 
		assert: [ dir exists ]
		descriptionBlock: [ dir asString , ' is not a valid directory' ].
	self assert: [ path isKindOf: String ].
	webDir := dir.
	homePath := path