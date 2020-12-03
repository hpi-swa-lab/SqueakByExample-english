initialization
initialize

	super initialize.
	self 
		label: '';
		borderWidth: 2;
		bounds: (0 @ 0 corner: 16 @ 16);
		offColor: Color cantaloupe;
		onColor: Color aqua;
		useSquareCorners.
	self turnOff.