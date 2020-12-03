initialization
newCellAt: i at: j 
	"Create a cell for position (i,j) and add it to my on-screen
	representation at the appropriate screen position. Answer the new cell."
	
	| cell origin |
	cell := SBECell new.
	origin := self innerBounds origin.
	self addMorph: cell.
	cell position: ((i - 1) * cell width) @ ((j - 1) * cell height) + origin.
	cell mouseAction: [self toggleNeighboursOfCellAt: i at: j].
	^ cell