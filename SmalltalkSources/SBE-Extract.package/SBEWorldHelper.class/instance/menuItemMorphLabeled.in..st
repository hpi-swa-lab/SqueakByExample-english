matching
menuItemMorphLabeled: aString in: aMorph

	^ aMorph
		findDeepSubmorphThat: [:morph | (morph isKindOf: MenuItemMorph) and: [aString matches: morph contents]]
		ifAbsent: [self error: 'no menu item with label ', aString]