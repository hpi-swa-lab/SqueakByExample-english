converting
childrenForHelp

	self isHelpLeaf ifTrue: [^ #()].
	^ self children select: [:ea | ea wantsOwnHelpTopic]