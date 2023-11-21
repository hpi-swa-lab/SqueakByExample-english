private
preprocessedContentsFromFile: aFSReference

	| contents |
	contents := super preprocessedContentsFromFile: aFSReference.
	
	self flag: #workaround. "current grammar gets in trouble with common.tex and thus is unable to ignore command \lstdefinelanguage"
	contents := contents copyWithRegex: '\\lstdefinelanguage(?:.(?!^\\lstset))*' matchesReplacedWith: ''.
	
	self flag: #workaround. "Smalltalk code can contain any strings that look like LaTeX ..."
	contents := contents copyWithRegex: '\\begin\{ExecuteSmalltalkScript\}(?:(?!\\end\{ExecuteSmalltalkScript\}).)*\\end\{ExecuteSmalltalkScript\}' matchesReplacedWith: ''.
	
	^ contents