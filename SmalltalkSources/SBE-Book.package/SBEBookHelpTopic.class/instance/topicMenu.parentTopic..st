menus
topicMenu: aMenu parentTopic: parentTopic

	aMenu add: 'open in PDF' target: self selector: #openInPDF.
	aMenu addLine.
	
	^ super topicMenu: aMenu parentTopic: parentTopic