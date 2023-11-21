actions
openLabel: key in: aHelpBrowser

	| path topicNode topic index |
	path := self pathToLabel: key.
	path ifNil: [^ self inform: ('{1} not found :(' format: {key})].
	
	topicNode := (path select: [:node | node wantsOwnHelpTopic]) last.
	aHelpBrowser showTopicThat: [:ea |
		(ea isKindOf: SBEBookHelpTopic)
			and: [(topic := ea) bookNode = topicNode]].
	
	index := topic contents runs findFirst: [:attrs |
		attrs anySatisfy: [:attr |
			(attr isKindOf: SBETextLabelAnchor) and: [attr label = key]]].
	(aHelpBrowser anyTextPaneWithSelector: #topicContents) setSelection: (index to: index - 1).