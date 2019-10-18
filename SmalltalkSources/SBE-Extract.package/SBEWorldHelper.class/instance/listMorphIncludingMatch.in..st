matching
listMorphIncludingMatch: anItemMatch in: aMorph

	^ self
		listMorphIncludingThat: [:item | item asString = anItemMatch asString]
		in: aMorph