matching
listMorphIncludingMatch: anItemMatch in: aMorph

	^ self
		listMorphIncludingThat: [:item | anItemMatch matches: item asString]
		in: aMorph