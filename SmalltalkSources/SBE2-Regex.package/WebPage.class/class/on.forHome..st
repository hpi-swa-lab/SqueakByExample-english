creation
on: filePath forHome: homePath
	self assert: [ homePath isKindOf: String ].
	^ self new setPath: filePath homePath: homePath