private
simulateKeyEvent: aSymbol key: aCharacter buttons: someButtons morph: aMorph
	
	| morphicEvent |
	morphicEvent := self
		generateKeyEvent: aSymbol
		character: aCharacter
		buttons: someButtons
		position: aMorph center.
	hand processEvent: morphicEvent in: aMorph.