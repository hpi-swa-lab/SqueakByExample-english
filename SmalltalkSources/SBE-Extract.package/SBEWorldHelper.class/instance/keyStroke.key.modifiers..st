events
keyStroke: aWidget key: aCharacter modifiers: aCollectionOfModifiers
	self
		simulateKeyEvent: #keystroke
		key: aCharacter
		buttons: aCollectionOfModifiers
		morph: aWidget