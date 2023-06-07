matching
listOrTreeIncludingThat: anItemPredicate in: aMorph

	^ aMorph
		findDeepSubmorphThat: [:morph |
			(morph isPluggableListMorph and: [morph getList anySatisfy: anItemPredicate])
				or: [(morph isKindOf: PluggableTreeMorph) and: [morph items anySatisfy: [:item | anItemPredicate value: item contents]]]]
		ifAbsent: [self error: 'no list morph found']