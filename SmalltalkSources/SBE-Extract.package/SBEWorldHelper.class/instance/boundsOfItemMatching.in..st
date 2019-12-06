matching
boundsOfItemMatching: anItemMatch in: aListMorph
	"Does not scroll the item into view, if required"

	^ self
		boundsOfItemThat: [:item | anItemMatch matches: item]
		in: aListMorph