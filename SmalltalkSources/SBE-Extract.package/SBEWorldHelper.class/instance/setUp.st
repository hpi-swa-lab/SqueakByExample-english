running
setUp

	world := (PasteUpMorph newWorldForProject: nil)
		extent: self worldSize;
		viewBox: (0 @ 0 extent: self worldSize);
		color: Color transparent;
		clipSubmorphs: false;
		flag: #refactor "ct: maybe make a subclass of PasteUpMorph?";
		yourself.
	world setProperty: #sbeMaximumUsableArea toValue: (0 asPoint corner: world extent).
	
	(world instVarNamed: #worldState)
		instVarNamed: #canvas
		put: (Form extent: self worldSize depth: 32) getCanvas. 
	
	hand := SBEHandMorph new
		showTemporaryCursor: Cursor normal; "to update extent for scaleFactor"
		yourself.
	world
		removeHand: world firstHand; "the default hand"
		addHand: hand.
	
	world doOneCycleNow. "inter alia, this initializes lastAlarmTime in the worldState"
	
	hiddenMorphs := OrderedCollection new.