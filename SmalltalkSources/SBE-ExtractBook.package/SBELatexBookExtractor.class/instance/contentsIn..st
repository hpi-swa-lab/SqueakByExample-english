private
contentsIn: node

	| extractor |
	extractor := self copyForContents.
	"yeah ... in theory we would have to copy way more here ..."
	extractor withCommandArguments: commandArguments do:
		[extractor visit: node].
	^ extractor contents