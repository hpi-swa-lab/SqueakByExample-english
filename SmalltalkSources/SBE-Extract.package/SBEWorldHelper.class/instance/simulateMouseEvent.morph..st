private
simulateMouseEvent: morphicEvent morph: aMorph
	
	| target |
	" zoom in to the morph to make sure we simulate the mouse having moved there properly "
	" FIXME: is this always the deepest morph or should we check some sort of mouse focus accept? "
	target := (aMorph morphsAt: morphicEvent position) first.
	
	morphicEvent
		wasHandled: false;
		setHand: hand.
	
	hand
		position: morphicEvent position;
		newMouseFocus: target event: morphicEvent;
		handleEvent: morphicEvent