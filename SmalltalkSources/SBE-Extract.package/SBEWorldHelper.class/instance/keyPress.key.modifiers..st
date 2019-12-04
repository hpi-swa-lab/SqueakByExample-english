events
keyPress: aWidget key: aCharacter modifiers: aCollectionOfButtons
	self
		simulateKeyEvent: #keyDown
		key: aCharacter
		buttons: aCollectionOfButtons
		morph: aWidget