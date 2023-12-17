private
preprocessedContentsFromFile: aFSReference

	| contents |
	contents := aFSReference contents copyReplaceAll: String crlf with: String cr.
	
	"ignore \makeatletter...\makeatother for now"
	contents := contents copyWithRegex: '\\makeatletter((?!\\makeatother).)*\\makeatother' matchesReplacedWith: ''.
	
	self flag: #workaround. "current grammar cannot handle conditional environment begins or ends"
	file = aFSReference ifFalse:
		[contents := #('\begin{document}' '\end{document}')
			inject: contents
			into: [:newContents :string | newContents copyReplaceAll: string with: '']].
	
	^ contents