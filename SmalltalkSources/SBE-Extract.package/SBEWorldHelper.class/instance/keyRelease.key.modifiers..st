events
keyRelease: aWidget key: aCharacter modifiers: aCollectionOfButtons
	self
		simulateKeyEvent: #keyUp
		key: aCharacter
		buttons: aCollectionOfButtons
		morph: aWidget