initialize-release
initializeCommandHandlers

	commandHandlers := (Pragma allNamed: #command: from: self class to: thisContext method methodClass)
		collect: [:pragma | pragma arguments first -> pragma selector]
		as: Dictionary.