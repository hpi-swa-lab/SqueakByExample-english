converting
fullText

	^ Text streamContents: [:stream |
		stream withAttribute: TextEmphasis bold do:
			[stream nextPutAll: self title].
		self text ifNotNil: [:text |
			stream nextPutAll: self titleSeparatorForHelp.
			stream nextPutAll: text].
		self children do: [:ea |
			ea fullText ifNotNil: [:childText |
				stream cr; cr.
				stream nextPutAll: childText]]]