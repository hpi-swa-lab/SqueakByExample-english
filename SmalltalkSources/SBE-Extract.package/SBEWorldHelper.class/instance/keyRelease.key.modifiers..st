events
keyRelease: aWidget key: aCharacter modifiers: aCollectionOfButtons

	self focus: aWidget.
	self
		simulateKeyEvent: #keyUp
		key: aCharacter
		buttons: aCollectionOfButtons
		morph: aWidget