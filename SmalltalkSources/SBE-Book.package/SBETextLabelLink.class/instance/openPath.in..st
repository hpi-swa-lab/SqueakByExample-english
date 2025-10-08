mouse events
openPath: path in: aHelpBrowser

	| topicNode topic index textMorph |
	topicNode := (path select: [:node | node wantsOwnHelpTopic]) last.
	aHelpBrowser showTopicThat: [:ea |
		(ea isKindOf: SBEBookHelpTopic)
			and: [(topic := ea) bookNode = topicNode]].
	
	topic contents ifNil: [^ self].
	index := topic contents runs findFirst: [:attrs |
		attrs anySatisfy: [:attr |
			(attr isKindOf: SBETextLabelAnchor) and: [attr label = self label]]].
	
	textMorph := aHelpBrowser anyTextPaneWithSelector: #topicContents.
	textMorph setSelection: (index to: index - 1).
	self currentHand future newKeyboardFocus: textMorph.