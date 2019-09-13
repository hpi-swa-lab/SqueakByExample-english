querying
allHtmlFiles
	^ webDir fullNamesOfAllFilesInSubtree select: [ :each | htmlRegex matches: each ]