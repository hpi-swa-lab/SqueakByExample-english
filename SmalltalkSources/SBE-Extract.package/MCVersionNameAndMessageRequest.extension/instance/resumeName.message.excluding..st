*SBE-Extract-handling
resumeName: aName message: aMessage excluding: aCollection

	^ self resume: (Array
		with: aName
		with: aMessage
		with: aCollection)