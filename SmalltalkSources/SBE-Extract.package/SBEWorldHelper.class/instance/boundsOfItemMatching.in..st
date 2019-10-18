matching
boundsOfItemMatching: anItemMatch in: aListMorph
	"Does not scroll the item into view, if required"

	^ self
		boundsOfItemThat: [:item | item asString = anItemMatch asString]
		in: aListMorph