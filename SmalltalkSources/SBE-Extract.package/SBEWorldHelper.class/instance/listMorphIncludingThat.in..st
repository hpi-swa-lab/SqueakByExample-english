matching
listMorphIncludingThat: anItemPredicate in: aMorph

	^ aMorph
		findDeepSubmorphThat: [:morph | (morph isKindOf: LazyListMorph) and: [morph listSource getList anySatisfy: anItemPredicate]]
		ifAbsent: [self error: 'no list morph found']