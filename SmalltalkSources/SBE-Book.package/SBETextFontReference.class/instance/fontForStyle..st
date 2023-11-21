private
fontForStyle: aSymbol

	^ aSymbol caseOf:
		{[#smaller] -> [Preferences standardButtonFont]}