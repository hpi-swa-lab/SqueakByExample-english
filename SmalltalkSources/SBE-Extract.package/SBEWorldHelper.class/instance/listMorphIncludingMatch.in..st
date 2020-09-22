matching
listMorphIncludingMatch: anItemMatch in: aMorph

	^ self
		listMorphIncludingThat: [:item | anItemMatch matches: item]
		in: aMorph