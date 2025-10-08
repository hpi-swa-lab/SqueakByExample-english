accessing
subtopics

	^ subtopics ifNil: [subtopics :=
		self bookNode childrenForHelp
			withIndexCollect: [:child :index |
				child asHelpTopic
					priority: index;
					yourself]]