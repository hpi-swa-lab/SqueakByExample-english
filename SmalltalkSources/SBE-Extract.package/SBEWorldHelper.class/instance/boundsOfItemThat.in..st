matching
boundsOfItemThat: anItemPredicate in: aListMorph
	"Does not scroll the item into view, if required"

	^ (0 @ ((aListMorph getList findFirst: anItemPredicate)
		- 1 / aListMorph getListSize * aListMorph listMorph height)
			translateBy: (aListMorph localPointToGlobal: aListMorph topLeft))
				extent: aListMorph width @ (aListMorph listMorph height / aListMorph getListSize)