private
copyForContents

	| copy |
	copy := self class new.
	copy
		rootFile: rootFile;
		setCommandHandlers: commandHandlers
		environmentHandlers: environmentHandlers.
	^ copy