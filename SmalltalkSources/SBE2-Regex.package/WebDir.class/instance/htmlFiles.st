querying
htmlFiles
	"In the first case we crerate a new regex matcher for each file.
	In the second case we use a dedicated matcher created once at initialization."
	"^ webDir fileNames select: [ :each | each matchesRegex: '.*\.html' ]"
	^ webDir fileNames select: [ :each | htmlRegex matches: each ]