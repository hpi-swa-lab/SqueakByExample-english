private
simulateKeyEvent: aSymbol key: aCharacter buttons: someButtons morph: aMorph
	| morphicEvent |
	morphicEvent := MorphicEvent readFrom: ('{1} {2} {3} {4}' format: {
		aSymbol.
		0. "time"
		self mapButtons: someButtons.
		aCharacter asciiValue}) readStream.
	
	morphicEvent
		wasHandled: false;
		setHand: hand;
		setPosition: aMorph center.
	
	hand handleEvent: morphicEvent.