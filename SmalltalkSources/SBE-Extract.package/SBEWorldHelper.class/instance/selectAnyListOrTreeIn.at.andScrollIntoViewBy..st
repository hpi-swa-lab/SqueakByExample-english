utils
selectAnyListOrTreeIn: aMorph at: anItemMatch andScrollIntoViewBy: aNumber

	| list |
	list := self listOrTreeIncludingMatch: anItemMatch in: aMorph.
	self select: list at: anItemMatch andScrollIntoViewBy: aNumber.
	^ list