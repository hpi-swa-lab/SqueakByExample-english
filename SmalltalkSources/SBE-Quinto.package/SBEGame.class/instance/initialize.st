initialization
initialize
	| sampleCell width height n |
	super initialize.
	n := self cellsPerSide..
	sampleCell := SBECell new.
	width := sampleCell width.
	height := sampleCell height.
	bounds := (5@5 extent: ((width*n) @(height*n)) + (2 * self borderWidth)).
	cells := Matrix new: n tabulate: [ :i :j | self newCellAt: i at: j].