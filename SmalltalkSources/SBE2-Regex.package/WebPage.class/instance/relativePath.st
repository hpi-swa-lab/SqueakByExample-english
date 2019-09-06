html
relativePath
	^ path 
		copyWithRegex: homePath , '/'
		matchesReplacedWith: ''