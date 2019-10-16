initialization
initialize
	super initialize.
	self label: ''.
	self borderWidth: 2.
	self bounds: (0@0 corner: 16@16).
	self offColor: Color cantaloupe.
	self onColor: Color aqua.
	self useSquareCorners.
	self turnOff.