events
keyPress: aWidget key: aCharacter modifiers: aCollectionOfButtons
	
	self focus: aWidget.
	self
		simulateKeyEvent: #keyDown
		key: aCharacter
		buttons: aCollectionOfButtons
		morph: aWidget