running
setUp
	super setUp.

	world := (PasteUpMorph newWorldForProject: nil)
		extent: self worldSize;
		viewBox: (0 @ 0 extent: self worldSize);
		yourself.
	
	(world instVarNamed: #worldState)
		instVarNamed: #canvas
		put: (Form extent: self worldSize depth: 32) getCanvas. 
	
	hand := PHTestHandMorph new.
	world
		removeHand: world firstHand; "the default hand"
		addHand: hand