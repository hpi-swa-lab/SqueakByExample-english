private
generateKeyEvent: aType character: aCharacter buttons: buttons position: aPoint

	| event |
	event := KeyboardEvent readFrom: ({aType.
		0 milliSeconds asMilliSeconds.
		self mapButtons: buttons.
		aCharacter asciiValue.
		aCharacter asciiValue }
			joinSeparatedBy: ' ') readStream.
	event
		wasHandled: false;
		setHand: self hand;
		setPosition: aPoint.
	^ event