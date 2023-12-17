initialize-release
initializeEnvironmentHandlers

	environmentHandlers := (Pragma allNamed: #environment: from: self class to: thisContext method methodClass)
		collect: [:pragma | pragma arguments first -> pragma selector]
		as: Dictionary.