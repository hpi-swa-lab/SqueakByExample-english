event handling
keyStroke: anEvent

	| keyCharacter |
	keyCharacter := anEvent keyCharacter.
	keyCharacter = Character arrowUp ifTrue: [self position: self position - (0@1)].
	keyCharacter = Character arrowDown ifTrue: [self position: self position + (0@1)].
	keyCharacter = Character arrowLeft ifTrue: [self position: self position - (1@0)].
	keyCharacter = Character arrowRight ifTrue: [self position: self position + (1@0)].