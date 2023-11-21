private
contentsIn: node

	| extractor |
	extractor := self class new.
	extractor
		rootFile: rootFile;
		setCommandHandlers: commandHandlers
		environmentHandlers: environmentHandlers.
	"yeah ... in theory we would have to copy way more here ..."
	extractor withCommandArguments: commandArguments do:
		[extractor visit: node].
	^ extractor contents