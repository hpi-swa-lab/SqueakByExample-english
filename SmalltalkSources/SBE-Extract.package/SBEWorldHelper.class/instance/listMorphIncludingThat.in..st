matching
listMorphIncludingThat: anItemPredicate in: aMorph

	^ aMorph
		findDeepSubmorphThat: [:morph | morph isPluggableListMorph and: [morph getList anySatisfy: anItemPredicate]]
		ifAbsent: [self error: 'no list morph found']