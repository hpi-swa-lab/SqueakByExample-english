matching
boundsOfItemThat: anItemPredicate in: aListMorph
	"Does not scroll the item into view, if required"

	^ (0 @ ((aListMorph listSource getList findFirst: anItemPredicate)
		- 1 / aListMorph getListSize * aListMorph height)
			translateBy: (aListMorph localPointToGlobal: aListMorph topLeft))
				extent: aListMorph width @ (aListMorph height / aListMorph getListSize)