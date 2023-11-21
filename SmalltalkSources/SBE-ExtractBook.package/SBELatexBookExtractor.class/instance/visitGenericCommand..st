visiting - nodes
visitGenericCommand: node

	| commandName afterArgsStream argsStream result |
	commandName := self nameOfCommand: node.
	argsStream := #() writeStream.
	afterArgsStream := #() writeStream..
	node children allButFirst do: [:arg |
		((#(linebreak lineComment) includes: arg sbeType) or: [arg sbeType isNil and: [arg contents isAllSeparators]])
			ifFalse:
				[argsStream nextPut: arg.
				afterArgsStream reset]
			ifTrue:
				[afterArgsStream nextPut: arg]].
	
	result := self handleCommand: commandName arguments: argsStream contents.
	
	afterArgsStream contents do: [:ea |
		self visit: ea].