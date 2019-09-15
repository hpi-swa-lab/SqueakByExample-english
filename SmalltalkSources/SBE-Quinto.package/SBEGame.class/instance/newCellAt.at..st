initialization
newCellAt: i at: j 
	"Create a cell for position (i,j) and add it to my on-screen
	representation at the appropriate screen position.  Answer the new cell"
	| c origin |
	c := SBECell new.
	origin := self innerBounds origin.
	self addMorph: c.
	c position: ((i - 1) * c width) @ ((j - 1) * c height) + origin.
	c mouseAction: [self toggleNeighboursOfCellAt: i at: j].
	^ c