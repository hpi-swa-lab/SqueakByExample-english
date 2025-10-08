converting
textForHelp

	| texts |
	texts := {self text}.
	(self children allSatisfy: [:child | child wantsOwnHelpTopic]) ifFalse:
		[texts := texts ,
			(self children
				select: [:child | child isHelpLeaf]
				thenCollect: [:child | child fullTextForHelp])].
	texts := texts reject: [:ea | ea isEmptyOrNil].
	texts ifEmpty: [^ nil].
	
	^ Text streamContents: [:stream |
		texts
			do: [:ea | stream nextPutAll: ea]
			separatedBy: [stream cr; cr]]