utils
selectAnyListIn: aMorph at: anItemMatch andScrollIntoViewBy: aNumber

	| list |
	list := self listMorphIncludingMatch: anItemMatch in: aMorph.
	self select: list at: anItemMatch andScrollIntoViewBy: aNumber.
	^ list