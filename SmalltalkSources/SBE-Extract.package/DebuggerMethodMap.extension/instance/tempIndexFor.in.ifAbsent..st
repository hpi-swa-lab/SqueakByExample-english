*SBE-Extract-accessing
tempIndexFor: tempName in: aContext ifAbsent: aBlock

	^ (self tempNamesForContext: aContext)
		indexOf: tempName
		ifAbsent: aBlock