utils
selectAnyListIn: aMorph at: anItemMatch

	| list |
	list := self listMorphIncludingMatch: anItemMatch in: aMorph.
	self select: list at: anItemMatch.
	^ list