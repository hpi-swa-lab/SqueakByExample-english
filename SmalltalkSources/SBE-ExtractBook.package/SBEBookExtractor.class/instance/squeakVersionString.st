accessing
squeakVersionString
	
	| version |
	version := self squeakVersion.
	version isAlpha ifTrue: [^ 'Trunk'].
	^ '{1}.{2}' format: {version majorVersionNumber. version minorVersionNumber}