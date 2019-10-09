initialization
initialize
	| height overallBorderWidth sampleCell width |
	super initialize.
	sampleCell := SBECell new.
	width := sampleCell width.
	height := sampleCell height.
	overallBorderWidth := 2 * self borderWidth.
	self bounds: (5@5 extent: (width * self cellsPerSide)@(height * self cellsPerSide) + overallBorderWidth).
	cells := Matrix new: self cellsPerSide tabulate: [:i :j | self newCellAt: i at: j].