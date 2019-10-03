as yet unclassified
commandsFrom: aStream do: aBlock

	| prefix suffix |
	prefix := '%%{SBESqueakPicture'.
	suffix := '%%]}'.
	[aStream atEnd] whileFalse: [ | match |
		aStream upToAll: prefix.
		match := prefix, (aStream upToAll: suffix), suffix.
		aStream atEnd ifFalse: [
			aBlock value: ((match lines collect: [:line | line allButFirst: 2]) joinSeparatedBy: String cr) allButFirst allButLast]]