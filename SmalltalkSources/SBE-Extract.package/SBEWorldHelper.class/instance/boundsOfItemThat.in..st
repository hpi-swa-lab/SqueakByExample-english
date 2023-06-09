matching
boundsOfItemThat: anItemPredicate in: widget
	"Note: This does NOT scroll the item into view, if required"

	| itemIndex lazyList y |
	(widget isKindOf: PluggableListMorph) ifFalse: [
		^ (widget
			findDeepSubmorphThat: [:item |
				(item respondsTo: #contents) and: [
					anItemPredicate value: item contents]]
			ifAbsent: [self error: 'No item found']) boundsInWorld].
	
	itemIndex := widget getList findFirst: anItemPredicate.
	lazyList := widget listMorph.
	y := itemIndex  - 1 / widget getListSize * lazyList height.
	^ (0 @ y extent: lazyList width @ (lazyList height / widget getListSize))
			translateBy: (widget localPointToGlobal: widget topLeft)
				