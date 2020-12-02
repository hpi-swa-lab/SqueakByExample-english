initialization
initialize
	super initialize.
	self 
		extent: 50 @ 50;
		useGradientFill; borderWidth: 2; useRoundedCorners;
		setBorderStyle: #complexRaised;
		color: Color green.
	self fillStyle direction: self extent.
	dieValue := 1.
	faces := 6.
	isStopped := false.