*SBE-Extract-accessing
copyEnvironmentFrom: aProcess

	(aProcess environmentDictionary ifNil: [^ self]) keysAndValuesDo: [:key :value |
		self environmentAt: key put: value].