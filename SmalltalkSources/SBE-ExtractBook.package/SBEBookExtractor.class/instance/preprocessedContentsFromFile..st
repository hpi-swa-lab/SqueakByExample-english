private
preprocessedContentsFromFile: aFSReference

	| contents matcher |
	contents := super preprocessedContentsFromFile: aFSReference.
	
	self flag: #workaround. "too lazy to implement \ifdefined as well"
	contents := contents copyWithRegex: (matcher := '\\ifdefined\\SQUEAKVERSION(((?!\\else).)*)\\else((?!\\fi).)*\\fi' asRegex) matchesTranslatedUsing: [:match |
		matcher subexpression: 2].
	
	self flag: #workaround. "current grammar gets in trouble with common.tex and thus is unable to ignore command \lstdefinelanguage"
	contents := contents copyWithRegex: '\\lstdefinelanguage(?:.(?!^\\lstset))*' matchesReplacedWith: ''.
	
	self flag: #workaround. "Smalltalk code can contain any strings that look like LaTeX ..."
	contents := contents copyWithRegex: '\\begin\{ExecuteSmalltalkScript\}(?:(?!\\end\{ExecuteSmalltalkScript\}).)*\\end\{ExecuteSmalltalkScript\}' matchesReplacedWith: ''.
	
	^ contents