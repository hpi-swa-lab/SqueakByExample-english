accessing
updateStarIndexes

	| highestOrder |
	highestOrder := (self children collect: [:child | child canonicalHierarchyOrder]) min.
	self children
		do: [:child |
			child hasStarIndex: child canonicalHierarchyOrder > highestOrder].