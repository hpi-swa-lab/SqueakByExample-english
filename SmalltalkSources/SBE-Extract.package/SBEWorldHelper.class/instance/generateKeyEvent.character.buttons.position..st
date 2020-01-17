private
generateKeyEvent: aType character: aCharacter buttons: buttons position: aPoint

	| event |
	event := KeyboardEvent readFrom: ({aType.
		0 milliSeconds asMilliSeconds.
		aCharacter asciiValue.
		self mapButtons: buttons }
			joinSeparatedBy: ' ') readStream.
	event
		wasHandled: false;
		setHand: self hand;
		setPosition: aPoint.
	^ event