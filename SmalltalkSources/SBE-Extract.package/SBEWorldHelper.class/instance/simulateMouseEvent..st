private
simulateMouseEvent: morphicEvent
	
	morphicEvent
		wasHandled: false;
		setHand: hand.
	
	hand
		position: morphicEvent position;
		processNewEvent: morphicEvent.