events
keyPress: aWidget key: aCharacter modifiers: aCollectionOfButtons
	
	self mouseEnter: aWidget.
	self
		simulateKeyEvent: #keyDown
		key: aCharacter
		buttons: aCollectionOfButtons
		morph: aWidget