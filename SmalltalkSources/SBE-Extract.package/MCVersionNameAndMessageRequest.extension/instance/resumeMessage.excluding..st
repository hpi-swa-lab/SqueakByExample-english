*SBE-Extract-handling
resumeMessage: aMessage excluding: aCollection

	^ self
		resumeName: self suggestedName
		message: aMessage
		excluding: aCollection