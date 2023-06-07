matching
listOrTreeIncludingMatch: anItemMatch in: aMorph

	^ self
		listOrTreeIncludingThat: [:item | anItemMatch matches: item]
		in: aMorph