matching
boundsOfItemThat: anItemPredicate in: aListMorph
	"Note: This does not scroll the item into view, if required"

	| itemIndex lazyList y |
	itemIndex := aListMorph getList findFirst: anItemPredicate.
	lazyList := aListMorph listMorph.
	y := itemIndex  - 1 / aListMorph getListSize * lazyList height.
	^ (0 @ y extent: lazyList width @ (lazyList height / aListMorph getListSize))
			translateBy: (aListMorph localPointToGlobal: aListMorph topLeft)
				