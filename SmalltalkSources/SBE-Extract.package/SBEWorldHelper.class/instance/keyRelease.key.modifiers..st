events
keyRelease: aWidget key: aCharacter modifiers: aCollectionOfButtons

	self mouseEnter: aWidget.
	self
		simulateKeyEvent: #keyUp
		key: aCharacter
		buttons: aCollectionOfButtons
		morph: aWidget